local tCivilians = {}
for row in DB.Query("SELECT * FROM Units WHERE (Combat = 0 AND AirCombat = 0)") do
	tCivilians[row.ID] = row.Type
end

local tLandUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE (Domain = DOMAIN_Land)") do
	tLandUnits[row.ID] = row.Type
end

local tAirUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE (Domain = DOMAIN_AIR)") do
	tAirUnits[row.ID] = row.Type
end

local tSeaUnits = {}
for row in DB.Query("SELECT * FROM Units WHERE (Domain = DOMAIN_SEA)") do
	tSeaUnits[row.ID] = row.Type
end

function EW_UnitLimits_Check(playerID)
	local pPlayer = Players[playerID]
	local iLandCap = 10
	local iAirCap = 5
	local iSeaCap = 5

	--City and Population Count
	local iCities = 0
	local iTotal_Pop = 0

	for pCity in pPlayer:Cities() do
		iCities = iCities + 1
		iTotal_Pop = iTotal_Pop + pCity:GetPopulation()
	end

	local iAvg_Pop = iTotal_Pop / iCities

	--Land Unit Count
	iLandCap = iLandCap + math.ceil((5 * iCities) * iAvg_Pop)

	--Air Unit Count
	iAirCap = iAirLandCap + math.ceil((2 * iCities) * iAvg_Pop)

	--Sea Unit Count
	iSeaCap = iSeaCap + math.ceil((1.5 * iCities) * iAvg_Pop)

	local iLandUnits = 0
	for pUnit in pPlayer:Units() do
		if (not pUnit:IsCombatUnit()) and tLandUnits[pUnit:GetUnitType()] then
			iLandUnits = iLandUnits + 1
		end
	end

	local iAirUnits = 0
	for pUnit in pPlayer:Units() do
		if (not pUnit:IsCombatUnit()) and tAirUnits[pUnit:GetUnitType()] then
			iAirUnits = iAirUnits + 1
		end
	end

	local iSeaUnits = 0
	for pUnit in pPlayer:Units() do
		if (not pUnit:IsCombatUnit()) and tSeaUnits[pUnit:GetUnitType()] then
			iSeaUnits = iSeaUnits + 1
		end
	end

	local iTotalUnits = 0
	for pUnit in pPlayer:Units() do
		if not pUnit:IsCombatUnit() then
			iTotalUnits = iTotalUnits + 1
		end
	end

	return iLandCap, iAirCap, iSeaCap, iLandUnits, iAirUnits, iSeaUnits, iTotalUnits
end

function EW_UnitLimits_Roundabout(playerID)
	local iLandCap, iAirCap, iSeaCap, iLandUnits, iAirUnits, iSeaUnits, iTotalUnits = EW_UnitLimits_Check(playerID)
end
GameEvents.PlayerDoTurn.Add(EW_UnitLimits_Roundabout)

function EW_UnitLimits_CanTrain(playerID, cityID, unitType)
	local pPlayer = Players[playerID]

	local iLandCap, iAirCap, iSeaCap, iLandUnits, iAirUnits, iSeaUnits, iTotalUnits = EW_UnitLimits_Check(playerID)

	if tCivilians[unitType] then
		return true
	elseif tLandUnits[unitType] then
		if iLandUnits >= iLandCap then
			return false
		end
	elseif tAirUnits[unitType] then
		if iAirUnits >= iAiCap then
			return false
		end
	elseif tSeaUnits[unitType] then
		if iSeaUnits >= iSeaCap then
			return false
		end
	elseif iTotalUnits >= (iLandCap + iAirCap + iSeaCap) then
		return false
	end

	return true
end
GameEvents.CityCanTrain.Add(EW_UnitLimits_CanTrain)

--Load for active player
function EW_UnitLimits_GameLoad()
	local activePlayerID = Game.GetActivePlayer()
	EW_UnitLimits_Check(activePlayerID)
end
Events.SequenceGameInitComplete.Add(EW_UnitLimits_GameLoad)
Events.SerialEventUnitInfoDirty.Add(EW_UnitLimits_GameLoad)