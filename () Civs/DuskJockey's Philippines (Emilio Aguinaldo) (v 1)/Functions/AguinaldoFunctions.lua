-- AguinaldoFunctions
-- Author: DuskJockey
-- DateCreated: 6/7/2021 5:29:36 PM
--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("JFD_Nationalism_Utils.lua")
--------------------------------------------------------------
-- Utility Functions
--------------------------------------------------------------
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus.SS_TAKEN or slotStatus == SlotStatus.SS_COMPUTER) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end

	return false
end

function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()

function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()

function Game_IsNationalismActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "c3b6e30c-3548-4fbc-9d7f-cf3025be8261" then
			return true
		end
	end
	return false
end
local isNationalismActive = Game_IsNationalismActive()

function HasTrait(player, traitID)
	if isCPActive then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
end

-- adapted from Tophat's France
function GetSpiderKingPlayerFromTeam(teamID)
	local iTeam = 0
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer:GetCivilizationType() == civilizationID then
			iTeam = pPlayer:GetTeam()
			if iTeam == teamID then
				return pPlayer
			end
		end
	end
	return nil
end
--------------------------------------------------------------
-- Localized Variables
--------------------------------------------------------------
local civilizationID = GameInfoTypes.CIVILIZATION_DJ_PHILIPPINES_AGUINALDO
local isCivActive = JFD_IsCivilisationActive(civilizationID)
local defineMaxMajorCivs = GameDefines.MAX_MAJOR_CIVS

local traitAguinaldoID = GameInfoTypes.TRAIT_DJ_UNDIMMED_BY_TYRANTS_MIGHT
local promotionHeavyChargeID = GameInfoTypes.PROMOTION_HEAVY_CHARGE
local unitcombatGunID = GameInfoTypes.UNITCOMBAT_GUN

local unitclassRiflemanID = GameInfoTypes.UNITCLASS_RIFLEMAN
local unitKatipuneroID = GameInfoTypes.UNIT_DJ_KATIPUNERO

local buildingAglipayanChurchID = GameInfoTypes.BUILDING_DJ_AGLIPAYAN_CHURCH

local achievementAguinaldoSpecialID = GameInfoTypes.AA_DJ_PHILIPPINES_AGUINALDO_SPECIAL
local tAmericas = {};

function getCivsOfType(sType)
	local tCivs = {};
	for row in DB.Query([[
			SELECT ID, Type, DerivativeCiv
			FROM Civilizations
			WHERE Type LIKE "%]]..sType..[[%"
				OR DerivativeCiv LIKE "%]]..sType..[[%"
			]]) do
		print(tostring(row.Type).." ("..tostring(row.DerivativeCiv)..") is of civType: "..tostring(sType));
		tCivs[row.ID] = true;
	end
	return tCivs;
end
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnCityCaptureComplete
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnCityCaptureComplete(oldPlayerID, _, plotX, plotY, newPlayerID, _, isConquest)
	local oldPlayer = Players[oldPlayerID]
	local newPlayer = Players[newPlayerID]
	if not newPlayer:IsAlive() then return end
	if newPlayer:IsMinorCiv() or newPlayer:IsBarbarian() then return end
	if not isAAActive then return end
	if IsAAUnlocked(achievementPhilippinesAguinaldoSpecialID) or not player:IsHuman() then return end
	-- ADDITIONAL ACHIEVEMENTS SUPPORT
	if newPlayer:GetCivilizationType() == civilizationID and tAmericas[oldPlayer:GetCivilizationType()] then
		local city = Map.GetPlot(plotX, plotY):GetPlotCity()
		if city:IsCapital() then
			print("Conditions met; unlocking Philippine special achievement")
			UnlockAA(achievementPhilippinesAguinaldoSpecialID)
		end
	end
end

GameEvents.CityCaptureComplete.Add(Tranq_NormansGuiscard_OnCityCaptureComplete)
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnCityTrained
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnCityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinorCiv() or player:IsBarbarian() then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	-- AGLIPAYAN CHURCH
	if city:HasBuilding(buildingAglipayanChurchID) then
		local unitType = unit:GetUnitType()
		local numYield2 = player:GetTotalJONSCulturePerTurn()
		if isNationalismActive then
			numYield2 = player:GetNationalismPerTurn()
		end
		local numRawBonus = player:GetTotalFaithPerTurn() + numYield2
		local numBonus = math.floor(numRawBonus / player:GetNumCities())
		city:ChangeProductionUnit(unit:GetUnitType(), numBonus)
		local isPlayerHuman = player:IsHuman() and player:IsTurnActive()
		if isPlayerHuman then
			local hex = HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY())))
			Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_PRODUCTION]", numBonus))
		end
	end
end

