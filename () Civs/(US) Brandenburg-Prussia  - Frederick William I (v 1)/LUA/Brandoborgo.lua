WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "usBrandenburg";
include("PlotIterators")
--==========================================================================================================================
--AUTHOR: TarcisioCM
--==========================================================================================================================
-- Kantone
--==========================================================================================================================
function Kantone(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_US_BRANDENBURG"] then
		for city in player:Cities() do
			if city:IsHasBuilding(GameInfoTypes["BUILDING_US_KANTONE"]) then
				--Experience from finished policy trees
				local finishedPolicyTrees = player:GetNumPolicyBranchesFinished()
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_KANTONE_EXP_DUMMY"], finishedPolicyTrees)
				--Culture and Production while building land military units
				local unitType = city:GetProductionUnit()
				if unitType and unitType.Combat > 0 and unitType.Domain == GameInfoTypes["DOMAIN_LAND"] then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_KANTONE_LAND_DUMMY"], 1)
				else
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_KANTONE_LAND_DUMMY"], 0)
				end
			else
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_KANTONE_LAND_DUMMY"], 0)
				city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_KANTONE_EXP_DUMMY"], 0)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Kantone)
--==========================================================================================================================
-- Potsdam Giant
--==========================================================================================================================
function potsdamReset(playerID)
	local player = Players[playerID]
	if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_MUSKETMAN"]) > 0 then
		local PotsdamGiants = {}
		for unit in player:Units() do
			if unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) or unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"]) or unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], false)
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"], false)
			end
			if unit:GetUnitType() == GameInfoTypes["UNIT_US_GIANTS"] then
				table.insert(PotsdamGiants, unit)
			end
		end
		for key,PotsdamGiant in pairs(PotsdamGiants) do 
			local plot = PotsdamGiant:GetPlot()
			for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:IsCombatUnit() then
						local level = PotsdamGiant:GetLevel()
						if level >= 5 then
							if otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) or otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"]) then
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], false)
							end
							otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"], true)
						elseif level >= 3 then
							if not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) then
								if otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) then
									otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								end
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], true)
							end
						else 
							if not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) and not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"])) then
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], true)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(potsdamReset)

function potsdamGiant(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_MUSKETMAN"]) > 0 then
		local unit = player:GetUnitByID(unitID)
		local plot = unit:GetPlot()
		if unit:GetUnitType() == GameInfoTypes["UNIT_US_GIANTS"] then
			for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:IsCombatUnit() then
						local level = unit:GetLevel()
						if level >= 5 then
							if otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) or otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"]) then
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], false)
							end
							otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"], true)
						elseif level >= 3 then
							if not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) then
								if otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) then
									otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								end
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], true)
							end
						else 
							if not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) and not(otherUnit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"])) then
								otherUnit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], true)
							end
						end
					end
				end
			end
		elseif unit:IsCombatUnit() then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], false)
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"], false)
			for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				for i = 0, loopPlot:GetNumUnits() - 1, 1 do
					local otherUnit = loopPlot:GetUnit(i)
					if otherUnit and otherUnit:GetOwner() == playerID and otherUnit:GetUnitType() == GameInfoTypes["UNIT_US_GIANTS"] then
						local level = otherUnit:GetLevel()
						if level >= 5 then
							if unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) or unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"]) then
								unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], false)
							end
							unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"], true)
						elseif level >= 3 then
							if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) then
								if unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"]) then
									unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], false)
								end
								unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"], true)
							end
						else 
							if not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_3"])) and not(unit:IsHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_2"])) then
								unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_GIANTS_1"], true)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(potsdamGiant)

function PotsdamGiantDisband(unitOwnerId, unitId, unitType, unitX, unitY, bDelay, eKillingPlayer)
	if bDelay then
		local player = Players[unitOwnerId]
		if eKillingPlayer == nil then
			local unit = player:GetUnitByID(unitId)
			if unit:GetUnitType() == GameInfoTypes["UNIT_US_GIANTS"] and unit:GetLevel() >= 5 then 
				local plot = unit:GetPlot()
				local city = plot:GetPlotCity()
				if city then
					local numExp = city:GetNumBuilding(GameInfoTypes["BUILDING_US_POTSDAM_EXP_DUMMY"]) + 1
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_US_POTSDAM_EXP_DUMMY"], numExp)
				end
			end
		end
	end
end
GameEvents.UnitPrekill.Add(PotsdamGiantDisband)
--==========================================================================================================================
-- UA
--==========================================================================================================================
include("FLuaVector.lua")
function UnitTrained(ownerId, cityId, unitId, bGold, bFaithOrCulture)
    local player = Players[ownerId]
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_US_BRANDENBURG"] then
        local unit = player:GetUnitByID(unitId)
        local experience = unit:GetExperience()
        player:ChangeJONSCulture(experience)
        if player:IsHuman() then
           Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))), Locale.ConvertTextKey("+{1_Num} [ICON_CULTURE] Culture was gained for training an unit", experience), true)
        end
    end
end
GameEvents.CityTrained.Add(UnitTrained)

function potsdamReset1(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_US_BRANDENBURG"] then
		local turnsLeft = load(player, "usBrandenburgTurnsLeft") 
		if turnsLeft then
			local newTurnsLeft = turnsLeft
			if turnsLeft == 0 then
				newTurnsLeft = nil
			else 
				newTurnsLeft = turnsLeft - 1
			end
			for unit in player:Units() do
				if unit:GetDomainType() == GameInfoTypes["DOMAIN_LAND"] and unit:IsCombatUnit() then
					unit:ChangeMoves(120)
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_BRANDENBURG_UA"], true)
				end
				if newTurnsLeft == nil then
					unit:SetHasPromotion(GameInfoTypes["PROMOTION_US_BRANDENBURG_UA"], false)
				end
			end
			save(player, "usBrandenburgTurnsLeft", newTurnsLeft)
		end
	end
end
GameEvents.PlayerDoTurn.Add(potsdamReset1)

function policyYoureAdopted(playerID)
    local player = Players[playerID]
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_US_BRANDENBURG"] then
        for city in player:Cities() do
            if city:GetProductionUnit() >= 0 then
                if GameInfo.Units[city:GetProductionUnit()].Combat > 0 then
                    local productionValue = city:GetYieldRate(GameInfoTypes["YIELD_PRODUCTION"]) * 10
                    city:ChangeProduction(productionValue)
                    save(player, "usBrandenburgTurnsLeft", 5)
                end
            end
        end
    end
end
GameEvents.PlayerAdoptPolicy.Add(policyYoureAdopted)
GameEvents.PlayerAdoptPolicyBranch.Add(policyYoureAdopted)
--==========================================================================================================================
--==========================================================================================================================
local policyID = GameInfoTypes["POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA"]
local buildings = {[GameInfoTypes["BUILDING_US_KANTONE"]]= 8, [GameInfoTypes["BUILDING_ARMORY"]]=8, [GameInfoTypes["BUILDING_MILITARY_ACADEMY"]]= 8,}

function Urdnot_CityTrained(playerID, cityID, unitID)
    local player = Players[playerID]
    local city = player:GetCityByID(cityID)
    local unit = player:GetUnitByID(unitID)
    if player:HasPolicy(policyID) then
        for buildingID,XP in pairs(buildings) do
            if city:IsHasBuilding(buildingID) then
                unit:ChangeExperience(XP)
            end
        end
    end
end
GameEvents.CityTrained.Add(Urdnot_CityTrained)
--=======================================================================================================================
--=======================================================================================================================