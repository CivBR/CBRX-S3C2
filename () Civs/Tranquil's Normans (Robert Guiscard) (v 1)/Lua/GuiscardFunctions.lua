--------------------------------------------------------------
-- Included Files
--------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local Teams 					= Teams
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local activeTeamID				= activePlayer:GetTeam()
local activeTeam				= Teams[activeTeamID]
--====================================================
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsUsingMod
local CBPmodID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"

function Game_IsUsingMod(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
end

local isUsingCBP  = Game_IsUsingMod(CBPmodID)
--------------------------------------------------------------
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--------------------------------------------------------------
function HasTrait(player, traitID)
	if isUsingCBP then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
--IsTraitActive
local slotComputerID = SlotStatus["SS_COMPUTER"]
local slotTakenID = SlotStatus["SS_TAKEN"]
function IsTraitActive(traitID)
	for slotID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotPlayer = Players[slotID]
		local slotStatus = PreGame.GetSlotStatus(slotID)
		if (slotStatus == slotTakenID or slotStatus == slotComputerID) then
			if HasTrait(slotPlayer, traitID) then
				return true
			end
		end
	end
	return false
end
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes.BUILDING_TRANQ_NORMANS
local defineMaxMajorCivs = GameDefines.MAX_MAJOR_CIVS

local traitGuiscardID = GameInfoTypes.TRAIT_TRANQ_NORMANS
local g_IsTraitActive = IsTraitActive(traitGuiscardID)
local resourceHorseID = GameInfoTypes.RESOURCE_HORSE
local buildingNormansHorseID = GameInfoTypes.BUILDING_TRANQ_NORMANS_HORSE
local buildingNormansGGPointID = GameInfoTypes.BUILDING_TRANQ_NORMANS_GG_POINT

local unitclassKnightID = UNITCLASS_KNIGHT
local unitEquitesID = UNIT_TRANQ_EQUITES
local promotionEquitesContinentID = GameInfoTypes.PROMOTION_TRANQ_EQUITES_CONTINENT
local iCourthouse = GameInfoTypes["BUILDING_COURTHOUSE"]
local iCitadel = GameInfoTypes["IMPROVEMENT_CITADEL"]
local iUUConqueror = GameInfoTypes["UNIT_TRANQ_CONQUEROR"]
local iUUClass = GameInfo.UnitClasses[GameInfo.Units[iUUConqueror].Class].ID

local missionTSConqueror = GameInfoTypes["MISSION_TS_CONQUEROR"]
local CUSTOM_MISSION_NO_ACTION		 	= 0
local CUSTOM_MISSION_ACTION			 	= 1
local CUSTOM_MISSION_DONE            	= 2
local CUSTOM_MISSION_ACTION_AND_DONE 	= 3
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnCityCaptureComplete
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnCityCaptureComplete(oldPlayerID, _, plotX, plotY, newPlayerID, _, isConquest)
	local oldPlayer = Players[oldPlayerID]
	local newPlayer = Players[newPlayerID]
	if not newPlayer:IsAlive() then return end
	if newPlayer:IsMinor() or newPlayer:IsBarbarian() then return end
	-- UA
	if HasTrait(newPlayer, traitGuiscardID) then
		local capital = player:GetCapitalCity()
		local capitalPlot = capital:GetPlot()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		local cityPlot = Map.GetPlot(plotX.plotY)
		local isFirstCityOnContinent = true
		for loopCity in player:Cities() do
			local loopCityPlot = loopCity:GetPlot()
			if loopCityPlot:GetContinentArtType() == cityPlot:GetContinentArtType() then
				isFirstCityOnContinent = false
			end
		end
		if isFirstCityOnContinent and cityPlot:GetContinentArtType() ~= capitalPlot:GetContinentArtType() then
			local numBonusHorse = capital:GetNumRealBuilding(buildingNormansHorseID)
			capital:SetNumRealBuilding(buildingNormansHorseID, numBonusHorse + 1)
			print(capital:GetName() .. ", the Norman Capital, now has " .. numBonusHorse .. " Horse dummies.")
			if isConquest then
				local distance = Map.PlotDistance(plotX, plotY, capitalX, capitalY)
				local numBonus = math.floor(distance * 2.5)
				player:ChangeFaith(numBonus)
				player:ChangeGold(numBonus)
				print("Earned " .. numBonus .. "Faith and Gold from the city capture.")
			end
		end
	end
end

if g_IsTraitActive then GameEvents.CityCaptureComplete.Add(Tranq_NormansGuiscard_OnCityCaptureComplete) end
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnCityTrained
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnCityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinor() or player:IsBarbarian() then return end
	-- EQUITES
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() == unitEquitesID then
		local numBonus = math.floor(player:GetNumResourceAvailable(resourceHorseID, true) / 2)
		local baseCombatStrength = GameInfo.Units[unitEquitesID].Combat
		unit:SetBaseCombatStrength(baseCombatStrength + numBonus)
	end
end

if g_IsTraitActive then GameEvents.CityTrained.Add(Tranq_NormansGuiscard_OnCityTrained) end
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnPlayerCityFounded
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnPlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	local plot = Map.GetPlot(plotX, plotY)
	local plotCity = plot:GetCity()
	if not player:IsAlive() then return end
	if player:IsMinor() or player:IsBarbarian() then return end
	if plotCity:IsCapital() then return end
	-- UA
	if HasTrait(newPlayer, traitGuiscardID) then
		local capital = player:GetCapitalCity()
		local capitalPlot = capital:GetPlot()
		local capitalX = capital:GetX()
		local capitalY = capital:GetY()
		local isFirstCityOnContinent = true
		for loopCity in player:Cities() do
			local loopCityPlot = loopCity:GetPlot()
			if loopCityPlot:GetContinentArtType() == cityPlot:GetContinentArtType() then
				isFirstCityOnContinent = false
			end
		end
		if isFirstCityOnContinent and plot:GetContinentArtType() ~= capitalPlot:GetContinentArtType() then
			local numBonusHorse = capital:GetNumRealBuilding(buildingNormansHorseID)
			capital:SetNumRealBuilding(buildingNormansHorseID, numBonusHorse + 1)
			print(capital:GetName() .. ", the Norman Capital, now has " .. numBonusHorse .. " Horse dummies.")
		end
	end
end

if g_IsTraitActive then GameEvents.PlayerCityFounded.Add(Tranq_NormansGuiscard_OnPlayerCityFounded) end
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnPlayerDoTurn
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnPlayerDoTurn(playerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	if player:IsMinor() or player:IsBarbarian() then return end
	-- UA
	if HasTrait(player, traitGuiscardID) then
		local capital = player:GetCapitalCity()
		local numBonus = player:GetNumResourceAvailable(resourceHorseID, true)
		capital:SetNumRealBuilding(buildingNormansGGPointID, numBonus)
	end
	-- EQUITES
	if player:HasUnitOfClassType(unitclassKnightID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitEquitesID then
				local hasPromotion = false
				local capital = player:GetCapitalCity()
				local capitalPlot = capital:GetPlot()
				local unitPlot = unit:GetPlot()
				if unitPlot:GetContinentArtType() ~= capitalPlot:GetContinentArtType() then
					hasPromotion = true
				end
				unit:SetHasPromotion(promotionEquitesContinentID, hasPromotion)
			end
		end
	end
end

if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Tranq_NormansGuiscard_OnPlayerDoTurn) end
--------------------------------------------------------------
-- Tranq_NormansGuiscard_OnUnitPrekill
--------------------------------------------------------------
function Tranq_NormansGuiscard_OnUnitPrekill(playerID, unitID, unitTypeID, plotX, plotY, isDelay, killerID)
	local player = Players[playerID]
	if not player:IsAlive() then return end
	local unitID = player:GetUnitByID(unitID)
	local unitXP = unit:GetExperience()
	local plot = Map.GetPlot(plotX, plotY)
	-- Conqueror
	if plot:IsWater() and unit:GetDomainType() ~= domainSeaID then
		for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			local plotUnit = loopPlot:GetUnit()
			if plotUnit:GetUnitType() == unitVungTauFerryID then
				respawnedUnit = player:InitUnit(unitTypeID, loopPlot:GetX(), loopPlot:GetY())
				respawnedUnit:JumpToNearestValidPlot()
				respawnedUnit:ChangeExperience(killedUnitExperience)
				break
			end
		end
	end				
end

if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Tranq_NormansGuiscard_OnUnitPrekill) end
--------------------------------------------------------------
--=== Unit Action Code
function Jar_CanPerformAction(unit) -- checks if a unit is on a valid plot
	local pBool = false;
	local pPlot = unit:GetPlot();
	if unit:MovesLeft() <= 1 then return pBool end
	if unit:GetOwner() ~= pPlot:GetOwner() then return pBool end
	if pPlot ~= nil then
		local pCity = pPlot:GetWorkingCity()
		local iPlayer = pCity:GetOwner()
		local pPlayer = Players[iPlayer]
		if pCity then
			local pCityPlot = pCity:Plot()
			if pCityPlot:GetImprovementType() == iCitadel and pCity:IsHasBuilding(iCourthouse) then return pBool end
			if pPlot:IsCity() then
				pBool = true
			else
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(unit:GetX(), unit:GetY(), direction)
					if pAdjacentPlot and pAdjacentPlot:IsCity() then
						pBool = true
						break
					end
				end
			end
		end
	end
	return pBool
end

function Jar_PerformTSConquerorMission(hPlayer, hUnit)
	local hUnitPlot = hUnit:GetPlot();
	local hCity = hUnitPlot:GetWorkingCity()
    local hCityPlot = hCity:Plot()
	
	hCityPlot:SetImprovementType(iCitadel)
	if not hCity:IsHasBuilding(iCourthouse) then
		hCity:SetNumRealBuilding(iCourthouse, 1)
	end	
	hUnit:Kill()
end

function Jar_AIDoPerformAction(playerID)
	local aPlayer = Players[playerID]
	local aTeam = Teams[aPlayer:GetTeam()]
	if aPlayer:IsHuman() then return end
	if aPlayer:GetUnitClassCount(iUUClass) == 0 then return end
	local aCapital = aPlayer:GetCapitalCity();
	if aCapital == nil then return end
	for aUnit in aPlayer:Units() do
		if aUnit:GetUnitType() == iUUConqueror then
			local aUnitPlot = aUnit:GetPlot();
			if Jar_CanPerformAction(aUnit) and GetRandom(1, 10) <= 2 then
				tEligibleCities1 = {}
				tEligibleCities2 = {}
				for pCity in pPlayer:Cities() do
					local pCityPlot = pCity:Plot()
					if pCityPlot:GetImprovementType() ~= iCitadel or not pCity:IsHasBuilding(iCourthouse) then
						if pCity:GetOriginalOwner() == playerID then
							table.insert(tEligibleCities1, pCity)	-- founded cities
						else
							table.insert(tEligibleCities2, pCity)	-- conquered cities
						end
					end
				end
				local chosencity
				if #tEligibleCities2>0 then
					chosencity = tEligibleCities2[1]
					if #tEligibleCities2>1 then
						local rand = math.random(#tEligibleCities2);
						chosencity = tEligibleCities2[rand];					
					end
				else
					if #tEligibleCities1>0 then
						chosencity = tEligibleCities1[1]
						if #tEligibleCities1>1 then
							local rand = math.random(#tEligibleCities1);
							chosencity = tEligibleCities1[rand];
						end
					end
				end
				chosencity:Plot():SetImprovementType(iCitadel)
				if not chosencity:IsHasBuilding(iCourthouse) then
					chosencity:SetNumRealBuilding(iCourthouse, 1)
				end	
				aUnit:Kill()
			end
		end
	end
end
if g_IsTraitActive then GameEvents.PlayerDoTurn.Add(Jar_AIDoPerformAction) end
--==========================================================================================================================
-- UI FUNCTIONS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- UNIT PANEL
-------------------------------------------------------------------------------------------------------------------------
local EUI = (MapModData and MapModData.UI_bc1)

if (not isUsingCBP) then
--Jar_TSConqueror_UI_UnitActionButton
function Jar_TSConqueror_UI_UnitActionButton()
	local unit = UI.GetHeadSelectedUnit();
	Jar_PerformTSConquerorMission(activePlayer, unit)
end

--Jar_TSConqueror_UI_SerialEventUnitInfoDirty
function Jar_TSConqueror_UI_SerialEventUnitInfoDirty()
	if activePlayer:GetUnitClassCount(iUUClass) == 0 then return end
	
	local unit = UI.GetHeadSelectedUnit();
	if (not unit) then return end
	if unit:GetUnitType() == iUUConqueror then
		local bcheck = not Jar_CanPerformAction(unit)
		Controls.UnitActionButton:SetHide(bcheck) -- if not allowed -> hide true; if allowed -> hide false
	end
	
	local buildCityButtonActive = unit:IsFound();				
	
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack") 
	primaryStack:CalculateSize();
	primaryStack:ReprocessAnchoring();
    
	local stackSize = primaryStack:GetSize();
	local stretchySize = primaryStretchy:GetSize();
	local buildCityButtonSize = 0
	if buildCityButtonActive then
		if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
			buildCityButtonSize = 36;
		else
			buildCityButtonSize = 60;
		end
	end
	primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
end

--Jar_TSConqueror_UI_UpdateUnitInfoPanel
local function Jar_TSConqueror_UI_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("TS_ConquerorAction_64.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("TS_ConquerorAction_45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_TS_CONQUEROR_DOMTM")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

local function Initialize()	
	Events.LoadScreenClose.Add(Jar_TSConqueror_UI_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Jar_TSConqueror_UI_SerialEventUnitInfoDirty);
end
IconHookup(0, 45, "TS_CONQUEROR_ACTION_ATLAS", Controls.UnitActionIcon)	
Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Jar_TSConqueror_UI_UnitActionButton);
Initialize();


if EUI then
--==========================================================================================================================
-- ENHANCED USER INTERFACE COMPATIBILITY
--==========================================================================================================================
IconHookup(0, 45, "TS_CONQUEROR_ACTION_ATLAS", Controls.TomButtonImage)
Controls.TomButtonBackground:SetHide(true)
local pSelUnit
function Jar_TSConquerorhSelection(playerID, unitID, x, y, a5, bool)
	if bool then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID);
		if pUnit:GetUnitType() == iUUConqueror then
			ContextPtr:SetHide(false)
			Controls.TomButtonBackground:SetHide(false)
			pSelUnit = pUnit;
			Controls.TomButton:SetDisabled(false)
			Controls.TomButton:RegisterCallback(Mouse.eLClick, Jar_DoPerformAction)	
			Controls.TomButton:LocalizeAndSetToolTip("TXT_KEY_TS_CONQUEROR_DOMTM")
		end
	else
		Controls.TomButtonBackground:SetHide(true)
		pSelUnit = nil;
	end
end
Events.UnitSelectionChanged.Add(Jar_TSConquerorhSelection)

function Jar_DoPerformAction(playerID, unitID)
	local hPlayer = Players[playerID]
	local hTeam = hPlayer:GetTeam()
	local hUnit = pSelUnit;
	local hUnitPlot = hUnit:GetPlot();
	if Jar_CanPerformAction(hUnit) then
		Jar_PerformTSConquerorMission(hPlayer, hUnit)
	else
		local iX = hUnit:GetX()
		local iY = hUnit:GetY()
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "[COLOR_WARNING_TEXT]" .. Locale.ConvertTextKey("TXT_KEY_MISSION_TS_CONQUEROR_DOMTM_DISABLED") .. "[ENDCOLOR]", 0)
	end
end

end

else
--==========================================================================================================================
-- CBP MISSION EVENTS COMPATIBILITY
--==========================================================================================================================
-- Jar_TSConqueror_CustomMissionStart
local function Jar_TSConqueror_CustomMissionStart(playerID, unitID, missionID, data1, data2, flags, turn)
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local plot = unit:GetPlot()
	if missionID == missionTSConqueror then
		Jar_PerformTSConquerorMission(player, unit)
		return CUSTOM_MISSION_ACTION
	end
	return CUSTOM_MISSION_NO_ACTION
end

-- Jar_TSConqueror_CustomMissionCompleted
local function Jar_TSConqueror_CustomMissionCompleted(playerID, unitID, missionID, data1, data2, flags, turn)
	return (missionID == missionTSConqueror)
end

-- Jar_TSConqueror_CustomMissionPossible
local function Jar_TSConqueror_CustomMissionPossible(playerID, unitID, missionID, data1, data2, _, _, plotX, plotY, bTestVisible)
	if ((not playerID) or (not unitID) or (not missionID)) then return end
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	
	if activePlayer:GetUnitClassCount(iUUClass) == 0 then
		return false
	elseif missionID == missionTSConqueror then
		if unit:GetUnitType() == iUUConqueror then
			return Jar_CanPerformAction(unit)
		end
	end	
	return false
end

GameEvents.CustomMissionStart.Add(Jar_TSConqueror_CustomMissionStart)
GameEvents.CustomMissionCompleted.Add(Jar_TSConqueror_CustomMissionCompleted)
GameEvents.CustomMissionPossible.Add(Jar_TSConqueror_CustomMissionPossible)
end
----------------------------------------------------------------------------------------
print("GuiscardFunctions.lua loaded successfully!")
--==========================================================================================================================
--==========================================================================================================================