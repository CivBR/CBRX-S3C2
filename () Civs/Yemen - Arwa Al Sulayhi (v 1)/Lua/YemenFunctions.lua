include('PlotIterators.lua')

--Log Spamming Mode
local bDebug = false
if bDebug then print("Yemen Lua loaded") end

local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxPlayers = GameDefines["MAX_PLAYERS"]
--Useful Things
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--HasTrait
function HasTrait(player, traitID)
	if (not player:IsMinorCiv()) and (not player:IsBarbarian()) then
		if (not traitID) then
			print(player:GetName(), debug.traceback())
		end
		if Player.HasTrait then
			return player:HasTrait(traitID)
		else
			local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
			local traitType  = GameInfo.Traits[traitID].Type
			for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
				return true
			end
		end
		return false
	end
end
function Neirai_GetNearestCity(pPlayer, pPlot)
    local distance = 9999
    local cNearestCity = nil
    for cCity in pPlayer:Cities() do
        local pCityPlot = cCity:Plot()
        local between = Map.PlotDistance(pCityPlot:GetX(), pCityPlot:GetY(), pPlot:GetX(), pPlot:GetY())
        if between < distance then
            distance = between
            cNearestCity = cCity
        end
    end
    return cNearestCity
end

local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

--Constants
local iYemenID = GameInfoTypes["CIVILIZATION_URD_YEMEN"]
local iYemenTrait = GameInfoTypes["TRAIT_URD_YEMEN"]

local iMudBrickStage2 = GameInfoTypes["BUILDING_URD_ARWA_MBS_2"]
local iMudBrickLastStage = GameInfoTypes["BUILDING_URD_ARWA_MBS_5"]
local iFoodDummy = GameInfoTypes["BUILDING_URD_YEMEN_MBS_FOOD"]

local iBakil = GameInfoTypes["UNIT_URD_BAKIL"]
local iFreshWaterFeature = GameInfoTypes["FEATURE_WATER_DUMMY"]

local tLuxDummies = DB.Query("SELECT ID, Type FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_URD_YEMEN' AND Capital = 1")
local tLuxes = DB.Query("SELECT ID, Type FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'")

local iCaravan = GameInfoTypes["UNIT_CARAVAN"]
local iCargo = GameInfoTypes["UNIT_CARGO_SHIP"]

local iFoodYield = GameInfoTypes["YIELD_FOOD"]
local iDesert = GameInfoTypes["TERRAIN_DESERT"]
--Balancing Variables
local iFoodTurnsToBoost = 5
local iFoodToAdd = 2
local iChanceToClaim = 25
--UA
--Acquiring a new Luxury provides a free trade unit and a burst of food in all cities adjacent to mountains.
--On each turn, check if the player is Yemen, then for each luxury resource, check if the player owns it, then check if a dummy building of the relevant building exists.
local function RelicAcquireLuxDoTurn(iPlayerID)
	if bDebug then print("Starting Arwa UA Function, DoTurn Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bDebug then print("Got player") end
	if not pPlayer:IsAlive() then return end
	if not HasTrait(pPlayer, iYemenTrait) then return end
	if bDebug then print("Trait Check Passed") end
	local pCapital = pPlayer:GetCapitalCity()
	if not pCapital then return end
	for row in tLuxes do
		if bDebug then print("Looking for building: ".."BUILDING_URD_DUMMY_"..tostring(row.Type)) end
		local buildingID = GameInfoTypes["BUILDING_URD_DUMMY_"..tostring(row.Type)]
		if pCapital:GetNumRealBuilding(buildingID) == 0 then
			if bDebug then print("Building does not exist, checking for luxury") end
			if pPlayer:GetNumResourceAvailable(row.ID) > 0 then
				if bDebug then print("Luxury recently acquired") end
				--Grant a Trade Unit in the capital
				if pCapital:CanTrain(iCargo) then
					pPlayer:InitUnit(iCargo, pCapital:GetX(), pCapital:GetY())
				else
					pPlayer:InitUnit(iCaravan, pCapital:GetX(), pCapital:GetY())
				end
				--Grant Food Burst
				for pCity in pPlayer:Cities() do
					local hasAdjMountain = false
					for pPlot in PlotRingIterator(pCity:Plot(), 1, SECTOR_NORTH, true) do
						if pPlot:IsMountain() then
							if bDebug then print("Found Mountain") end
							hasAdjMountain = true
						end
					end
					if hasAdjMountain then
						local iFoodSurplus = pCity:FoodDifference()
						if bDebug then print("Adding Food to city") end
						pCity:ChangeFood(iFoodSurplus * iFoodTurnsToBoost)
					end
				end
				pCapital:SetNumRealBuilding(buildingID, 1)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RelicAcquireLuxDoTurn)
