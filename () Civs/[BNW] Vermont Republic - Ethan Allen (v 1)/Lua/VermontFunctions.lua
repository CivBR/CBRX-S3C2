-- Lua Script1
-- Author: pedro
-- DateCreated: 11/09/18 8:52:13 PM
--------------------------------------------------------------
include("PlotIterators")

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local civilizationID = GameInfoTypes.CIVILIZATION_SAS_VERMONT
local maple = GameInfoTypes.RESOURCE_SAS_MAPLE
local ForestTab = {}
local bRemoveForest = GameInfoTypes.BUILD_REMOVE_FOREST;
local forest = GameInfoTypes.FEATURE_FOREST;
local iLumberMill = GameInfoTypes["IMPROVEMENT_LUMBERMILL"]
local iForest = GameInfoTypes["FEATURE_FOREST"]
local iMaple = GameInfoTypes["RESOURCE_SAS_MAPLE"]

function VermontMapleSettle(playerID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local plot = Map.GetPlot( plotX, plotY)
		local city = plot:GetPlotCity()
		for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if (adjacentPlot:GetFeatureType() == forest and adjacentPlot:GetResourceType() == -1)  then
			local chance = JFD_GetRandom(1, 2)
			if chance == 1 then
				adjacentPlot:SetResourceType(maple, 1)
				end
			end
		end
	end 	
end
GameEvents.PlayerCityFounded.Add(VermontMapleSettle)

GameEvents.PlayerCityFounded.Add(function(iPlayer, iCityX, iCityY)
	local player = Players[iPlayer]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		InitialForest(iCityX, iCityY, iPlayer)
	end
end)

GameEvents.CityCaptureComplete.Add(function(iPlayer, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iPlayer]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		InitialForest(iX, iY, iNewOwner)
	end
end)

function InitialForest(x, y, iPlayer)
	for iX = -5, 5 do
		for iY = -5, 5 do
			local iPlot = Map.GetPlot(x + iX, y + iY)
			if iPlot then
				if iPlot:GetFeatureType() == forest then
					ForestTab[iPlot] = 1;
				end
			end
		end
	end
end

function GetNearestCity(playerID, kPlot)
	local dCity = false;
	local dist = 9999;
	for iCity in Players[playerID]:Cities() do
		local ndist = Map.PlotDistance(iCity:GetX(), iCity:GetY(), kPlot:GetX(), kPlot:GetY());
		if ndist < dist then
			dist = ndist;
			dCity = iCity;
		end
	end
	return dCity;
end

GameEvents.BuildFinished.Add(function(playerID, x, y, imID)
	local kPlot = Map.GetPlot(x,y);
	if kPlot then
		if ForestTab[kPlot] then
		if kPlot:GetResourceType() == maple then
			if kPlot:GetFeatureType() == -1 then
				ForestTab[kPlot] = nil;
				local player = Players[playerID]
				if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
					local kCity = GetNearestCity(playerID, kPlot);
					if kCity then
						kPlot:SetFeatureType(forest);
						local bBonus = kPlot:GetFeatureProduction(bRemoveForest, Players[playerID]:GetTeam())
						kPlot:SetFeatureType(-1);
						kPlot:SetResourceType(maple, 0)			
						if bBonus > 0 then
							if kCity:GetProductionBuilding() ~= -1 then
								kCity:ChangeBuildingProduction(kCity:GetProductionBuilding(), bBonus);
							elseif kCity:GetProductionUnit() ~= -1 then
								kCity:ChangeUnitProduction(kCity:GetProductionUnit(), bBonus);
							else
								kCity:ChangeProduction(bBonus);
							end
							if playerID == Game.GetActivePlayer() then
								Events.GameplayAlertMessage("Clearing a Forest has created extra " .. bBonus .. " [ICON_PRODUCTION]")								
								end
							end
						end
					end
				end
			end
		end
	end
end)


function VermontMapleCount(playerID, city)
    local cityPlot = city:Plot()
    local justForts = 0
    for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        if adjacentPlot:GetResourceType() == maple and adjacentPlot:GetImprovementType() == iLumberMill and adjacentPlot:GetOwner() == playerID then
                    justForts = justForts + 0.5
        end
    end
    return math.floor(justForts)
end

function VermontBuilding(playerID)
local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == civilizationID then
	for city in player:Cities() do
	if city:IsHasBuilding(GameInfoTypes.BUILDING_SAS_TAPHOUSE) then
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_SAS_SYRUP, VermontMapleCount(playerID, city))			
				end
			end
		end
	end
GameEvents.PlayerDoTurn.Add(VermontBuilding)

function C15_KrillMaple(playerID, iX, iY, improvementID)
    if improvementID == -1 then
        local pPlot = Map.GetPlot(iX, iY)
        if pPlot and pPlot:GetFeatureType() ~= iForest and pPlot:GetResourceType() == iMaple then
            pPlot:SetResourceType(-1, 0)
        end
    end
end

GameEvents.BuildFinished.Add(C15_KrillMaple)

RCMPInt = 0;
RCMPIntHelp = 1;
RCMPPlots = {}
RCMPPlotBool = {}
RCMPPrePlayer = Game.GetActivePlayer();

