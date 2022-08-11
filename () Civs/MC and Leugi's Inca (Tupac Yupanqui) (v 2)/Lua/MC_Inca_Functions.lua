-- TupacLua
-- Author: EmeraldRange
-- DateCreated: 9/12/2020 2:31:23 PM
--------------------------------------------------------------
print("Tupac Lua loaded")
include("PlotIterators.lua")
--------------------------------------------------------------
--=======================================================================================================================
-- JFD_IsCivilisationActive
--=======================================================================================================================
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end
--=======================================================================================================================
local iCiv = GameInfoTypes["CIVILIZATION_MC_INCA"] --Change civ name
local bIsCivActive = JFD_IsCivilisationActive(iCiv)
local iChaskaChuquiPromotion = GameInfoTypes["PROMOTION_MC_CHASKA_CHUQUI"] -- Dummy promo to identify Chaska Chuqui
local iHarbour = GameInfoTypes["BUILDING_HARBOR"] --Change this to a dummy if you don't want to use a Harbour
local iYampuRunancha = GameInfoTypes["UNIT_MC_INCAN_YAMPU_RUNANCHA"] --Add name of Yampu Runanchu
local iGreatAdmiral = GameInfoTypes["UNITCLASS_GREAT_ADMIRAL"]
local iAmphibiousPromotion = GameInfoTypes["PROMOTION_MC_INCA_AMPHIBIOUS"] --Dummy promotion that's just like amphibious

--variables
local tWorldSizes = {}
for row in DB.Query("SELECT ID, GridWidth FROM Worlds") do 
	tWorldSizes[row.ID] = row.GridWidth
end
local iDistanceUnit = math.floor(tWorldSizes[Map.GetWorldSize()] / 10)

local iChaskaChuquiBaseStrength = 21 --base in a normal game
for row in DB.Query("SELECT ID, Combat FROM Units WHERE Type='UNIT_'") do --need to add the name of it too
	iChaskaChuquiBaseStrength = row.Combat
end

--table of player and team IDs for every Tahuatnsuyo
local tTahuatnsuyoIDs = {}
for k, v in pairs(Players) do
	if v:GetCivilizationType() == iCiv then
		tTahuatnsuyoIDs[k] = v:GetTeam()
	end
end	

local pPlayer = Players[Game.GetActivePlayer()]
if pPlayer:GetCivilizationType() == iCiv then
  pPlayer:SetEmbarkedGraphicOverride("ART_DEF_UNIT_MC_INCAN_EMBARK")
end

--Add dummy building defines here:
local iMitimaesDummy = GameInfoTypes["BUILDING_MC_INCAN_UA"] -- +1 Production and +1 Culture stackable dummy building
--=======================================================================================================================
-- ER_TahuatnsuyoDistanceFunc
-- Modifies distance for "distance to the capital".
-- (Distance - 4)/x where x is as follows (in standard vanilla)
-- Duel  Tiny  Small  Standard  Large  Huge
--  4     5      6       8       10     12
--=======================================================================================================================
function ER_TahuatnsuyoDistanceFunc(iDistance)
	if iDistance > 4 then
		iDistance = math.ceil((iDistance - 4)/ iDistanceUnit)
	else
		iDistance = 0
	end
	return iDistance;
end

--=======================================================================================================================
-- ER_TahuantinsuyoPlayerDoTurn
-- UA:  Conquered Cities gain extra Production and Culture increased by their distance from the city to the Capital
-- UU1: Receive additional Combat Strength the further they are from the Capital.
-- UU2: Land units within 2 tiles of a Yampu Runancha receive the Amphibious Promotion.
--=======================================================================================================================
function ER_TahuantinsuyoPlayerDoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() then
		local pCapital = pPlayer:GetCapitalCity()
		if pCapital then
			local iCapX = pCapital:GetX()
			local iCapY = pCapital:GetY()
			--UA: Mitimaes		
			if pPlayer:GetCivilizationType() == iCiv then
				for pCity in pPlayer:Cities() do
					if pCity:GetOriginalOwner() ~= pCity:GetOwner() then
					local iDistance = Map.PlotDistance(pCity:GetX(), pCity:GetY(), iCapX, iCapY)
						iDistance = ER_TahuatnsuyoDistanceFunc(iDistance)
						pCity:SetNumRealBuilding(iMitimaesDummy, iDistance)
					end
				end
			end
			for pUnit in pPlayer:Units() do
				--UU1: Chaska Chuqui
				if pUnit:IsHasPromotion(iChaskaChuquiPromotion) then
					local iDistance = Map.PlotDistance(pUnit:GetX(), pUnit:GetY(), iCapX, iCapY)
					iDistance = ER_TahuatnsuyoDistanceFunc(iDistance)
					pUnit:SetBaseCombatStrength(iChaskaChuquiBaseStrength + iDistance)
				end
				--UU2: Yampu Runancha
				--Has to spiral on every unit to avoid tracking units that move out of range of the UU2
				if pPlayer:HasUnitOfClassType(iGreatAdmiral) and pUnit:GetDomainType() == DomainTypes.DOMAIN_LAND and pUnit:IsCombatUnit() then
					
					--We don't need to do anything if its naturally amphibious
					if pUnit:IsHasPromotion(GameInfoTypes["PROMOTION_AMPHIBIOUS"]) then return end
					
					local bNearYampuRunancha = false
					for pAreaPlot in PlotAreaSpiralIterator(pUnit:GetPlot(), 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
						if bNearYampuRunancha then break end
						for i = 0, pAreaPlot:GetNumUnits()-1, 1 do
							if not bNearYampuRunancha and pAreaPlot:GetUnit(i):GetUnitType() == iYampuRunancha then
								bNearYampuRunancha = true
							end
						end
					end
				
					if bNearYampuRunancha then
						if not pUnit:IsHasPromotion(iAmphibiousPromotion) then
							pUnit:SetHasPromotion(iAmphibiousPromotion, true)
						end
					else
						if pUnit:IsHasPromotion(iAmphibiousPromotion) then
							pUnit:SetHasPromotion(iAmphibiousPromotion, false)
						end
					end
				end
			end
		end
	end
end
--=======================================================================================================================
-- ER_TahuantinsuyoCityCaptureComplete
-- UU1: Coastal Cities conquered by Chaska Chuquis are instantly connected to the Capital.
--=======================================================================================================================
function ER_TahuantinsuyoCityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID, oldPop, isConquest)
	local pPlot = Map.GetPlot(plotX, plotY)
	local pUnit = pPlot:GetUnit()
	if pUnit and pUnit:IsHasPromotion(iChaskaChuquiPromotion) then
		local pPlayer = Players[newOwnerID]
		local pCity = pPlot:GetPlotCity()
		if pCity:IsCoastal() and not pCity:IsHasBuilding(iHarbour) then
			pCity:SetNumRealBuilding(iHarbour, 1)
		end
	end
