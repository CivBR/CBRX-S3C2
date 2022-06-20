-- JFD_Civs_HanWu_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
--IsTraitActive
local slotComputerID = SlotStatus["SS_COMPUTER"]
local slotTakenID = SlotStatus["SS_TAKEN"]
function IsTraitActive(traitID)
	for slotID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotPlayer = Players[slotID]
		local slotStatus = PreGame.GetSlotStatus(slotID)
		if (slotStatus == slotTakenID or slotStatus == slotComputerID) then
			if HasTrait(slotPlayer, traitID) then
				return true
			end
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
--Sukritact_GetStrongestMilitaryUnit (Sukritact)
function Sukritact_GetStrongestMilitaryUnit(pPlayer, bIgnoreResources, ...)
	local tUnit = {["Combat"] = 0}
	for iKey, sCombatType in pairs(arg) do
		for row in GameInfo.Units("CombatClass = \'" .. sCombatType .. "\'") do
			if pPlayer:CanTrain(row.ID, bIgnoreResources) and row.Combat > tUnit.Combat then
				tUnit = row
			end
		end
	end
	return tUnit.ID
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_CIV_PLAYERS"]
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local traitHanWuID = GameInfoTypes["TRAIT_JFD_HAN_WU"]
local g_IsTraitActive = IsTraitActive(traitHanWuID) 

local buildingDummyHanWuScienceCapitalID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_CAPITAL"]
local buildingDummyHanWuGoldCapitalID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_GOLD_CAPITAL"]
local buildingDummyHanWuProductionCapitalID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_CAPITAL"]
local buildingDummyHanWuCultureOtherID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_CULTURE_OTHER"]
local buildingDummyHanWuScienceOtherID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_OTHER"]
local buildingDummyHanWuGoldOtherID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_GOLD_OTHER"]
local buildingDummyHanWuProductionOtherID = GameInfoTypes["BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_OTHER"]
local buildingDummyPavilionID = GameInfoTypes["BUILDING_DUMMY_JFD_PAVILION"]
local buildingPaperMakerID = GameInfoTypes["BUILDING_PAPER_MAKER"]
local buildingPavilionID = GameInfoTypes["BUILDING_JFD_PAVILION"]

local promotionQiangSpearmanID = GameInfoTypes["PROMOTION_JFD_QIANG_SPEARMAN"]

local unitQiangSpearmanID = GameInfoTypes["UNIT_JFD_QIANG_SPEARMAN"]

local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]
local yieldScienceID = GameInfoTypes["YIELD_SCIENCE"]
----------------------------------------------------------------------------------------------------------------------------
--g_Specialists_Table
local g_Specialists_Table = {}
local g_Specialists_Count = 1
for row in DB.Query("SELECT ID FROM Specialists WHERE Type != 'SPECIALIST_CITIZEN';") do 	
	g_Specialists_Table[g_Specialists_Count] = row
	g_Specialists_Count = g_Specialists_Count + 1
end
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_HanWu_PlayerDoTurn
local function JFD_HanWu_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UA
	if HasTrait(player, traitHanWuID) then
		local playerCapital = player:GetCapitalCity()
		if (not playerCapital) then return end
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDummyHanWuScienceOtherID, 0)
			playerCapital:SetNumRealBuilding(buildingDummyHanWuScienceCapitalID, 0)
			city:SetNumRealBuilding(buildingDummyHanWuGoldOtherID, 0)
			playerCapital:SetNumRealBuilding(buildingDummyHanWuGoldCapitalID, 0)
			city:SetNumRealBuilding(buildingDummyHanWuProductionOtherID, 0)
			playerCapital:SetNumRealBuilding(buildingDummyHanWuProductionCapitalID, 0)
			city:SetNumRealBuilding(buildingDummyHanWuCultureOtherID, 0)
			
			--g_Specialists_Table
			local numRows = #g_Specialists_Table
			for index = 1, numRows do
				local row = g_Specialists_Table[index]
				local specialistID = row.ID
				local numSpecialist = city:GetSpecialistCount(specialistID)
				local numGold = (city:GetSpecialistYield(specialistID, yieldGoldID)*numSpecialist)
				local numProduction = (city:GetSpecialistYield(specialistID, yieldProductionID)*numSpecialist)
				local numScience = (city:GetSpecialistYield(specialistID, yieldScienceID)*numSpecialist)
				local numCulture = (numScience+numGold+numProduction)
				if numScience > 0 then
					city:SetNumRealBuilding(buildingDummyHanWuScienceOtherID, numScience)
					playerCapital:SetNumRealBuilding(buildingDummyHanWuScienceCapitalID, numScience)
				end
				if numGold > 0 then
					city:SetNumRealBuilding(buildingDummyHanWuGoldOtherID, numGold)
					playerCapital:SetNumRealBuilding(buildingDummyHanWuGoldCapitalID, numGold)
				end
				if numProduction > 0 then
					city:SetNumRealBuilding(buildingDummyHanWuProductionOtherID, numProduction)
					playerCapital:SetNumRealBuilding(buildingDummyHanWuProductionCapitalID, numProduction)
				end
				if numCulture > 0 then
					city:SetNumRealBuilding(buildingDummyHanWuCultureOtherID, numCulture)
				end
			end
		end
	end

	--UB
	for city in player:Cities() do
		if city:IsHasBuilding(buildingPavilionID) then
			local isHasGP = false
			local plotX, plotY = city:GetX(), city:GetY()
			local plot = g_MapGetPlot(plotX, plotY)
			for index = 0,(plot:GetNumUnits() - 1) do
				local thisUnit = plot:GetUnit(index)
				if thisUnit:IsGreatPerson() then
					isHasGP = true
					break
				end
			end
			if isHasGP then
				local numPavilions = city:GetNumRealBuilding(buildingDummyPavilionID)
				if numPavilions < 25 then
					city:ChangeNumRealBuilding(buildingDummyPavilionID, (numPavilions+1))
				end
			else
				local numPavilions = city:GetNumRealBuilding(buildingDummyPavilionID)
				if numPavilions < 25 then
					city:ChangeNumRealBuilding(buildingDummyPavilionID, (numPavilions-1))
				end
			end
		else
			if city:IsHasBuilding(buildingDummyPavilionID) then
				city:ChangeNumRealBuilding(buildingDummyPavilionID, 0)
			end
		end
	end
end
if g_IsTraitActive then
	GameEvents.PlayerDoTurn.Add(JFD_HanWu_PlayerDoTurn)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_HanWu_CityTrained
local function JFD_HanWu_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UU
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitQiangSpearmanID then return end
	local city = player:GetCityByID(cityID)
	local numCulture = player:GetTotalJONSCulturePerTurn()
	if city:GetOriginalOwner() ~= playerID then
		numCulture = (numCulture*2)
	end
	city:ChangeJONSCultureStored(numCulture)	
	if player:IsHuman() and player:IsTurnActive() then
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_CULTURE] Local Culture[ENDCOLOR]", numCulture))
	end
end
if g_IsTraitActive then
	GameEvents.CityTrained.Add(JFD_HanWu_CityTrained)
end
--=======================================================================================================================
--=======================================================================================================================
