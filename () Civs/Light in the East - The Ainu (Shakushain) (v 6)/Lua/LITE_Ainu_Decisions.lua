-- AinuDecisions
-- Author: Danmacsch/Damasc/DMS
--=======================================================================================================================
--print("The Ainu's Decisions: loaded")
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
--------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
--------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local civilisationID 						= GameInfoTypes["CIVILIZATION_LITE_AINU"]
local eraMedievalID							= GameInfoTypes["ERA_MEDIEVAL"]
local eraIndustrialID						= GameInfoTypes["ERA_INDUSTRIAL"]
local buildingMuseumID						= GameInfoTypes["BUILDING_MUSEUM"]
local buildingPorotoKotanID					= GameInfoTypes["BUILDING_LITE_POROTO_KOTAN"]
local pHills								= GameInfoTypes["PLOT_HILLS"]
local buildingItaomachipTradersCountDummy	= GameInfoTypes["BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY"]
-------------------------------------------------------------------------------------------------------------------------
-- Ainu: Itaomachip Traders
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ItaomachipTraders = {}
	Decisions_ItaomachipTraders.Name = "TXT_KEY_DECISIONS_DMS_AINU_ITAOMACHIP_TRADERS"
	Decisions_ItaomachipTraders.Desc = "TXT_KEY_DECISIONS_DMS_AINU_ITAOMACHIP_TRADERS_DESC"
	HookDecisionCivilizationIcon(Decisions_ItaomachipTraders, "CIVILIZATION_LITE_AINU")
	Decisions_ItaomachipTraders.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		if load(pPlayer, "Decisions_ItaomachipTraders") == true then
			Decisions_ItaomachipTraders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_AINU_ITAOMACHIP_TRADERS_ENACTED_DESC")
			return false, false, true 
		end

		local iGoldCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 300)
		Decisions_ItaomachipTraders.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_AINU_ITAOMACHIP_TRADERS_DESC", iGoldCost)
		-- requirements
		if not(pPlayer:GetCurrentEra() <= eraMedievalID) then return true, false end
		if (pPlayer:GetGold() < iGoldCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ItaomachipTraders.DoFunc = (
	function(pPlayer)
		local iGoldCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 300)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		--print("Decisions_ItaomachipTraders initializing (DoFunc - first time run)..")
			local iNumNavalTR = 0
			--print("Decisions_ItaomachipTraders: iNumNavalTR = " .. iNumNavalTR .. "..")
			--print("Decisions_ItaomachipTraders: iterate through Trade Routes to count international naval Trade routes..")
			for _,v in ipairs(pPlayer:GetTradeRoutes()) do
				local pFromCity = v.FromCity
				local pToCity = v.ToCity
				if v.Domain == DomainTypes.DOMAIN_SEA then
					--print("Decisions_ItaomachipTraders: found a naval TR..")
					if pFromCity and pToCity and (pFromCity:GetOwner() ~= pToCity:GetOwner()) then -- if only valid for Internation TRs
						--print("Decisions_ItaomachipTraders: TR is international..")
						iNumNavalTR = iNumNavalTR + 1
						--print("Decisions_ItaomachipTraders: iNumNavalTR = " .. iNumNavalTR .. "..")
					else
						--print("Decisions_ItaomachipTraders: nil check failed..")
					end
				else
					--print("Decisions_ItaomachipTraders: found a land TR - do nothing..")	
				end
			end
			--print("Decisions_ItaomachipTraders: iteration complete, found " .. iNumNavalTR .. " Naval Trade Routes in total..")
			if iNumNavalTR > 0 then
				pPlayer:GetCapitalCity():SetNumRealBuilding(buildingItaomachipTradersCountDummy, math.min(iNumNavalTR, 5))
				--print("Decisions_ItaomachipTraders: granting the capital math.min(iNumNavalTR, 3) = " .. math.min(iNumNavalTR, 5) .. " dummy buildings..")
			else
				--print("Decisions_ItaomachipTraders: iNumGoldTradeRouteBonus = 0 - do nothing..")
			end

		JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DECISIONS_DMS_AINU_ITAOMACHIP_TRADERS"))		
		save(pPlayer, "Decisions_ItaomachipTraders", true)
	end
	)

	Decisions_ItaomachipTraders.Monitors = {}
	Decisions_ItaomachipTraders.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		--print("Decisions_ItaomachipTraders: Called (PlayerDoTurn)..")
		local pPlayer = Players[iPlayer]		
		if (pPlayer:GetCivilizationType() ~= civilisationID) then return end
		if load(pPlayer, "Decisions_ItaomachipTraders") == true then
			local iNumNavalTR = 0
			--print("Decisions_ItaomachipTraders: iNumNavalTR = " .. iNumNavalTR .. "..")
			--print("Decisions_ItaomachipTraders: iterate through Trade Routes to count international naval Trade routes..")
			for _,v in ipairs(pPlayer:GetTradeRoutes()) do
				local pFromCity = v.FromCity
				local pToCity = v.ToCity
				if v.Domain == DomainTypes.DOMAIN_SEA then
					--print("Decisions_ItaomachipTraders: found a naval TR..")
					if pFromCity and pToCity and (pFromCity:GetOwner() ~= pToCity:GetOwner()) then -- if only valid for Internation TRs
						--print("Decisions_ItaomachipTraders: TR is international..")
						iNumNavalTR = iNumNavalTR + 1
						--print("Decisions_ItaomachipTraders: iNumNavalTR = " .. iNumNavalTR .. "..")
					else
						--print("Decisions_ItaomachipTraders: nil check failed..")
					end
				else
					--print("Decisions_ItaomachipTraders: found a land TR - do nothing..")	
				end
			end
			--print("Decisions_ItaomachipTraders: iteration complete, found " .. iNumNavalTR .. " Naval Trade Routes in total..")
			if iNumNavalTR > 0 then
				pPlayer:GetCapitalCity():SetNumRealBuilding(buildingItaomachipTradersCountDummy, math.min(iNumNavalTR, 5))
				--print("Decisions_ItaomachipTraders: granting the capital math.min(iNumNavalTR, 3) = " .. math.min(iNumNavalTR, 5) .. " dummy buildings..")
			else
				--print("Decisions_ItaomachipTraders: iNumGoldTradeRouteBonus = 0 - do nothing..")
			end
		end
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_AINU"], "Decisions_ItaomachipTraders", Decisions_ItaomachipTraders)
-------------------------------------------------------------------------------------------------------------------------
-- Ainu: Contruct Poroto Kotan
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ConstructPorotoKotan = {}
	Decisions_ConstructPorotoKotan.Name = "TXT_KEY_DECISIONS_DMS_AINU_CONSTRUCT_POROTO_KOTAN"
	Decisions_ConstructPorotoKotan.Desc = "TXT_KEY_DECISIONS_DMS_AINU_CONSTRUCT_POROTO_KOTAN_DESC"
		HookDecisionCivilizationIcon(Decisions_ConstructPorotoKotan, "CIVILIZATION_LITE_AINU")
	Decisions_ConstructPorotoKotan.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		if load(pPlayer, "Decisions_ConstructPorotoKotan") == true then
			Decisions_ConstructPorotoKotan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_AINU_CONSTRUCT_POROTO_KOTAN_ENACTED_DESC")
			return false, false, true 
		end

		local iGoldCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 500)
		Decisions_ConstructPorotoKotan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_AINU_CONSTRUCT_POROTO_KOTAN_DESC", iGoldCost)
		-- requirements
		if (pPlayer:GetCurrentEra() < eraIndustrialID) then return true, false end
		if (pPlayer:GetGold() < iGoldCost) then	return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_ConstructPorotoKotan.DoFunc = (
	function(pPlayer)
		local iGoldCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 500)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		pPlayer:GetCapitalCity():SetNumRealBuilding(buildingMuseumID, 1)
		--print("Decisions_ConstructPorotoKotan: set museum in capital..")
		pPlayer:GetCapitalCity():SetNumRealBuilding(buildingPorotoKotanID, 1)
		--print("Decisions_ConstructPorotoKotan: set porotokotan dummy in capital..")

		--JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DECISIONS_DMS_AINU_CONSTRUCT_POROTO_KOTAN"))		
		save(pPlayer, "Decisions_ConstructPorotoKotan", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_LITE_AINU"], "Decisions_ConstructPorotoKotan", Decisions_ConstructPorotoKotan)
--=======================================================================================================================
--=======================================================================================================================