-- ModocLua
-- Author: Sasquatch
-- DateCreated: 7/9/2021 9:11:46 AM
--------------------------------------------------------------
include("PlotIterators")
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
local iModoc = GameInfoTypes["CIVILIZATION_SAS_MODOC"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end
local bIsActive = JFD_IsCivilisationActive(iModoc)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local ModocID = GameInfoTypes.CIVILIZATION_SAS_MODOC
local bIsCivActive = JFD_IsCivilisationActive(ModocID)

-- Chrisy pullin up to rewrite your mod

-- C15 --

--[[function ModocMountainCount(playerID, city)
	local cityPlot = city:Plot()
	local mi = 0
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if (adjacentPlot:IsMountain()) and adjacentPlot:GetOwner() == playerID then
					mi = mi + 1
				end
			end
	return mi
end

function ModocHillsCount(playerID, city)
	local cityPlot = city:Plot()
	local hi = 0
	for adjacentPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if (adjacentPlot:IsHills()) and adjacentPlot:GetOwner() == playerID then
					hi = hi + 1
				end
			end
	return hi
end]]

local iHillDef = GameInfoTypes.BUILDING_SAS_MODOC_DFENS1
local iMountainDef = GameInfoTypes.BUILDING_SAS_MODOC_DFENS2

function ModocQela(playerID)
	local player = Players[playerID]	
	if player:IsAlive() and player:GetCivilizationType() == ModocID then 
	for city in player:Cities() do
			--[[local hills = ModocHillsCount(playerID, city)
			local num = ModocMountainCount(playerID, city)
			city:SetNumRealBuilding(, hills)
			city:SetNumRealBuilding(, num)]]
			local iHillCount, iMountCount = 0, 0
			for pPlot in PlotAreaSpiralIterator(city:GetPlot(), 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if pPlot then
					if pPlot:GetOwner() == playerID then
						if pPlot:GetWorkingCity() == city then
							if pPlot:IsHills() then
								iHillCount = iHillCount + 1
							elseif pPlot:IsMountain() then
								iMountCount = iMountCount + 1
							end
						end
					end
				end
			end
			city:SetNumRealBuilding(iHillDef, iHillCount)
			city:SetNumRealBuilding(iMountainDef, iMountCount)
		end
	end
end

-- Eh, since I can
function C15_Modoc_BoughtPlot(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == ModocID then
		local pPlot = Map.GetPlot(iX, iY)
		local iVar = 0
		if pPlot:IsHills() then
			iVar = 1
		elseif pPlot:IsMountain() then
			iVar = 2
		end
		if iVar > 0 then
			local pCity = pPlayer:GetCityByID(cityID)
			local iDummy = iVar == 1 and iHillDef or iMountainDef
			pCity:SetNumRealBuilding(iVar, pCity:GetNumRealBuilding(iVar) + 1)
		end
	end
end

if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(ModocQela)
	GameEvents.CityBoughtPlot.Add(C15_Modoc_BoughtPlot)
end
	-- /C15 --

local buildingCaveID = GameInfoTypes["BUILDING_SAS_MODOC_AIRLIFT"]
-- C15 --
local iFoodDummy = GameInfoTypes["BUILDING_SAS_MODOC_FOOD"] -- +1 Food

--JFD_Zion_CityConstructed
--[[function JFD_Modoc_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	if buildingID ~= buildingCaveID then return end

	local city = player:GetCityByID(cityID)
	local plot = Map.GetPlot(city:GetX(), city:GetY())

	plot:SetImprovementType(improvementCaveID)
end

GameEvents.CityConstructed.Add(JFD_Modoc_CityConstructed)]]

function C15_Modoc_CityFounded(playerID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == ModocID then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		pCity:SetNumRealBuilding(buildingCaveID, 1)
		local iMountCount = 0
		for iDir = 0,  DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
			local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
			if pAdjPlot:IsMountain() then
				iMountCount = iMountCount + 1
			end
		end
		
		pCity:SetNumRealBuilding(iFoodDummy, iMountCount)
	end
end

GameEvents.PlayerCityFounded.Add(C15_Modoc_CityFounded)

-- /C15 --

--===========================================================================
-- UU (Kilosh)
--===========================================================================
local iRiflemanClass = GameInfoTypes["UNITCLASS_RIFLEMAN"]
local iKilosh = GameInfoTypes["UNIT_SAS_KILOSH"]
local iGG = GameInfoTypes["UNIT_GREAT_GENERAL"]
-----------------------------------------------------------------------------
-- 1. When adjacent to an enemy, generates Great Writer Points (+2 GWP) in the capital.
-- 2. When adjacent to an enemy Great General, deals attrition damage (34 damage maybe?) to the GG and provides additional (+4 total) Great Writer Points in the Capital.
-----------------------------------------------------------------------------
function JWW_KiloshNearEnemy(playerID)
	local iGPGen = 0
	local iNumGGs = 0
    local pPlayer = Players[playerID]
	local pTeam = Teams[pPlayer:GetTeam()]
	-- C15 --
	--if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iModoc then
	-- /C15 --
		if pPlayer:HasUnitOfClassType(iRiflemanClass) then
			for pUnit in pPlayer:Units() do
				local bValidNearbyUnit = false
				local bEnemyGeneralNearbyUnit = false
				if pUnit:GetUnitType() == iKilosh then
					for iDir = 0,  DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
						if pAdjPlot then
							-- C15 --
							--local pAdjUnit = pAdjPlot:GetUnit(0)
							for iUnit = 0, pAdjPlot:GetNumUnits() - 1 do
								local pAdjUnit = pAdjPlot:GetUnit(iUnit)
								if pAdjUnit and pAdjUnit:GetOwner() ~= playerID then
									-- /C15 --
									local pNextPlayer = Players[pAdjUnit:GetOwner()]
										local iEnemyTeam = pNextPlayer:GetTeam()
										if pTeam:IsAtWar(iEnemyTeam) then
											bValidNearbyUnit = true
											if pAdjUnit:GetUnitType() == iGG then
												bEnemyGeneralNearbyUnit = true
												pAdjUnit:ChangeDamage(34) --34 attrition damage (Probably a tad steep imo)
												iNumGGs = iNumGGs + 1
											end
										end
									end
								end
							end
						end
					end
				if bValidNearbyUnit then
                    iGPGen = iGPGen + 1
				end
				if bValidNearbyUnit and (iNumGGs < 5) then -- max at +4 iGPGen?
					iGPGen = iGPGen + 1
				end
            end
        end
        local pCapital = pPlayer:GetCapitalCity()
        if pCapital then
            pCapital:SetNumRealBuilding(iGPGenDummy, math.min(iGPGen, 15))
        end
    --end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_KiloshNearEnemy)
end
--===========================================================================
-- UB (Pithouse)
--===========================================================================
local iPithouse = GameInfoTypes["BUILDING_SAS_PITHOUSE"]
-----------------------------------------------------------------------------
-- Units killed in the borders of a city with a Pit House provide a lump sum of Culture.
-----------------------------------------------------------------------------
function JWW_PithouseCultureOnDeath(iPlayer, iUnit, unitType, iPlotX, iPlotY, bDelay, killerID)
	if bDelay == false then return end
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pKiller = Players[killerID]
	if pKiller ~= pPlayer then
		local pPlot = pUnit:GetPlot()
		if pPlot and pPlot:IsOwned() then
			local pCity = pPlot:GetWorkingCity()
			if pCity:IsHasBuilding(iPithouse) then
				local pOwner = Players[pCity:GetOwner()]
				pOwner:ChangeJONSCulture(JFD_GetRandom(15,30)) -- 15-30 Culture per death.likely too much
			end
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_PithouseCultureOnDeath)
end
--===========================================================================
local iPithouseClass = GameInfoTypes["BUILDINGCLASS_AMPHITHEATER"]
-- C15 --
local tAmphitheaters = {}
for row in DB.Query("SELECT ID FROM Buildings WHERE BuildingClass = 'BUILDINGCLASS_AMPHITHEATER'") do
	tAmphitheaters[row.ID] = true
end
-- /C15 --
-----------------------------------------------------------------------------
--When a city with a Pit House is captured, all other cities that have filled Pit House GW slots have their HP restored and Production hurried.
-----------------------------------------------------------------------------
function ER_ModocUBFunc(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
    --This applies to any city with a Pit House of the iOldOwner because the UB is transferrable.
    local pOldOwner = Players[iOldOwner]
    if not pOldOwner or not pOldOwner:IsAlive() then return end 
    local pCapturedCity = (Map.GetPlot(iCityX, iCityY):GetPlotCity())
	-- C15 --
	if pOldOwnerpOldOwner:CountNumBuildings(iPithouse) == 0 then return end
    --if pCapturedCity and pCapturedCity:IsHasBuilding(iPithouse) then -- I'm pretty confident that the issue here is that the City won't have an iPithouse because it will have by this point been turned into whatever the captor's Amphitheater is
	if pCapturedCity then
		local bHas = false
		for k, v in pairs(tAmphitheaters) do
			if pCapturedCity:IsHasBuilding(k) then
				bHas = true
				break
			end
		end
		if bHas then
			-- /C15 --
			for pCity in pOldOwner:Cities() do -- should ignore all the enemy's city including pCapturedCity
				if pCity:IsHasBuilding(iPithouse) and pCity:GetNumGreatWorksInBuilding(iPithouseClass) > 0 then 
					-- C15 --
					--pCity:SetDamage(pCity:GetMaxHitPoints())
					pCity:SetDamage(pCity:GetMaxHitPoints() * -1)
					-- /C15 --
					if pCity:CanHurry() then pCity:Hurry() end 
				end
			end
		end
    end
end
if bIsActive then
    GameEvents.CityCaptureComplete.Add(ER_ModocUBFunc)
end