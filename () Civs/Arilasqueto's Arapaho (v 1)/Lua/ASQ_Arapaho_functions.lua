-- ASQ_ Arapaho_functions
-- Author: Sket
-- Code by: Chrisy15, EmeraldRange, TopHatPaladin
-- DateCreated: 7/7/2021 12:24:41 PM
--------------------------------------------------------------

--[[
People of the blue sky - Gain a free mounted unit each time you complete a trade route. Cities settled on a strategic resource also create the relevant improvement and get a free trade route slot (max 3).
]]
include("FLuaVector.lua")
print("Arapaho functions loaded")
--=======================================================================================================================
-- JFD_IsCivilisationActive
--=======================================================================================================================
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
--=======================================================================================================================
local iCiv = GameInfoTypes["CIVILIZATION_ASQ_ARAPAHO"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iLeader = GameInfoTypes["LEADER_ASQ_PRETTYNOSE"]
local iTradeDummy = GameInfoTypes["BUILDING_ASQ_TRADE_SLOT_DUMMY"]

local tStrats = {}
for row in DB.Query("SELECT a.ID ResourceID, b.ID ImprovementID FROM Resources a, Improvements b, Improvement_ResourceTypes c WHERE c.ResourceTrade = 1 AND b.Water = 0 AND a.Type = c.ResourceType AND b.Type = c.ImprovementType AND a.ResourceUsage = 1") do
	if not tStrats[row.ResourceID] then
		tStrats[row.ResourceID] = row.ImprovementID
	end
end

local tTradeClasses = {}
tTradeClasses[GameInfoTypes["UNITCLASS_CARAVAN"]] = true
tTradeClasses[GameInfoTypes["UNITCLASS_CARGO_SHIP"]] = true

-- Shitty and inefficient but I can't think rn
function GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["ID"] = GameInfoTypes.UNIT_WARRIOR, ["Combat"] = -1}
	for iKey, sCombatType in pairs({...}) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end

