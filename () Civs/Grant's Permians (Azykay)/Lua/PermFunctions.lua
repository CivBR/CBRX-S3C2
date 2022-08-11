--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetDistance	= Map.GetDistance
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
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
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
----------------------------------------------------------------------------------------------------------------------------
-- GT_GetUserSetting
function GT_GetUserSetting(type)
	for row in GameInfo.GT_Perm_UserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
------------------------------------------------------------------------------------------------------------------------
-- GT_Print
local printForDebugPerm = GT_GetUserSetting("GT_PERM_DEBUGGING_ON") == 1
function GT_Print(string)
	if (not printForDebugPerm) then
		return
	else
		return print(string)
	end
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function GetNearestCity(player, plot)
    local distance = 9999
    for city in player:Cities() do
        local cityPlot = city:Plot()
        local between = Map.PlotDistance(cityPlot:GetX(), cityPlot:GetY(), plot:GetX(), plot:GetY())
        if between < distance then
            distance = between
            closest = city
        end
    end
    return closest
end
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID		= GameInfoTypes["CIVILIZATION_GT_PERM"]
local traitPermID			= GameInfoTypes["TRAIT_GT_PERM"]
local unitBatyrID			= GameInfoTypes["UNIT_GT_BATYR"]
local unitKrezhMagiID		= GameInfoTypes["UNIT_GT_KREZH_MAGI"]
local IsPermActivePlayer 	= activePlayer:GetCivilizationType() == civilizationID
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-----------------------------
-- CONFLUENCE OF THE IDOLS --
-----------------------------
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
local unitProphetID = GameInfoTypes["UNIT_PROPHET"]
local unitInquisitorID = GameInfoTypes["UNIT_INQUISITOR"]

function GT_ConfluenceOfTheIdols_SerialEventUnitCreated(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState)
	local player = Players[playerID]
	if not HasTrait(player, traitPermID) then return end
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	if not (unit:GetUnitType() == unitMissionaryID or unit:GetUnitType() == unitProphetID or unit:GetUnitType() == unitInquisitorID) then return end
	GT_Print("GT_ConfluenceOfTheIdols_SerialEventUnitCreated: unit is religious")
	local plot = unit:GetPlot()
	local owner = Players[unit:GetOriginalOwner()]
	if owner and owner ~= player then
		GT_Print("GT_ConfluenceOfTheIdols_SerialEventUnitCreated: owner is not player")
		local ownerTeam = Teams[owner:GetTeam()]
		local playerTeam = Teams[player:GetTeam()]
		if ownerTeam:IsAtWar(playerTeam) then
			GT_Print("GT_ConfluenceOfTheIdols_SerialEventUnitCreated: owner and player at at war")
			local nearestCity = GetNearestCity(owner, plot)
			local numTurns = ownerTeam:GetNumTurnsLockedIntoWar(playerTeam)
			nearestCity:ChangeResistanceTurns(numTurns)
			GT_Print("GT_ConfluenceOfTheIdols_SerialEventUnitCreated: resistance set")
			local capital = player:GetCapitalCity()
			if capital then
				capital:SetNumRealBuilding(buildingPermID, (1+ capital:GetNumRealBuilding(buildingPermID)))
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(GT_ConfluenceOfTheIdols_SerialEventUnitCreated)

function GT_ConfluenceOfTheIdols_UnitPreKill(playerID, unitID, unitTypeID, unitX, unitY, isDelay, killerID)
	if isDelay then return end
	GT_Print("GT_ConfluenceOfTheIdols_UnitPreKill: not isDelay")
	local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	local team = Teams[player:GetTeam()]
	local killer = Players[killerID]
	if not killer ~= player then return end
	local killerTeam = Teams[killer:GetTeam()]
	if team:IsAtWar(killerTeam) then
	GT_Print("GT_ConfluenceOfTheIdols_UnitPreKill: killer Team at war with killed Team")
		if unit:IsTrade() then
			for ID = 0,(plot:GetNumUnits() - 1) do
				GT_Print("GT_ConfluenceOfTheIdols_UnitPreKill: checking for unit on plot")
				local plotUnit = plot:GetUnit(ID)
				if plotUnit and plotUnit:IsCombatUnit() then
					if Players[plotUnit:GetOwner()] == killer then
						GT_Print("GT_ConfluenceOfTheIdols_UnitPreKill: trade unit pillaged")
						local nearestCity = GetNearestCity(player, plot)
						local numTurns = team:GetNumTurnsLockedIntoWar(killerTeam)
						nearestCity:ChangeResistanceTurns(numTurns)
						GT_Print("GT_ConfluenceOfTheIdols_UnitPreKill: resistance set")
					end
				end
			end
		end
	end
