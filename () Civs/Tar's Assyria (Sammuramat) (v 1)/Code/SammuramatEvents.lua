------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID = GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"]
--------------------------------------------------------------------------------------------------------------------------
-- Event_tcm_Assyria_Decoy_Soldiers
--------------------------------------------------------------------------------------------------------------------------
local Event_tcm_Assyria_Decoy_Soldiers = {}
	Event_tcm_Assyria_Decoy_Soldiers.Name = "TXT_KEY_EVENT_TCM_ASSYRIA_DECOY_SOLDIERS"
	Event_tcm_Assyria_Decoy_Soldiers.Desc = "TXT_KEY_EVENT_TCM_ASSYRIA_DECOY_SOLDIERS_DESC"
	Event_tcm_Assyria_Decoy_Soldiers.EventImage = 'Event_tcm_Decoys.dds'
	Event_tcm_Assyria_Decoy_Soldiers.Weight = 2
	Event_tcm_Assyria_Decoy_Soldiers.CanFunc = (
		function(player)			
			if load(player, "Event_tcm_Assyria_Decoy_Soldiers") == true then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			if Teams[player:GetTeam()]:GetAtWarCount() < 1 then return false end
			return true
		end
		)
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes[1] = {}
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_ASSYRIA_DECOY_SOLDIERS_OUTCOME_1"
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_ASSYRIA_DECOY_SOLDIERS_OUTCOME_RESULT_1"
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes[1].CanFunc = (
		function(player)	
			return true
		end
		)
	Event_tcm_Assyria_Decoy_Soldiers.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()

			local iUnit = nil
			for unitType in GameInfo.Units() do
				if player:CanTrain(GameInfoTypes[unitType.Type]) then
					if iUnit == nil then
						iUnit = GameInfoTypes[unitType.Type]
					elseif unitType.Combat > GameInfo.Units[iUnit].Combat then
						iUnit = GameInfoTypes[unitType.Type]
					end
				end
			end
			if iUnit ~= nil then 
				player:InitUnit(iUnit, capitalX, capitalY):SetHasPromotion(GameInfoTypes["PROMOTION_TCM_LITERAL_DUMMY"], true)
				player:InitUnit(iUnit, capitalX, capitalY):SetHasPromotion(GameInfoTypes["PROMOTION_TCM_LITERAL_DUMMY"], true)
				player:InitUnit(iUnit, capitalX, capitalY):SetHasPromotion(GameInfoTypes["PROMOTION_TCM_LITERAL_DUMMY"], true)
			end

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_ASSYRIA_DECOY_SOLDIERS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_DECOY_SOLDIERS"))
			save(player, "Event_tcm_Assyria_Decoy_Soldiers", true)	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_tcm_Assyria_Decoy_Soldiers", Event_tcm_Assyria_Decoy_Soldiers)
--=======================================================================================================================
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Event_tcm_Assyria_Handsome_Soldier
--------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
-- Event_tcm_Assyria_Handsome_Soldier
--------------------------------------------------------------------------------------------------------------------------
local Event_tcm_Assyria_Handsome_Soldier = {}
	Event_tcm_Assyria_Handsome_Soldier.Name = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER"
	Event_tcm_Assyria_Handsome_Soldier.Desc = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_DESC"
	Event_tcm_Assyria_Handsome_Soldier.EventImage = 'Event_tcm_Seduction.dds'
	Event_tcm_Assyria_Handsome_Soldier.Data1 = {}
	Event_tcm_Assyria_Handsome_Soldier.Data2 = nil
	Event_tcm_Assyria_Handsome_Soldier.Weight = 5
	Event_tcm_Assyria_Handsome_Soldier.CanFunc = (
		function(player)
			if load(player, "Event_tcm_Assyria_Handsome_Soldier") == player:GetCurrentEra() then return false end
			if player:GetCivilizationType() ~= civilisationID then return false end
			Event_tcm_Assyria_Handsome_Soldier.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[player:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[player:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_tcm_Assyria_Handsome_Soldier.Data1, pCS)
				end
			end
			if #Event_tcm_Assyria_Handsome_Soldier.Data1 < 1 then return false end
			Event_tcm_Assyria_Handsome_Soldier.Data2 = Event_tcm_Assyria_Handsome_Soldier.Data1[GetRandom(1, #Event_tcm_Assyria_Handsome_Soldier.Data1)]
			Event_tcm_Assyria_Handsome_Soldier.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_DESC", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationAdjectiveKey())
			return true
		end
		)
	Event_tcm_Assyria_Handsome_Soldier.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[1] = {}
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[1].Name = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_1"
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[1].Desc = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_1"
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[1].CanFunc = (
		function(player)	
			Event_tcm_Assyria_Handsome_Soldier.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_1", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capital = player:GetCapitalCity()
			local capitalX = capital:GetX()
			local capitalY = capital:GetY()
			local iUnit = nil
			for unitType in GameInfo.Units() do
				if player:CanTrain(GameInfoTypes[unitType.Type]) then
					if iUnit == nil then
						iUnit = GameInfoTypes[unitType.Type]
					elseif unitType.Combat > GameInfo.Units[iUnit].Combat then
						iUnit = GameInfoTypes[unitType.Type]
					end
				end
			end
			if iUnit ~= nil then 
				player:InitUnit(iUnit, capitalX, capitalY)
				player:InitUnit(iUnit, capitalX, capitalY)
			end

			Teams[Event_tcm_Assyria_Handsome_Soldier.Data2:GetTeam()]:DeclareWar(player:GetTeam())

			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_1", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationShortDescription())) 
			save(player, "Event_tcm_Assyria_Handsome_Soldier", player:GetCurrentEra())	
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[2] = {}
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[2].Name = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_2"
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[2].Desc = "TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_2"
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[2].CanFunc = (
		function(player)
			return true
		end
		)
	Event_tcm_Assyria_Handsome_Soldier.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local chance = GetRandom(1, 100)
			if chance > 34 then
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_2_NOTIFICATION_A"), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_2_A", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationShortDescription())) 
				local capital = player:GetCapitalCity()
				local capitalX = capital:GetX()
				local capitalY = capital:GetY()
				local iUnit = nil
				for unitType in GameInfo.Units() do
					if player:CanTrain(GameInfoTypes[unitType.Type]) then
						if iUnit == nil then
							iUnit = GameInfoTypes[unitType.Type]
						elseif unitType.Combat > GameInfo.Units[iUnit].Combat then
							iUnit = GameInfoTypes[unitType.Type]
						end
					end
				end
				if iUnit ~= nil then 
					player:InitUnit(iUnit, capitalX, capitalY):ChangeExperience(100)
				end
			else
				JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_TCM_ASSYRIA_HANDSOME_SOLDIER_OUTCOME_RESULT_2_NOTIFICATION_B", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationAdjectiveKey()), Locale.ConvertTextKey("TXT_KEY_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER"))
				JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_TCM_ASSYRIA_HANDSOME_SOLDIER_2_B", Event_tcm_Assyria_Handsome_Soldier.Data2:GetCivilizationShortDescription())) 
			end
			save(player, "Event_tcm_Assyria_Handsome_Soldier", player:GetCurrentEra())	
		end)
	
Events_AddCivilisationSpecific(civilisationID, "Event_tcm_Assyria_Handsome_Soldier", Event_tcm_Assyria_Handsome_Soldier)	