function C15_Ari_CityFounded(playerID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetLeaderType() ~= iLeader then return end
	local pPlot = Map.GetPlot(iX, iY)
	local iResource = pPlot:GetResourceType(pPlayer:GetTeam())
	if tStrats[iResource] then
		pPlot:SetImprovementType(tStrats[iResource], playerID)
		if pPlayer:CountNumBuildings(iTradeDummy) < 3 then
			pPlot:GetPlotCity():SetNumRealBuilding(iTradeDummy, 1)
		end
	end
end

GameEvents.PlayerCityFounded.Add(C15_Ari_CityFounded)

function C15_Ari_CanSaveUnit(playerID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetLeaderType() ~= iLeader then return end
	local pUnit = pPlayer:GetUnitByID(unitID)
	if tTradeClasses[pUnit:GetUnitClassType()] then
		local pPlot = pUnit:GetPlot()
		local pCity = pPlot:GetWorkingCity()
		if pCity and pCity:GetOwner() == playerID then
			local iUsed = pPlayer:GetNumInternationalTradeRoutesUsed()
			local iRows = #pPlayer:GetTradeRoutes()
			if iUsed == iRows then -- It seems as though the only condition where these are the same during CanSaveUnit are upon Route completion.
				local iNewUnit = GetStrongestMilitaryUnit(pPlayer, true, "UNITCOMBAT_MOUNTED", "UNITCOMBAT_ARMOR")
				pPlayer:InitUnit(iNewUnit, pPlot:GetX(), pPlot:GetY()):JumpToNearestValidPlot()
			end
		end
	end
end



--[[GameEvents.UnitSetXY.Add(function(playerID, unitID, iX, iY) local pPlayer = Players[playerID] local pUnit = pPlayer:GetUnitByID(unitID) if pUnit:GetUnitType() == GameInfoTypes["UNIT_CARAVAN"] then print("SetXY: ", playerID, unitID, iX, iY, "Trade Routes:", pPlayer:GetNumInternationalTradeRoutesUsed()) end end)
Events.SerialEventUnitCreated.Add(function(playerID, unitID) local pPlayer = Players[playerID] local pUnit = pPlayer:GetUnitByID(unitID) if pUnit:GetUnitType() == GameInfoTypes["UNIT_CARAVAN"] then print("UnitCreated: ", playerID, unitID, pUnit:GetX(), pUnit:GetY(), "Trade Routes:", pPlayer:GetNumInternationalTradeRoutesUsed()) end end)
GameEvents.CanSaveUnit.Add(function(playerID, unitID) local pPlayer = Players[playerID] local pUnit = pPlayer:GetUnitByID(unitID) if pUnit:GetUnitType() == GameInfoTypes["UNIT_CARAVAN"] then print("CanSaveUnit: ", playerID, unitID, pUnit:GetX(), pUnit:GetY(), pUnit:GetPlot(), "Trade Routes:", pPlayer:GetNumInternationalTradeRoutesUsed()) for k,v in pairs(pPlayer:GetTradeRoutes()) do print(k,v) end end end)
GameEvents.CanSaveUnit.Add(function(playerID, unitID) local pPlayer = Players[playerID] local pUnit = pPlayer:GetUnitByID(unitID) if pUnit:GetUnitType() == GameInfoTypes["UNIT_CARAVAN"] then print("CanSaveUnit: ", playerID, unitID, pUnit:GetX(), pUnit:GetY(), pUnit:GetPlot(), "Trade Routes:", pPlayer:GetNumInternationalTradeRoutesUsed(), pPlayer:GetUnitClassCount(GameInfoTypes["UNITCLASS_CARAVAN"]), #pPlayer:GetTradeRoutes()) for k,v in pairs(pPlayer:GetTradeRoutes()) do print(k,v.ToCityName) end end end)]]

--function EW_Whatever was here but idk what it does so rip 

----------------------------------------------------------------------------------------------------------------------------
-- Beniiinen: Kills generate various yields depending on level.
-- 1] Gold, 2] Culture, 3] Faith, 4] Science; 5-8] Double in same order
-- lvl 1 is promotionless
-- PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC is used as a convenient what to identify that it is a Beniiinen
----------------------------------------------------------------------------------------------------------------------------
local iBeniiinenPromo			= GameInfoTypes["PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC"]

local tBeniiinenYields = {}
local iD = Game.GetGameSpeedType()
for row in DB.Query("SELECT GoldPercent, CulturePercent, ResearchPercent FROM GameSpeeds WHERE ID =" .. iD .. ";") do 
	--Tying Religion to Culture cuz firaxis bad
	tBeniiinenYields[1] = row.GoldPercent / 100
	tBeniiinenYields[2] = row.CulturePercent / 100
	tBeniiinenYields[3] = row.CulturePercent / 100
	tBeniiinenYields[0] = row.ResearchPercent / 100
	--this is setup to do a modular calc later
end

local iUnitStrength = 0

function ER_BeniiinenKill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if bDelay then
		if killerID == -1 then return end
		local pPlayer = Players[playerID]
		iUnitStrength = pPlayer:GetUnitByID(unitID):GetBaseCombatStrength()
	elseif iUnitStrength > 0 then
		local pPlot = Map.GetPlot(iX, iY)
		for i = 0, pPlot:GetNumUnits()-1, 1 do
			local pKillingUnit = pPlot:GetUnit(i)
			if pKillingUnit and pKillingUnit:IsHasPromotion(iBeniiinenPromo) then
				local iLevelMod = math.floor(pKillingUnit:GetLevel() % 4)
				local iLevel = math.floor(pKillingUnit:GetLevel() / 4)
				
				local iYield = 0
				if iLevelMod ~= 0 then  --4 then iLevel is 1
					iYield = math.floor(iUnitStrength * (iLevel + 1)*tBeniiinenYields[iLevelMod])
				else 
					iYield = math.floor(iUnitStrength * iLevel * tBeniiinenYields[iLevelMod])
				end
				if iYield <= 0 then return end
				
				local pPlayer = Players[pKillingUnit:GetOwner()]
				local sGoldMessage = ""
				local sCultureMessage = ""
				local sFaithMessage = ""
				local sScienceMessage = ""

				for j = 0,iLevel+1,1 do
					print(j)
					if iLevelMod >= 1 then
						pPlayer:ChangeGold(iYield)
						sGoldMessage = "[COLOR_YIELD_GOLD]+" .. iYield .. " [ICON_GOLD][ENDCOLOR]"
					end
					if iLevelMod >= 2 then
						pPlayer:ChangeJONSCulture(iYield)
						sCultureMessage = "[COLOR_CULTURE_STORED]+" .. iYield .. " [ICON_CULTURE][ENDCOLOR]"
					end
					if iLevelMod >= 3 then
						pPlayer:ChangeFaith(iYield)
						sFaithMessage = "[COLOR_WHITE]+" .. iYield .. " [ICON_PEACE][ENDCOLOR]"
					end
					if iLevelMod >= 0 and iLevel ~= 0 then 
						local pTeam = Teams[pPlayer:GetTeam()]
						local pTeamTech = pTeam:GetTeamTechs()
						local pTech = pPlayer:GetCurrentResearch()
						if pTech and pTeamTech then 
							pTeamTech:ChangeResearchProgress(pTech, iYield, pPlayer)
							sScienceMessage = "[COLOR_RESEARCH_STORED]+" .. iYield .. " [ICON_RESEARCH][ENDCOLOR]"
						end
					end
				end
				
				if pPlayer:IsHuman() then
					local iX, iY = pPlot:GetX(), pPlot:GetY()
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sGoldMessage, 1)
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sCultureMessage, 1)
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sFaithMessage, 1)
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sScienceMessage, 1)
				end
			end
		end
	end
