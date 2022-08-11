-- ========= --
-- UTILITIES --
-- ========= --

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

function JFDGame_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = JFDGame_IsAAActive()

-- ======= --
-- DEFINES --
-- ======= --

include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
include("PlotIterators.lua")

local iCiv = GameInfoTypes["CIVILIZATION_THP_ZULU"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ============================== --
-- UB: XP GAIN FROM BORDER GROWTH --
-- ============================== --

local iKraal = GameInfoTypes["BUILDING_THP_KRAAL"]

function Zulu_BorderXP(pCity)
	if not pCity:IsHasBuilding(iKraal) then return end
	local pPlot = pCity:Plot()
	for i = 0, pPlot:GetNumUnits() - 1, 1 do
		local pCityUnit = pPlot:GetUnit(i)
		if pCityUnit:IsCombatUnit() then
			pCityUnit:ChangeExperience(3)
		end
	end
	for pAdjPlot in PlotRingIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE) do
		if pAdjPlot then
			for i = 0, pAdjPlot:GetNumUnits() - 1, 1 do
				local pUnit = pAdjPlot:GetUnit(i)
				if pUnit:IsCombatUnit() and (pUnit:GetOwner() == pCity:GetOwner()) then
					pUnit:ChangeExperience(3)
				end
			end
		end
	end
end

function Zulu_CityBoughtPlot(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = pPlayer:GetCityByID(cityID)
		Zulu_BorderXP(pCity)
	end
end

if bIsActive then
	GameEvents.CityBoughtPlot.Add(Zulu_CityBoughtPlot)
end

-- ============================================= --
-- UA: TRADE ORIGINS EXPAND WHEN DESTINATIONS DO --
-- ============================================= --

function ClaimNextFreeTile(pCity)
	for pPlot in PlotAreaSpiralIterator(pCity:Plot(), 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if pPlot and not pPlot:IsOwned() then
			local iPlayer = pCity:GetOwner()
			pPlot:SetOwner(iPlayer, pCity:GetID())
			Zulu_BorderXP(pCity)
			
			if Players[iPlayer]:IsHuman() then
				local iX = pPlot:GetX()
				local iY = pPlot:GetY()
				local sMessage = "Claimed"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
			end
			
			return
		end
	end
end

function Zulu_ExpandAlongTradeRoutes(playerID, cityID, iX, iY)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	local tDoneCities = {}
	
	for k, v in pairs(pPlayer:GetTradeRoutesToYou()) do
		if (v.FromCivilizationType == iCiv) and (v.ToCity == pCity) and (not tDoneCities[v.FromCity]) then
			ClaimNextFreeTile(v.FromCity)
			tDoneCities[v.FromCity] = true
		end
	end
	
	-- this workaround is necessary to catch internal trade routes
	if pPlayer:GetCivilizationType() == iCiv then
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			if (v.FromID == v.ToID) and (v.ToCity == pCity) and (not tDoneCities[v.FromCity]) then
				ClaimNextFreeTile(v.FromCity)
				tDoneCities[v.FromCity] = true
			end
		end
	end
end

if bIsActive then
	GameEvents.CityBoughtPlot.Add(Zulu_ExpandAlongTradeRoutes)
end

-- ==================================== --
-- UA: GAP FROM OCCUPIED/PUPPETED TRADE --
-- ==================================== --

function Zulu_TradeGAP(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			if v.ToCity:IsOccupied() or v.ToCity:IsPuppet() then
				local iPoints = v.ToCity:GetPopulation()
				pPlayer:ChangeGoldenAgeProgressMeter(iPoints)
				if pPlayer:IsHuman() then
					local iX = v.FromCity:GetX()
					local iY = v.FromCity:GetY()
					local sMessage = "+" .. iPoints .. " [ICON_GOLDEN_AGE]"
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Zulu_TradeGAP)
end

-- ====================================== --
-- UU: BECOMES STRONGER AFTER THIRD PROMO --
-- ====================================== --

local iIbutho = GameInfoTypes["UNIT_THP_IBUTHO"]
local iWeakPromo = GameInfoTypes["PROMOTION_THP_IBUTHO_BASE"]
local iStrongPromo = GameInfoTypes["PROMOTION_THP_IBUTHO_STRENGTH"]
local iLevel3Amt = 60

function Zulu_IbuthoPromoted(playerID, unitID, promotionID)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitType() == iIbutho then
		if pUnit:IsHasPromotion(iStrongPromo) then return end
		if pUnit:GetExperience() >= iLevel3Amt then
			pUnit:SetHasPromotion(iWeakPromo, false)
			pUnit:SetHasPromotion(iStrongPromo, true)
			if pPlayer:IsHuman() then
				local iX = pUnit:GetX()
				local iY = pUnit:GetY()
				local sMessage = "Armed: +33% strength!"
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPromoted.Add(Zulu_IbuthoPromoted)
end

-- ===================================== --
-- UB: INSTANTLY CLAIM PASTURE RESOURCES --
-- ===================================== --

local tPastureRes = {}
for row in DB.Query("SELECT * FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE'") do
	local iRes = GameInfoTypes[row.ResourceType]
	tPastureRes[iRes] = true
end

function Zulu_KraalClaim(playerID, cityID, buildingType)
	if buildingType == iKraal then
		local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		local bHasClaimed = false
		for pPlot in PlotAreaSweepIterator(pCity:Plot(), 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			if pPlot then
				local iPlotRes = pPlot:GetResourceType()
				if tPastureRes[iPlotRes] then
					pPlot:SetOwner(playerID, cityID)
					bHasClaimed = true
				end
			end
		end
		
		if bHasClaimed and (pPlayer:GetCivilizationType() == iCiv) then
			Zulu_BorderXP(pCity)
			
			local tDoneCities = {}
			for k, v in pairs(pPlayer:GetTradeRoutesToYou()) do
				if (v.FromCivilizationType == iCiv) and (v.ToCity == pCity) and (not tDoneCities[v.FromCity]) then
					ClaimNextFreeTile(v.FromCity)
					tDoneCities[v.FromCity] = true
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.CityConstructed.Add(Zulu_KraalClaim)
end

-- ========== --
-- AA SUPPORT --
-- ========== --

if isAAActive then
	local iEngland = GameInfoTypes["CIVILIZATION_ENGLAND"]
	
	function CetshwayoAA(oldPlayerID, bCapital, iX, iY, newPlayerID)
		if IsAAUnlocked('AA_THP_ZULU_SPECIAL') then return end
		if (not bCapital) then return end
		local pPlayer = Players[newPlayerID]
		if pPlayer:IsHuman() and pPlayer:GetCivilizationType() == iCiv then
			local iOldCiv = Players[oldPlayerID]:GetCivilizationType()
			if iOldCiv == iEngland then
				local pUnit = Map.GetPlot(iX, iY):GetUnit(0)
				if pUnit:GetUnitType() == iIbutho then
					UnlockAA('AA_THP_ZULU_SPECIAL')
				end
			elseif GameInfo.Civilizations[iOldCiv].DerivativeCiv == iEngland then
				local pUnit = Map.GetPlot(iX, iY):GetUnit(0)
				if pUnit:GetUnitType() == iIbutho then
					UnlockAA('AA_THP_ZULU_SPECIAL')
				end
			end
		end
	end
	GameEvents.CityCaptureComplete.Add(CetshwayoAA)
end