end
GameEvents.UnitPreKill.Add(GT_ConfluenceOfTheIdols_UnitPreKill)

local unitGeneralID = GameInfoTypes["UNIT_GREAT_GENERAL"]
local featureForestID = GameInfoTypes["FEATURE_FOREST"]
local terrainTundraID = GameInfoTypes["TERRAIN_TUNDRA"]
local unitWarriorID = GameInfoTypes["UNIT_WARRIOR"]
local unitHorsemanID = GameInfoTypes["UNIT_HORSEMAN"]
local unitKnightID = GameInfoTypes["UNIT_KNIGHT"]
local unitGWIID = GameInfoTypes["UNIT_GREAT_WAR_INFANTRY"]
local eraMedieval = GameInfoTypes["ERA_MEDIEVAL"]
local eraIndustrial = GameInfoTypes["ERA_INDUSTRIAL"]
local eraAtomic = GameInfoTypes["ERA_POSTMODERN"]
function GT_ConfluenceOfTheIdols_UnitSetXY(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	if not HasTrait(player, traitPermID) then return end
	local unit = player:GetUnitByID(unitID)
	local InitUnit = nil
	if unit:GetUnitType() == unitGeneralID then
		GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: unit is Great General")
		local era = player:GetCurrentEra()
		local plot = unit:GetPlot()
		if not (plot:GetFeatureType() == featureForestID or plot:GetTerrainType() == terrainTundraID) then return end
		GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: unit is in Tundra or Forest")
		local ownerID = plot:GetOwner()
		local owner = Players[ownerID]
		if owner and owner ~= player then
			GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: unit is in enemy territory")
			local ownerTeam = Teams[owner:GetTeam()]
			local playerTeam = Teams[player:GetTeam()]
			if ownerTeam:IsAtWar(playerTeam) then
				GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: unit is in hostile territory")
				for adjacentPlot in PlotAreaSweepIterator(plot, 4, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: iterating plots")
					local numTurns = ownerTeam:GetNumTurnsLockedIntoWar(playerTeam)
					local nearestCity = GetNearestCity(owner, plot)
					local resistance = nearestCity:GetResistanceTurns()
					local unhappiness = owner:GetUnhappiness()
					if JFD_GetRandom(1, 100) > (90 - (numTurns + resistance + unhappiness)) then
						GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: calculating spawn chance")
						if era < eraMedieval then
							InitUnit = player:InitUnit(unitWarriorID, adjacentPlot:GetX(), adjacentPlot:GetY())
							InitUnit:JumpToNearestValidPlot()
						elseif era > eraMedieval and era < eraIndustrial then
							InitUnit = player:InitUnit(unitHorsemanID, adjacentPlot:GetX(), adjacentPlot:GetY())
							InitUnit:JumpToNearestValidPlot()
						elseif era > eraIndustrial and era < eraAtomic then
							InitUnit = player:InitUnit(unitKnightID, adjacentPlot:GetX(), adjacentPlot:GetY())
							InitUnit:JumpToNearestValidPlot()
						elseif era >= eraAtomic then
							InitUnit = player:InitUnit(unitGWIID, adjacentPlot:GetX(), adjacentPlot:GetY())
							InitUnit:JumpToNearestValidPlot()
						end
						GT_Print("GT_ConfluenceOfTheIdols_UnitSetXY: units spawned")
					end
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(GT_ConfluenceOfTheIdols_UnitSetXY)

local pillageMissionID = GameInfoTypes["MISSION_PILLAGE"]
local improvementTradingPostID = GameInfoTypes["IMPROVEMENT_TRADING_POST"]

function IsButtonPossible(unit)
	if unit:IsCombatUnit() then
		local plot = unit:GetPlot()
		local plotOwner = -1
		local unitOwner = Players[unit:GetOwner()]
		if plot:IsOwned() then
			plotOwner = Players[plot:GetOwner()]
		end
		if unitOwner ~= plotOwner then
			if plot:GetImprovementType() > -1 and not plot:IsImprovementPillaged() then
				if plot:GetImprovementType() == improvementTradingPostID then
					if plot:IsOwned() then
						local unitTeam = Teams[unitOwner:GetTeam()]
						local iOtherTeam = plotOwner:GetTeam()
						if unitTeam:IsAtWar(iOtherTeam) then
							return true
						end
					else
						return true
					end
				end
			end
		end
	end
	return false
end

function Perm_DoButtonEffect(player, unit)
	local plot = unit:GetPlot()
	plot:SetImprovementPillaged(true)
	unit:ChangeMoves(-120)
	if unit:MovesLeft() < 0 then unit:SetMoves(0) end
	unit:ChangeDamage(-25)
	player:ChangeGold(20)
	if player:IsHuman() then
		local iX = unit:GetX()
		local iY = unit:GetY()
		local sMessage = "[COLOR_YIELD_GOLD]+20 [ICON_GOLD][ENDCOLOR]"
		Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), sMessage, 0)
	end
	local ownerID = plot:GetOwner()
	local owner = Players[ownerID]
	if owner then
		local ownerTeam = Teams[owner:GetTeam()]
		local playerTeam = Teams[player:GetTeam()]
		local numTurns = ownerTeam:GetNumTurnsLockedIntoWar(playerTeam)
		local nearestCity = GetNearestCity(owner, plot)
		nearestCity:ChangeResistanceTurns(numTurns)
	end
