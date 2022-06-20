-- Senshi_TitoFunctions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
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
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
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
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- INIT
----------------------------------------------------------------------------------------------------------------------------
--Senshi_Tito_LoadScreenClose
local policyTitoID = GameInfoTypes["POLICY_SENSHI_YUGOSLAVIA_TITO"]
local function Senshi_Tito_LoadScreenClose()
	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
		if player:IsAlive() then
			if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SENSHI_YUGOSLAVIA"] then
				if (not player:HasPolicy(policyTitoID)) then
					if Player.GrantPolicy then 
						player:GrantPolicy(policyTitoID, true)
					else
						player:SetNumFreePolicies(1)
						player:SetNumFreePolicies(0)
						player:SetHasPolicy(policyTitoID, true)
					end
				end
			end
		end
	end
end
Events.LoadScreenClose.Add(Senshi_Tito_LoadScreenClose)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civilizationTitoID = GameInfoTypes["CIVILIZATION_SENSHI_YUGOSLAVIA"]
local buildingDummySpomenikCultureID = GameInfoTypes["BUILDING_SENSHI_YUGOSLAVIA_TITO_CULTURE"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--Senshi_Tito_PlayerDoTurn
local buildingSpomenikID = GameInfoTypes["BUILDING_SENSHI_SPOMENIK"]
local buildingDummyTitoProdID = GameInfoTypes["BUILDING_SENSHI_YUGOSLAVIA_TITO_PRODUCTION"]
local promotionPartisanRangeID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE"]
local unitPartisanID = GameInfoTypes["UNIT_SENSHI_PARTISAN"]
local function Senshi_Tito_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	if player:GetCivilizationType() == civilizationTitoID then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDummySpomenikCultureID, 0)
			if city:IsHasBuilding(buildingSpomenikID) then
				city:SetNumRealBuilding(buildingDummyTitoProdID, numLocalHappiness)
				if city:GetProductionUnit() > -1 then
					local numLocalHappiness = city:GetLocalHappiness()
					if player:GetAtWarCount(true) > 0 then
						numLocalHappiness = numLocalHappiness*2
					end
					city:SetNumRealBuilding(buildingDummyTitoProdID, numLocalHappiness)
				end
			end
		end
		
		for unit in player:Units() do
			if unit:GetUnitType() == unitPartisanID then
				unit:SetHasPromotion(promotionPartisanRangeID, false)
				local unitPlot = unit:GetPlot()
				for loopPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local adjUnit = loopPlot:GetUnit()
					if adjUnit then
						local adjUnitOwner = Players[adjUnit:GetOwner()]
						local adjUnitOwnerTeamID = adjUnitOwner:GetTeam()
						local playerTeam = Teams[player:GetTeam()]
						if playerTeam:IsAtWar(adjUnitOwnerTeamID) then
							unit:SetHasPromotion(promotionPartisanRangeID, true)
							break 
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Senshi_Tito_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--Senshi_Tito_CityTrained
local function Senshi_Tito_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	
	if player:GetCivilizationType() == civilizationTitoID then
		local playerTeam = Teams[player:GetTeam()]
		if playerTeam:GetAtWarCount(true) > 0 then
			local numCulture = player:GetTotalJONSCulturePerTurn()
			unit:ChangeExperience(numCulture)
		end
	end
end
GameEvents.CityTrained.Add(Senshi_Tito_CityTrained)
-------------------------------------------------------------------------------------------------------------------------
--Senshi_Tito_UnitPromoted
local promotionPartisanRangeStrength1ID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_1"]
local promotionPartisanRangeStrength2ID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_2"]
local promotionPartisanRangeStrength3ID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_3"]
local promotionPartisanRangeStrength4ID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_4"]
local promotionPartisanRangeStrength5ID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_5"]
local function Senshi_Tito_UnitPromoted(playerID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	local unit = player:GetUnitByID(unitID)
	
	if player:GetCivilizationType() == civilizationTitoID then
		if unit:GetUnitType() == unitPartisanID then
			local numLevel = unit:GetLevel()
			if numLevel <= 5 then
				local promoID = GameInfoTypes["PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_" .. numLevel]
				if promoID then
					unit:SetHasPromotion(promoID, true)
				end
			end
		end
	end
end
GameEvents.UnitPromoted.Add(Senshi_Tito_UnitPromoted)
------------------------------------------------------------------------------------------------------------------------
--Senshi_Tito_UnitPrekill
local function Senshi_Tito_UnitPrekill(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	local player = Players[killingPlayerID]
	if unitOwnerID == killingPlayerID then return end
	if (not player) then return end
	if (not player:IsAlive()) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	if player:GetCivilizationType() == civilizationTitoID then
		local plot = Map.GetPlot(plotX, plotY)
		local plotCity = plot:GetWorkingCity()
		if plotCity and plotCity:GetOwner() == killingPlayerID then
			if plotCity:IsHasBuilding(buildingSpomenikID) then
				local numCulture = plotCity:GetNumRealBuilding(buildingDummySpomenikCultureID)+1
				plotCity:SetNumRealBuilding(buildingDummySpomenikCultureID, numCulture)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(Senshi_Tito_UnitPrekill)
--=======================================================================================================================
--=======================================================================================================================