Events.SequenceGameInitComplete.Add(function()
	RCMPInGame = false;
	for i, player in pairs(Players) do
		if player:GetCivilizationType() == civilizationID then
			RCMPInGame = true;
			break;
		end
	end
	if RCMPInGame then
		for i = 0, Map:GetNumPlots() - 1, 1 do
			local fPlot = Map.GetPlotByIndex( i );
			if fPlot:GetOwnershipDuration() < 0 then
				RCMPInt = RCMPInt + 1;
				RCMPPlots[RCMPInt] = fPlot;
				RCMPPlotBool[fPlot] = true;
			end
		end
	end
end)

GameEvents.UnitSetXY.Add(function(player, unit, x, y)
	if Players[player]:GetCivilizationType() == civilizationID then
		local pUnit = Players[player]:GetUnitByID(unit)
		if pUnit:GetUnitType() == GameInfoTypes.UNIT_SAS_GREENMOUNTAINBOY then
			if Map.GetPlot(x,y) ~= nil then
				local cPlot = Map.GetPlot(x,y);
				if not cPlot:IsWater() then
					RCMPMain(player, unit, cPlot)
				end
			end
		end
	end
end)

function RCMPMain(player, unit, cPlot)
	if cPlot:GetOwner() == -1 or cPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FORT or cPlot:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CITADEL then
		RCMPInt = RCMPInt + 1;
		RCMPPlots[RCMPInt] = cPlot;
		RCMPPlotBool[cPlot] = true;
		cPlot:SetOwner(player);
		cPlot:SetOwnershipDuration( -1 )
	elseif cPlot:GetOwner() == player then
		if cPlot:GetOwnershipDuration() < 0 then
			cPlot:SetOwnershipDuration( -1 )
		end
	end
end

GameEvents.PlayerDoTurn.Add(function(iPlayer)
	if Players[RCMPPrePlayer]:GetCivilizationType() == civilizationID then
		RCMPPlotCheck(RCMPPrePlayer)
	end
	RCMPPrePlayer = iPlayer;
end)

local tCities = {}

 for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS, 1 do
  local otherPlayer = Players[iPlayer]
  if otherPlayer:IsAlive() then
  for city in otherPlayer:Cities() do
	table.insert(tCities, city)
		end
	end
end


function RCMPPlotCheck(player)
	for i = RCMPIntHelp, RCMPInt do
		if RCMPPlotBool[RCMPPlots[i]] then
			if RCMPPlots[i]:GetOwner() == player then
				if RCMPPlots[i]:GetOwnershipDuration() < 0 then
					if RCMPPlots[i]:GetNumUnits() > 0 then
						if RCMPPlots[i]:GetUnit(0):GetOwner() == player then
							RCMPPlots[i]:SetOwnershipDuration( -1 )
						end
					end
					if RCMPPlots[i]:GetOwnershipDuration() == -1 then
					if RCMPPlots[i]:GetImprovementType() == GameInfoTypes.IMPROVEMENT_FORT or RCMPPlots[i]:GetImprovementType() == GameInfoTypes.IMPROVEMENT_CITADEL then
						local cityID = NearestListCity(RCMPPlots[i], player, tCities)
						local city = Cities[cityID]
						local plot = city:GetCityPlotIndex()
						local ownerID = plot:GetOwner()
						local owner = Players[ownerID]
						RCMPPlots[i]:SetOwner(owner);
					else
						RCMPPlots[i]:SetOwner(-1);
						end
						RCMPPlotBool[RCMPPlots[i]] = false;
						if i == RCMPIntHelp then
							RCMPIntHelp = RCMPIntHelp + 1;
						end
					end
				end
			end
		elseif i == RCMPIntHelp then
			RCMPIntHelp = RCMPIntHelp + 1;
		end
	end
end

GameEvents.PlayerCityFounded.Add(function(iPlayer, iCityX, iCityY)
	if Players[iPlayer]:GetCivilizationType() == civilizationID then
		local kplot = Map.GetPlot(iCityX, iCityY);
		RCMPCityCheck(kplot, iPlayer)
	end
end)

function RCMPCityCheck(kplot, iPlayer)
	if kplot:GetOwnershipDuration() < 0 then
		if kplot:GetOwner() == iPlayer then
			RCMPPlotBool[kplot] = false;
			kplot:SetOwnershipDuration( 0 );
		end
	end
	for i = 0, 5 do
		local iPlot = Map.PlotDirection(kplot:GetX(), kplot:GetY(), i);
		if iPlot ~= nil then
			if iPlot:GetOwnershipDuration() < 0 then
				if iPlot:GetOwner() == iPlayer then
					RCMPPlotBool[iPlot] = false;
					iPlot:SetOwnershipDuration( 0 );
				end
			end
		end
	end
end

function NearestListCity(pPlot, pPlayer, tList)
	local iShortestDistance = 99999
	local pNearestCity = nil
	for k, pCity in pairs(tList) do
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY())
		if (iDist < iShortestDistance) then
			iShortestDistance = iDist
			pNearestCity = pCity
		end
	end
	return pNearestCity
end