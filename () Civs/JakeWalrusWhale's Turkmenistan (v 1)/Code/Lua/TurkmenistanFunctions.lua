--============================================================
-- GLOBALS
--============================================================
include("UniqueDiplomacyUtils.lua")
include("FLuaVector.lua")
print("JWW Turkmenistan Lua Activated")

local iTurkmenistan = GameInfoTypes["CIVILIZATION_JWW_TURKMENISTAN"]
local pActivePlayer = Players[Game.GetActivePlayer()]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iTurkmenistan)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local iVal = 0
tStratRes = {}
for row in DB.Query("SELECT Type FROM Resources WHERE ResourceClassType != 'RESOURCECLASS_BONUS' AND ResourceClassType != 'RESOURCECLASS_LUXURY' AND Type != 'RESOURCE_ARTIFACTS' AND Type != 'RESOURCE_HIDDEN_ARTIFACTS'") do
   tStratRes[iVal] = {ResType=row.Type}
   iVal = iVal + 1
end

tGreatWorksOfWritingBuildings = {}
for row in DB.Query("SELECT BuildingClass FROM Buildings WHERE GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'") do
   tGreatWorksOfWritingBuildings[row.BuildingClass] = {}
end
--===========================================================================
-- UA (Ruhnama)
--===========================================================================
local iWriterSpecialist = GameInfoTypes["SPECIALIST_WRITER"]
-----------------------------------------------------------------------------
-- Expending Great Writers start a We Love the King Day in all cities.
-----------------------------------------------------------------------------
function JWW_WhyIsThereNoEventForMakingGreatWorks(iPlayer, iUnit, unitType, iX, iY, bDelay, iKiller) 
	if not bDelay then return end
	if iKiller ~= -1 then return end
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit:GetUnitType() == GameInfoTypes["UNIT_WRITER"] then
			for pCity in pPlayer:Cities() do
				if pCity:GetWeLoveTheKingDayCounter() <= 15 then
					pCity:SetWeLoveTheKingDayCounter(15)
					if pPlayer:IsHuman() then
						pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_LUXURY_RESOURCE, 'Expending a [ICON_GREAT_WRITER] Great Writer causes the city of ' .. pCity:GetName() .. ' to enter a "We Love the King" Day, giving the city a [ICON_FOOD] growth bonus!', pCity:GetName() .. ' loves the king!', pCity:GetX(), pCity:GetY(), GameInfo.Resources["RESOURCE_ARTIFACTS"].ID)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- The first Great Work of Writing in a city will spawn a random strategic resource nearby.
-----------------------------------------------------------------------------
local iUADummy = GameInfoTypes["BUILDING_JWW_TURKMEN_UA_DUMMY"] 

