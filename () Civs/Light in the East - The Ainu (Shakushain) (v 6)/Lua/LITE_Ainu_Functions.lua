-- LITE_Ainu_Functions.lua
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_TableContains
----------------------------------------------------------------------------------------------------------------------------
function DMS_TableContains(table, value)
	for _, v in pairs(table) do
		if v == value then

		return true
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- KilledNearestCity
----------------------------------------------------------------------------------------------------------------------------
function KilledNearestCity(pPlot, pPlayer)
	local iShortestDistance = 99999
	local pNearestCity = nil
	local iUnitX = pPlot:GetX()
	local iUnitY = pPlot:GetY()
	for pCity in pPlayer:Cities() do
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iUnitX, iUnitY)
		if (iDist < iShortestDistance) then
			iShortestDistance = iDist
			pNearestCity = pCity
		end
	end
	return pNearestCity
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
----------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
--==========================================================================================================================
-- Globals
--==========================================================================================================================
local activePlayerID 									= Game.GetActivePlayer()
local activePlayer 										= Players[activePlayerID]
local activePlayerTeam 									= Teams[Game.GetActiveTeam()]
local civilizationAinuID								= GameInfoTypes["CIVILIZATION_LITE_AINU"]
local resourceBearID									= GameInfoTypes["RESOURCE_LITE_AINU_BEAR"]
local isAinuCivActive 									= JFD_IsCivilisationActive(civilizationAinuID)
local isAinuActivePlayer 								= activePlayer:GetCivilizationType() == civilizationAinuID
-- uniques
local unitMatagiID										= GameInfoTypes["UNIT_LITE_AINU_MATAGI"]
-- save
local iSaveX
local iSaveY
-- resources
local resourceCattle									= GameInfoTypes["RESOURCE_COW"]
local resourceSheep										= GameInfoTypes["RESOURCE_SHEEP"]
local resourceDeer										= GameInfoTypes["RESOURCE_DEER"]
local resourceBison										= GameInfoTypes["RESOURCE_BISON"]
local resourceFish										= GameInfoTypes["RESOURCE_FISH"]
local resourceHorse										= GameInfoTypes["RESOURCE_HORSE"]
local resourceCrab										= GameInfoTypes["RESOURCE_CRAB"]
local resourceWhales									= GameInfoTypes["RESOURCE_WHALE"]
local resourceFurs										= GameInfoTypes["RESOURCE_FUR"]
local resourceIvory										= GameInfoTypes["RESOURCE_IVORY"]
-- table
DMS_AnimalResources = {resourceCattle, resourceSheep, resourceDeer, resourceBison, resourceFish, resourceHorse, resourceCrab, resourceWhales, resourceFurs, resourceIvory}
-- other stuff
local techTrappingID									= GameInfoTypes["TECH_TRAPPING"]
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- BearLux
----------------------------------------------------------------------------------------------------------------------------
function BearLux(iPlayer, iCityX, iCityY)
	local pPlayer = Players[iPlayer]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationAinuID then
		--print("BearLux initializing founded city on plot (" .. iCityX .. "," .. iCityY .. ")..")
		local pPlot = Map.GetPlot(iCityX, iCityY)
		local pCity = pPlot:GetPlotCity()
		if pPlot then
			local bPlotTundraOrSnow = false
			for pTundraPlot in PlotAreaSpiralIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pTundraPlot:GetTerrainType() == TerrainTypes.TERRAIN_TUNDRA then
					bPlotTundraOrSnow = true
				elseif (pTundraPlot:GetTerrainType() == TerrainTypes.TERRAIN_SNOW) then
					bPlotTundraOrSnow = true
				end
			end
			if bPlotTundraOrSnow == true then
				pPlayer:ChangeNumResourceTotal(resourceBearID, 1)
				--print("BearLux: bear resource added..")

				if pPlayer:IsHuman() then
					local description = "Source of [ICON_RES_LITE_AINU_BEAR] Bears found in " .. pCity:GetName() .. "!"
					local descriptionShort = "Iomante"
					JFD_SendNotification(iPlayer, 'NOTIFICATION_GENERIC', description, descriptionShort)
				end
			end
		end
	end
end

if isAinuCivActive then
	GameEvents.PlayerCityFounded.Add(BearLux)
