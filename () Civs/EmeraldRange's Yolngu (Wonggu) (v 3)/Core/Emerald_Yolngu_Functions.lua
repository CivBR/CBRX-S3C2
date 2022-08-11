-- Civs_EmeraldYolngu_Functions
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
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingDumYolnguID = GameInfoTypes["BUILDING_DUMMY_EMERALD_YOLNGU"]
local buildingDumYolngu2ID = GameInfoTypes["BUILDING_DUMMY_EMERALD_YOLNGU_2"]

local traitYolnguID = GameInfoTypes["TRAIT_ER_GARMA_MILNGURR"]

local unitLippaID = GameInfoTypes["UNIT_ER_LIPPA"]
local oceanPromoID = GameInfoTypes["PROMOTION_OCEAN_IMPASSABLE"]

--Emerald's

local iBaseTrireme = 10
for row in DB.Query("SELECT Combat FROM Units WHERE Type='UNIT_TRIREME'") do
	iBaseTrireme = row.Combat
end
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--ER_StrengthAdder
function ER_StrengthAdder(unit) 
	--already lippa and stuff
	--iBaseTrireme should be 10: the strength of a trireme
	local iPastAddition = unit:GetBaseCombatStrength() - iBaseTrireme
	if iPastAddition == 0 then
		unit:SetBaseCombatStrength(12)
	elseif iPastAddition == 2 then
		unit:SetBaseCombatStrength(13)
	elseif iPastAddition == 3 and math.random() < 0.5 then
		unit:SetBaseCombatStrength(14)
	elseif iPastAddition == 4 and math.random() < 0.2 then
		unit:SetBaseCombatStrength(15)
	elseif iPastAddition >= 5 and math.random() < 0.1 then
		unit:SetBaseCombatStrength(unit:GetBaseCombatStrength()+1)
	elseif iPastAddition == 1 then --shouldn't ever happen
		unit:SetBaseCombatStrength(12)
	end
end
--EmeraldYolngu_PlayerDoTurn
local function EmeraldYolngu_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UA
	if HasTrait(player, traitYolnguID) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDumYolnguID, 0)
			city:SetNumRealBuilding(buildingDumYolngu2ID, 0)
		end

		local tradeRoutes = player:GetTradeRoutes()
		local numGPGen = 0
		for _, tradeRoute in ipairs(tradeRoutes) do
			local toCity = tradeRoute.ToCity
			local toPlot = g_MapGetPlot(toCity:GetX(), toCity:GetY())
			local fromCity = tradeRoute.FromCity
			local fromPlot = g_MapGetPlot(fromCity:GetX(), fromCity:GetY())
			if toPlot:GetArea() ~= fromPlot:GetArea() then
				numGPGen = numGPGen + 1
			end
			tradeRoute.FromCity:SetNumRealBuilding(buildingDumYolnguID, (numGPGen))
			if tradeRoute.Domain == DomainTypes["DOMAIN_LAND"] then
				local numGreatWorks = tradeRoute.FromCity:GetNumGreatWorks()
				tradeRoute.FromCity:SetNumRealBuilding(buildingDumYolngu2ID, numGreatWorks)
			end
		end

		--UU
		local bCurrency = (Teams[player:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CURRENCY))

		for unit in player:Units() do
			if unit:GetUnitType() == unitLippaID then
				--currency embark
				if unit:IsHasPromotion(oceanPromoID) and bCurrency then
					unit:SetHasPromotion(oceanPromoID, false)
				end
				--jfd stuff
				local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
				if plot:GetFeatureType() == -1 and plot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] then
					local astrTradeRouteStrings = player:GetInternationalTradeRoutePlotToolTip(plot);
					if #astrTradeRouteStrings > 0 then
						player:ChangeJONSCulture(1)
						player:ChangeGold(3)
						local plotCity = plot:GetWorkingCity() 
						if plotCity then
							plotCity:ChangeFood(1)
							if player:IsHuman() and player:IsTurnActive() then
								local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+1 [ICON_CULTURE] +3 [ICON_GOLD] +1 [ICON_FOOD]"))
							end
						else
							if player:IsHuman() and player:IsTurnActive() then
								local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
								Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+1 [ICON_CULTURE] +3 [ICON_GOLD]"))
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(EmeraldYolngu_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--EmeraldYolngu_TeamMeet
local function EmeraldYolngu_TeamMeet(playerMetID, playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerMet = Players[playerMetID]
	local playerMetTeam = Teams[playerMet:GetTeam()]
	
	--UNIQUE TRAIT
	if HasTrait(player, traitYolnguID) then 
		local toCity = player:GetCapitalCity()
		if (not toCity) then return end
		local toPlot = g_MapGetPlot(toCity:GetX(), toCity:GetY())
		local fromCity = playerMet:GetCapitalCity()
		if (not fromCity) then return end
		local fromPlot = g_MapGetPlot(fromCity:GetX(), fromCity:GetY())
		if toPlot:GetArea() ~= fromPlot:GetArea() then
			for unit in player:Units() do
				if unit:GetUnitType() == unitLippaID then
					ER_StrengthAdder(unit)
				end
			end
		end
	elseif HasTrait(playerMet, traitYolnguID) then 
		local toCity = playerMet:GetCapitalCity()
		if (not toCity) then return end
		local toPlot = g_MapGetPlot(toCity:GetX(), toCity:GetY())
		local fromCity = player:GetCapitalCity()
		if (not fromCity) then return end
		local fromPlot = g_MapGetPlot(fromCity:GetX(), fromCity:GetY())
		if toPlot:GetArea() ~= fromPlot:GetArea() then
			for unit in playerMet:Units() do
				if unit:GetUnitType() == unitLippaID and unit:GetBaseCombatStrength() < 20 then
					ER_StrengthAdder(unit)
				end
			end
		end
	end
end
GameEvents.TeamMeet.Add(EmeraldYolngu_TeamMeet)
--=======================================================================================================================
--=======================================================================================================================