function JWW_ScolarsGetDollars(iPlayer) --check every turn if GW of Writing exists, then spawn dummy (that prevents any more from spawning)
	local bCanDoInCityBounds = false
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then
		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(iUADummy) then
				for k, v in pairs(tGreatWorksOfWritingBuildings) do
					if pCity:IsHoldingGreatWork(GameInfoTypes[k]) then

						 --spawn res
						 for i = 0, pCity:GetNumCityPlots(), 1 do
							local pPlot = pCity:GetCityIndexPlot(i)
							if pPlot:GetWorkingCity() == pCity then
								if (pPlot:GetResourceType() == -1) and (pPlot:GetImprovementType() == -1) and (not pPlot:IsCity()) then
									bCanDoInCityBounds = true

									if pPlot:IsWater() then
										pPlot:SetResourceType(GameInfoTypes["RESOURCE_OIL"], JFD_GetRandom(3, 6))
										pCity:SetNumRealBuilding(iUADummy, 1)
										if pPlayer:IsHuman() then
											Events.GameplayAlertMessage('Due to the city of ' .. pCity:GetName() .. ' gaining a Great Work of Writing, a Strategic Resource was found on a nearby tile! That resource may not be available yet however...')
										end
										return

									else
										local iRes = JFD_GetRandom(0, iVal) --pick random resource
										for k, v in pairs(tStratRes) do
											if iRes == k then
												pPlot:SetResourceType(GameInfoTypes[v.ResType], JFD_GetRandom(3, 6))
												pCity:SetNumRealBuilding(iUADummy, 1)
												if pPlayer:IsHuman() then
													Events.GameplayAlertMessage('Due to the city of ' .. pCity:GetName() .. ' gaining a Great Work of Writing, a Strategic Resource was found on a nearby tile! That resource may not be available yet however...')
												end
												return
											end
										end
									end
								end
							end

							if not bCanDoInCityBounds then --cant spawn any resources in territory, spawn it where possible nearby (within 3 tiles)
								for i = 0, pCity:GetNumCityPlots(), 1 do
									local pPlot = pCity:GetCityIndexPlot(i)
									if (pPlot:GetResourceType() == -1) and (pPlot:GetImprovementType() == -1) and (not pPlot:IsCity()) then

										if pPlot:IsWater() then
											pPlot:SetResourceType(GameInfoTypes["RESOURCE_OIL"], JFD_GetRandom(3, 6))
											pCity:SetNumRealBuilding(iUADummy, 1)
											if pPlayer:IsHuman() then
												Events.GameplayAlertMessage('Due to the city of ' .. pCity:GetName() .. ' gaining a Great Work of Writing, a Strategic Resource was found on a nearby tile! That resource may not be available yet however...')
											end
											return

										else
											local iRes = JFD_GetRandom(0, iVal) --pick random resource
											for k, v in pairs(tStratRes) do
												if iRes == k then
													pPlot:SetResourceType(GameInfoTypes[v.ResType], JFD_GetRandom(3, 6))
													pCity:SetNumRealBuilding(iUADummy, 1)
													if pPlayer:IsHuman() then
														Events.GameplayAlertMessage('Due to the city of ' .. pCity:GetName() .. ' gaining a Great Work of Writing, a Strategic Resource was found on a nearby tile! That resource may not be available yet however...')
													end
													return
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_WhyIsThereNoEventForMakingGreatWorks)
	GameEvents.PlayerDoTurn.Add(JWW_ScolarsGetDollars)
end
--===========================================================================
-- UU (Ederman)
--===========================================================================
local iEderman = GameInfoTypes["UNIT_JWW_EDERMAN"]
--local iMarineClass = GameInfoTypes["UNITCLASS_MARINE"]
-----------------------------------------------------------------------------
-- Built faster if the city has a Great Work of Writing.
-----------------------------------------------------------------------------
local iEdermanTrainDummy = GameInfoTypes["BUILDING_JWW_EDERMAN_TRAIN_DUMMY"]

function JWW_WritingMakesUsFaster(iPlayer) --If Great Work of Writing, Dummy Building
	local pPlayer = Players[iPlayer]
	local bDummy = false
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then
		for pCity in pPlayer:Cities() do
			for k, v in pairs(tGreatWorksOfWritingBuildings) do
				if pCity:IsHoldingGreatWork(GameInfoTypes[k]) then
					bDummy = true
					pCity:SetNumRealBuilding(iEdermanTrainDummy, 1)
					break
				end
			end
			if not bDummy then
				pCity:SetNumRealBuilding(iEdermanTrainDummy, 0)
			end
		end
	end
end		
-----------------------------------------------------------------------------
-- If trained during a We Love the King Day, grant the city a Great Work of Writing slot.
-----------------------------------------------------------------------------
local iEdermanWLTKDummy = GameInfoTypes["BUILDING_JWW_EDERMAN_WLTK_DUMMY"]

function JWW_FreeWritingSlotTheKingIsGreat(iPlayer, iCity, iUnit) --check WLTK then for UU; give +1 dummy
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then
		local pCity = pPlayer:GetCityByID(iCity)
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pCity:GetWeLoveTheKingDayCounter() > 0 then
			if pUnit:GetUnitType() == iEderman then
				if pCity:IsHasBuilding(iEdermanWLTKDummy) then
					pCity:SetNumRealBuilding(iEdermanWLTKDummy, pCity:GetNumRealBuilding(iEdermanWLTKDummy) + 1)
				else
					pCity:SetNumRealBuilding(iEdermanWLTKDummy, 1)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_WritingMakesUsFaster)
	GameEvents.CityTrained.Add(JWW_FreeWritingSlotTheKingIsGreat)
