print("Muisca Decisions")

--Muisca Confederation

local Decisions_Muisca_Confederation = {}
	Decisions_Muisca_Confederation.Name = "TXT_KEY_DECISIONS_LEUGI_MUISCA_CONFEDERATION"
	Decisions_Muisca_Confederation.Desc = "TXT_KEY_DECISIONS_LEUGI_MUISCA_CONFEDERATION_DESC"
	HookDecisionCivilizationIcon(Decisions_Muisca_Confederation, "CIVILIZATION_MUISCA")
	Decisions_Muisca_Confederation.Weight = nil
	Decisions_Muisca_Confederation.CanFunc = (
		function(pPlayer)	
			nCities = 0
			for pCity in pPlayer:Cities() do
				nCities = nCities + 1
				if nCities == 1 then
					cityname1 = Locale.ConvertTextKey(pCity:GetName());
				elseif nCities == 2 then
					cityname2 = Locale.ConvertTextKey(pCity:GetName());
				elseif nCities == 3 then
					cityname3 = Locale.ConvertTextKey(pCity:GetName());
				end
			end
			if nCities < 3 then
				cityname3 = "Your third city";
				if nCities < 2 then
					cityname2 = "Your second city";
				end
				if nCities < 1 then
					cityname1 = "Your Capital";
				end
			end
	
			if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MUISCA"]) then return false, false end
			if load(pPlayer, "Decisions_Muisca_Confederation") == true then
				Decisions_Muisca_Confederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MUISCA_CONFEDERATION_ENACTED_DESC", cityname1, cityname2, cityname3)
				return false, false, true
			end	
			Decisions_Muisca_Confederation.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_MUISCA_CONFEDERATION_DESC", cityname1, cityname2, cityname3)
			local iGoldCost = math.ceil((300) * iMod)
			local iFaithCost = math.ceil((300) * iMod)
			if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 3) then return true, false end	 	
			if (pPlayer:GetFaith() < iFaithCost) then return true, false end
			if (pPlayer:GetGold() < iGoldCost) then return true, false end
			if (pPlayer:GetCurrentEra() >= GameInfo.Eras["ERA_RENAISSANCE"].ID) then return true, false end
			nCities = 0
			for pCity in pPlayer:Cities() do
				nCities = nCities + 1
			end
			if (nCities < 3) then return true, false end	
			return true, true
		end
	)
	
	Decisions_Muisca_Confederation.DoFunc = (
	function(pPlayer)
	
		local iBuilding1 = GameInfoTypes.BUILDING_MUISCA_1
		local iBuilding2 = GameInfoTypes.BUILDING_MUISCA_2
		local iBuilding3 = GameInfoTypes.BUILDING_MUISCA_3

		local iGoldCost = math.ceil((300) * iMod)
		local iFaithCost = math.ceil((300) * iMod)
		pPlayer:ChangeFaith(-iFaithCost);
		pPlayer:ChangGold(-iGoldCost);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -3)
		nCities = 0
		for pCity in pPlayer:Cities() do
			nCities = nCities + 1
			if nCities == 1 then
				pCity:SetNumRealBuilding(iBuilding2, 1)
			elseif nCities == 2 then
				pCity:SetNumRealBuilding(iBuilding1, 1)
			elseif nCities == 3 then
				pCity:SetNumRealBuilding(iBuilding3, 1)
			end
		end



		save(pPlayer, "Decisions_Muisca_Confederation", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MUISCA"], "Decisions_Muisca_Confederation", Decisions_Muisca_Confederation)

-- Nemequene Code


local Decisions_Nemequene_Code = {}
	Decisions_Nemequene_Code.Name = "TXT_KEY_DECISIONS_LEUGI_NEMEQUENE_CODE"
	Decisions_Nemequene_Code.Desc = "TXT_KEY_DECISIONS_LEUGI_NEMEQUENE_CODE_DESC"
	HookDecisionCivilizationIcon(Decisions_Nemequene_Code, "CIVILIZATION_MUISCA")
	Decisions_Nemequene_Code.Weight = nil
	Decisions_Nemequene_Code.CanFunc = (
	function(pPlayer)	
			
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_MUISCA"]) then return false, false end
		Decisions_Nemequene_Code.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_LEUGI_NEMEQUENE_CODE_DESC")
		local iCost = math.ceil((200) * iMod)
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end	 	
		if (pPlayer:GetFaith() < iCost) then return true, false end
		if (pPlayer:IsEmpireUnhappy()) then return true, false end
		if (pPlayer:IsEmpireVeryUnhappy()) then return true, false end
		if (pPlayer:IsEmpireSuperUnhappy()) then return true, false end
		if (pPlayer:GetCurrentEra() ~= GameInfo.Eras["ERA_MEDIEVAL"].ID) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_Nemequene_Code.DoFunc = (
	function(pPlayer)
	
		local iCost = math.ceil((200) * iMod)
		pPlayer:ChangeFaith(-iCost);
		local iGold = math.ceil((50) * iMod)
		pPlayer:ChangeGold(iGold);
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeNumFreePolicies(1)
		pPlayer:ChangeUnhappinessFromUnits(300)

		save(pPlayer, "Decisions_Nemequene_Code", true)

	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_MUISCA"], "Decisions_Nemequene_Code", Decisions_Nemequene_Code)
