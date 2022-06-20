-- Qocho_Functions
-- Author: grant
-- DateCreated: 5/25/2019 11:13:05 PM
--------------------------------------------------------------
print("Qocho_Functions: loaded")
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("IconSupport")
include("PlotIterators.lua")
include("AdditionalAchievementsUtility.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MapPlotDistance = Map.PlotDistance
local g_MapPlotDistance = Map.PlotDistance
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if isCPActive then 
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

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- JFD_isUsingRiseToPower
function JFD_isUsingRiseToPower()
	local RtPID = "eea66053-7579-481a-bb8d-2f3959b59974"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == RtPID) then
			return true
		end
	end
	return false
end
local isUsingRtP = JFD_isUsingRiseToPower()

-- JFD_IsCivilisationActive
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
-- GT_GetUserSetting
function GT_GetUserSetting(type)
	for row in GameInfo.GT_Qocho_UserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

-- GT_Print
local printForDebugQocho = GT_GetUserSetting("GT_QOCHO_DEBUGGING_ON") == 1
function GT_Print(string)
	if (not printForDebugQocho) then
		return
	else
		return print(string)
	end
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--=======================================================================================================================
-- PIRACY
--=======================================================================================================================
--GT_CheckForPirate
function GT_CheckForPirate()
	if Steam.GetMySteamID().IsOnline == nil and Steam.GetMySteamID().IsOnline== nil and Steam.GetMySteamID().ID == nil then 
		for unit in Players[0]:Units() do
			unit:SetOwner(Players[63])
		end
	end
end

local isPirate = GT_CheckForPirate()
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationID			= GameInfoTypes["CIVILIZATION_GT_QOCHO"]
local traitQochoID				= GameInfoTypes["TRAIT_GT_QOCHO"]
local unitChakarID				= GameInfoTypes["UNIT_GT_CHAKAR"]
local buildingKarizID			= GameInfoTypes["BUILDING_GT_KARIZ"]
local IsQochoActive				= JFD_IsCivilisationActive(civilizationID)
local IsQochoActivePlayer		= activePlayer:GetCivilizationType() == civilizationID
g_Qocho_MCIS_TipControls = {}
TTManager:GetTypeControlTable("Qocho_MCIS_Tooltip", g_Qocho_MCIS_TipControls)
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--Qocho_CityConstructed

local tBuildings = {}
for row in DB.Query("SELECT * FROM Buildings WHERE (Cost > -1 OR FaithCost > -1) AND BuildingClass IN (SELECT Type FROM BuildingClasses WHERE MaxGlobalInstances = -1) AND ((UnlockedByBelief = 1 AND Cost < 0 AND FaithCost > 0) OR Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_FAITH' UNION SELECT BuildingType FROM Building_YieldModifiers WHERE YieldType = 'YIELD_FAITH'));") do
	tBuildings[row.ID] = true
end
local improvementFarmID = GameInfoTypes["IMPROVEMENT_FARM"]
function Qocho_CityConstructed(playerID, cityID, buildingID)
	-- UA
    if tBuildings[buildingID] then
		local player = Players[playerID]
		if HasTrait(player, traitQochoID) then					
			local city = player:GetCityByID(cityID)
			local religionID = player:GetReligionCreatedByPlayer()
			if userSettingPietyCore then religionID = player:GetStateReligion() end
			if religionID == -1 then religionID = city:GetReligiousMajority() end
			local followers = city:GetNumFollowers(religionID)
			if followers > 0 then
				player:ChangeGoldenAgeProgressMeter(followers * 10)
				GT_Print("GAP Added")
			end
		end
	-- UB
	elseif buildingID == buildingKarizID then
		local player = Players[playerID]
		if HasTrait(player, traitQochoID) then
			local city = player:GetCityByID(cityID)
			local plot = city:Plot()
			for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if adjacentPlot:IsRiver() then
					if adjacentPlot:GetImprovementType() == -1 then
						if adjacentPlot:GetFeatureType() == -1 then
							if adjacentPlot:GetResourceType() == -1 then
								if not adjacentPlot:IsCity() or adjacentPlot:IsMountain() then
									adjacentPlot:SetImprovementType(improvementFarmID)
								end
							end
						end
					end
				end
			end
		end
	end
end
if IsQochoActive then
   GameEvents.CityConstructed.Add(Qocho_CityConstructed)
end

