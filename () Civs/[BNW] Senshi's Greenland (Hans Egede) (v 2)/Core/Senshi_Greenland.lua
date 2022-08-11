-- JFD_Civs_IcelandArnarson_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
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

--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
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
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local civID = GameInfoTypes["CIVILIZATION_SENSHI_GREENLAND"]
local buildingMissionshusID = GameInfoTypes["BUILDING_SENSHI_MISSIONSHUS"]
local buildingDummyApostleID = GameInfoTypes["BUILDING_DUMMY_SEN_APOSTLE"]
local buildingDummyMissionshusID = GameInfoTypes["BUILDING_DUMMY_SEN_MISSIONSHUS"]
local buildingDummyMarkerID = GameInfoTypes["BUILDING_DUMMY_SEN_MARKER"]
local promoEmbark1ID = GameInfoTypes["PROMOTION_ALLWATER_EMBARKATION"]
local promoEmbark2ID = GameInfoTypes["PROMOTION_OCEAN_MOVEMENT"]
local unitApostleID = GameInfoTypes["UNIT_SENSHI_APOSTLE"]
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local unitWorkboatID = GameInfoTypes["UNIT_WORKBOAT"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
--Senshi_Greenland_PlayerDoTurn
function Senshi_Greenland_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	--UB
	if player:GetCivilizationType() == civID then
		local numTRs = 0 
		for city in player:Cities() do
			if city:IsHasBuilding(buildingMissionshusID) then
				local tradeRoutes = player:GetTradeRoutes()
				for _, tradeRoute in ipairs(tradeRoutes) do
					local fromCity = tradeRoute.FromCity
					if fromCity == city then
						numTRs = numTRs + 1
					end
				end
				local tradeRoutesTo = player:GetTradeRoutesToYou()
				for _, tradeRoute in ipairs(tradeRoutesTo) do
					local toCity = tradeRoute.ToCity
					if toCity == city then
						numTRs = numTRs + 1
					end
				end
			end
			city:SetNumRealBuilding(buildingDummyMissionshusID, numTRs)
		end
	end
end
GameEvents.PlayerDoTurn.Add(Senshi_Greenland_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--Senshi_Greenland_CityConvertsReligion
function Senshi_Greenland_CityConvertsReligion(playerID, religionID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then return end
	
	if player:GetReligionCreatedByPlayer() ~= religionID then return end

	--UA
	if religionID == -1 then return end
	local religionFounderID = Game.GetFounder(religionID, -1)
	local religionFounder = Players[religionFounderID]
	if Teams[religionFounder:GetTeam()]:IsAtWar(player:GetTeam()) then return end
	if religionFounder:GetCivilizationType() ~= civID then return end
	if (not city:IsHasBuilding(buildingDummyMarkerID)) then
		
		local tempPlots = {}
		local tempPlotsCount = 1
		for city in player:Cities() do
			local numTiles = 0
			for i = 0, city:GetNumCityPlots() - 1, 1 do
				local plot = city:GetCityIndexPlot(i)
				if plot and plot:IsWater() and plot:GetResourceType() == -1 then
					tempPlots[tempPlotsCount] = plot
					tempPlotsCount = tempPlotsCount + 1
				end
			end
		end
		for i = 0, 3 - 1, 1 do
			local randPlot = tempPlots[g_GetRandom(1,#tempPlots)]
			if randPlot then
				local tempResources = {}
				local tempResourcesCount = 1
				for row in GameInfo.Resources("Type IN ('RESOURCE_FISH', 'RESOURCE_PEARLS', 'RESOURCE_CRAB', 'RESOURCE_WHALE', 'RESOURCE_CORAL')") do
					local resourceID = row.ID
					tempResources[tempResourcesCount] = resourceID
					tempResourcesCount = tempResourcesCount + 1
				end
				local randResourceID = tempResources[g_GetRandom(1,#tempResources)]
				if randResourceID then
					randPlot:SetResourceType(randResourceID, 1)
					if player:IsHuman() and player:IsTurnActive() then
						local hex = ToHexFromGrid(Vector2(randPlot:GetX(), randPlot:GetY()))
						Events.GameplayFX(hex.x, hex.y, -1)
					end
				end
			end
		end
		
		city:SetNumRealBuilding(buildingDummyMarkerID, 1)
	end
end
GameEvents.CityConvertsReligion.Add(Senshi_Greenland_CityConvertsReligion)
----------------------------------------------------------------------------------------------------------------------------
--Senshi_Greenland_CityConstructed
function Senshi_Greenland_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	local city = player:GetCityByID(cityID)
	local plot = g_MapGetPlot(city:GetX(), city:GetY())

	--UB
	if player:GetCivilizationType() ~= civID then return end
	if buildingID == buildingMissionshusID then
		if city:IsCoastal() then
			player:InitUnit(unitWorkboatID, city:GetX(), city:GetY())
		end
	end
end
GameEvents.CityConstructed.Add(Senshi_Greenland_CityConstructed)
------------------------------------------------------------------------------------------------------------------------
--Senshi_Greenland_UnitPrekill
local function Senshi_Greenland_UnitPrekill(unitOwnerID, unitID, unitTypeID, plotX, plotY, isDelay, playerID)
	local player = Players[unitOwnerID]
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not player:IsAlive()) then return end
	if isDelay then return end
	if playerID ~= -1 then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE UNIT
	if player:GetCivilizationType() ~= civID then return end
	if unitTypeID == unitApostleID then
		local plot = g_MapGetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		if city then
			if city:GetPopulation() <= 1 then
				city:ChangePopulation(2, true)
				city:SetNumRealBuilding(buildingDummyApostleID, 1)
			end
		end
	end
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitSettlerID or unit:IsGreatPerson() and unit:GetUnitType() ~= unitProphetID then
		if (playerCapital:GetReligiousMajority() > 0) then
			local newUnit = player:InitUnit(unitMissionaryID, playerCapital:GetX(), playerCapital:GetY())
			newUnit:SetXY(plotX, plotY)
		end
	end
end
GameEvents.UnitPrekill.Add(Senshi_Greenland_UnitPrekill)
------------------------------------------------------------------------------------------------------------------------
--Senshi_Greenland_SerialEventUnitCreated
local function Senshi_Greenland_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	local unit = player:GetUnitByID(unitID)
	
	if player:GetCivilizationType() == civID and unit:GetUnitType() == unitProphetID then
		unit:Kill(-1)
		player:InitUnit(unitApostleID, unit:GetX(), unit:GetY())
	end

	--UA
	if player:GetCivilizationType() == civID and player:GetReligionCreatedByPlayer() > -1 then
		if unit:GetUnitType() == unitSettlerID or unit:IsGreatPerson() then
			if (not unit:IsHasPromotion(promoEmbark1ID)) then
				unit:SetHasPromotion(promoEmbark1ID, true)
			end
			if (not unit:IsHasPromotion(promoEmbark2ID)) then
				unit:SetHasPromotion(promoEmbark2ID, true)
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(Senshi_Greenland_SerialEventUnitCreated)
--=======================================================================================================================
--=======================================================================================================================