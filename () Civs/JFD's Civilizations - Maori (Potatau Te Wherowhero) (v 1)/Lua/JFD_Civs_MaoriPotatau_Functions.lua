-- JFD_Civs_MaoriPotatau_Functions
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
local buildingMaraeID = GameInfoTypes["BUILDING_JFD_MARAE"]

local traitMaoriPotatauID = GameInfoTypes["TRAIT_JFD_MAORI_POTATAU"]

local unitToaID = GameInfoTypes["UNIT_JFD_TOA"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_MaoriPotatau_PlayerDoTurn
local promotionToa1ID = GameInfoTypes["PROMOTION_JFD_TOA_1"]
local promotionToa2ID = GameInfoTypes["PROMOTION_JFD_TOA_2"]
local function JFD_MaoriPotatau_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	--UNIQUE UNIT
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionToa1ID) then
			local isSettlerInRange = false
			local unitPlot = unit:GetPlot()
			if unitPlot then
				for loopPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					for index = 0,(loopPlot:GetNumUnits() - 1) do
						local adjUnit = loopPlot:GetUnit(index)
						if adjUnit then
							local adjUnitInfo = GameInfo.Units[adjUnit:GetUnitType()]
							local adjUnitOwnerID = adjUnit:GetOwner()
							if adjUnitOwnerID ~= playerID and adjUnitInfo.Found or adjUnitInfo.FoundAbroad then
								isSettlerInRange = true
								break 
							end
						end
					end
				end
			end 
			unit:SetHasPromotion(promotionToa2ID, isSettlerInRange)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_MaoriPotatau_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_MaoriPotatau_TeamMeet
local unitSettlerID = GameInfoTypes["UNIT_SETTLER"]
local function JFD_MaoriPotatau_TeamMeet(playerMetID, playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerMet = Players[playerMetID]
	local playerMetTeam = Teams[playerMet:GetTeam()]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	if HasTrait(player, traitMaoriPotatauID) then 
		local playerCapital = player:GetCapitalCity()
		if playerCapital then
			if playerTeam:GetHasMetCivCount(true) == 1 then 
				player:InitUnit(unitSettlerID, playerCapital:GetX(), playerCapital:GetY())
			
				if (player:IsHuman() and player:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_MAORI_POTATAU_MESSAGE_1", playerMet:GetCivilizationDescription()))
				end
			else
				if playerCapital:CanTrain(unitSettlerID) then
					local numProd = (playerCapital:GetCurrentProductionDifference()*2.5)
					playerCapital:ChangeUnitProduction(unitSettlerID, numProd)

					if (player:IsHuman() and player:IsTurnActive()) then
						Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_MAORI_POTATAU_MESSAGE_2", playerMet:GetCivilizationDescription()))
					end
				end	
			end
		end
	elseif HasTrait(playerMet, traitMaoriPotatauID) then 
		local playerMetCapital = playerMet:GetCapitalCity()
		if playerMetCapital then
			if playerMetTeam:GetHasMetCivCount(true) == 1 then 
				playerMet:InitUnit(unitSettlerID, playerMetCapital:GetX(), playerMetCapital:GetY())
			
				if (playerMet:IsHuman() and playerMet:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_MAORI_POTATAU_MESSAGE_1", player:GetCivilizationDescription()))
				end
			else
				if playerCapital:CanTrain(unitSettlerID) then
					local numProd = (playerMetCapital:GetCurrentProductionDifference()*2.5)
					playerMetCapital:ChangeUnitProduction(unitSettlerID, numProd)

					if (playerMet:IsHuman() and playerMet:IsTurnActive()) then
						Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_MAORI_POTATAU_MESSAGE_2", player:GetCivilizationDescription()))
					end
				end	
			end
		end
	end
end
GameEvents.TeamMeet.Add(JFD_MaoriPotatau_TeamMeet)	
------------------------------------------------------------------------------------------------------------------------
--JFD_MaoriPotatau_PlayerCityFounded
local g_Buildings_Table = {}
local g_Buildings_Count = 1
for row in DB.Query("SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_CULTURE' AND BuildingType NOT IN (SELECT DefaultBuilding FROM BuildingClasses WHERE (MaxPlayerInstances = 1 OR MaxGlobalInstances = 1));") do 	
	g_Buildings_Table[g_Buildings_Count] = row
	g_Buildings_Count = g_Buildings_Count + 1
end
for row in DB.Query("SELECT BuildingType FROM Building_YieldModifiers WHERE YieldType = 'YIELD_CULTURE' AND BuildingType NOT IN (SELECT DefaultBuilding FROM BuildingClasses WHERE (MaxPlayerInstances = 1 OR MaxGlobalInstances = 1));") do 		
	g_Buildings_Table[g_Buildings_Count] = row
	g_Buildings_Count = g_Buildings_Count + 1
end
local function JFD_MaoriPotatau_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	if (not HasTrait(player, traitMaoriPotatauID)) then	return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city:IsCapital()) then
		
		--g_Buildings_Table
		local buildingsTable = g_Buildings_Table
		local numBuildings = #buildingsTable
		for index = 1, numBuildings do
			local row = buildingsTable[index]
			local buildingID = GameInfoTypes[row.BuildingType]
			if playerCapital:IsHasBuilding(buildingID) then
				city:SetNumRealBuilding(buildingID, 1) 
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(JFD_MaoriPotatau_PlayerCityFounded)
------------------------------------------------------------------------------------------------------------------------
--JFD_MaoriPotatau_SetPopulation
local function JFD_MaoriPotatau_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	if newPopulation < oldPopulation then return end
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	
	--UNIQUE BUILDING
	if (not city:IsHasBuilding(buildingMaraeID)) then return end
	local numCulture = city:GetJONSCulturePerTurn()
	if numCulture > 0 then
		city:ChangeFood(numCulture)
		if player:IsHuman() and player:IsTurnActive() then
			local hex = ToHexFromGrid(Vector2(plotX, plotY))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_FOOD]", numCulture), true)
		end
	end
end
GameEvents.SetPopulation.Add(JFD_MaoriPotatau_SetPopulation)
--=======================================================================================================================
--=======================================================================================================================