end



local iHorse = GameInfoTypes["RESOURCE_HORSE"]
local iRangeDummy = GameInfoTypes["BUILDING_ASQ_RANGE_DUMMY"]
local iTravoisPost = GameInfoTypes["BUILDING_ASQ_TRAVOIS"]

-- TradeRouteLandDistanceModifier = 10
-- TradeRouteSeaDistanceModifier = 10

function GetNumHorses(pCity)
	local iNum = 0
	local iOwner = pCity:GetOwner()
	for i = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pCity:IsWorkingPlot(pPlot) and (pPlot:GetResourceType() == iHorse) then
			iNum = iNum + pPlot:GetNumResource()
		end
	end
	print("Horse " .. iNum); 
	return iNum
end

function Arapaho_TravoisPostConstructed(playerID, cityID, buildingType)
	if buildingType ~= iTravoisPost then return end
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	local iNumHorses = GetNumHorses(pCity)
	pCity:SetNumRealBuilding(iRangeDummy, iNumHorses)
end

function Arapaho_TravoisPostDoTurn(playerID)
	local pPlayer = Players[playerID]
	local bIsMainPlayer = (Game.GetActivePlayer() == playerID)
	if pPlayer:CountNumBuildings(iTravoisPost) > 0 then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iTravoisPost) then
				local iNumHorses = GetNumHorses(pCity)
				pCity:SetNumRealBuilding(iRangeDummy, iNumHorses)
			else
				pCity:SetNumRealBuilding(iRangeDummy, 0)
			end
		end
		
		local tCityTradeIncome = {}
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			local pCity = v.FromCity
			if pCity:IsHasBuilding(iTravoisPost) then
				if not tCityTradeIncome[pCity] then
					tCityTradeIncome[pCity] = 0
				end
				tCityTradeIncome[pCity] = tCityTradeIncome[pCity] + v.FromGPT
				print(pCity:GetName() .. " has " .. tCityTradeIncome[pCity]);
			end
		end
		
		for kCity, v in pairs(tCityTradeIncome) do
			local iQuarterIncome = math.ceil(v / 400)
			kCity:ChangeProduction(iQuarterIncome)
			if bIsMainPlayer then
				local iX, iY = kCity:GetX(), kCity:GetY()
				--local sMessage = "Travois Post: +" .. iQuarterIncome .. " [ICON_PRODUCTION]"
				--Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 1)
			end
		end
	end
end

if bIsActive then
	GameEvents.CityConstructed.Add(Arapaho_TravoisPostConstructed)
	GameEvents.PlayerDoTurn.Add(Arapaho_TravoisPostDoTurn)
	GameEvents.CanSaveUnit.Add(C15_Ari_CanSaveUnit)
	GameEvents.UnitPrekill.Add(ER_BeniiinenKill)
end