end

function Perm_UnitActionButton()
	local unit = UI.GetHeadSelectedUnit();
	Perm_DoButtonEffect(activePlayer, unit)
end

function Perm_SerialEventUnitInfoDirty()
	local unit = UI.GetHeadSelectedUnit();
	if (not unit) then return end
	if IsButtonPossible(unit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = unit:IsFound();
				
	local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
	local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
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

local function Perm_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_GT_PERM_PILLAGE_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

function Perm_CheckIfCanPillage(playerID, unitID, missionID)
	-- thanks to chrisy for reminding me that CanStartMission exists
	if missionID == pillageMissionID then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		if unit:IsCombatUnit() then
			return false
		end
	end
	return true
end

function Perm_AI_Pillage(playerID)
	local player = Players[playerID]
	if (player:GetCivilizationType() == civilizationID) then
		if not player:IsHuman() then
			for unit in player:Units() do
				if IsButtonPossible(unit) then
					local iRandomSeed = JFD_GetRandom(1, 3)
					local iCheckAgainst = 3

					local plot = unit:GetPlot()
					if plot:GetResourceType() > -1 then
						iCheckAgainst = iCheckAgainst - 1
					end
					if unit:GetDamage() >= 50 then
						iCheckAgainst = iCheckAgainst - 1
					end

					if iRandomSeed >= iCheckAgainst then
						Perm_DoButtonEffect(player, unit)
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Perm_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Perm_SerialEventUnitInfoDirty);
end

if IsPermActivePlayer then
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Perm_UnitActionButton);
	IconHookup(37, 45, "UNIT_ACTION_ATLAS", Controls.UnitActionIcon)
	GameEvents.CanStartMission.Add(Perm_CheckIfCanPillage)
	GameEvents.PlayerDoTurn.Add(Perm_AI_Pillage)
	Initialize();
end
-----------
-- BATYR --
-----------
local promotionDoubleAttack = GameInfoTypes["PROMOTION_SECOND_ATTACK"]
local promotionCapturedReligiousID = GameInfoTypes["PROMOTION_GT_CAPTURED_RELIGIOUS"]
function GT_Batyr_PromotionDoubleAttack_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if not HasTrait(player, traitPermID) then return end
	for unit in player:Units() do
		GT_Print("GT_Batyr_PromotionDoubleAttack_PlayerDoTurn: iterating units")
		if unit:IsHasPromotion(promotionCapturedReligiousID) then
			unit:SetHasPromotion(promotionCapturedReligiousID, false)
			unit:SetHasPromotion(promotionDoubleAttack, true)
		elseif unit:IsHasPromotion(promotionDoubleAttack) then
			unit:SetHasPromotion(promotionDoubleAttack, false)
			GT_Print("GT_Batyr_PromotionDoubleAttack_PlayerDoTurn: setting promotions")	
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Batyr_PromotionDoubleAttack_PlayerDoTurn)

function GT_Batyr_ReligiousUnitCaptured(playerID, unitID, hexVec, unitType, cultureType, civID, primaryColor, secondaryColor, unitFlagIndex, fogState)
	local player = Players[playerID]
	if not HasTrait(player, traitPermID) then return end
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	if not (unit:GetUnitType() == unitMissionaryID or unit:GetUnitType() == unitProphetID or unit:GetUnitType() == unitInquisitorID) then return end
	GT_Print("GT_Batyr_ReligiousUnitCaptured: captured unit is religious")
	local plot = unit:GetPlot()
	for ID = 0,(plot:GetNumUnits() - 1) do
		GT_Print("GT_Batyr_ReligiousUnitCaptured: checking for capturing unit")
		local plotUnit = plot:GetUnit(ID)
		if plotUnit and plotUnit:GetUnitType() == unitBatyrID then
			plotUnit:SetHasPromotion(promotionCapturedReligiousID, true)
			GT_Print("GT_Batyr_ReligiousUnitCaptured: setting promotion")
			local capital = player:GetCapitalCity()
			if capital then
				capital:SetNumRealBuilding(buildingPermID, (1+ capital:GetNumRealBuilding(buildingPermID)))
			end
		end
	end
