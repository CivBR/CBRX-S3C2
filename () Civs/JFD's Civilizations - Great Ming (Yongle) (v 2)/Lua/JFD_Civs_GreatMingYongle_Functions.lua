-- JFD_Civs_GreatMingYongle_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--include("PlotIterators.lua")
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
local traitGreatMingYongleID = GameInfoTypes["TRAIT_JFD_GREAT_MING_YONGLE"]

local unitShenjiMusketeerID	= GameInfoTypes["UNIT_JFD_SHENJI_MUSKETEER"]
local unitTreasureFleetID = GameInfoTypes["UNIT_JFD_TREASURE_FLEET"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMingYongle_PlayerDoTurn
local g_Specialists_Table = {}
local g_Specialists_Count = 1
for row in DB.Query("SELECT ID FROM Specialists WHERE Type != 'SPECIALIST_CITIZEN';") do 	
	g_Specialists_Table[g_Specialists_Count] = row
	g_Specialists_Count = g_Specialists_Count + 1
end
local function JFD_GreatMingYongle_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end

	--UNIQUE TRAIT
	if HasTrait(player, traitGreatMingYongleID) then
		local spies = player:GetEspionageSpies();
		for city in player:Cities() do
			local hasSpy = false
			for _,spy in ipairs(spies) do
				if (spy.CityX == city:GetX() and spy.CityY == city:GetY()) then
					hasSpy = true
					break
				end
			end
			if hasSpy then
				--g_Specialists_Table
				local specialistsTable = g_Specialists_Table
				local numSpecialists = #specialistsTable
				for index = 1, numSpecialists do
					local row = specialistsTable[index]
					local specialistID = row.ID
					local numSpecialist = city:GetSpecialistCount(specialistID)
					if numSpecialist > 0 then
						city:ChangeSpecialistGreatPersonProgressTimes100(specialistID, (numSpecialist*200))
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_GreatMingYongle_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMingYongle_TeamMeet
local buildingDummyGreatMingYongle1ID = GameInfoTypes["BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1"]
local buildingDummyGreatMingYongle2ID = GameInfoTypes["BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2"]
local function JFD_GreatMingYongle_TeamMeet(playerMetID, playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local playerMet = Players[playerMetID]
	local playerMetTeam = Teams[playerMet:GetTeam()]
	
	--UNIQUE TRAIT
	if HasTrait(player, traitGreatMingYongleID) then 
		local playerCapital = player:GetCapitalCity()
		if playerCapital then
			local numCityStates = 0
			local numCityStatesMet = 0
			for otherPlayerID = 0, defineMaxMinorCivs - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
					numCityStates = numCityStates + 1
					if playerTeam:IsHasMet(otherPlayer:GetTeam()) then
						numCityStatesMet = numCityStatesMet + 1
					end
				end
			end
	
			local numPercentMet = g_MathFloor((numCityStatesMet/numCityStates)*100)
			if numPercentMet >= 100 then
				if Player.EspionageCreateSpy then
					player:EspionageCreateSpy()
				else
					playerCapital:SetNumRealBuilding(buildingDummyGreatMingYongle1ID, 1)
				end
				if (player:IsHuman() and player:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_3", playerMet:GetCivilizationShortDescription(), numPercentMet))
				end
			elseif numPercentMet == 50 then
				if Player.EspionageCreateSpy then
					player:EspionageCreateSpy()
				else
					playerCapital:SetNumRealBuilding(buildingDummyGreatMingYongle2ID, 1)
				end
				
				if (player:IsHuman() and player:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_2", playerMet:GetCivilizationShortDescription(), numPercentMet))
				end
			else
				if (player:IsHuman() and player:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_1", playerMet:GetCivilizationShortDescription(), numPercentMet))
				end
			end	
		end
	elseif HasTrait(playerMet, traitGreatMingYongleID) then 
		local playerMetCapital = playerMet:GetCapitalCity()
		if playerMetCapital then
			local numCityStates = 0
			local numCityStatesMet = 0
			for otherPlayerID = 0, defineMaxMinorCivs - 1 do
				local otherPlayer = Players[otherPlayerID]
				if (otherPlayer:IsAlive() and otherPlayer:IsMinorCiv()) then
					numCityStates = numCityStates + 1
					if playerMetTeam:IsHasMet(otherPlayer:GetTeam()) then
						numCityStatesMet = numCityStatesMet + 1
					end
				end
			end
	
			local numPercentMet = g_MathFloor((numCityStatesMet/numCityStates)*100)
			if numPercentMet >= 100 then
				if Player.EspionageCreateSpy then
					playerMet:EspionageCreateSpy()
				else
					playerMetCapital:SetNumRealBuilding(buildingDummyGreatMingYongle1ID, 1)
				end
				if (player:IsHuman() and player:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_3", player:GetCivilizationShortDescription(), numPercentMet))
				end
			elseif numPercentMet == 50 then
				if Player.EspionageCreateSpy then
					playerMet:EspionageCreateSpy()
				else
					playerMetCapital:SetNumRealBuilding(buildingDummyGreatMingYongle2ID, 1)
				end
				
				if (playerMet:IsHuman() and playerMet:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_2", player:GetCivilizationShortDescription(), numPercentMet))
				end
			else
				if (playerMet:IsHuman() and playerMet:IsTurnActive()) then
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_MESSAGE_1", player:GetCivilizationShortDescription(), numPercentMet))
				end
			end	
		end
	end
end
GameEvents.TeamMeet.Add(JFD_GreatMingYongle_TeamMeet)
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMingYongle_GreatPersonExpended
local function JFD_GreatMingYongle_GreatPersonExpended(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	
	--UNIQUE UNIT
	if (not HasTrait(player, traitGreatMingYongleID)) then return end
	if (not unitTypeID) then unitTypeID = unitID end
	if unitTypeID == unitTreasureFleetID then return end
	if GameInfo.Units[unitTypeID].Special ~= "SPECIALUNIT_PEOPLE" then return end
	local numTFPs = (player:GetTotalPopulation()*3)
	player:ChangeNavalCombatExperience(numTFPs)
	if (player:IsHuman() and player:IsTurnActive() and plotX and plotY) then
		local hex = ToHexFromGrid(Vector2(plotX, plotY))
		Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_GREAT_PEOPLE_STORED]+{1_Num} [ICON_GREAT_PEOPLE] Treasure Fleet Points", numTFPs), true)
	end
end
GameEvents.GreatPersonExpended.Add(JFD_GreatMingYongle_GreatPersonExpended)
------------------------------------------------------------------------------------------------------------------------
--JFD_GreatMingYongle_CityTrained
local promotionShenjiMusketeer1ID = GameInfoTypes["PROMOTION_JFD_SHENJI_MUSKETEER_1"]
local promotionShenjiMusketeer2ID = GameInfoTypes["PROMOTION_JFD_SHENJI_MUSKETEER_2"]
local promotionShenjiMusketeer3ID = GameInfoTypes["PROMOTION_JFD_SHENJI_MUSKETEER_3"]
local promotionShenjiMusketeer4ID = GameInfoTypes["PROMOTION_JFD_SHENJI_MUSKETEER_4"]
local function JFD_GreatMingYongle_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE UNIT
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitShenjiMusketeerID then return end
	local city = player:GetCityByID(cityID)
	if city:IsCapital() then
		unit:SetHasPromotion(promotionShenjiMusketeer1ID, true)
	elseif (g_IsCPActive and city:IsColony()) then
		unit:SetHasPromotion(promotionShenjiMusketeer2ID, true)
	elseif city:GetOriginalOwner() ~= playerID then
		unit:SetHasPromotion(promotionShenjiMusketeer3ID, true)
	else
		unit:SetHasPromotion(promotionShenjiMusketeer4ID, true)
	end
end
GameEvents.CityTrained.Add(JFD_GreatMingYongle_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