end
--===========================================================================
-- UB (Gas Pipeline)
--===========================================================================
local iGasGasGas = GameInfoTypes["BUILDING_JWW_GAS_PIPELINE"]
-----------------------------------------------------------------------------
-- Trading away strategic resources in city limits will generate gold and great writer points.
-----------------------------------------------------------------------------
function JWW_IronMakesThePens(iPlayer)
	local iNum = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then

		local ResourcesTraded = {} --slightly taken from Tar
		for k, v in pairs(tStratRes) do
			local numExport = pPlayer:GetResourceExport(GameInfoTypes[v.ResType])
			if numExport > 0 then
				table.insert(ResourcesTraded, v.ResType)
			end
		end

		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iGasGasGas) then
				if ResourcesTraded then
					for k, v in pairs(ResourcesTraded) do
						if pCity:IsHasResourceLocal(GameInfoTypes[v]) then
							iNum = iNum + 1
						end
					end
				end
			end
			pPlayer:ChangeGold(iNum * 10)
			pCity:ChangeSpecialistGreatPersonProgressTimes100(iWriterSpecialist, iNum * 200)
		end
	end
end
-----------------------------------------------------------------------------
-- If strategic resources are improved during a We Love the King Day in this city, the amount of resources on the tile will be duplicated.
-----------------------------------------------------------------------------
local tDupRes = {}

function JWW_DoubleDown(iPlayer, iX, iY, iImprovement) --wow crazy smash reference??
	local pPlayer = Players[iPlayer]
	local pPlot = Map.GetPlot(iX, iY)
	for k, v in pairs(tDupRes) do --no plot can be duplicated twice
		if k and (k == pPlot) then return end
	end
	if pPlayer:IsAlive() then
		local pCity = pPlot:GetWorkingCity()
		if pCity and (pCity:GetWeLoveTheKingDayCounter() > 0) and pCity:IsHasBuilding(iGasGasGas) then
			for k, v in pairs(tStratRes) do
				if pPlot:GetResourceType() == GameInfoTypes[v.ResType] then
					if not (pPlot:GetImprovementType() == -1) then
						local iNumRes = pPlot:GetNumResource()
						local iRes = pPlot:GetResourceType()
						pPlot:ChangeNumResource(iNumRes)
						tDupRes[pPlot] = {}
					end
				end
			end
		end
	end
end				
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_IronMakesThePens)
	GameEvents.BuildFinished.Add(JWW_DoubleDown)
end
--===========================================================================
-- OTHER
--===========================================================================
-- Unique Diplo Responses with any civ with a dog with their leaderscene or icons (O'Connell, Frederick VII, Muteesa I, Charles II, Matilda, Amundsen)
-----------------------------------------------------------------------------
--stolen from Typhlomence
function Typh_NiyazovUniqueDiplo()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			if (civilizationID == GameInfoTypes["CIVILIZATION_DMS_IRELAND_OCONNELL"]) or (civilizationID == GameInfoTypes["CIVILIZATION_DMS_FRED7_DENMARK"]) or (civilizationID == GameInfoTypes["CIVILIZATION_DJ_TUSCANY"]) or (civilizationID == GameInfoTypes["CIVILIZATION_GT_SF_ANTARCTICA"]) or (civilizationID == GameInfoTypes["CIVILIZATION_TV_BUGANDA"]) or (civilizationID == GameInfoTypes["CIVILIZATION_HI_CH_ENGLAND"]) then
				ChangeDiplomacyResponse("LEADER_JWW_SAPARMURAT_NIYAZOV", "RESPONSE_FIRST_GREETING",  "TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_FIRSTGREETING%",	"TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_DOG_FIRSTGREETING_1",	500)
				break
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(Typh_NiyazovUniqueDiplo)
--===========================================================================