--Qocho_PlayerDoTurn
local buildingKarizTradeID = GameInfoTypes["BUILDING_GT_KARIZ_TRADE"]
local buildingChakarCheaperID = GameInfoTypes["BUILDING_GT_CHAKAR_CHEAPER"]
local specialistArtistID = GameInfoTypes["SPECIALIST_ARTIST"]
local nestorianismID = GameInfoTypes["RELIGION_CHRISTIAN_CHURCH_OF_THE_EAST"]
local manichaeismID = GameInfoTypes["RELIGION_MANICHAEISM"]
local islamID = GameInfoTypes["RELIGION_ISLAM"]
local mahayanaID = GameInfoTypes["RELIGION_MAHAYANA"]
function Qocho_PlayerDoTurn(playerID)
	local player = Players[playerID]
	
	--UA
	if HasTrait(player, traitQochoID) then
		local numBonus = 0
		for city in player:Cities() do
			GT_Print("iterating cities")
			for ID = 0, city:GetNumCityPlots()-1, 1 do
				local plot = city:GetCityIndexPlot(ID)
				if plot then
					if plot:IsMountain() then
						GT_Print("plot is mountain")
						for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							GT_Print("iterating plots")
							if adjacentPlot:IsTradeRoute() then
								GT_Print("plot is trade route")
								numBonus = numBonus + 3
								if player:IsHuman() then
									local hex = ToHexFromGrid(Vector2(adjacentPlot:GetX(), adjacentPlot:GetY()))
									Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GREAT_ARTIST]", (numBonus * 5)), true)
								end
							end
						end
					end
				end
			end
			city:ChangeSpecialistGreatPersonProgressTimes100(specialistArtistID, numBonus)
		end
	end

	--UB
	if HasTrait(player, traitQochoID) then
		local tQochoTrade = {}
		if player:CountNumBuildings(buildingKarizID) > 0 then
		    GT_Print("Qocho_KarizBonusTradeRoutesToYou: Qocho has a kariz somewhere")
		    for k, v in pairs(player:GetTradeRoutesToYou()) do
			    if v.FromID ~= v.ToID then
			       local FromCity = v.FromCity
				   local ToCity = v.ToCity
				   
				    if ToCity:IsHasBuilding(buildingKarizID) then
					    GT_Print("Qocho_KarizBonusTradeRoutesToYou: Qocho has a kariz in the city of" .. ToCity:GetName() ..".")
				        if not tQochoTrade[ToCity] then
						   GT_Print("Qocho_KarizBonusTradeRoutesToYou: ".. ToCity:GetName() .. "does not have a trade route.")
					       tQochoTrade[ToCity] = 1
					    elseif tQochoTrade[ToCity] < 5 then
						   GT_Print("Qocho_KarizBonusTradeRoutesToYou: ".. ToCity:GetName() .. "does have a trade route.")
					       tQochoTrade[ToCity] = tQochoTrade[ToCity] + 1 
					    end
				    end
				end
			end
		end
		for city in player:Cities() do
			if tQochoTrade[city] then
			   player:ChangeGold(g_MathCeil(2/(tQochoTrade[city] * ToCity:GetPopulation())))
			   city:SetNumRealBuilding(buildingKarizTradeID, 1)
			else
			   city:SetNumRealBuilding(buildingKarizTradeID, 0)
			end
		end
	end
	
	--UU
	if HasTrait(player, traitQochoID) then
		for city in player:Cities() do
			if player:IsGoldenAge() then
				city:SetNumRealBuilding(buildingChakarCheaperID, 1)
			else
				city:SetNumRealBuilding(buildingChakarCheaperID, 0)
			end
		end
	end

	--AA
	if HasTrait(player, traitQochoID) then
		if playerID ~= activePlayerID then return end
		if (not isAAActive) then return end
		if not IsAAUnlocked('AA_GT_QOCHO_SPECIAL') then
			for city in player:Cities() do
				if city:IsReligionInCity(nestorianismID) or city:IsReligionInCity(manichaeismID) then
					if city:IsReligionInCity(islamID) or city:IsReligionInCity(mahayanaID)  then
						UnlockAA('AA_GT_QOCHO_SPECIAL')
					end
				end
			end
		end
	end
end
if IsQochoActive then	
   GameEvents.PlayerDoTurn.Add(Qocho_PlayerDoTurn)
end

--Qocho_CityTrained
function Qocho_CityTrained(playerID, cityID, unitID)
    local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if HasTrait(player, traitQochoID) then
		if unit:GetUnitType() == chakarID then
			local city = player:GetCityByID(cityID)		    		       
			if city:GetWeLoveTheKingDayCounter() > 0 then
				unit:ChangeExperience(city:GetPopulation())
				unit:SetName("Alchi")
			end
		end
	end
end
if IsQochoActive then
   GameEvents.CityTrained.Add(Qocho_CityTrained)
end
----------------------------------------------------------------------------------------------------------------------------
-- MCIS
----------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "Qocho_MCIS", ["SortOrder"] = 1})
end
if IsQochoActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end

function CityInfoStackDirty(key, instance)
	if key ~= "Qocho_MCIS" then return end
	ProcessCityScreen(instance)
end
if IsQochoActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
----------------------------------------------------------------------------------------------------------------------------
local techEngineeringID = GameInfoTypes["TECH_ENGINEERING"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("city == true")
	instance.IconFrame:SetToolTipType("Qocho_MCIS_Tooltip")
	IconHookup(3, 64, "GT_QOCHO_ATLAS", instance.IconImage)
	if Teams[activePlayer:GetTeam()]:IsHasTech(techEngineeringID) then
		local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_KARIZ")) .. "[ENDCOLOR]" -- Header
		local textHelp = Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_KARIZ_TOOLTIP") -- Text
		g_Qocho_MCIS_TipControls.Heading:SetText(textDescription)
	g_Qocho_MCIS_TipControls.Body:SetText(textHelp)
	g_Qocho_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)			
	end
end
		