end
--=======================================================================================================================
-- ER_TahuantinsuyoTeamMeet
-- UA: Discovering City-States grants a burst of Gold and Great Admiral Points, increased by the distance from the City-State to the Capital.
--=======================================================================================================================
function ER_TahuantinsuyoTeamMeet(fromTeamID, metTeamID)
	--Edit these to change bonus given
	--For every (x tiles - 4) away from the capital give y Gold/Admiral Points
	--    where x is determined by ER_TahuatnsuyoDistanceFunc and y is below
	local iGoldModifier = 10
	local iAdmiralModifier = 5
	
	for k, v in pairs(tTahuatnsuyoIDs) do
		local pPlayer = Players[k]
		local pCapital = pPlayer:GetCapitalCity()
		local iX = pCapital:GetX()
		local iY = pCapital:GetY()
		
		if fromTeamID == v then -- deals with multiple Tahuatnsuyo in a team too
			if Teams[metTeamID]:IsMinorCiv() then
				local pMinor = Players[Teams[metTeamID]:GetLeaderID()]
				local pMinorCapital = pMinor:GetCapitalCity()
				local iDistance = Map.PlotDistance(pMinorCapital:GetX(), pMinorCapital:GetY(), iX, iY)
				iDistance = ER_TahuatnsuyoDistanceFunc(iDistance)
				--Give Bonus
				pPlayer:ChangeGold(iGoldModifier*iDistance)
				pPlayer:ChangeNavalCombatExperience(iAdmiralModifier*iDistance)
			end
		end
		if metTeamID == v then -- deals with multiple Tahuatnsuyo in a team too
			if Teams[fromTeamID]:IsMinorCiv() then
				local pMinor = Players[Teams[fromTeamID]:GetLeaderID()]
				local pMinorCapital = pMinor:GetCapitalCity()
				local iDistance = Map.PlotDistance(pMinorCapital:GetX(), pMinorCapital:GetY(), iX, iY)
				iDistance = ER_TahuatnsuyoDistanceFunc(iDistance)
				--Give Bonus
				pPlayer:ChangeGold(iGoldModifier*iDistance)
				pPlayer:ChangeNavalCombatExperience(iAdmiralModifier*iDistance)			
			end
		end
	end
end
--=======================================================================================================================
-- ER_TahuantinsuyoUnitPreKill
-- UU2: Expending a Yampu Runancha heals and refreshes the movement of all embarked units within 2 tiles.
--=======================================================================================================================
function ER_TahuantinsuyoUnitPreKill(playerID, unitID, unitType, plotX, plotY, isDelay, killerID)
	if isDelay and killerID == -1 and unitType == iYampuRunancha then
		local pPlayer = Players[playerID]
		local pPlot = Map.GetPlot(plotX, plotY)
		for pAreaPlot in PlotAreaSpiralIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if pAreaPlot:IsWater() then
				for i = 0, pAreaPlot:GetNumUnits()-1, 1 do
					local pUnit = pAreaPlot:GetUnit(i)
					if pUnit:IsEmbarked() then
						pUnit:SetDamage(0)
						pUnit:SetMoves(pUnit:MaxMoves())
					end
				end
			end
		end
	end
end

if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(ER_TahuantinsuyoPlayerDoTurn)
	GameEvents.TeamMeet.Add(ER_TahuantinsuyoTeamMeet)
	GameEvents.UnitPreKill.Add(ER_TahuantinsuyoUnitPreKill)
	GameEvents.CityCaptureComplete.Add(ER_TahuantinsuyoCityCaptureComplete)
end


GameEvents.PlayerDoTurn.Add(ER_TahuantinsuyoUnitPreKill)