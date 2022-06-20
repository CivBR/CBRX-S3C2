local Decisions_TCM_Kiev_Reform = {}
	Decisions_TCM_Kiev_Reform.Name = "TXT_KEY_DECISIONS_TCM_KIEV_REFORM"
	Decisions_TCM_Kiev_Reform.Desc = "TXT_KEY_DECISIONS_TCM_KIEV_REFORM_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Kiev_Reform, "CIVILIZATION_TCM_KIEV")
	Decisions_TCM_Kiev_Reform.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_KIEV"]) then return false, false end
		if load(pPlayer, "Decisions_TCM_Kiev_Reform") == true then
			Decisions_TCM_Kiev_Reform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_KIEV_REFORM_ENACTED_DESC")
			return false, false, true
		end
		local culture = 300 * iMod
		local gold = 100 + (pPlayer:GetGoldPerTurnFromDiplomacy() * 15)
		Decisions_TCM_Kiev_Reform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_KIEV_REFORM_DESC", culture, gold)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetJONSCulture() < culture) then return true, false end
		local numPuppets = 0
		for city in pPlayer:Cities() do if city:IsPuppet() then numPuppets = numPuppets + 1 if numPuppets == 3 then break end end end
		if (numPuppets < 3) then return true, false end

		return true, true
	end
	)
       
	Decisions_TCM_Kiev_Reform.DoFunc = (
	function(pPlayer)
		local gold = 100 + (pPlayer:GetGoldPerTurnFromDiplomacy() * 15)
		local culture = 300 * iMod
		pPlayer:ChangeGold(gold)
		pPlayer:ChangeJONSCulture(-culture)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_TCM_KIEV_DECISION"], true)
		for city in pPlayer:Cities() do
			if city:IsPuppet() then
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_KIEV_GOLD_PUPPET_DUMMY"], 1)
			end
		end
		save(pPlayer, "Decisions_TCM_Kiev_Reform", true)
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_KIEV"], "Decisions_TCM_Kiev_Reform", Decisions_TCM_Kiev_Reform)

local Decisions_TCM_Kiev_Call = {}
	Decisions_TCM_Kiev_Call.Name = "TXT_KEY_DECISIONS_TCM_KIEV_CALL"
	Decisions_TCM_Kiev_Call.Desc = "TXT_KEY_DECISIONS_TCM_KIEV_CALL_DESC"
	HookDecisionCivilizationIcon(Decisions_TCM_Kiev_Call, "CIVILIZATION_TCM_KIEV")
	Decisions_TCM_Kiev_Call.CanFunc = (
	function(pPlayer, tUnitTable)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_KIEV"]) then return false, false end
		local era = load(pPlayer, "Decisions_TCM_Kiev_Call")
		local currentEra = pPlayer:GetCurrentEra()
		if era ~= nil then
			if era < currentEra then
				save(pPlayer, "Decisions_TCM_Kiev_Call", nil)
			else
				Decisions_TCM_Kiev_Call.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_KIEV_CALL_ENACTED_DESC")
				return false, false, true
			end
		end
		local gold = math.ceil((currentEra + 1) * 180 * iMod)
		Decisions_TCM_Kiev_Call.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_KIEV_CALL_DESC", gold)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetGold() < gold) then return true, false end
		if (currentEra > 2) then return true, false end

		return true, true
	end
	)
       
	Decisions_TCM_Kiev_Call.DoFunc = (
	function(pPlayer, tUnitTable)
		local gold = math.ceil((pPlayer:GetCurrentEra() + 1) * 180 * iMod)
		pPlayer:ChangeGold(-gold)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		local numUnits = 0
		for resource in GameInfo.Resources() do
			local numExport = pPlayer:GetResourceExport(GameInfoTypes[resource.Type])
			if numExport > 0 then numUnits = numUnits + numExport end
		end

		local iUnit = nil
		for unitType in GameInfo.Units() do
			if pPlayer:CanTrain(GameInfoTypes[unitType.Type]) then
				if iUnit == nil then
					iUnit = GameInfoTypes[unitType.Type]
				elseif unitType.Combat > GameInfo.Units[iUnit].Combat then
					iUnit = GameInfoTypes[unitType.Type]
				end
			end
		end
		if iUnit ~= nil then 
			InitUnitFromCity(pPlayer:GetCapitalCity(), iUnit, numUnits) 
		end

		save(pPlayer, "Decisions_TCM_Kiev_Call", pPlayer:GetCurrentEra())
	end
	)
       
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_KIEV"], "Decisions_TCM_Kiev_Call", Decisions_TCM_Kiev_Call)