-- JFD_Civs_AngloNorse_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Anglo-Norse Decisions: loaded")
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("FLuaVector.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  		= Locale.ConvertTextKey
local g_MathCeil				= math.ceil
local g_MathFloor				= math.floor
local g_MathMax					= math.max
local g_MathMin					= math.min
				
local Players 					= Players
local Teams 					= Teams

local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--Game_GetRound
function Game_GetRound(num, idp)
	local mult = 10^(idp or 0)
	return g_MathFloor(num * mult + 0.5) / mult
end
local g_GetRound = Game_GetRound
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
local userSettingCIDFestivalsCore 	= (Game_GetUserSetting("JFD_CID_FESTIVALS_CORE") == 1)
local userSettingCIDLoyaltyCore 	= (Game_GetUserSetting("JFD_CID_LOYALTY_CORE") == 1)
local userSettingRTPSovereigntyCore = (Game_GetUserSetting("JFD_RTP_SOVEREIGNTY_CORE") == 1)
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID  	  = GameInfoTypes["CIVILIZATION_JFD_ANGLO_NORSE"]
local defineMaxMinorCivs  = GameDefines["MAX_MINOR_CIVS"]
local eraMedievalID   	  = GameInfoTypes["ERA_MEDIEVAL"]
local resourceCaptainsID  = GameInfoTypes["RESOURCE_JFD_CAPTAINS"]
-------------------------------------------------------------------------------------------------------------------------
-- Anglo-Norse: Bestow Ecumenical Gifts
-------------------------------------------------------------------------------------------------------------------------
local minorTraitReligiousID = GameInfoTypes["MINOR_TRAIT_RELIGIOUS"]
local Decisions_JFD_AngloNorse_EcumenicalGifts = {}
	Decisions_JFD_AngloNorse_EcumenicalGifts.Name = "TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_ECUMENICAL_GIFTS"
	Decisions_JFD_AngloNorse_EcumenicalGifts.Desc = "TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_ECUMENICAL_GIFTS_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_AngloNorse_EcumenicalGifts, "CIVILIZATION_JFD_ANGLO_NORSE")
	Decisions_JFD_AngloNorse_EcumenicalGifts.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local era = load(player, "Decisions_JFD_AngloNorse_EcumenicalGifts")
		if era ~= nil then
			if era < player:GetCurrentEra() then
				save(player, "Decisions_JFD_AngloNorse_EcumenicalGifts", nil)
			else
				Decisions_JFD_AngloNorse_EcumenicalGifts.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_ECUMENICAL_GIFTS_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if player:HasPolicy(policyDecisionsAngloNorseNorthSeaEmpireID) then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		local playerTeam = Teams[player:GetTeam()]
		local numCityStates = 0
		local hasFriendship = false
		for otherPlayerID = 0, defineMaxMinorCivs - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsMinorCiv() and playerTeam:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetMinorCivTrait() == minorTraitReligiousID and (not playerTeam:IsAtWar(otherPlayer:GetTeam())) then
				numCityStates = numCityStates + 1
				if otherPlayer:GetMinorCivFriendshipLevelWithMajor(playerID) >= 1 then
					hasFriendship = true
				end
			end
		end
		if hasFriendship then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local req3 = false
		local reqIcon3 = "[ICON_UNCHECKBOX]"
		if player:GetCurrentEra() >= eraMedievalID then
			req3 = true
			reqIcon3 = "[ICON_CHECKBOX]"
		end
		
		local costFaith = g_GetRound(((40)*iMod)*numCityStates)
		local costGold = g_GetRound(((50)*iMod)*numCityStates)
		Decisions_JFD_AngloNorse_EcumenicalGifts.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_ECUMENICAL_GIFTS_DESC", reqIcon1, reqIcon2, reqIcon3, costFaith, costGold)	
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if (not req3) then return true, false end
		if player:GetFaith() < costFaith then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AngloNorse_EcumenicalGifts.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local playerTeam = Teams[player:GetTeam()]
		local numCityStates = 0
		for otherPlayerID = 0, defineMaxMinorCivs - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsMinorCiv() and playerTeam:IsHasMet(otherPlayer:GetTeam()) and otherPlayer:GetMinorCivTrait() == minorTraitReligiousID and (not playerTeam:IsAtWar(otherPlayer:GetTeam())) then
				numCityStates = numCityStates + 1
				otherPlayer:ChangeMinorCivFriendshipWithMajor(playerID, 20)
			end
		end
		local costFaith = g_GetRound(((40)*iMod)*numCityStates)
		local costGold = g_GetRound(((50)*iMod)*numCityStates)
		player:ChangeFaith(-costFaith)
		player:ChangeGold(-costGold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		save(player, "Decisions_JFD_AngloNorse_EcumenicalGifts", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_AngloNorse_EcumenicalGifts", Decisions_JFD_AngloNorse_EcumenicalGifts)
-------------------------------------------------------------------------------------------------------------------------
-- Anglo-Norse: Institute the North Sea Empire
-------------------------------------------------------------------------------------------------------------------------
local policyDecisionsAngloNorseNorthSeaEmpireID = GameInfoTypes["POLICY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA"]
local reformStateEmpireID 						= GameInfoTypes["REFORM_JFD_STATE_EMPIRE"]
local Decisions_JFD_AngloNorse_NorthSeaEmpire = {}
	Decisions_JFD_AngloNorse_NorthSeaEmpire.Name = "TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA"
	Decisions_JFD_AngloNorse_NorthSeaEmpire.Desc = "TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_AngloNorse_NorthSeaEmpire, "CIVILIZATION_JFD_ANGLO_NORSE")
	Decisions_JFD_AngloNorse_NorthSeaEmpire.CanFunc = (
	function(player)
		local playerID = player:GetID()
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		
		local strYield = "+1 [ICON_HAPPINESS_1] Happiness"
		if userSettingCIDLoyaltyCore then
			strYield = "+2 [ICON_JFD_LOYALTY] Loyalty"
		end
		local strWLTKD = "'We Love the King Day'"
		if userSettingCIDFestivalsCore then
			strWLTKD = "[ICON_JFD_FESTIVAL] Festival"
		end
		
		if player:HasPolicy(policyDecisionsAngloNorseNorthSeaEmpireID) then
			if userSettingRTPSovereigntyCore then
				Decisions_JFD_AngloNorse_NorthSeaEmpire.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA_ENACTED_DESC", strWLTKD, strYield)
			else
				Decisions_JFD_AngloNorse_NorthSeaEmpire.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA_ENACTED_DESC_SOVEREIGNTY", strWLTKD, strYield)
			end
			return false, false, true 
		end
		
		local numCapitals = 0
		local hasOriginalCapital = false
		for city in player:Cities() do
			if city:IsOriginalCapital() then
				numCapitals = numCapitals + 1
				if city:GetOriginalOwner() == playerID then
					hasOriginalCapital = true
				end
			end
		end
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if numCapitals >= 3 then
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		if hasOriginalCapital then
			req2 = true
			reqIcon2 = "[ICON_CHECKBOX]"
		end
		
		local costResource = numCapitals
		local resourceID = iMagistrate
		local strResource = "[ICON_MAGISTRATES] Magistrates"
		if resourceCaptainsID then
			resourceID = resourceCaptainsID
			strResource = "[ICON_JFD_CAPTAINS] Captains"
		end
		if userSettingRTPSovereigntyCore then
			local req3 = false
			local reqIcon3 = "[ICON_UNCHECKBOX]"
			if player:HasGovernment() then
				req3 = true
				reqIcon3 = "[ICON_CHECKBOX]"
			end
			Decisions_JFD_AngloNorse_NorthSeaEmpire.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA_DESC_SOVEREIGNTY", reqIcon1, reqIcon2, reqIcon3, costResource, strResource, strWLTKD, strYield)
			
			if (not req3) then return true, false end
		else
			Decisions_JFD_AngloNorse_NorthSeaEmpire.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA_DESC", reqIcon1, reqIcon2, costResource, strResource, strWLTKD, strYield)	
		end
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetNumResourceAvailable(resourceID, false) < costResource then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_AngloNorse_NorthSeaEmpire.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local numCapitals = 0
		for city in player:Cities() do
			if city:IsOriginalCapital() then
				numCapitals = numCapitals + 1
				city:ChangeWeLoveTheKingDayCounter(10*iMod)
			end
		end
		local costResource = numCapitals
		local resourceID = iMagistrate
		if resourceCaptainsID then
			resourceID = resourceCaptainsID
		end
		player:ChangeNumResourceTotal(resourceID, -costResource)
		if isCPActive then
			player:GrantPolicy(policyDecisionsAngloNorseNorthSeaEmpireID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyDecisionsAngloNorseNorthSeaEmpireID, true)
		end
		if userSettingRTPSovereigntyCore then
			player:SetHasReform(reformStateEmpireID, true, true)
		end
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_CIV_JFD_NORTH_SEA_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_CIV_JFD_NORTH_SEA_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_CIV_JFD_NORTH_SEA_ADJECTIVE")
		
		Player_SendWorldEvent(player, g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_ANGLO_NORSE_NORTH_SEA", player:GetName(), player:GetCivilizationShortDescription())) 
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_AngloNorse_NorthSeaEmpire", Decisions_JFD_AngloNorse_NorthSeaEmpire)
--=======================================================================================================================
--=======================================================================================================================
