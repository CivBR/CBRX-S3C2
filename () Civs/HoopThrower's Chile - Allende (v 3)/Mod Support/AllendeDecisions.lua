
print("Allende Decisions: Loaded")

--------------------------------------------------------------------------------------------------------------------------
-- Allende Synco
--------------------------------------------------------------------------------------------------------------------------

local allendeID = GameInfoTypes["CIVILIZATION_CHILE_ALLENDE"]

local Decisions_AllendeSynco = {}
	Decisions_AllendeSynco.Name = "TXT_KEY_DECISIONS_ALLENDE_SYNCO"
	Decisions_AllendeSynco.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ALLENDE_SYNCO_DESC")
	HookDecisionCivilizationIcon(Decisions_AllendeSynco, "CIVILIZATION_CHILE_ALLENDE")
	Decisions_AllendeSynco.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= allendeID) then
			return false, false
		end
		if load(pPlayer, "Decisions_AllendeSynco") == true then
			Decisions_AllendeSynco.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ALLENDE_SYNCO_ENACTED_DESC")
			return false, false, true
		end
		
		local iEra = pPlayer:GetCurrentEra()
		if (iEra < GameInfoTypes.ERA_POSTMODERN) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		local pCity = pPlayer:GetCapitalCity()
		if pCity == nil then
			return true, false
		end
		pAllendeSyncoUnit = nil
		local pPlot = pCity:Plot()
		local iNumUnits = pPlot:GetNumUnits()
		for iVal = 0,(iNumUnits - 1) do
			local pUnit = pPlot:GetUnit(iVal)
			local iUnitClass = pUnit:GetUnitClassType()
			if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_SCIENTIST) or (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_ENGINEER) then
				pAllendeSyncoUnit = pUnit
				break
			end
		end
		if pAllendeSyncoUnit ~= nil then
			return true, true
		else
			return true, false
		end
	end
	)
	
	Decisions_AllendeSynco.DoFunc = (
	function(pPlayer)
		pAllendeSyncoUnit:Kill()
		local pCity = pPlayer:GetCapitalCity()
		local pPlot = pCity:Plot()
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		Teams[pPlayer:GetTeam()]:SetHasTech(GameInfoTypes.TECH_INTERNET, true)
		pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_DECISIONS_ALLENDE_SYNCO, 1)
		save(pPlayer, "Decisions_AllendeSynco", true)
	end
	)
	
Decisions_AddCivilisationSpecific(allendeID, "Decisions_AllendeSynco", Decisions_AllendeSynco)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Allende Agrarian Reform
--------------------------------------------------------------------------------------------------------------------------
local AllendeAgrarianReformID = GameInfoTypes["POLICY_ALLENDE_AGRARIAN_REFORM"]

local Decisions_AllendeAgrarianReform = {}
	Decisions_AllendeAgrarianReform.Name = "TXT_KEY_DECISIONS_ALLENDE_AGRARIAN_REFORM"
	Decisions_AllendeAgrarianReform.Desc = "TXT_KEY_DECISIONS_ALLENDE_AGRARIAN_REFORM_DESC"
	HookDecisionCivilizationIcon(Decisions_AllendeAgrarianReform, "CIVILIZATION_CHILE_ALLENDE")
	Decisions_AllendeAgrarianReform.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= allendeID then return false, false end
		if load(player, "Decisions_AllendeAgrarianReform") == true then
			Decisions_AllendeAgrarianReform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ALLENDE_AGRARIAN_REFORM_ENACTED_DESC")
			return false, false, true
		end
		
		local iGold = 1000 * iMod
		
		Decisions_AllendeAgrarianReform.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ALLENDE_AGRARIAN_REFORM_DESC", iGold)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1	then return true, false end
		if	player:GetGold() < iGold then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(GameInfoTypes.TECH_FERTILIZER))	then return true, false end
		return true, true
	end
	)
		
	
	Decisions_AllendeAgrarianReform.DoFunc = (
	function(player)
		local iGold = 1000 * iMod
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-iGold)
		if GrantPolicy then
			player:GrantPolicy(AllendeAgrarianReformID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(AllendeAgrarianReformID, true)
		end
		save(player, "Decisions_AllendeAgrarianReform", true)
	end
	)
	
Decisions_AddCivilisationSpecific(allendeID, "Decisions_AllendeAgrarianReform", Decisions_AllendeAgrarianReform)