end
----------------------------------------------------------------------------------------------------------------------------
-- BearLuxRemove
----------------------------------------------------------------------------------------------------------------------------
function BearLuxRemove(iPlayer, bCapital, iX, iY, iNewPlayer, bConquest1, bConquest2)
	local pPlayer = Players[iPlayer]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationAinuID then
		if iNewPlayer ~= iPlayer then
			local pPlot = Map.GetPlot(iX, iY)
			if pPlot then
				local pCity = pPlot:GetPlotCity()
				if pCity then
					local iNumTotalBearResources = pPlayer:GetNumResourceTotal(resourceBearID, false)
					if iNumTotalBearResources >= 1 then
						pPlayer:ChangeNumResourceTotal(resourceBearID, -1)
						--print("BearLux: bear resource removed..")

						--if pPlayer:IsHuman() then
						--	local description = "Source of [ICON_RES_LITE_AINU_BEAR] Bears is lost with the lose of " .. pCity:GetName() .. "!"
						--	local descriptionShort = "Iomante"
						--	JFD_SendNotification(iPlayer, 'NOTIFICATION_GENERIC', description, descriptionShort)
						--end
					end
				end
			end
		end
	end
end

if isAinuCivActive then
	GameEvents.CityCaptureComplete.Add(BearLuxRemove)
