-- Lua Script1
-- Author: pedro
-- DateCreated: 12/26/16 2:15:28 PM
--------------------------------------------------------------
include('PlotIterators')

local nkID = GameInfoTypes.CIVILIZATION_UC_BEST_KOREA

local koksanID 		= GameInfoTypes["UNIT_UC_KOKSAN"]

function KoksanMovement(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == koksanID then
		if unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_SET"]) then
			unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_SET"], false)
		end
	end
end
GameEvents.UnitSetXY.Add(KoksanMovement)

function KoksanDoTurn(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
	for unit in player:Units() do
	if unit:GetUnitType() == koksanID then
		if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_SET"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_SET"], true)
			end
	local plot = unit:GetPlot()
		if plot and plot:GetOwner() == playerID then
			for loopPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if loopPlot:GetOwner() or loopPlot:GetOwner() ~= playerID  then
				if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_BORDER"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_BORDER"], true)
				end
			else
				if unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_BORDER"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_KOKSAN_BORDER"], false)
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(KoksanDoTurn)

local fortID = GameInfoTypes["IMPROVEMENT_FORT"]
local citadelID = GameInfoTypes["IMPROVEMENT_CITADEL"]
function NKForts(playerID, city)
	local cityPlot = city:Plot()
	local forts = 0
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if adjacentPlot:GetImprovementType() == fortID or adjacentPlot:GetImprovementType() == citadelID and adjacentPlot:IsBeingWorked() and not adjacentPlot:IsImprovementPillaged() then
					forts = forts + 1
		end
	end
	return forts 
end

local fortID = GameInfoTypes["IMPROVEMENT_FORT"]
local citadelID = GameInfoTypes["IMPROVEMENT_CITADEL"]
function NKJustForts(playerID, city)
	local cityPlot = city:Plot()
	local justForts = 0
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if adjacentPlot:GetImprovementType() == fortID and adjacentPlot:IsBeingWorked() and not adjacentPlot:IsImprovementPillaged() then
					justForts = justForts + 1
		end
	end
	return justForts 
end

function NorthKoreanDoTurn(playerID)
local player = Players[playerID]
	if player:IsAlive() and player:GetCivilizationType() == nkID then
	for city in player:Cities() do
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_FORT_HAPPY, NKForts(playerID, city))
		local wltkd = city:GetWeLoveTheKingDayCounter() 
		if wltkd > 0 then
			if city:IsHasBuilding(GameInfoTypes.BUILDING_UC_PROPAGANDA) then
					local works = city:GetNumGreatWorks()
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_FAMINE, 1)
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_HAPPY, works)
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_CULTURE, works)
				end
			if not city:IsHasBuilding(GameInfoTypes.BUILDING_UC_NK_STOP) then
			local newNum = (NKJustForts(playerID, city) * 2)
			city:ChangeWeLoveTheKingDayCounter(newNum)
			city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_STOP, 1)
			end
		else
			if wltkd == 0 and city:IsHasBuilding(GameInfoTypes.BUILDING_UC_NK_STOP) then
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_STOP, 0)				
					end
				end
			end
		end
	end
GameEvents.PlayerDoTurn.Add(NorthKoreanDoTurn)

local hasRunOnce = false

function NorthKoreaCitadel(iPlayer, iX, iY, iImprovement)
	if hasRunOnce then 
    hasRunOnce = false;
    return;
else
    hasRunOnce = true;
end
	if iImprovement ~= citadelID then return end
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() ~= nkID then return end
	local pPlot = Map.GetPlot(iX, iY)
	local pCity = pPlot:GetWorkingCity()
	if not pCity or pCity:GetOwner() ~= iPlayer then
		local iDistance = 9999
		for pOtherCity in pPlayer:Cities() do
			local iNewDistance = Map.PlotDistance(iX, iY, pOtherCity:GetX(), pOtherCity:GetY())
			if iNewDistance < iDistance then
				iDistance = iNewDistance
				pCity = pOtherCity
			end
		end
	end
	if pCity and pCity:GetOwner() == iPlayer then
	local cityName = pCity:GetName()
		pCity:ChangeWeLoveTheKingDayCounter(10)
		Events.GameplayAlertMessage("The construction of a citadel near " .. cityName .. " has started a We Love the King Day!")
	end
end

GameEvents.BuildFinished.Add(NorthKoreaCitadel)