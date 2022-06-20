-- JFD_Civs_AmericaFRoosevelt_Functions
-- Author: JFD
-- DateCreated: 6/17/2014 10:17:21 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
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
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
----------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
----------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
----------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationAmericaFRooseveltID = GameInfoTypes["CIVILIZATION_JFD_AMERICA_F_ROOSEVELT"]
local traitAmericaFRooseveltID = GameInfoTypes["TRAIT_JFD_AMERICA_F_ROOSEVELT"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_AmericaFRoosevelt_PlayerAdoptPolicy
local buildingAmericaFRooseveltProductionID = GameInfoTypes["BUILDING_JFD_AMERICA_F_ROOSEVELT_PRODUCTION"]
local specialistEngineerID = GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]
local function JFD_AmericaFRoosevelt_PlayerAdoptPolicy(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	--NEW DEAL
	if (not HasTrait(player, traitAmericaFRooseveltID)) then return end
	local currentEraID = player:GetCurrentEra()+1
	for city in player:Cities() do
		local numEngineerSpecialist = (city:GetSpecialistCount(specialistEngineerID)*3)
		local numEngineerPoints = g_MathCeil(numEngineerSpecialist*currentEraID)
		local numMerchantSpecialist = (city:GetSpecialistCount(specialistMerchantID)*3)
		local numMerchantPoints = g_MathCeil(numMerchantSpecialist*currentEraID)
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistEngineerID, numEngineerPoints*100)
		city:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, numMerchantPoints*100)

		if player:IsHuman() and player:IsTurnActive() then
			local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
			if numEngineerPoints > 0 then
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_GREAT_ENGINEER][ENDCOLOR]", numEngineerPoints))
			end
			if numMerchantPoints > 0 then
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num} [ICON_GREAT_MERCHANT][ENDCOLOR]", numMerchantPoints))
			end
		end
	end
end
GameEvents.PlayerAdoptPolicy.Add(JFD_AmericaFRoosevelt_PlayerAdoptPolicy)
GameEvents.PlayerAdoptPolicyBranch.Add(JFD_AmericaFRoosevelt_PlayerAdoptPolicy)
--=======================================================================================================================
--=======================================================================================================================