end
----------------------------------------------------------------------------------------------------------------------------
-- AnimisticBeliefs
----------------------------------------------------------------------------------------------------------------------------
local iFirstTimeThroughKillerData = "NONE"
function AnimisticBeliefs(iPlayerKilled, iUnit, iUnitType, iX, iY, bDelay, iPlayerKiller)
	if bDelay then
		iFirstTimeThroughKillerData = iPlayerKiller
		
		if iFirstTimeThroughKillerData == -1 then
			--print("iFirstTimeThroughKillerData was set to -1, which means no valid iKiller data from any run-through: exiting the function") 
			iFirstTimeThroughKillerData = "NONE"
			return
		end

		local pKillerPlayer = Players[iFirstTimeThroughKillerData]
		--print("iFirstTimeThroughKillerData was " .. tostring(iFirstTimeThroughKillerData) .. " before resetting") 
		
		if pKillerPlayer == pPlayer then
			--print("pKillerPlayer is the same as pPlayer: exiting the function")
			return
		end

		local pPlayer = Players[iPlayerKilled]
		if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationAinuID then
			--print("AnimisticBeliefs initializing for Ainu unit killed on plot (" .. iX .. "," .. iY .. ")..")
			local pUnit = pPlayer:GetUnitByID(iUnit)
			local pUnitClass = pUnit:GetUnitCombatType()
			local iCurrentEra = pPlayer:GetCurrentEra()
			local iValue = 0
			local eValue = "NONE"
			if pUnitClass == GameInfoTypes["UNITCOMBAT_ARCHER"] then
				eValue = GameInfoTypes["YIELD_FOOD"]
				iValue = 4
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_ARCHER ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_RECON"] then
				eValue = GameInfoTypes["YIELD_GOLD"]
				iValue = 3
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_RECON ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
				eValue = GameInfoTypes["YIELD_CULTURE"]
				iValue = 5
				print("AnimisticBeliefs: CombatClass : UNITCOMBAT_MOUNTED ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_MELEE"] then
				eValue = GameInfoTypes["YIELD_PRODUCTION"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_MELEE ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_SIEGE"] then
				eValue = GameInfoTypes["YIELD_SCIENCE"]
				iValue = 4
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_SIEGE ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_GUN"] then
				eValue = GameInfoTypes["YIELD_GOLD"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_GUN ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_ARMOR"] then
				eValue = GameInfoTypes["YIELD_PRODUCTION"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_ARMOR ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_HELICOPTER"] then
				eValue = GameInfoTypes["YIELD_CULTURE"]
				iValue = 6
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_HELICOPTER ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_NAVALRANGED"] then
				eValue = GameInfoTypes["YIELD_FOOD"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_NAVALRANGED ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_NAVALMELEE"] then
				eValue = GameInfoTypes["YIELD_PRODUCTION"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_NAVALMELEE ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_FIGHTER"] then
				eValue = GameInfoTypes["YIELD_CULTURE"]
				iValue = 6
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_FIGHTER ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_BOMBER"] then
				eValue = GameInfoTypes["YIELD_CULTURE"]
				iValue = 6
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_BOMBER ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_SUBMARINE"] then
				eValue = GameInfoTypes["YIELD_GOLD"]
				iValue = 5
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_SUBMARINE ..")
			elseif pUnitClass == GameInfoTypes["UNITCOMBAT_CARRIER"] then
				eValue = GameInfoTypes["YIELD_SCIENCE"]
				iValue = 4
				--print("AnimisticBeliefs: CombatClass : UNITCOMBAT_CARRIER ..")
			end
			--local iYieldBonus = math.floor(((iValue * ((iCurrentEra + 1) * 1.5)) * 15) / 10)
			local iYieldBonus = iValue
			if iYieldBonus > 0 then
				--print("AnimisticBeliefs: iYieldBonus = " .. iYieldBonus .."..")
				if (eValue == GameInfoTypes["YIELD_GOLD"]) or (eValue == GameInfoTypes["YIELD_SCIENCE"]) or (eValue == GameInfoTypes["YIELD_CULTURE"]) then
					--print("AnimisticBeliefs: yield type is neither Food nor Production, thus added globally..")
					local iYieldBonus = JFD_GetEraAdjustedValue(iPlayerKilled, iValue * 2) 
					if eValue == GameInfoTypes["YIELD_GOLD"] then
						pPlayer:ChangeGold(iYieldBonus)
						--print("AnimisticBeliefs: yield type is Gold..")

						if pPlayer:IsHuman() then
							
							Events.GameplayAlertMessage("A Unit's Essence is returning to Ainu lands. [COLOR_POSITIVE_TEXT]+" .. iYieldBonus .. "[ICON_GOLD] Gold[ENDCOLOR]!");
							
							--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlotCity:GetX(), pPlotCity:GetY()))), "+" .. iYieldBonus .. "[ICON_GOLD] Gold", 0)
						end

					elseif eValue == GameInfoTypes["YIELD_SCIENCE"] then
						local currentTech = pPlayer:GetCurrentResearch()
						local PlayerTeamTechs = Teams[pPlayer:GetTeam()]:GetTeamTechs()
						PlayerTeamTechs:ChangeResearchProgress(currentTech, iYieldBonus, pPlayer)
						--print("AnimisticBeliefs: yield type is Science..")

						if pPlayer:IsHuman() then

							Events.GameplayAlertMessage("A Unit's Essence is returning to Ainu lands. [COLOR_POSITIVE_TEXT]+" .. iYieldBonus .. "[ICON_RESEARCH] Science[ENDCOLOR]!");

							--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlotCity:GetX(), pPlotCity:GetY()))), "+" .. iYieldBonus .. "[ICON_SCIENCE] Science", 0)
						end

					elseif eValue == GameInfoTypes["YIELD_CULTURE"] then
						pPlayer:ChangeJONSCulture(iYieldBonus)
						--print("AnimisticBeliefs: yield type is Culture..")

						if pPlayer:IsHuman() then

							Events.GameplayAlertMessage("A Unit's Essence is returning to Ainu lands. [COLOR_POSITIVE_TEXT]+" .. iYieldBonus .. "[ICON_CULTURE] Culture[ENDCOLOR]!");

							--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlotCity:GetX(), pPlotCity:GetY()))), "+" .. iYieldBonus .. "[ICON_CULTURE] Culture", 0)
						end

					end
				elseif (eValue == GameInfoTypes["YIELD_FOOD"]) or (eValue == GameInfoTypes["YIELD_PRODUCTION"]) then
					--print("AnimisticBeliefs: yield type is either Food or Production and is added to nearest city..")
					local pUnitPlot = Map.GetPlot(iSaveX, iSaveY)
					local pCity = KilledNearestCity(pUnitPlot, pPlayer)
					pPlotCity = pCity:Plot()
					if eValue == GameInfoTypes["YIELD_FOOD"] then
						local iYieldBonus = math.ceil(iValue * 3)
					
						pCity:ChangeFood(iYieldBonus)
						--print("AnimisticBeliefs: yield type is Food..")

						if pPlayer:IsHuman() then
							
							Events.GameplayAlertMessage("A Unit's Essence is returning to Ainu lands. [COLOR_POSITIVE_TEXT]+" .. iYieldBonus .. "[ICON_FOOD] Food[ENDCOLOR] in " .. pCity:GetName() .. "!");

							--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlotCity:GetX(), pPlotCity:GetY()))), "+" .. iYieldBonus .. "[ICON_FOOD] Food", 0)
						end

					elseif eValue == GameInfoTypes["YIELD_PRODUCTION"] then

						local iYieldBonus = JFD_GetEraAdjustedValue(iPlayerKilled, iValue * 2)

						pCity:ChangeProduction(iYieldBonus)
						--print("AnimisticBeliefs: yield type is Production..")

						if pPlayer:IsHuman() then

							Events.GameplayAlertMessage("A Unit's Essence is returning to Ainu lands. [COLOR_POSITIVE_TEXT]+" .. iYieldBonus .. "[ICON_PRODUCTION] Production[ENDCOLOR] in " .. pCity:GetName() .. "!");

							--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlotCity:GetX(), pPlotCity:GetY()))), "+" .. iYieldBonus .. "[ICON_PRODUCTION] Production", 0)
						end

					end
				end
			end
		end
	end
