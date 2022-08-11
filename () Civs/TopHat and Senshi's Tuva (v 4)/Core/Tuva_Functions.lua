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

local iCiv = GameInfoTypes["CIVILIZATION_THP_SEN_TUVA"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iGerKharuulStrong = GameInfoTypes["IMPROVEMENT_THP_SEN_GER_KHARUUL_YES_RELIG"]
local iGerKharuulWeak = GameInfoTypes["IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG"]
local iMountain = GameInfoTypes["TERRAIN_MOUNTAIN"]
local iSinger = GameInfoTypes["UNIT_THP_SEN_THROAT_SINGER"]

-- ============================ --
-- UA: GWM SLOTS FROM MOUNTAINS --
-- ============================ --

local tMusicDummies = {}
for i = 1, 18, 1 do
	tMusicDummies[i] = GameInfoTypes["BUILDING_THP_SEN_TUVA_SLOT_" .. i]
end

function AssignTuvaSlots(pCity)
	local pCityPlot = pCity:Plot()
	local iNumSlots = 0
	for pAdjPlot in PlotAreaSpiralIterator(pCityPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if pAdjPlot:GetTerrainType() == iMountain then
			iNumSlots = iNumSlots + 1
		end
	end
	for i = 1, iNumSlots, 1 do
		pCity:SetNumRealBuilding(tMusicDummies[i], 1)
	end
end

function TuvaCitySettled(playerID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		AssignTuvaSlots(pCity)
	end
end

function TuvaCityConquered(oldPlayerID, bCapital, iX, iY)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	local pOwner = Players[pCity:GetOwner()]
	if pOwner:GetCivilizationType() == iCiv then
		AssignTuvaSlots(pCity)
	end
end

if bIsActive then
	GameEvents.PlayerCityFounded.Add(TuvaCitySettled)
	GameEvents.CityCaptureComplete.Add(TuvaCityConquered)
end

-- ============================= --
-- UA: PRESSURE FROM GREAT WORKS --
-- ============================= --

local iPressureDummy = GameInfoTypes["BUILDING_THP_SEN_TUVA_PRESSURE"]

function ManageTuvaPressure(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local iReligion = pPlayer:GetReligionCreatedByPlayer()
		if iReligion < 1 then
			local pCap = pPlayer:GetCapitalCity()
			if (pCap) and (pCap:GetReligiousMajority() > 0) then
				iReligion = pCap:GetReligiousMajority()
			end
		end
		if iReligion < 1 then return end
		for pCity in pPlayer:Cities() do
			if pCity:GetReligiousMajority() == iReligion then
				pCity:SetNumRealBuilding(iPressureDummy, pCity:GetNumGreatWorks())
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(ManageTuvaPressure)
end

-- ================================================ --
-- UU: MAY ENTER RIVAL TERRITORY W/ SHARED RELIGION --
-- ================================================ --

local iSingerPromo = GameInfoTypes["PROMOTION_THP_SEN_TUVA_RIVAL_TERRITORY"]

function TuvaSingerPromoCheck(playerID, unitID, iX, iY)
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitType() == iSinger then
		local pPlot = Map.GetPlot(iX, iY)
		local bIsRivalAdjacent = false
		local bShouldPromote = false
		local tNearbyReligions = {}
		
		for pAdjPlot in PlotAreaSpiralIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local ownerID = pAdjPlot:GetOwner()
			if (ownerID > -1) and (ownerID ~= playerID) then
				bIsRivalAdjacent = true
				local pOwner = Players[ownerID]
				if pOwner:HasCreatedReligion() then
					tNearbyReligions[pOwner] = pOwner:GetReligionCreatedByPlayer()
				else
					tNearbyReligions[pOwner] = pOwner:GetCapitalCity():GetReligiousMajority()
				end
			end
		end
		
		if bIsRivalAdjacent then
			local iHomeReligion = pPlayer:GetReligionCreatedByPlayer()
			if (iHomeReligion < 1) and (pPlayer:GetCapitalCity()) then
				iHomeReligion = pPlayer:GetCapitalCity():GetReligiousMajority()
			end
			for kPlayer, vReligionID in pairs(tNearbyReligions) do
				if (vReligionID == iHomeReligion) and (vReligionID > 0) then
					bShouldPromote = true
					break
				end
			end
		end
		
		pUnit:SetHasPromotion(iSingerPromo, bShouldPromote)
	end
end

if bIsActive then
	GameEvents.UnitSetXY.Add(TuvaSingerPromoCheck)
end

-- ================================ --
-- UU: REMOVES HERESY WHEN EXPENDED --
-- ================================ --

local iInquisitor = GameInfoTypes["UNIT_INQUISITOR"]
local iHeresyMission = GameInfoTypes["MISSION_REMOVE_HERESY"]

function ThroatSinger_RemoveHeresy(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if (not bDelay) and (killerID == -1) and (unitType == iSinger) then
		local pCity = Map.GetPlot(iX, iY):GetPlotCity()
		if pCity:GetOwner() == playerID then
			local pPlayer = Players[playerID]
			if pPlayer:HasCreatedReligion() then
				local pInquisitor = pPlayer:InitUnit(iInquisitor, iX, iY)
				pInquisitor:PushMission(iHeresyMission)
			end
		end
	end
end

if bIsActive then
	GameEvents.UnitPrekill.Add(ThroatSinger_RemoveHeresy)
end

-- ============================= --
-- UI: MORE POWERFUL W/ RELIGION --
-- ============================= --

function CorrectGerKharuulAroundCity(pCity, bHasReligion)
	local iWrongType = iGerKharuulStrong
	local iRightType = iGerKharuulWeak
	if bHasReligion then
		iWrongType = iGerKharuulWeak
		iRightType = iGerKharuulStrong
	end

	for i = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot:GetOwner() == pCity:GetOwner() then
			if pPlot:GetImprovementType() == iWrongType then
				pPlot:SetImprovementType(iRightType)
			end
		end
	end
end

function UpdateGerKharuulOnFounding(playerID)
	local pPlayer = Players[playerID]
	for pCity in pPlayer:Cities() do
		CorrectGerKharuulAroundCity(pCity, true)
	end
end

function AdjustCapturedGerKharuul(oldPlayerID, bCapital, iX, iY)
	local pCity = Map.GetPlot(iX, iY):GetPlotCity()
	local pOwner = Players[pCity:GetOwner()]
	if pOwner:HasCreatedReligion() then
		CorrectGerKharuulAroundCity(pCity, true)
	else
		CorrectGerKharuulAroundCity(pCity, false)
	end
end

function UpdateNewGerKharuul(playerID, iX, iY, iImprovement)
	if iImprovement == iGerKharuulWeak then
		local pPlayer = Players[playerID]
		if pPlayer:HasCreatedReligion() then
			Map.GetPlot(iX, iY):SetImprovementType(iGerKharuulStrong)
		end
	end
end

if bIsActive then
	GameEvents.ReligionFounded.Add(UpdateGerKharuulOnFounding)
	GameEvents.CityCaptureComplete.Add(AdjustCapturedGerKharuul)
	GameEvents.BuildFinished.Add(UpdateNewGerKharuul)
end

-- ============================= --
-- UI: GM POINTS FROM CONVERSION --
-- ============================= --

local iMusicSpec = GameInfoTypes["SPECIALIST_MUSICIAN"]

function HasGerKharuul(pPlot)
	local iImprovement = pPlot:GetImprovementType()
	if (iImprovement == iGerKharuulWeak) or (iImprovement == iGerKharuulStrong) then
		return true
	end
	return false
end

function GerKharuulGMPoints(playerID, iReligion, iX, iY)
	local pCityPlot = Map.GetPlot(iX, iY)
	for pAdjPlot in PlotAreaSpiralIterator(pCityPlot, 5, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if HasGerKharuul(pAdjPlot) then
			local pGKOwner = Players[pAdjPlot:GetOwner()]
			if pGKOwner then
				local pConvertedCity = pCityPlot:GetPlotCity()
				local iPointGain = 5 * pConvertedCity:GetPopulation()
				local pCapital = pGKOwner:GetCapitalCity()
				pCapital:ChangeSpecialistGreatPersonProgressTimes100(iMusicSpec, (iPointGain * 100))
				if pGKOwner:IsHuman() then
					local iX = pAdjPlot:GetX()
					local iY = pAdjPlot:GetY()
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+" .. iPointGain .. " [ICON_GREAT_PEOPLE] towards Throat Singer", 1)
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.CityConvertsReligion.Add(GerKharuulGMPoints)
end

-- ========== --
-- AA SUPPORT --
-- ========== --
