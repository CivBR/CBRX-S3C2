-- LITE_Ainu_Events
-- Author: DMS
--=======================================================================================================================
print("LITE's Ainu's Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 

-- JFD_GetEraAdjustedValue
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 

-- JFD_SendWorldEvent
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
local civilisationAinuID				= GameInfoTypes["CIVILIZATION_LITE_AINU"]
local eraMedievalID						= GameInfoTypes["ERA_MEDIEVAL"]
local eraRenaissanceID					= GameInfoTypes["ERA_RENAISSANCE"]
local eraIndustrialID					= GameInfoTypes["ERA_INDUSTRIAL"]
local eraModernID						= GameInfoTypes["ERA_MODERN"]
local terrainTundraID					= GameInfoTypes["TERRAIN_TUNDRA"]
local resourceBearID					= GameInfoTypes["RESOURCE_LITE_AINU_BEAR"]
local unitPoetImekanuID					= GameInfoTypes["UNIT_DMS_POET_IMENKANU"]
--------------------------------------------------------------------------------------------------------------------------
-- Ainu: Poet Imekanu
--------------------------------------------------------------------------------------------------------------------------
local Event_AinuPoetImekanu = {}
	Event_AinuPoetImekanu.Name = "TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU"
	Event_AinuPoetImekanu.Desc = "TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU_DESC"
	Event_AinuPoetImekanu.EventImage = "EventImage_PoetImekanu.dds"
	Event_AinuPoetImekanu.Weight = 15
	Event_AinuPoetImekanu.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_AinuPoetImekanu") == true then return false end
			if pPlayer:GetCivilizationType() ~= civilisationAinuID then return false, false end

			if pPlayer:GetCurrentEra() <= eraIndustrialID			then return false end

			return true
		end
		)
	Event_AinuPoetImekanu.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_AinuPoetImekanu.Outcomes[1] = {}
	Event_AinuPoetImekanu.Outcomes[1].Name = "TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU_OUTCOME_1"
	Event_AinuPoetImekanu.Outcomes[1].Desc = "TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU_OUTCOME_RESULT_1"
	Event_AinuPoetImekanu.Outcomes[1].Weight = 10
	Event_AinuPoetImekanu.Outcomes[1].CanFunc = (
		function(pPlayer)	
			
			return true
		end
		)
	Event_AinuPoetImekanu.Outcomes[1].DoFunc = (
		function(pPlayer) 
			local iPlayer = pPlayer:GetID()

			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_LITE_AINU_POET_IMEKANU_1"))
			save(pPlayer, "Event_AinuPoetImekanu", true)
		end)
		
	Event_AinuPoetImekanu.Monitors = {}
	Event_AinuPoetImekanu.Monitors[GameEvents.GreatPersonExpended] = (	
		function(iPlayer, eGreatPersonType)
			local pPlayer = Players[iPlayer]
			if load(pPlayer, "Event_AinuPoetImekanu") == true then
			
				if eGreatPersonType == unitPoetImekanuID then
					local iTotalGreatWorks = pPlayer:GetNumGreatWorks()
					
					local iCulture = JFD_GetEraAdjustedValue(pPlayer:GetID(), iTotalGreatWorks * 25)
					pPlayer:ChangeJONSCulture(iCulture)
					
					local pPlot = pPlayer:GetCapitalCity():Plot()
					pPlayer:InitUnit(unitPoetImekanuID, pPlot:GetX(), pPlot:GetY())

					JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU_NOTIFICATION_ON_EXPENDED", iCulture), Locale.ConvertTextKey("TXT_KEY_EVENT_LITE_AINU_POET_IMEKANU"))

				end				
			end
		end
	)

Events_AddCivilisationSpecific(civilisationAinuID, "Event_AinuPoetImekanu", Event_AinuPoetImekanu)
--------------------------------------------------------------------------------------------------------------------------
-- Ainu: Iaomante Celebrations
--------------------------------------------------------------------------------------------------------------------------
local Event_AinuIaomanteCelebrations = {}
	Event_AinuIaomanteCelebrations.Name = "TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS"
	Event_AinuIaomanteCelebrations.Desc = "TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS_DESC"
	Event_AinuIaomanteCelebrations.EventImage = "EventImage_IaomanteCelebrations.dds"
	Event_AinuIaomanteCelebrations.Weight = 20
	Event_AinuIaomanteCelebrations.CanFunc = (
		function(pPlayer)
			if load(pPlayer, "Event_AinuIaomanteCelebrations") == true then return false end
			if pPlayer:GetCivilizationType() ~= civilisationAinuID then return false end

			local iEra = load(pPlayer, "Event_AinuIaomanteCelebrations")
			local iCurrentEra = pPlayer:GetCurrentEra()
			if iEra ~= nil then
				if iEra < iCurrentEra then
					save(pPlayer, "Event_AinuIaomanteCelebrations", nil)
				else
					return false
				end
			end

			local iNumCitiesOnTundra = 0
			for pCity in pPlayer:Cities() do
				if pCity and pCity:Plot():GetTerrainType() == terrainTundraID then
					iNumCitiesOnTundra = iNumCitiesOnTundra + 1
				end
			end

			if iNumCitiesOnTundra < 1 then return false end

			return true
		end
		)
	Event_AinuIaomanteCelebrations.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_AinuIaomanteCelebrations.Outcomes[1] = {}
	Event_AinuIaomanteCelebrations.Outcomes[1].Name = "TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS_OUTCOME_1"
	Event_AinuIaomanteCelebrations.Outcomes[1].Desc = "TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS_OUTCOME_RESULT_1"
	Event_AinuIaomanteCelebrations.Outcomes[1].Weight = 10
	Event_AinuIaomanteCelebrations.Outcomes[1].CanFunc = (
		function(pPlayer)
			local iPlayer = pPlayer:GetID()
			iNumBearResources = pPlayer:GetNumResourceTotal(resourceBearID, false)
			iFaithBonus = JFD_GetEraAdjustedValue(iPlayer, iNumBearResources * 10)

			Event_AinuIaomanteCelebrations.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS_OUTCOME_RESULT_1", iFaithBonus)

			return true
		end
		)
	Event_AinuIaomanteCelebrations.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iPlayer = pPlayer:GetID()
			iNumBearResources = pPlayer:GetNumResourceTotal(resourceBearID, false)
			iFaithBonus = JFD_GetEraAdjustedValue(iPlayer, iNumBearResources * 10)
			pPlayer:ChangeFaith(iFaithBonus)

			for pCity in pPlayer:Cities() do
				if pCity and pCity:Plot():GetTerrainType() == terrainTundraID then
					if pCity:GetWeLoveTheKingDayCounter() == 0 then
						pCity:ChangeWeLoveTheKingDayCounter(8)
					end
				end
			end

			save(pPlayer, "Event_AinuIaomanteCelebrations", pPlayer:GetCurrentEra())

			JFD_SendNotification(iPlayer, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_IAOMANTE_CELEBRATIONS"))
			JFD_SendWorldEvent(iPlayer, Locale.ConvertTextKey("TXT_KEY_JFD_WORLD_EVENTS_DMS_IAOMANTE_CELEBRATIONS_1"))
		end
		)
	
Events_AddCivilisationSpecific(civilisationAinuID, "Event_AinuIaomanteCelebrations", Event_AinuIaomanteCelebrations)
--=======================================================================================================================
--=======================================================================================================================