end

if isAinuCivActive then
	GameEvents.UnitPrekill.Add(AnimisticBeliefs)
end
----------------------------------------------------------------------------------------------------------------------------
-- AinuCheckPlot
----------------------------------------------------------------------------------------------------------------------------
function AinuCheckPlot(iPlayerID, iUnitID)
	--print("AinuCheckPlot initializing..")
	local pPlayer = Players[iPlayerID]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationAinuID then
		local pKilledUnit = pPlayer:GetUnitByID(iUnitID)
		if bIsSavedDone then
			iSaveX = pKilledUnit:GetX()
			iSaveY = pKilledUnit:GetY()
			bIsSavedDone = false
			--print("AinuCheckPlot: bIsSavedDone = false..")
		else
			bIsSavedDone = true
			--print("AinuCheckPlot: bIsSavedDone = true..")
		end
	end
end

if isAinuCivActive then
	GameEvents.CanSaveUnit.Add(AinuCheckPlot)
end
----------------------------------------------------------------------------------------------------------------------------
-- AinuHunter
----------------------------------------------------------------------------------------------------------------------------
function AinuHunter(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == civilizationAinuID then
		--print("AinuHunter initializing..")
		--print("AinuHunter: iterate through units..")
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:GetUnitType() == unitMatagiID then
				--print("AinuCheckPlot: AinuHunter: found Matagi Archer unit..")
				local pPlot = pUnit:GetPlot()
				local pResource = pPlot:GetResourceType()
				if pResource and DMS_TableContains(DMS_AnimalResources, pResource) then
					--print("AinuHunter: Matagi is on an animal resource..")  -- and pPlot:IsBeingWorked()
					if (pPlot:GetImprovementType() == -1) then
						--print("AinuHunter: the animal resource is not improved..")
						local pCity = pPlot:GetWorkingCity()
						if pCity and pCity:GetOwner() == pUnit:GetOwner() then
							--print("AinuHunter: working city " .. pCity:GetName() .. " is Ainu..")
							pCity:ChangeFood(1)
							pCity:ChangeJONSCultureStored(1)
							pPlayer:ChangeJONSCulture(1)
							--print("AinuHunter: added food and culture to " .. pCity:GetName() .. "..")
							if pPlayer:IsHuman() then
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), "[COLOR_POSITIVE_TEXT]+1 [ICON_CULTURE] Culture[ENDCOLOR] and [COLOR_POSITIVE_TEXT]+1 [ICON_FOOD] Food[ENDCOLOR] in " .. pCity:GetName(), 0)
							end
						else
							--print("AinuHunter: pCity either nil or not owner by the ainu - terminate function..")
						end
					else
						--print("AinuHunter: Matagi is on a animal resource, but it is improved - terminate function..")
					end
				else
					--print("AinuHunter: Matagi is not on valid plot - terminate function..")
				end
			end
		end
	end
end

if isAinuCivActive then
	GameEvents.PlayerDoTurn.Add(AinuHunter)
end
--==========================================================================================================================
--==========================================================================================================================