--Trade routes grant additional food to their origin city when passing over desert tiles.
local function RelicCheckTraderTiles(iPlayerID)
	if bDebug then print("Starting Arwa UA Function, DoTurn Trader Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bDebug then print("Got player") end
	if not pPlayer:IsAlive() then return end
	if not HasTrait(pPlayer, iYemenTrait) then return end
	if bDebug then print("Trait Check Passed") end
	for pUnit in pPlayer:Units() do
		if pUnit:IsTrade() then
			pPlot = pUnit:GetPlot()
			if pPlot:GetTerrainType() == iDesert then
				if bDebug then print("Found Trader Over Desert") end
				pNearestCity = Neirai_GetNearestCity(pPlayer, pUnit:GetPlot())
				if not pNearestCity then return end
				pNearestCity:SetNumRealBuilding(iFoodDummy, iFoodToAdd)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RelicCheckTraderTiles)
--UB
--DoTurn check for the 5th stage of the UB, if present, stick the feature on it.
--Props to Suk/Grant/Tomatekh for this flow
local function RelicCheckForFreshWater(iPlayerID)
	if bDebug then print("Starting Arwa UB Function, DoTurn Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bDebug then print("Got player") end
	if not pPlayer:IsAlive() then return end
	for pCity in pPlayer:Cities() do
        local bFreshWater = false
        local CityPlot = pCity:Plot()
        --check if any existing buildings provide access to freshwater
        for row in GameInfo.Building_ProvidesAccesstoFreshWater() do
            local iBuilding = GameInfo.Buildings[row.BuildingType].ID
            if pCity:IsHasBuilding(iBuilding) then
				if bDebug then print("Fresh Water Building Found") end
                bFreshWater = true
            end
        end
        if bFreshWater then
            CityPlot:SetFeatureType(iFreshWaterFeature)
        else
            if CityPlot:GetFeatureType() == iFreshWaterFeature then
                CityPlot:SetFeatureType(iNone)
            end
        end
    end
end
function CityScreenBuildingProvidesAccesstoFreshWater()
    local iPlayer = Game.GetActivePlayer()
    RelicCheckForFreshWater(iPlayer)
end

GameEvents.PlayerDoTurn.Add(RelicCheckForFreshWater)
Events.SerialEventExitCityScreen.Add(CityScreenBuildingProvidesAccesstoFreshWater)
--UU
--Every turn, check for fortified units. PlotIterate adjacent plots, get nearest city, and set plot owners. Add yields.
local function RelicDoTurnFortified(iPlayerID)
	if bDebug then print("Starting Arwa UU Function, DoTurn Event: "..iPlayerID) end
	local pPlayer = Players[iPlayerID]
	if bDebug then print("Got player") end
	if not pPlayer:IsAlive() then return end
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == iBakil then
			if pUnit:GetFortifyTurns() > 0 then
				if bDebug then print("Fortified Bakil") end
				pNearestCity = Neirai_GetNearestCity(pPlayer, pUnit:GetPlot())
				for pPlot in PlotAreaSweepIterator(pUnit:GetPlot(), 1, SECTOR_NORTH, true, true, true) do
					if not pPlot:IsOwned() and (pPlot:IsMountain() or pPlot:GetTerrainType() == iDesert) and JFD_GetRandom(0, 100) <= iChanceToClaim then
						if bDebug then print("Flipping Plot") end
						pPlot:SetOwner(iPlayerID, pNearestCity:GetID())
						Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), iFoodYield, 1)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(RelicDoTurnFortified)

--Restrict access to the second floor of the UU
local function RelicCanConstruct(iPlayer, iCity, iBuilding)
	if iBuilding == iMudBrickStage2 then
		if not HasTrait(Players[iPlayer], iYemenTrait) then
			return false
		end
	end
	return true
end

GameEvents.CityCanConstruct.Add(RelicCanConstruct)