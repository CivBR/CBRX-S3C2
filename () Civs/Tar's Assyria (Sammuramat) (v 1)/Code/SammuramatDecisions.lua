local Decisions_TCM_Assyria_Banks_Babylon = {}
	Decisions_TCM_Assyria_Banks_Babylon.Name = "TXT_KEY_DECISIONS_TCM_ASSYRIA_BANKS_BABYLON"
	Decisions_TCM_Assyria_Banks_Babylon.Desc = "TXT_KEY_DECISIONS_TCM_ASSYRIA_BANKS_BABYLON_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Assyria_Banks_Babylon, "CIVILIZATION_TCM_ASSYRIA")
	Decisions_TCM_Assyria_Banks_Babylon.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"]) then return false, false end
		if load(player, "Decisions_TCM_Assyria_Banks_Babylon") == true then
			Decisions_TCM_Assyria_Banks_Babylon.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ASSYRIA_BANKS_BABYLON_ENACTED_DESC")
			return false, false, true
		end
		local river = 0
		for city in player:Cities() do if city:CountNumRiverPlots() > 1 then river = river + 1 end end
		local gold = math.ceil((130 + (river * 70)) * iMod)
		local food = math.ceil((((player:GetCurrentEra() + 1) * 10) * river) * iMod)
		Decisions_TCM_Assyria_Banks_Babylon.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ASSYRIA_BANKS_BABYLON_DESC", gold, food)
		if (river < 1) then return true, false end
		if (player:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (player:GetGold() < gold) then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(GameInfoTypes["TECH_ENGINEERING"])) then return true, false end

		return true, true
	end
	)
       
	Decisions_TCM_Assyria_Banks_Babylon.DoFunc = (
	function(player)
		local river = 0
		for city in player:Cities() do if city:CountNumRiverPlots() > 1 then river = river + 1 city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_ASSYRIA_FOOD"], 1) end end
		local gold = math.ceil((130 + (river * 70)) * iMod)
		local food = math.ceil((((player:GetCurrentEra() + 1) * 10) * river) * iMod)
		for city in player:Cities() do city:ChangeFood(food) end
		player:ChangeGold(-gold)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_TCM_ASSYRIA_BANKS_BABYLON"], true)
		save(player, "Decisions_TCM_Assyria_Banks_Babylon", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"], "Decisions_TCM_Assyria_Banks_Babylon", Decisions_TCM_Assyria_Banks_Babylon)

local Decisions_TCM_Assyria_Victory_Stele = {}
	Decisions_TCM_Assyria_Victory_Stele.Name = "TXT_KEY_DECISIONS_TCM_ASSYRIA_VICTORY_STELE"
	Decisions_TCM_Assyria_Victory_Stele.Desc = "TXT_KEY_DECISIONS_TCM_ASSYRIA_VICTORY_STELE_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Assyria_Victory_Stele, "CIVILIZATION_TCM_ASSYRIA")
	Decisions_TCM_Assyria_Victory_Stele.CanFunc = (
	function(player)
		if (player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"]) then return false, false end
		local numCapitals = 0
		for city in player:Cities() do if city:IsOriginalCapital() and not(city:IsCapital()) then numCapitals = numCapitals + 1 end end
		if load(player, "Decisions_TCM_Assyria_Victory_Stele") and load(player, "Decisions_TCM_Assyria_Victory_Stele") >= numCapitals then
			Decisions_TCM_Assyria_Victory_Stele.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ASSYRIA_VICTORY_STELE_ENACTED_DESC")
			return false, false, true
		end
		local gold = math.ceil((player:GetCurrentEra() + 1) * 200 * iMod)
		Decisions_TCM_Assyria_Victory_Stele.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_ASSYRIA_VICTORY_STELE_DESC", gold)
		if (player:GetGold() < gold) then return true, false end
		if (numCapitals < 1) then return true, false end
		return true, true
	end
	)
       
	Decisions_TCM_Assyria_Victory_Stele.DoFunc = (
	function(player)
		local numCapitals = 0
		for city in player:Cities() do if city:IsOriginalCapital() and not(city:IsCapital()) then numCapitals = numCapitals + 1 end end
		local capital = player:GetCapitalCity()
		local gold = math.ceil((player:GetCurrentEra() + 1) * 200 * iMod)
		local numVictoryStele = capital:GetNumBuilding(GameInfoTypes["BUILDING_MONUMENT"]) + 1
		capital:SetNumRealBuilding(GameInfoTypes["BUILDING_MONUMENT"], numVictoryStele)
		player:ChangeGold(-gold)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(GameInfoTypes["POLICY_TCM_ASSYRIA_VICTORY_STELE"], true)
		save(player, "Decisions_TCM_Assyria_Victory_Stele", numCapitals)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_ASSYRIA"], "Decisions_TCM_Assyria_Victory_Stele", Decisions_TCM_Assyria_Victory_Stele)