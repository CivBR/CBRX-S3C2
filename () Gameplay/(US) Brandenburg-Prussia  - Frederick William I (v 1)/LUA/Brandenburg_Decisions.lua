-- Brandenburg_Decisions
-- Author: Urdnot (Using JFD's Base tbh)
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
--JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
------------------------------------------------------------------------------------------------------------------------
-- UNIQUE UTILS
------------------------------------------------------------------------------------------------------------------------
--JFD_GetNumConqueredCapitals
function JFD_GetNumConqueredCapitals(playerID)
	local numCapitals = 0
	for city in Players[playerID]:Cities() do
		if (city:GetOriginalOwner() ~= playerID and city:IsOriginalCapital()) then
			numCapitals = numCapitals + 1
		end
	end
	return numCapitals
end

--JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local activePlayerTeam 	= Teams[Game.GetActiveTeam()]
local civilizationID 	= GameInfoTypes["CIVILIZATION_US_BRANDENBURG"]
local eraMedievalID		= GameInfoTypes["ERA_MEDIEVAL"]
local mathCeil 			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- King in Prussia
-------------------------------------------------------------------------------------------------------------------------
local policyPrussiaID			= GameInfoTypes["POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA"]
local Decisions_US_Brandenburg_Prussia = {}
    Decisions_US_Brandenburg_Prussia.Name = "TXT_KEY_DECISIONS_US_BRANDENBURG_PRUSSIA"
    Decisions_US_Brandenburg_Prussia.Desc = "TXT_KEY_DECISIONS_US_BRANDENBURG_PRUSSIA_DESC"
    HookDecisionCivilizationIcon(Decisions_US_Brandenburg_Prussia, "CIVILIZATION_US_BRANDENBURG")
    Decisions_US_Brandenburg_Prussia.CanFunc = (
    function(player)
        if player:GetCivilizationType() ~= civilizationID then return false, false end
            if player:HasPolicy(policyPrussiaID) then
                Decisions_US_Brandenburg_Prussia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_BRANDENBURG_PRUSSIA_ENACTED_DESC")
            return false, false, true
        end
        local costCulture = mathCeil(400*iMod)
            Decisions_US_Brandenburg_Prussia.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_BRANDENBURG_PRUSSIA_DESC", costCulture)
        local playerID = player:GetID()
        if JFD_GetNumConqueredCapitals(playerID) < 1 then return true, false end
        if player:GetCurrentEra() < eraMedievalID then return true, false end
        if player:GetGold() < costCulture then return true, false end
        if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
        return true, true
    end
	)
	
	Decisions_US_Brandenburg_Prussia.DoFunc = (
	function(player)
		local playerID = player:GetID()
		local costCulture = mathCeil(400*iMod)
		player:ChangeGold(-costCulture)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGoldenAgeTurns(10)
		PreGame.SetCivilizationDescription(playerID, "TXT_KEY_US_PRUSSIA_DESC")
		PreGame.SetCivilizationShortDescription(playerID, "TXT_KEY_US_PRUSSIA_SHORT_DESC")
		PreGame.SetCivilizationAdjective(playerID, "TXT_KEY_US_PRUSSIA_ADJECTIVE")
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyPrussiaID, true)
		JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_US_BRANDENBURG_PRUSSIA", player:GetName()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_US_Brandenburg_Prussia", Decisions_US_Brandenburg_Prussia)
--------------------------------------------------------------------------------------------------------------------------
-- Recite Laws
--------------------------------------------------------------------------------------------------------------------------

-- JFD - Today at 11:29 PM
local policyBburgLawsID            = GameInfoTypes["POLICY_DECISIONS_US_BRANDENBURG_LAWS"]
local Decisions_US_Brandenburg_Laws = {}
    Decisions_US_Brandenburg_Laws.Name = "TXT_KEY_DECISIONS_US_BRANDENBURG_LAWS"
    Decisions_US_Brandenburg_Laws.Desc = "TXT_KEY_DECISIONS_US_BRANDENBURG_LAWS_DESC"
    HookDecisionCivilizationIcon(Decisions_US_Brandenburg_Laws, "CIVILIZATION_US_BRANDENBURG")
    Decisions_US_Brandenburg_Laws.CanFunc = (
    function(player)
        if player:GetCivilizationType() ~= civilizationID then return false, false end
            if player:HasPolicy(policyBburgLawsID) then
                Decisions_US_Brandenburg_Laws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_BRANDENBURG_LAWS_ENACTED_DESC")
            return false, false, true
        end
        local costCulture = mathCeil(300*iMod)
            Decisions_US_Brandenburg_Laws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_US_BRANDENBURG_LAWS_DESC", costCulture)
        local playerID = player:GetID()
		if JFD_GetNumConqueredCapitals(playerID) < 2 then return true, false end
        if player:GetJONSCulture() < costCulture then return true, false end
            return true, true
    end
    )
    
    Decisions_US_Brandenburg_Laws.DoFunc = (
    function(player)
        local playerID = player:GetID()
        local costCulture = mathCeil(200*iMod)
        player:ChangeJONSCulture(-costCulture)
        player:ChangeNumResourceTotal(iMagistrate, 2)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(policyBburgLawsID, true)
    end
    )
    
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_US_Brandenburg_Laws", Decisions_US_Brandenburg_Laws)
--=======================================================================================================================
--=======================================================================================================================