GameEvents.CityTrained.Add(DJ_PhilippinesAguinaldo_OnCityTrained)
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnDeclareWar
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnDeclareWar(fromTeamID, toTeamID)
	local toTeam = Teams[toTeamID]
	local fromTeam = Teams[fromTeamID]
	local fromPlayer = GetSpiderKingPlayerFromTeam(fromTeamID)
	local toPlayer = GetSpiderKingPlayerFromTeam(toTeamID)
	local numMostCities = 0
	if not toPlayer:IsAlive() or fromPlayer:IsAlive() then return end
	-- UNDIMMED BY TYRANT'S MIGHT
	if fromPlayer and HasTrait(fromPlayer, traitAguinaldoID) then
		local numFromCities = fromTeam:GetNumCities()
		local numToCities = toTeam:GetNumCities()
		local numDifference = numToCities - numFromCities
		if numDifference > 0 then
			local numYield = fromPlayer:GetCapitalCity():GetJONSCulturePerTurn()
			if isNationalismActive then	
				numYield = fromPlayer:GetNationalismPerTurn()
				local numBonus = numYield * numDifference
				fromPlayer:ChangeNationalism(numBonus)
			else
				local numBonus = numYield * numDifference
				fromPlayer:ChangeJONSCulture(numBonus)
			end
			local isPlayerHuman = player:IsHuman() and player:IsTurnActive()
			if isPlayerHuman then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_DJ_PHILIPPINES_AGUINALDO_ON_DECLARE_WAR", numBonus))
			end
		end
	end
	if toPlayer and HasTrait(toPlayer, traitAguinaldoID) then
		local numToCities = toTeam:GetNumCities()
		local numFromCities = fromTeam:GetNumCities()
		local numDifference = numToCities - numFromCities
		if numDifference > 0 then
			local numYield = toPlayer:GetCapitalCity():GetJONSCulturePerTurn()
			if isNationalismActive then
				numYield = toPlayer:GetNationalismPerTurn()
				local numBonus = numYield * numDifference
				toPlayer:ChangeNationalism(numBonus)
			else
				local numBonus = numYield * numDifference
				toPlayer:ChangeJONSCulture(numBonus)
			end
			local isPlayerHuman = player:IsHuman() and player:IsTurnActive()
			if isPlayerHuman then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_ALERT_DJ_PHILIPPINES_AGUINALDO_ON_DECLARE_WAR", numBonus))
			end
		end
	end
end

GameEvents.DeclareWar.Add(DJ_PhilippinesAguinaldo_OnDeclareWar)
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnJFD_PolicyNationalized
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnJFD_PolicyNationalized(playerID, policyID)
	local player = Players[playerID]
	--KATIPUNERO
	if player:HasUnitOfClassType(unitclassRiflemanID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitKatipuneroID then
				unit:ChangeDamage(-10)
				unit:ChangeMoves(60)
			end
		end
	end
end

if isNationalismActive then
	LuaEvents.JFD_PolicyNationalized.Add(DJ_PhilippinesAguinaldo_OnJFD_PolicyNationalized)
end
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnPlayerDoTurn
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinorCiv() or player:IsBarbarian() then return end
	-- UNDIMMED BY TYRANT'S MIGHT
	if HasTrait(player, traitAguinaldoID) then
		for unit in player:Units() do
			local hasPromotion = false
			local unitPlot = unit:GetPlot()
			local plotOwner = unitPlot:GetOwner()
			if unit:GetUnitCombatType() == unitcombatGunID and plotOwner == playerID then
				hasPromotion = true
			end
			unit:SetHasPromotion(promotionHeavyChargeID, hasPromotion)
		end
	end
end

GameEvents.PlayerDoTurn.Add(DJ_PhilippinesAguinaldo_OnPlayerDoTurn)
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicy
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicy(playerID, policyID)
	if isNationalismActive then return end
	local player = Players[playerID]
	--KATIPUNERO
	if player:HasUnitOfClassType(unitclassRiflemanID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitKatipuneroID then
				unit:ChangeDamage(-10)
				unit:ChangeMoves(60)
			end
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicy)
--------------------------------------------------------------
-- DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicyBranch
--------------------------------------------------------------
function DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicyBranch(playerID, policyID)
	if isNationalismActive then return end
	local player = Players[playerID]
	--KATIPUNERO
	if player:HasUnitOfClassType(unitclassRiflemanID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitKatipuneroID then
				unit:ChangeDamage(-10)
				unit:ChangeMoves(60)
			end
		end
	end
end

GameEvents.PlayerAdoptPolicyBranch.Add(DJ_PhilippinesAguinaldo_OnPlayerAdoptPolicyBranch)
--------------------------------------------------------------
print("AguinaldoFunctions.lua loaded successfully!")