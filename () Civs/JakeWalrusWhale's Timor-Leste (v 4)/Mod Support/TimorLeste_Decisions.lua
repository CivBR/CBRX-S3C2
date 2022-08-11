-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--===========================================================================
-- GLOBALS
--===========================================================================
local iTimorLeste = GameInfoTypes["CIVILIZATION_JWW_TIMOR-LESTE"]
local iFalintil = GameInfoTypes["UNIT_JWW_FORCAS_DA_FALINTIL"]
local iPenicilin = GameInfoTypes["TECH_PENICILIN"]
local iSupportDummy = GameInfoTypes["BUILDING_JWW_TL_SUPPORT_DUMMY"]
local iRefrigeration = GameInfoTypes["TECH_REFRIGERATION"]
local iOffshorePlatform = GameInfoTypes["IMPROVEMENT_OFFSHORE_PLATFORM"]
local iPetroleumDummy = GameInfoTypes["BUILDING_JWW_TL_PETROLEUM_DUMMY"]
--===========================================================================
-- Gain Global Support From the UN
--===========================================================================
function DummyIfTLCityCaptured(iOldOwner, isCapital, iPlotX, iPlotY, iNewOwner)
	local pOldPlayer = Players[iOldOwner]
	if pOldPlayer:GetCivilizationType() == iTimorLeste then
		local pCity = Map.GetPlot(iPlotX, iPlotY):GetPlotCity()
		pCity:SetNumRealBuilding(iSupportDummy, 1)
	end
end

function AddDummyEachTurn(iPlayer)
	local pPlayer = Players[iPlayer]
	for pCity in pPlayer:Cities() do
		if pCity:IsHasBuilding(iSupportDummy) then
			local iNumBuilding = pCity:GetNumBuilding(iSupportDummy)
			if iNumBuilding > 10 then
				pCity:SetNumRealBuilding(iSupportDummy, 0)
			else
				pCity:SetNumRealBuilding(iSupportDummy, iNumBuilding + 1)
			end
		end
	end
end

GameEvents.CityCaptureComplete.Add(DummyIfTLCityCaptured)
GameEvents.PlayerDoTurn.Add(AddDummyEachTurn)

