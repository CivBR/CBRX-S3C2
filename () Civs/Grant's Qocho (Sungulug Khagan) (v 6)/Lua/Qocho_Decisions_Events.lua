--=======================================================================================================================
print("Qocho_Decisions_Events")
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
-- Utilities
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
------------------------------------------------------------------------------------------------------------------------
-- GT_GetUserSetting
function GT_GetUserSetting(type)
	for row in GameInfo.GT_Qocho_UserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
------------------------------------------------------------------------------------------------------------------------
-- GT_Print
local printForDebugQocho = GT_GetUserSetting("GT_QOCHO_DECISIONS_DEBUGGING_ON") == 1
function GT_Print(string)
	if (not printForDebugQocho) then
		return
	else
		return print(string)
	end
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
--g_Specialists_Table
local g_Specialists_Table = {}
local g_Specialists_Count = 1
for row in DB.Query("SELECT ID FROM Specialists WHERE ID > 0;") do     
    g_Specialists_Table[g_Specialists_Count] = row.ID
    g_Specialists_Count = g_Specialists_Count + 1
end

--Player:GetTotalSpecialistCount
function Player.GetTotalSpecialistCount(player, specialistID, city)
    local numSpecialist = 0
    if specialistID then
        if city then
            numSpecialist = numSpecialist + city:GetSpecialistCount(specialistID)
        else
            for city in player:Cities() do
                numSpecialist = numSpecialist + city:GetSpecialistCount(specialistID)
            end    
        end    
    else
        if city then
            --g_Specialists_Table
            local specialistsTable = g_Specialists_Table
            local numSpecialists = #specialistsTable
            for index = 1, numSpecialists do
                local ID = specialistsTable[index]
                numSpecialist = numSpecialist + city:GetSpecialistCount(ID)
            end
        else
            for city in player:Cities() do
                --g_Specialists_Table
                local specialistsTable = g_Specialists_Table
                local numSpecialists = #specialistsTable
                for index = 1, numSpecialists do
                    local ID = specialistsTable[index]
                    numSpecialist = numSpecialist + city:GetSpecialistCount(ID)
                end
            end    
        end    
    end    
    return numSpecialist
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
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local civilizationID		= GameInfoTypes["CIVILIZATION_GT_QOCHO"]
local eraClassicalID		= GameInfoTypes["ERA_CLASSICAL"]
local eraMedievalID			= GameInfoTypes["ERA_MEDIEVAL"]
local traitQochoID			= GameInfoTypes["TRAIT_GT_QOCHO"]
-------------------------------------------------------------------------------------------------------------------------
-- Qocho: Construct the Tower of Imperial Writings
-------------------------------------------------------------------------------------------------------------------------
local buildingImperialWritingsID = GameInfoTypes["BUILDING_GT_DECISIONS_IMPERIAL_WRITINGS"]
local buildingImperialWritingsDefenceID	= GameInfoTypes["BUILDING_GT_DECISIONS_DEFENSE"]
local policyImperialWritingsID = GameInfoTypes["POLICY_GT_DECISIONS_IMPERIAL_WRITINGS"]
local Decisions_GT_Imperial_Writings = {}
	Decisions_GT_Imperial_Writings.Name = "TXT_KEY_DECISIONS_GT_QOCHO_IMPERIAL_WRITINGS"
	Decisions_GT_Imperial_Writings.Desc = "TXT_KEY_DECISIONS_GT_QOCHO_IMPERIAL_WRITINGS_DESC"
	Decisions_GT_Imperial_Writings.Era = eraMedievalID
	HookDecisionCivilizationIcon(Decisions_GT_Imperial_Writings, "CIVILIZATION_GT_QOCHO")
	Decisions_GT_Imperial_Writings.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyImperialWritingsID) then
			Decisions_GT_Imperial_Writings.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_GT_QOCHO_IMPERIAL_WRITINGS_ENACTED_DESC")
			return false, false, true 
		end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if player:GetCurrentEra() > eraClassicalID then 
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local req2 = false
		local reqIcon2 = "[ICON_UNCHECKBOX]"
		for otherPlayerID, otherPlayer in pairs(Players) do
			if otherPlayer:IsAlive() and otherPlayer ~= player and not player:IsMinorCiv() then
				local playerScore = player:GetScore()
				local otherPlayerScore = otherPlayer:GetScore()
				if playerScore < otherPlayerScore then
					if otherPlayer:IsDOF(player:GetID()) then 
						local req2 = true
						local reqIcon2 = "[ICON_CHECKBOX]"
					end
				end
			end
		end
		
		local costGold = g_MathCeil(300 * iMod)
		Decisions_GT_Imperial_Writings.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GT_QOCHO_IMPERIAL_WRITINGS_DESC", costGold, reqIcon1, reqIcon2)
		
		
		if (not req1) then return true, false end
		if (not req2) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < costGold then return true, false end
		return true, true
	end
	)
	
	Decisions_GT_Imperial_Writings.DoFunc = (
	function(player)
		local costGold = g_MathCeil(300 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:ChangeGold(-costGold)
		local capital = player:GetCapitalCity()
		if not capital:IsHasBuilding(buildingImperialWritingsDefenceID) then
			capital:SetNumRealBuilding(buildingImperialWritingsDefenceID, 1)
		end
		for otherPlayerID, otherPlayer in pairs(Players) do
			if otherPlayer:IsAlive() and otherPlayer ~= player and not player:IsMinorCiv() then
				local playerScore = player:GetScore()
				local otherPlayerScore = otherPlayer:GetScore()
				if playerScore < otherPlayerScore then
					if otherPlayer:IsDOF(player:GetID()) then 
						local otherPlayerGreatWorks = otherPlayer:GetNumGreatWorks()
						if city:IsHasBuilding(buildingImperialWritingsID) then
							capital:SetNumRealBuilding(buildingImperialWritingsDefenceID, otherPlayerGreatWorks)
						end
					end
				end
			end
		end
		if isCPActive then
			player:GrantPolicy(policyImperialWritingsID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyImperialWritingsID, true)
		end
	end
	)
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_GT_Imperial_Writings", Decisions_GT_Imperial_Writings)
-------------------------------------------------------------------------------------------------------------------------
-- Qocho: Adopt a Writing System
-------------------------------------------------------------------------------------------------------------------------
local policyWritingSystemID	= GameInfoTypes["POLICY_GT_DECISIONS_WRITING_SYSTEM"]
local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]
local unitCaravanID = GameInfoTypes["UNIT_CARAVAN"]
local Decisions_GT_Adopt_Writing_System = {}
	Decisions_GT_Adopt_Writing_System.Name = "TXT_KEY_DECISIONS_GT_QOCHO_ADOPT_WRITING_SYSTEM"
	Decisions_GT_Adopt_Writing_System.Desc = "TXT_KEY_DECISIONS_GT_QOCHO_ADOPT_WRITING_SYSTEM_DESC"
	HookDecisionCivilizationIcon(Decisions_GT_Adopt_Writing_System, "CIVILIZATION_GT_QOCHO")
	Decisions_GT_Adopt_Writing_System.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		if player:HasPolicy(policyWritingSystemID) then
			Decisions_GT_Adopt_Writing_System.Desc = g_ConvertTextKey("TXT_KEY_DECISIONS_GT_QOCHO_ADOPT_WRITING_SYSTEM_ENACTED_DESC")
			return false, false, true 
		end
		
		local req1 = false
		local reqIcon1 = "[ICON_UNCHECKBOX]"
		if player:GetCurrentEra() > eraClassicalID then 
			req1 = true
			reqIcon1 = "[ICON_CHECKBOX]"
		end
		
		local costGold = g_MathCeil(350 * iMod)
		Decisions_GT_Adopt_Writing_System.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_GT_QOCHO_ADOPT_WRITING_SYSTEM_DESC", costGold, reqIcon1)
		
		if (not req1) then return true, false end
		if player:GetGold() < costGold then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		return true, true
	end
	)
	
	Decisions_GT_Adopt_Writing_System.DoFunc = (
	function(player)
		local costGold = g_MathCeil(350 * iMod)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-costGold)
		
		local capital = player:GetCapitalCity()
		if not capital:IsHasBuilding(buildingWritersGuildID) then
			capital:SetNumRealBuilding(buildingWritersGuildID, 1)
		end
		
		local religionID = player:GetReligionCreatedByPlayer()
		if isUsingRtP then religionID = player:GetStateReligion() end
		if religionID <= 0 then religionID = capital:GetReligiousMajority() end
		local numTrade = capital:GetNumTradeRoutesAddingPressure(religionID)
		InitUnitFromCity(capital, unitCaravanID, 1 + numTrade)
		if isCPActive then
			player:GrantPolicy(policyWritingSystemID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyWritingSystemID, true)
		end
	end
	)
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_GT_Adopt_Writing_System", Decisions_GT_Adopt_Writing_System)	
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Event: Statues Ruined
--------------------------------------------------------------------------------------------------------------------------
local buildingColossusID 		= GameInfoTypes["BUILDING_COLOSSUS"]
local buildingChristoRedentorID	= GameInfoTypes["BUILDING_CHRISTO_REDENTOR"]
local buildingSistineChapelID	= GameInfoTypes["BUILDING_SISTINE_CHAPEL"]
local buildingStatueOfZeusID	= GameInfoTypes["BUILDING_STATUE_OF_ZEUS"]
local buildingHalicarnassusID	= GameInfoTypes["BUILDING_MAUSOLEUM_OF_HALICARNASSUS"]
local buildingAbuSimbelID		= GameInfoTypes["BUILDING_ABU_SIMBEL"]
local buildingWatPhoID			= GameInfoTypes["BUILDING_WAT_PHO"]
local buildingBamiyanID			= GameInfoTypes["BUILDING_BAMIYAN"]
local buildingTodaiJiID			= GameInfoTypes["BUILDING_TODAI_JI"]
local buildingLeshanBuddhaID	= GameInfoTypes["BUILDING_LESHAN_BUDDHA"]
local buildingSpecialistArtist	= GameInfoTypes["BUILDING_GT_STATUES_RUINED_SPECIALIST_ARTIST"]
local artist					= GameInfo.Specialists["SPECIALIST_ARTIST"].ID
local Event_GT_Statues_Ruined = {}
	Event_GT_Statues_Ruined.Name = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED"
	Event_GT_Statues_Ruined.Desc = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_DESC"
	Event_GT_Statues_Ruined.EventImage = 'Event_Statues_Ruined.dds'
	Event_GT_Statues_Ruined.Weight = 100
	Event_GT_Statues_Ruined.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilizationID then return false end
			if load(player, "Event_GT_Statues_Ruined") == true then return end
			
			local hasPatheon = false
			local hasReligiousIcon = false
			local religionID = player:GetReligionCreatedByPlayer()
			
			if player:HasCreatedPantheon() then
				hasPatheon = true
			end
			
			if userSettingPietyCore then religionID = player:GetStateReligion() end
			if religionID == -1 then religionID = city:GetReligiousMajority() end
			
			for city in player:Cities() do 
				if city:IsHasBuilding(buildingAbuSimbelID) or city:IsHasBuilding(buildingBamiyanID) or city:IsHasBuilding(buildingChristoRedentorID) or city:IsHasBuilding(buildingColossusID) or city:IsHasBuilding(buildingHalicarnassusID)
				or city:IsHasBuilding(buildingLeshanBuddhaID) or city:IsHasBuilding(buildingSistineChapelID) or city:IsHasBuilding(buildingStatueOfZeusID) or city:IsHasBuilding(buildingTodaiJiID) or city:IsHasBuilding(buildingWatPhoID) then
					hasReligiousIcon = true
				end
			end
			
			if (not religionID) then return end
			if (not hasReligiousIcon) then return end
			if (not hasPatheon) then return end
			return true
		end
		)
	Event_GT_Statues_Ruined.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_GT_Statues_Ruined.Outcomes[1] = {}
	Event_GT_Statues_Ruined.Outcomes[1].Name = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_1"
	Event_GT_Statues_Ruined.Outcomes[1].Desc = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_1_RESULT_1"
	Event_GT_Statues_Ruined.Outcomes[1].CanFunc = (
		function(player)
			return true
		end
		)
	Event_GT_Statues_Ruined.Outcomes[1].DoFunc = (	
		function(player)
			local playerID = player:GetID()
			for city in player:Cities() do 
				if city:IsHasBuilding(buildingAbuSimbelID) then
					city:SetNumRealBuilding(buildingAbuSimbelID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingBamiyanID) then
					city:SetNumRealBuilding(buildingBamiyanID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingChristoRedentorID) then
					city:SetNumRealBuilding(buildingChristoRedentorID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingHalicarnassusID) then
					city:SetNumRealBuilding(buildingHalicarnassusID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingLeshanBuddhaID) then
					city:SetNumRealBuilding(buildingLeshanBuddhaID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingSistineChapelID) then
					city:SetNumRealBuilding(buildingSistineChapelID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingStatueOfZeusID) then
					city:SetNumRealBuilding(buildingStatueOfZeusID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingTodaiJiID) then
					city:SetNumRealBuilding(buildingTodaiJiID, 0)
					city:ChangeFood(1)
				end
				if city:IsHasBuilding(buildingWatPhoID) then
					city:SetNumRealBuilding(buildingWatPhoID, 0)
					city:ChangeFood(1)
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_1_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_1"))
			save(player, "Event_GT_Statues_Ruined", true)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_GT_Statues_Ruined.Outcomes[2] = {}
	Event_GT_Statues_Ruined.Outcomes[2].Name = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_2"
	Event_GT_Statues_Ruined.Outcomes[2].Desc = "TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_2_RESULT_2"
	Event_GT_Statues_Ruined.Outcomes[2].CanFunc = (
		function(player)
			return true
		end
		)
	Event_GT_Statues_Ruined.Outcomes[2].DoFunc = (	
		function(player)
			local playerID = player:GetID()
			for city in player:Cities() do
				local specialistCount = player.GetTotalSpecialistCount(player, artist, city)
				city:SetNumRealBuilding(buildingSpecialistArtist, specialistCount)
				if city:IsHasBuilding(buildingAbuSimbelID) or city:IsHasBuilding(buildingBamiyanID) or city:IsHasBuilding(buildingChristoRedentorID) or city:IsHasBuilding(buildingColossusID) or city:IsHasBuilding(buildingHalicarnassusID)
				or city:IsHasBuilding(buildingLeshanBuddhaID) or city:IsHasBuilding(buildingSistineChapelID) or city:IsHasBuilding(buildingStatueOfZeusID) or city:IsHasBuilding(buildingTodaiJiID) or city:IsHasBuilding(buildingWatPhoID) then
					city:SetNumRealBuilding(buildingSpecialistArtist, (specialistCount * 2))
				end
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_2_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_GT_QOCHO_STATUES_RUINED_OUTCOME_2"))
			save(player, "Event_GT_Statues_Ruined", true)
		end
		)

tEvents.Event_GT_Statues_Ruined = Event_GT_Statues_Ruined

	
					
					

	
	
	
	
	
	
	
	
	
	
	
	
	
	