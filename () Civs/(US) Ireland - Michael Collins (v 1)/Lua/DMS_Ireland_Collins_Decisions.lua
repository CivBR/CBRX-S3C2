-- DMS_Ireland_Collins_Decisions
-- Author: DMS
--==========================================================================================================================
print("Urdnot's Ireland's Decisions: loaded")
include("PlotIterators.lua")
include("FLuaVector.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bPrintForDebug = DMS_GetUserSetting("US_IRELAND_COLLINS_DEBUGGING_ON") == 1
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- Civ Specific Decisions
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationIreland						= GameInfoTypes["CIVILIZATION_US_IRELAND"]
local eraIndustrial								= GameInfoTypes["ERA_INDUSTRIAL"]
local traitAugustDestiny						= GameInfoTypes["TRAIT_US_AUGUST_DESTINY"]
local buildingPublicHouse						= GameInfoTypes["BUILDING_US_PUBLIC_HOUSE"]
local specialistMusician						= GameInfoTypes["SPECIALIST_MUSICIAN"]
local buildingTwelveApostles					= GameInfoTypes["BUILDING_US_TWELVE_APOSTLES"]
local policyTwelveApostles						= GameInfoTypes["POLICY_US_TWELVE_APOSTLES"]
local mathCeil									= math.ceil
local stringFormat								= string.format
----------------------------------------------------------------------------------------------------------------------------
-- Ireland (Michael Collins): Found the Twelve Apostles
----------------------------------------------------------------------------------------------------------------------------
local Decisions_FoundTheTwelveApostles = {}
	Decisions_FoundTheTwelveApostles.Name = "TXT_KEY_DECISIONS_DMS_FOUND_THE_TWELVE_APOSTLES"
	Decisions_FoundTheTwelveApostles.Desc = "TXT_KEY_DECISIONS_DMS_FOUND_THE_TWELVE_APOSTLES_DESC"
	HookDecisionCivilizationIcon(Decisions_FoundTheTwelveApostles, "CIVILIZATION_US_IRELAND")
	Decisions_FoundTheTwelveApostles.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationIreland then return false, false end
		if load(player, "Decisions_FoundTheTwelveApostles") == true then
			Decisions_FoundTheTwelveApostles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_FOUND_THE_TWELVE_APOSTLES_ENACTED_DESC")
			return false, false, true
		end
		
		local faithCost = 100
		Decisions_FoundTheTwelveApostles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_FOUND_THE_TWELVE_APOSTLES_DESC", faithCost)
		if (player:GetFaith() < faithCost) 									then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1)			then return true, false end
		if (player:GetCurrentEra() < eraIndustrial)							then return true, false end

		return true, true
	end
	)
	
	Decisions_FoundTheTwelveApostles.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local faithCost = 100
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeFaith(-iNumFaith)

		for city in player:Cities() do
			local garrisonedUnit = city:GetGarrisonedUnit()
			if garrisonedUnit ~= nil and garrisonedUnit ~= -1 then
				city:SetNumRealBuilding(buildingTwelveApostles, 1)
				DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: garrisoned unit in city %s, add decision building", city:GetName()))
			end
		end
	
		if isCPDLL then
			player:GrantPolicy(policyTwelveApostles, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyTwelveApostles, true)
		end
		
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_DMS_WORLD_EVENTS_FOUND_THE_TWELVE_APOSTLES"))
		save(player, "Decisions_FoundTheTwelveApostles", true)
	end
	)

	Decisions_FoundTheTwelveApostles.Monitors = {}
	Decisions_FoundTheTwelveApostles.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationIreland then return end
		if load(player, "Decisions_FoundTheTwelveApostles") == false then return end
		for city in player:Cities() do
			local garrisonedUnit = city:GetGarrisonedUnit()
			if garrisonedUnit ~= nil and garrisonedUnit ~= -1 then
				if not city:IsHasBuilding(buildingTwelveApostles) then
					city:SetNumRealBuilding(buildingTwelveApostles, 1)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: garrisoned unit in city %s, add decision building", city:GetName()))
				end
			else
				if city:IsHasBuilding(buildingTwelveApostles) then
					city:SetNumRealBuilding(buildingTwelveApostles, 0)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: no garrisoned unit in city %s, remove decision building", city:GetName()))
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationIreland, "Decisions_FoundTheTwelveApostles", Decisions_FoundTheTwelveApostles)
----------------------------------------------------------------------------------------------------------------------------
-- Ireland (Michael Collins): Encourage the notion of 'Blood Sacrifice'
----------------------------------------------------------------------------------------------------------------------------
local Decisions_EncourageTheNotionOfBloodSacrifice = {}
	Decisions_EncourageTheNotionOfBloodSacrifice.Name = "TXT_KEY_DECISIONS_DMS_ENCOURAGE_THE_NOTION_OF_BLOOD_SACRIFICE"
	Decisions_EncourageTheNotionOfBloodSacrifice.Desc = "TXT_KEY_DECISIONS_DMS_ENCOURAGE_THE_NOTION_OF_BLOOD_SACRIFICE_DESC"
	HookDecisionCivilizationIcon(Decisions_EncourageTheNotionOfBloodSacrifice, "CIVILIZATION_US_IRELAND")
	Decisions_EncourageTheNotionOfBloodSacrifice.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationIreland then return false, false end
		if load(player, "Decisions_EncourageTheNotionOfBloodSacrifice") == true then
			Decisions_EncourageTheNotionOfBloodSacrifice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_ENCOURAGE_THE_NOTION_OF_BLOOD_SACRIFICE_ENACTED_DESC")
			return false, false, true
		end
		local iGold = mathCeil(125 * iMod)
		local iCulture = mathCeil(50 * iMod)
		Decisions_EncourageTheNotionOfBloodSacrifice.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_ENCOURAGE_THE_NOTION_OF_BLOOD_SACRIFICE_DESC", iGold, iCulture)
		if (player:GetGold() < iGold)									then return true, false end
		if (player:GetJONSCulture() < iCulture)							then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1)		then return true, false end
		if (Teams[player:GetTeam()]:GetAtWarCount(true) < 1)			then return true, false end
		return true, true
	end
	)
	
	Decisions_EncourageTheNotionOfBloodSacrifice.DoFunc = (
	function(player)
		local iGold = mathCeil(125 * iMod)
		local iCulture = mathCeil(50 * iMod)
		player:ChangeGold(-iGold)
		player:ChangeJONSCulture(-iCulture)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				if unit:GetDamage() >= 50 then
					player:ChangeJONSCulture(2)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: unit has 50 or more damage, add culture"))
					if player:IsHuman() then
						local plot = unit:GetPlot()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_CULTURE] Culture", 0)
					end
				end
			end
		end
		for city in player:Cities() do
			local garrisonedUnit = city:GetGarrisonedUnit()
			if garrisonedUnit ~= nil and garrisonedUnit ~= -1 then
				if unit:GetDamage() >= 50 then
					city:ChangeSpecialistGreatPersonProgressTimes100(specialistMusician, 2 * 100)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: unit has 50 or more damage and is garrisoned in city %s", city:GetName()))
					if player:IsHuman() then
						local plot = unit:GetPlot()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_GREAT_MUSICIAN] Great Musician points", 0)
					end
				end
			end
		end
	
		save(player, "Decisions_EncourageTheNotionOfBloodSacrifice", true)
	end
	)

	Decisions_EncourageTheNotionOfBloodSacrifice.Monitors = {}
	Decisions_EncourageTheNotionOfBloodSacrifice.Monitors[GameEvents.PlayerDoTurn] = (
	function(playerID)
		local player = Players[playerID]
		if player:GetCivilizationType() ~= civilisationIreland then return end
		if load(player, "Decisions_FoundTheTwelveApostles") == false then return end
		
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				if unit:GetDamage() >= 50 then
					player:ChangeJONSCulture(2)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: unit has 50 or more damage, add culture"))
					if player:IsHuman() then
						local plot = unit:GetPlot()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_CULTURE] Culture", 0)
					end
				end
			end
		end
		for city in player:Cities() do
			local garrisonedUnit = city:GetGarrisonedUnit()
			if garrisonedUnit ~= nil and garrisonedUnit ~= -1 then
				if unit:GetDamage() >= 50 then
					city:ChangeSpecialistGreatPersonProgressTimes100(specialistMusician, 2 * 100)
					DMS_Print(stringFormat("Decisions_FoundTheTwelveApostles: unit has 50 or more damage and is garrisoned in city %s", city:GetName()))
					if player:IsHuman() then
						local plot = unit:GetPlot()
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(), plot:GetY()))), "[COLOR_POSITIVE_TEXT]+2[ENDCOLOR] [ICON_GREAT_MUSICIAN] Great Musician points", 0)
					end
				end
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(civilisationIreland, "Decisions_EncourageTheNotionOfBloodSacrifice", Decisions_EncourageTheNotionOfBloodSacrifice)
--==========================================================================================================================
--==========================================================================================================================
