include("PlotIterators.lua")
--------------------------------------------------------------
-- Sangkum
--------------------------------------------------------------
local civilizationCambodiaID = GameInfoTypes.CIVILIZATION_SENSHI_CAMBODIA
local traitSihanoukID = GameInfoTypes.TRAIT_SENSHI_SANGKUM
local gameSpeedModifier = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local stopID = GameInfoTypes.BUILDING_SENSHI_SANGKUM_MARKER
-------------------------------
function CambodiaGreatPeopleSpawn(playerID)
	local player = Players[playerID];
	if (player:IsAlive() and player:GetCivilizationType() == civilizationCambodiaID) then
	for city in player:Cities() do
	local wltkd = city:GetWeLoveTheKingDayCounter() 
	if wltkd > 0 and not city:IsHasBuilding(stopID) then
		city:SetNumRealBuilding(stopID, 1)
			local scientist = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_SCIENTIST)
			local engineer = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_ENGINEER)
			local merchant = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_MERCHANT)
			local writer = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_WRITER)
			local musician = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_MUSICIAN)
			local artist = city:GetSpecialistGreatPersonProgress(GameInfoTypes.SPECIALIST_ARTIST)
			local cityPlot = city:Plot()
			local plotX = cityPlot:GetX()
			local plotY = cityPlot:GetY()
			if scientist > engineer and scientist > merchant and scientist > writer and scientist > musician and scientist > artist then
				player:InitUnit(GameInfoTypes.UNIT_SCIENTIST, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_SCIENTIST, -scientist*100)
			else
			if engineer > scientist and engineer > merchant and engineer > writer and engineer > musician and engineer > artist then
				player:InitUnit(GameInfoTypes.UNIT_ENGINEER, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_ENGINEER, -engineer*100)
			else
			if merchant > scientist and merchant > engineer and merchant > writer and merchant > musician and merchant > artist then
				player:InitUnit(GameInfoTypes.UNIT_MERCHANT, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MERCHANT, -merchant*100)
			else
			if writer > scientist and writer > merchant and writer > engineer and writer > musician and writer > artist then
				player:InitUnit(GameInfoTypes.UNIT_WRITER, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_WRITER, -writer*100)
			else
			if musician > scientist and musician > merchant and musician > writer and musician > engineer and musician > artist then
				player:InitUnit(GameInfoTypes.UNIT_MUSICIAN, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_MUSICIAN, -musician*100)
			else
			if artist > scientist and artist > merchant and artist > writer and artist > engineer and artist > musician then
				player:InitUnit(GameInfoTypes.UNIT_ARTIST, plotX, plotY)
				city:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes.SPECIALIST_ARTIST, -artist*100)
										end
									end
								end
							end
						end
					end					
				end
			if wltkd == 0 and city:IsHasBuilding(stopID) then
					city:SetNumRealBuilding(stopID, 0)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(CambodiaGreatPeopleSpawn)
--------------------------------------------------------------
function KhmerWLTKD(X, Y, oldPopulation, newPopulation)
    local city = Map.GetPlot(X, Y):GetPlotCity()
    local player = Players[city:GetOwner()]
    local buildingCultureID = GameInfoTypes["BUILDING_SENSHI_KHMER_CULTURE"]
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SENSHI_CAMBODIA"] then
        if city:GetWeLoveTheKingDayCounter() > 0 then
            city:SetNumRealBuilding(buildingCultureID, city:GetNumBuilding(buildingCultureID)+1)
        end
    end
end
 
GameEvents.SetPopulation.Add(KhmerWLTKD)
--------------------------------------------------------------
-- FUNK
--------------------------------------------------------------
function FUNKProduction(ownerID, cityID, unitTypeID)
    local player = Players[ownerID]
    if GameInfo.Units[unitTypeID].Description == "UNIT_SENSHI_FUNK" then
        local city = player:GetCityByID(cityID)
        local populationBonus = city:GetPopulation()*5
        if populationBonus > city:GetUnitProduction(unitTypeID) then
            city:SetUnitProduction(unitTypeID, populationBonus)
        end
    end
    return true
end

GameEvents.CityCanTrain.Add(FUNKProduction)

local unitFUNKID = GameInfoTypes["UNIT_SENSHI_FUNK"]

function FUNKSpeed(ownerID)
    local player = Players[ownerID]
    -- iterating through the player's units
    for unit in player:Units() do
        -- is this the FUNK?
        if unit:GetUnitType() == unitFUNKID then
            -- get the plot the unit is standing on
            local plot = unit:GetPlot()
            -- adjacencyTracker
            local adjacentToNoEnemy = true
            -- iterating through the adjacent tiles
            for loopPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
                -- if an unit has been detected, stop everything
                if (loopPlot:IsUnit()) then
                    adjacentToNoEnemy = false
                end
            end
            -- did the check pass?
            if (adjacentToNoEnemy == true) then
                local moves = unit:GetMoves()
				unit:SetMoves(2*moves)
            end
        end
    end
    return true
end
GameEvents.PlayerDoTurn.Add(FUNKSpeed)
--------------------------------------------------------------
-- Rong Pheapyon
--------------------------------------------------------------
local buildingRongPheapyonID = GameInfoTypes.BUILDING_RONG_PHEAPYON
local buildingclassOperaHouseID = GameInfoTypes.BUILDINGCLASS_OPERA_HOUSE
local buildingRongPheapyonHappinessID = GameInfoTypes.BUILDING_RONG_PHEAPYON_HAPPINESS
local buildingRongPheapyonMarkerID = GameInfoTypes.BUILDING_RONG_PHEAPYON_MARKER
--------------------------------------------------------------
function DJ_RongPheapyonBonuses(playerID)
	local player = Players[playerID]
	for city in player:Cities() do
		if city:IsHasBuilding(buildingRongPheapyonID) then
			if city:GetNumGreatWorksInBuilding(buildingclassOperaHouseID) > 0 then
				city:SetNumRealBuilding(buildingRongPheapyonHappinessID, 1)
			end
			if not (city:IsHasBuilding(buildingRongPheapyonMarkerID)) then
				local numWLtKDTurns = 10 * gameSpeedModifier
				city:ChangeWeLoveTheKingDayCounter(numWLtKDTurns)
				city:SetNumRealBuilding(buildingRongPheapyonMarkerID, 1)
				if player:IsHuman() then
					local alertmessage = Locale.ConvertTextKey("TXT_KEY_ALERT_DJ_SIHANOUK_SANGKHUM_WLTKD", city:GetName(), GameInfo.Buildings[buildingID].Description)
					Events.GameplayAlertMessage(alertmessage)
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DJ_RongPheapyonBonuses)