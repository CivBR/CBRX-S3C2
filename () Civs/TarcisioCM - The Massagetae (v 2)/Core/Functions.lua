WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "TarcisioCMMassagetae";
include("PlotIterators")

--
function tcmMassagetaeExperienceFromKilledUnits(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	-- I don't know what bDelay does, but it works so I didn't even bother to find out
	if bDelay then
		local player = Players[unitOwnerId]
		local enemyPlayer = Players[eKillingPlayer]
		-- Use this to make sure that the effect doesn't trigger if the unit is disbanded or expended for something. It MUST be killed.
		if enemyPlayer and enemyPlayer ~= player then
			if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"] then
				local unit = player:GetUnitByID(unitId)
				local plot = unit:GetPlot()
				local experience = unit:GetExperience()
				--Adding nearby units to a list, used to hand out the experience from the killed unit. If theres no adjacent unit, it looks for more units in a 3 range radius. If there are still no units, it just picks someone from the player, awarding less experience.
				local numNearUnits = 0
				local unitList = {}
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local otherUnit = loopPlot:GetUnit()
					if otherUnit and otherUnit:IsCombatUnit() then
						if otherUnit:GetOwner() == unitOwnerId then
							numNearUnits = numNearUnits + 1
							table.insert(unitList, otherUnit)
						end
					end
				end
				if numNearUnits == 0 then
					for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						local otherUnit = loopPlot:GetUnit()
						if otherUnit and otherUnit:IsCombatUnit() then
							if otherUnit:GetOwner() == unitOwnerId then
								numNearUnits = numNearUnits + 1
								table.insert(unitList, otherUnit)
							end
						end
					end
				end
				if numNearUnits == 0 then
					for otherUnit in player:Units() do
						table.insert(unitList, otherUnit)
						experience = experience / 2
						numNearUnits = 1
						break
					end
				end
				
				experience = (experience / 3) / numNearUnits

				if numNearUnits > 0 then
					for key,otherUnit in pairs(unitList) do 
						otherUnit:ChangeExperience(experience)
					end
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(tcmMassagetaeExperienceFromKilledUnits)

function tcmMassagetaeMovementReset(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"] then
		for unit in player:Units() do
			save(unit, "tcmMassagetaeMovementBonus", false)
			local plot = unit:GetPlot()
			if plot and plot:GetOwner() == playerID then
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local otherUnit = loopPlot:GetUnit()
					if otherUnit and otherUnit:GetOwner() ~= playerID then
						local otherPlayer = Players[otherUnit:GetOwner()]
						local otherTeam = Teams[otherPlayer:GetTeam()]
						if otherTeam:IsAtWar(team) then
							unit:ChangeMoves(60)
							save(unit, "tcmMassagetaeMovementBonus", true)
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmMassagetaeMovementReset)

function tcmMassagetaeMovementPoints(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local unit = player:GetUnitByID(unitID)
	if load(unit, "tcmMassagetaeMovementBonus") == false or load(unit, "tcmMassagetaeMovementBonus") == nil then
		if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_TCM_MASSAGETAE"] then
			local plot = unit:GetPlot()
			if plot and plot:GetOwner() == playerID then
				for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local otherUnit = loopPlot:GetUnit()
					if otherUnit and otherUnit:GetOwner() ~= playerID then
						local otherPlayer = Players[otherUnit:GetOwner()]
						local otherTeam = Teams[otherPlayer:GetTeam()]
						if otherTeam:IsAtWar(team) then
							unit:ChangeMoves(60)
							save(unit, "tcmMassagetaeMovementBonus", true)
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcmMassagetaeMovementPoints)

function tcmMassagetaeBattleAxeman(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if unit:GetUnitType() == GameInfoTypes["UNIT_TCM_BATTLEAXEMAN"] then
		local extraStrength = 0
		for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local otherUnit = loopPlot:GetUnit()
			if otherUnit then
				local maxMoves = otherUnit:MaxMoves()
				local currentMoves = otherUnit:MovesLeft()
				if load(otherUnit, "tcmMassagetaeMovementBonus") == true then
					maxMoves = maxMoves + 60
				end
				maxMoves = maxMoves / 60
				currentMoves = currentMoves / 60

				local finalMoves = maxMoves - currentMoves
				finalMoves = finalMoves / 3

				extraStrength = extraStrength + finalMoves
			end
		end
		local strength = 12 + extraStrength
		unit:SetBaseCombatStrength(strength)
	end
	if plot then
		for firstloopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local otherUnit = firstloopPlot:GetUnit()
			if otherUnit then
				if otherUnit:GetUnitType() == GameInfoTypes["UNIT_TCM_BATTLEAXEMAN"] then
					local extraStrength = 0
					for loopPlot in PlotAreaSweepIterator(firstloopPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						local anotherUnit = loopPlot:GetUnit()
						if anotherUnit then
							local maxMoves = anotherUnit:MaxMoves()
							local currentMoves = anotherUnit:MovesLeft()
							if load(anotherUnit, "tcmMassagetaeMovementBonus") == true then
								maxMoves = maxMoves + 60
							end
							maxMoves = maxMoves / 60
							currentMoves = currentMoves / 60

							local finalMoves = maxMoves - currentMoves
							finalMoves = finalMoves / 3

							extraStrength = extraStrength + finalMoves
						end
					end
					local strength = 12 + extraStrength
					otherUnit:SetBaseCombatStrength(strength)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(tcmMassagetaeBattleAxeman)

function tcmScythianGoldsmith(playerID)
	local player = Players[playerID]
	if player:CountNumBuildings(GameInfoTypes["BUILDING_TCM_GOLDSMITH"]) > 0 then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_GOLDSMITH"]) and not city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_MASSAGETAE"]) then
				local plot = city:Plot()
				for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
					if loopPlot:GetResourceType() == GameInfoTypes["RESOURCE_IRON"] then
						loopPlot:SetResourceType(GameInfoTypes["RESOURCE_IRON"], 0);
						loopPlot:SetResourceType(GameInfoTypes["RESOURCE_GOLD"], 1)
					end
				end
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_MASSAGETAE"], 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(tcmScythianGoldsmith)

function tcmMassagetaeMountedUnit(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit and unit:GetUnitCombatType() == GameInfoTypes["UNITCOMBAT_MOUNTED"] then
		if load(unit, "tcmMassagetaeBuiltHorses") == nil then
			local plot = unit:GetPlot()
			if plot:IsCity() then
				local city = plot:GetPlotCity()
				if city:IsHasBuilding(GameInfoTypes["BUILDING_TCM_GOLDSMITH"]) then
					local numNearGold = 0
					for loopPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						if loopPlot:GetResourceType() == GameInfoTypes["RESOURCE_GOLD"] then
							numNearGold = numNearGold + 1
						end
					end
					local culture = city:GetJONSCulturePerTurn() * numNearGold
					player:ChangeJONSCulture(culture)
				end
			end
			save(unit, "tcmMassagetaeBuiltHorses", true)
		end
	end
end
GameEvents.UnitSetXY.Add(tcmMassagetaeMountedUnit)