end
Events.SerialEventUnitCreated.Add(GT_Batyr_ReligiousUnitCaptured)

local promotionBatyrID = GameInfoTypes["PROMOTION_GT_BATYR"]
function GT_Batyr_UnitKilledInCombat(killerPlayerID, iKilledPlayer, unitTypeID, bDelay)
	local killedPlayer = Players[iKilledPlayer]
	local killerPlayer = Players[killerPlayerID]
	if bDelay == false then 
		GT_Print("GT_Batyr_UnitKilledInCombat: bDelay is false")
		if unitTypeID == unitBatyrID then
			local unit = unitTypeID:GetID()
			if killerPlayer ~= killedPlayer then
				GT_Print("GT_Batyr_UnitKilledInCombat: killer Player is not the same as the killed player")
				if HasTrait(killedPlayer, traitPermID) then
					if killedPlayer:IsGoldenAge() then
						GT_Print("GT_Batyr_UnitKilledInCombat: is Golden Age")
						local capital = killedPlayer:GetCapital()
						if capital then
							local newUnit = killedPlayer:InitUnit(unitSettlerID, capital:GetX(), capital:GetY())
							newUnit:SetHasPromotion(promotionBatyrID, true)
							newUnit:SetName("Daughters of" .. unit:GetName() .. "")
							GT_Print("GT_Batyr_UnitKilledInCombat: name set")
						end
					end
				end
			end
		end
	else
		if killedPlayer == killerPlayer then
			if unitTypeID == unitSettlerID then
				local unit = unitTypeID:GetID()			
				local name = unit:GetName()
				local plot = unit:GetPlot()
				local city = plot:GetPlotCity()
				city:SetName(name)
				GT_Print("GT_Batyr_UnitKilledInCombat: city name set")
			end
		end
	end			
end
GameEvents.UnitKilledInCombat.Add(GT_Batyr_UnitKilledInCombat)
----------------
-- KREZH MAGI --
----------------
local improvementHolySite = GameInfoTypes["IMPROVEMENT_HOLY_SITE"]
function GT_Krezh_GreatPersonExpended(playerID, unitID)
	local player = Players[playerID]
	if (not unitTypeID) then unitTypeID = unitID end
	if not HasTrait(player, traitPermID) then return end
	if not unitTypeID == unitKrezhMagiID then return end
	GT_Print("GT_Krezh_GreatPersonExpended: Krezh expended")
	local unit = player:GetUnitByID(unitTypeID)
	local plot = unit:GetPlot()
	for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		GT_Print("GT_Krezh_GreatPersonExpended: sweeping plots")
		if adjacentPlot and adjacentPlot:IsCity() then
			local city = adjacentPlot:GetPlotCity()
			if city and city:GetOwner() == playerID then
				GT_Print("GT_Krezh_GreatPersonExpended: Krezh expended for a great work of music")
				local happiness = city:GetLocalHappiness()
				local growthRate = city:GetFoodTurnsLeft()
				player:ChangeCombatExperience(g_MathCeil((happiness * 5)/growthRate))
				GT_Print("GT_Krezh_GreatPersonExpended: combat experience changed")
				if plot:GetImprovementType() == improvementHolySite then
					GT_Print("GT_Krezh_GreatPersonExpended: adjacent plot is Holy Site")
					player:ChangeGoldenAgeProgressMeter(g_MathCeil((happiness * 25)/growthRate))
					GT_Print("GT_Krezh_GreatPersonExpended: GAP changed")
				end
			end
		end
	end
end
GameEvents.GreatPersonExpended.Add(GT_Krezh_GreatPersonExpended)		
-----------------------------
-- ADDITIONAL ACHIEVEMENTS --
-----------------------------		
local buildingPermID = GameInfoTypes["BUILDING_GT_PERM"]
function GT_Perm_AdditionalAchievement_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if HasTrait(player, traitPermID) then
		if playerID ~= activePlayerID then return end
		if (not isAAActive) then return end
		if IsAAUnlocked('AA_GT_PERM_SPECIAL') then return end
		local capital = player:GetCapitalCity()
		if capital and capital:GetNumRealBuilding(buildingPermID) >= 10 then
			UnlockAA('AA_GT_PERM_SPECIAL')
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Perm_AdditionalAchievement_PlayerDoTurn)
--==========================================================================================================================
--==========================================================================================================================