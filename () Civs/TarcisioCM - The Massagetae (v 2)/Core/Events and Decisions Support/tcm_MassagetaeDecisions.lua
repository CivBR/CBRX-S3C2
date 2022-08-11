function tcmMassagetaeDecisionUtility(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if load(unit, "tcmFreeExperienceMassagetae") == nil then
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"] then
			if load(player, "Decisions_EncaseTheHorses") == true then
				if unit:GetUnitType() == GameInfoTypes["UNIT_HORSEMAN"] then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_MASSAGETAE"], true)
					unit:ChangeExperience(15)
					save(unit, "tcmFreeExperienceMassagetae", true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcmMassagetaeDecisionUtility)

local Decisions_EncaseTheHorses = {}
	Decisions_EncaseTheHorses.Name = "TXT_KEY_DECISIONS_TCM_MASSAGETAE_ENCASE_THE_HORSES"
	Decisions_EncaseTheHorses.Desc = "TXT_KEY_DECISIONS_TCM_MASSAGETAE_ENCASE_THE_HORSES_DESC"
	HookDecisionCivilizationIcon(Decisions_EncaseTheHorses, "CIVILIZATION_TCM_MASSAGETAE")
	Decisions_EncaseTheHorses.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"]) then return false, false end
			if load(pPlayer, "Decisions_EncaseTheHorses") == true then
				Decisions_EncaseTheHorses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_MASSAGETAE_ENCASE_THE_HORSES_ENACTED")
				return false, false, true
			end

			local team = Teams[pPlayer:GetTeam()]
			local iCost = math.ceil(180 * iMod)
			local horsebackriding = GameInfo.Technologies["TECH_HORSEBACK_RIDING"].ID

			Decisions_EncaseTheHorses.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_MASSAGETAE_ENCASE_THE_HORSES_DESC", iCost)
			if (pPlayer:GetCurrentEra() >= GameInfoTypes["ERA_MEDIEVAL"]) then return false, false end
			if not(team:IsHasTech(horsebackriding)) then return true, false end
			if (pPlayer:GetJONSCulture() < iCost) then return true, false end
			
			return true, true
	end
	)
	
	Decisions_EncaseTheHorses.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(180 * iMod)
		pPlayer:ChangeJONSCulture(-iCost)
		for unit in pPlayer:Units() do
			if unit:GetUnitType() == GameInfoTypes["UNIT_HORSEMAN"] then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_TCM_MASSAGETAE"], true)
				unit:ChangeExperience(15)
				save(unit, "tcmFreeExperienceMassagetae", true)
			end
		end

		save(pPlayer, "Decisions_EncaseTheHorses", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"], "Decisions_EncaseTheHorses", Decisions_EncaseTheHorses)

local Decisions_SacrificeTheMightiest = {}
	Decisions_SacrificeTheMightiest.Name = "TXT_KEY_DECISIONS_TCM_MASSAGETAE_SACRIFICE_THE_MIGHTIEST"
	Decisions_SacrificeTheMightiest.Desc = "TXT_KEY_DECISIONS_TCM_MASSAGETAE_SACRIFICE_THE_MIGHTIEST_DESC"
	HookDecisionCivilizationIcon(Decisions_SacrificeTheMightiest, "CIVILIZATION_TCM_MASSAGETAE")
	Decisions_SacrificeTheMightiest.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"]) then return false, false end
			local era = load(pPlayer, "Decisions_SacrificeTheMightiest")
			local currentEra = pPlayer:GetCurrentEra()
			if era ~= nil then
				if era < currentEra then
					save(pPlayer, "Decisions_SacrificeTheMightiest", nil)
				else
					Decisions_SacrificeTheMightiest.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_MASSAGETAE_SACRIFICE_THE_MIGHTIEST_ENACTED")
					return false, false, true
				end
			end
			
			local unitLevel = 0
			local hasUnit = false
			local plot = pPlayer:GetCapitalCity():Plot()
			for iVal = 0,(plot:GetNumUnits() - 1) do
				local unit = plot:GetUnit(iVal)
				if unit:GetUnitType() == GameInfoTypes["UNIT_GREAT_GENERAL"] then
					unitLevel = 5
					hasUnit = true
					break
				elseif unit and unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
					unitLevel = unit:GetLevel()
					if unitLevel > 5 then
						unitLevel = 5
					end
					hasUnit = true
					break
				end
			end

			local iFaith = pPlayer:GetFaithPerTurnFromCities() * unitLevel 
			local iCulture = pPlayer:GetJONSCulturePerTurnFromCities() * unitLevel
			Decisions_SacrificeTheMightiest.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TCM_MASSAGETAE_SACRIFICE_THE_MIGHTIEST_DESC", iFaith, iCulture)

			if hasUnit == true then
				return true, true
			else
				return true, false
			end
	end
	)
	
	Decisions_SacrificeTheMightiest.DoFunc = (
	function(pPlayer)
		local unitLevel = 0
		local plot = pPlayer:GetCapitalCity():Plot()
		local killUnit
		for iVal = 0,(plot:GetNumUnits() - 1) do
			local unit = plot:GetUnit(iVal)
			if unit:GetUnitType() == GameInfoTypes["UNIT_GREAT_GENERAL"] then
				unitLevel = 5
				killUnit = unit
				break
			elseif unit and unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
				unitLevel = unit:GetLevel()
				if unitLevel > 5 then
					unitLevel = 5
				end
				killUnit = unit
				break
			end
			
		end

		local iFaith = pPlayer:GetFaithPerTurnFromCities() * unitLevel
		local iCulture = pPlayer:GetJONSCulturePerTurnFromCities() * unitLevel

		pPlayer:ChangeFaith(iFaith)
		pPlayer:ChangeJONSCulture(iCulture)

		for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local otherUnit = loopPlot:GetUnit()
			if otherUnit then
				if unitLevel == 1 then
					otherUnit:ChangeExperience(5)
				elseif unitLevel == 2 then
					otherUnit:ChangeExperience(10)
				elseif unitLevel == 3 then
					otherUnit:ChangeExperience(15)
				elseif unitLevel == 4 then
					otherUnit:ChangeExperience(20)
				elseif unitLevel == 5 then
					otherUnit:ChangeExperience(25)
				end
			end
		end;
		killUnit:Kill(true)
		save(pPlayer, "Decisions_SacrificeTheMightiest", pPlayer:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"], "Decisions_SacrificeTheMightiest", Decisions_SacrificeTheMightiest)