local Decisions_TimorLeste_Support = {}
	Decisions_TimorLeste_Support.Name = "TXT_KEY_DECISIONS_JWW_TIMORLESTE_SUPPORT"
	Decisions_TimorLeste_Support.Desc = "TXT_KEY_DECISIONS_JWW_TIMORLESTE_SUPPORT_DESC"
	HookDecisionCivilizationIcon(Decisions_TimorLeste_Support, "CIVILIZATION_JWW_TIMOR-LESTE")
	Decisions_TimorLeste_Support.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= iTimorLeste then return false, false end
		if load(pPlayer, "Decisions_TimorLeste_Support") == true then
			Decisions_TimorLeste_Support.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JWW_TIMORLESTE_SUPPORT_ENACTED_DESC")
			return false, false, true
		end
		
		local pTeam = Teams[pPlayer:GetTeam()]
		local iCost = math.ceil(700 * iMod)
		Decisions_TimorLeste_Support.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JWW_TIMORLESTE_SUPPORT_DESC", iCost)
		if pPlayer:GetJONSCulture() < iCost then return true, false end
		if pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if not pTeam:IsHasTech(iPenicilin) then return true, false end
		if pTeam:GetAtWarCount(false) == 0 then return true, false end
		return true, true
	end
	)
	
	Decisions_TimorLeste_Support.DoFunc = (
	function(pPlayer)
		local iNumTimes = 0
		local iCost = math.ceil(700 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeJONSCulture(-iCost)
		local pTeam = Teams[pPlayer:GetTeam()]
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pEnemyPlayer = Players[iPlayer]
			if pEnemyPlayer ~= pPlayer then
				for pCity in pEnemyPlayer:Cities() do
					if pCity:IsHasBuilding(iSupportDummy) then
						pPlayer:AcquireCity(pCity, false, false)
					end
				end
			end
		end
		for pCity in pPlayer:Cities() do
			if pCity:IsCapital() then
				repeat
					local pUnit = pPlayer:InitUnit(iFalintil, pCity:GetX(), pCity:GetY())
					pUnit:JumpToNearestValidPlot()
					iNumTimes = iNumTimes + 1
				until iNumTimes == 5
				save(pPlayer, "Decisions_TimorLeste_Support", true)
			end
		end
	end
	)
Decisions_AddCivilisationSpecific(iTimorLeste, "Decisions_TimorLeste_Support", Decisions_TimorLeste_Support)

--===========================================================================
-- Establish the Timor-Leste Petroleum Fund
--===========================================================================
function JWW_OffshorePlatformCheck(pPlayer)
	local iNumPlatforms = 0
	for pCity in pPlayer:Cities() do
		for i = 0, pCity:GetNumCityPlots()-1, 1 do
			local pPlot = pCity:GetCityIndexPlot(i)
			if pPlot:GetWorkingCity() == pCity then
				if pPlot:GetImprovementType() == iOffshorePlatform then
					iNumPlatforms = iNumPlatforms + 1
				end
			end
		end
	end
	if iNumPlatforms > 4 then
		return true
	else
		return false
	end
end

tOil = {}
for row in DB.Query("SELECT ID FROM Resources WHERE Type = 'RESOURCE_OIL'") do
	tOil[row.ID] = true
end

local Decisions_TimorLeste_Petroleum = {}
	Decisions_TimorLeste_Petroleum.Name = "TXT_KEY_DECISIONS_JWW_TIMORLESTE_PETROLEUM"
	Decisions_TimorLeste_Petroleum.Desc = "TXT_KEY_DECISIONS_JWW_TIMORLESTE_PETROLEUM_DESC"
	HookDecisionCivilizationIcon(Decisions_TimorLeste_Petroleum, "CIVILIZATION_JWW_TIMOR-LESTE")
	Decisions_TimorLeste_Petroleum.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= iTimorLeste then return false, false end
		if load(pPlayer, "Decisions_TimorLeste_Petroleum") == true then
			Decisions_TimorLeste_Petroleum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JWW_TIMORLESTE_PETROLEUM_ENACTED_DESC")
			return false, false, true
		end
		
		local pTeam = Teams[pPlayer:GetTeam()]
		local iCost = math.ceil(500 * iMod)
		Decisions_TimorLeste_Petroleum.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JWW_TIMORLESTE_PETROLEUM_DESC", iCost)
		if pPlayer:GetGold() < iCost then return true, false end
		if pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if not pTeam:IsHasTech(iRefrigeration) then return true, false end
		if not JWW_OffshorePlatformCheck(pPlayer) then return true, false end
		return true, true
	end
	)

	Decisions_TimorLeste_Petroleum.DoFunc = (
	function(pPlayer)
		local iNumUnits = 0
		local iCost = math.ceil(500 * iMod)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGold(-iCost)
		local iNumOil = 0
		for pCity in pPlayer:Cities() do
			 if pCity:IsCapital() then
				pCity:SetNumRealBuilding(iPetroleumDummy, 1)
				save(pPlayer, "Decisions_TimorLeste_Petroleum", true)
			end
		end
	end
	)
Decisions_AddCivilisationSpecific(iTimorLeste, "Decisions_TimorLeste_Petroleum", Decisions_TimorLeste_Petroleum)

function JWW_GiveDummyToAllCities(iPlayer)
	local pPlayer = Players[iPlayer]
	local pCapital = pPlayer:GetCapitalCity()
	if pPlayer:GetCivilizationType() == iTimorLeste and pCapital:IsHasBuilding(iPetroleumDummy) then
		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(iPetroleumDummy) then
				pCity:SetNumRealBuilding(iPetroleumDummy, 1)
				JWW_GoldPerOil(iPlayer)
			end
		end
	else
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iPetroleumDummy) then
				pCity:SetNumRealBuilding(iPetroleumDummy, 0)
			end
		end
	end
end

function JWW_GoldPerOil(iPlayer)
	local iGoldGiveth = 0
	local pPlayer = Players[iPlayer]
	if pPlayer:GetCivilizationType() == iTimorLeste then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iPetroleumDummy) then
				for i = 0, pCity:GetNumCityPlots()-1, 1 do
					local pPlot = pCity:GetCityIndexPlot(i)
					if pPlot:GetWorkingCity() == pCity then
						if tOil[pPlot:GetResourceType(pPlayer:GetTeam())] then
							iGoldGiveth = iGoldGiveth + 1
						end
					end
				end
			end
		end
		pPlayer:ChangeGold(iGoldGiveth * 5)
	end
end

GameEvents.PlayerDoTurn.Add(JWW_GiveDummyToAllCities)
GameEvents.PlayerDoTurn.Add(JWW_GoldPerOil)