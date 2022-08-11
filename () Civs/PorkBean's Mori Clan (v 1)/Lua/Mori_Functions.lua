--========================================================================================================================
-- PorkBean's Mori Clan
--========================================================================================================================
--print("mori lua loaded!");

include("PlotIterators")
include("FLuaVector.lua")
include("IconSupport.lua")
include("InstanceManager.lua")
include("C15_IteratorPack_v3.lua")

local iMoriCiv = GameInfoTypes.CIVILIZATION_PB_MORI;
local iMurakamiUnitPromotion = GameInfoTypes.PROMOTION_PB_MURAKAMI_BASE;
local iHagiyaki = GameInfoTypes.BUILDING_PB_HAGIYAKI;
local iHagiyakiDummy = GameInfoTypes.BUILDING_PB_MORI_CULTURE_DUMMY;

------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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

local isMoriCivActive = JFD_IsCivilisationActive(iMoriCiv);

------------------------------------------------------------------------------------------------------------------------
-- GetPlayerByCivilization
------------------------------------------------------------------------------------------------------------------------
function GetPlayerByCivilization(civilizationType)
	for _, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == civilizationType then 
			return pPlayer
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

--------------------------------------------------------------------------------------------------------------------------
-- HasTradeRoute
--------------------------------------------------------------------------------------------------------------------------
function HasTradeRoute(pPlot, pPlayer)
	return (#pPlayer:GetInternationalTradeRoutePlotToolTip(pPlot) > 0)
end

function CountInternationalTradeRoutesIn(playerID, city)
	local player = Players[playerID]
	local tradeRoutes = player:GetTradeRoutesToYou()
	local tradeRoutesIn = 0
	for _, tradeRoute in ipairs(tradeRoutes) do
		if tradeRoute.ToCity == city then
			if tradeRoute.FromID ~= tradeRoute.ToID then
				tradeRoutesIn = tradeRoutesIn+1
			end
		end
	end
	return tradeRoutesIn
end

--========================================================================================================================
-- UNIQUE UNIT: Murakami Kobaya
--========================================================================================================================
local MKPromotion = {
    [1] = GameInfoTypes.PROMOTION_PB_MURAKAMI_1,
    [2] = GameInfoTypes.PROMOTION_PB_MURAKAMI_2,
    [3] = GameInfoTypes.PROMOTION_PB_MURAKAMI_3,
    [4] = GameInfoTypes.PROMOTION_PB_MURAKAMI_4,
    [5] = GameInfoTypes.PROMOTION_PB_MURAKAMI_5,
    [6] = GameInfoTypes.PROMOTION_PB_MURAKAMI_6
}

--------------------------------------------------------------------------------------------------------------------------
-- MurakamiFunctions
--------------------------------------------------------------------------------------------------------------------------
function MurakamiFunctions(playerID)
	local pPlayer = Players[playerID]
	if (not pPlayer:IsAlive()) then return end
	local unit = pPlayer:GetUnitByID(unitID)
	for unit in pPlayer:Units() do
		if unit:IsHasPromotion(iMurakamiUnitPromotion) then
			pPlot = unit:GetPlot();
			if pPlot:GetImprovementType() ~= -1 then
				unit:ChangeDamage(-20)
			elseif HasTradeRoute(pPlot, pPlayer) then
				unit:ChangeDamage(-10)
			end
			local adjLand = 0;
			for rangePlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if rangePlot and not rangePlot:IsWater() then
					adjLand = adjLand+1;
				end
			end
			unit:SetHasPromotion(MKPromotion[1], false);
			unit:SetHasPromotion(MKPromotion[2], false);
			unit:SetHasPromotion(MKPromotion[3], false);
			unit:SetHasPromotion(MKPromotion[4], false);
			unit:SetHasPromotion(MKPromotion[5], false);
			unit:SetHasPromotion(MKPromotion[6], false);
			if adjLand > 6 then
				adjLand = 6;
			end
			if adjLand >= 1 then
				unit:SetHasPromotion(MKPromotion[adjLand], true);
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(MurakamiFunctions);

--========================================================================================================================
-- UNIQUE BUILDING: Hagiyaki Workshop
--========================================================================================================================

--------------------------------------------------------------------------------------------------------------------------
-- GrantMoriCultureDummies
--------------------------------------------------------------------------------------------------------------------------
function GrantMoriCultureDummies(playerID)
    local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iMoriCiv then
		for cCity in pPlayer:Cities() do
			if cCity:IsHasBuilding(iHagiyaki) then
				local numDummies = CountInternationalTradeRoutesIn(playerID, cCity)
				cCity:SetNumRealBuilding(iHagiyakiDummy, numDummies);
				if numDummies > 0 then
					--print("granted", numDummies, "Hagiyaki Culture dummies to", cCity);
				end
			else
				cCity:SetNumRealBuilding(iHagiyakiDummy, 0);
			end
		end
	end
end

if isMoriCivActive then
	GameEvents.PlayerDoTurn.Add(GrantMoriCultureDummies);
end


--========================================================================================================================
-- UNIQUE ABILITY: Miyajima
--========================================================================================================================
function FaithKillCoast(iPlayer, iUnit, iUnitType, iX, iY, bDelay, iByPlayer)

	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	
	local moriPlayer = GetPlayerByCivilization(iMoriCiv)
    local moriID = moriPlayer:GetID()

	-- Must have been killed by another Player
	if iPlayer == iByPlayer then return end
	if iByPlayer == -1 then return end
	
	-- Must be combat
	if not (pUnit:IsCombatUnit()) then return end

	if bDelay then
		if iByPlayer == -1 then return end
		pKiller = Players[iByPlayer]
		if pKiller == Players[iPlayer] then return end
		if not (pKiller == moriPlayer) then
			pKiller = nil
		end
	end
	
	if pKiller then
		--print("mori killed a unit")
		local pPlot = pUnit:GetPlot()
		local grantFaith = false
		if not pPlot:IsWater() then
			for rangePlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if rangePlot and rangePlot:IsWater() then
					grantFaith = true
					--print("mori killed a land unit near water")
					break;
				end
			end
		else
			for rangePlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if rangePlot and not rangePlot:IsWater() then
					grantFaith = true
					--print("mori killed a water unit near land")
					break;
				end
			end
		end
		if grantFaith then
			--print("mori killed a coastal unit, faith granted")
			moriPlayer:ChangeFaith(10)
			local hex = HexToWorld(ToHexFromGrid(Vector2(iX, iY)))
			Events.AddPopupTextEvent(hex, Locale.ConvertTextKey("+10[ICON_PEACE]"))
			for rangePlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				for unit in C15_PlotUnitsIterator(rangePlot) do
					if unit then
						 if unit:IsCombatUnit() then
							local ownerID = unit:GetOwner();
							if ownerID ~= iByPlayer then
								local owner = Players[ownerID];
								local ownerTeam = Teams[owner:GetTeam()];
								if ownerTeam:IsAtWar(iByPlayer) then
									unit:ChangeDamage(15)
									--print("mori coast kill damaged adjacent enemy")
								end
							end
						end
					end
				end
			end
		end
	end	
end

if isMoriCivActive then
	GameEvents.UnitPrekill.Add(FaithKillCoast);
end

local iGreatProphet = GameInfoTypes.UNIT_PROPHET;
local iCoast = GameInfoTypes.TERRAIN_COAST;
local iHolySite = GameInfoTypes.IMPROVEMENT_HOLY_SITE;
local iAtoll = GameInfoTypes.FEATURE_ATOLL;
------------------------------------------------------------------------------------------------------------------------
-- IsButtonPossible
------------------------------------------------------------------------------------------------------------------------
--Credit TopHat for all the button code
function IsButtonPossible(pUnit)
	if (pUnit:GetUnitType() == iGreatProphet) and pUnit:IsEmbarked() then
		local pUnitOwner = Players[pUnit:GetOwner()]
		if pUnitOwner == GetPlayerByCivilization(iMoriCiv) then
			local pPlot = pUnit:GetPlot()
			if (pPlot:GetTerrainType() == iCoast) and (pPlot:GetFeatureType() ~= iAtoll) then
				local pPlotOwner = -1		
				if pPlot:IsOwned() then
					pPlotOwner = Players[pPlot:GetOwner()]
				end
				if pUnitOwner == pPlotOwner then
					--print("clicked embarked mori prophet, can place holy site")
					return true
				end
			end
		end
	end
	return false
end

------------------------------------------------------------------------------------------------------------------------
-- Mori_DoButtonEffect
------------------------------------------------------------------------------------------------------------------------
function Mori_DoButtonEffect(pPlayer, pUnit)
	local pPlot = pUnit:GetPlot()
	pPlot:SetImprovementType(iHolySite)
	pUnit:Kill()
end

------------------------------------------------------------------------------------------------------------------------
-- Mori_UnitActionButton
------------------------------------------------------------------------------------------------------------------------
function Mori_UnitActionButton()
	local pUnit = UI.GetHeadSelectedUnit();
	Mori_DoButtonEffect(pActivePlayer, pUnit)
end

------------------------------------------------------------------------------------------------------------------------
-- Mori_SerialEventUnitInfoDirty
------------------------------------------------------------------------------------------------------------------------
function Mori_SerialEventUnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit();
	if (not pUnit) then return end
	if IsButtonPossible(pUnit) then
		Controls.UnitActionButton:SetHide(false)
	else
		Controls.UnitActionButton:SetHide(true)
	end
	
	local buildCityButtonActive = pUnit:IsFound();
				
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

------------------------------------------------------------------------------------------------------------------------
-- Mori_UpdateUnitInfoPanel
------------------------------------------------------------------------------------------------------------------------
local function Mori_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		--Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		--Controls.UnitActionIcon:SetTexture("UnitActions360.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_PB_MORI_HOLYSITE_HELP")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end


------------------------------------------------------------------------------------------------------------------------
-- Mori_AI_Build_HolySite
------------------------------------------------------------------------------------------------------------------------
local tResources = {}

for row in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_BONUS'") do
	tResources[row.ID] = true;
end

for row in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_LUXURY'") do
	tResources[row.ID] = true;
end

local tStrategicResources = {}

for row in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_RUSH'") do
	tStrategicResources[row.ID] = true;
end

for row in GameInfo.Resources("ResourceClassType = 'RESOURCECLASS_MODERN'") do
	tStrategicResources[row.ID] = true;
end

function Mori_AI_Build_HolySite(playerID)
	local pPlayer = Players[playerID]
	if (pPlayer:GetCivilizationType() == iMoriCiv) then
		if not pPlayer:IsHuman() then
			for pUnit in pPlayer:Units() do
				if IsButtonPossible(pUnit) then
					local iRandomSeed = JFD_GetRandom(1, 12)
					local iCheckAgainst = 4
					local pPlot = pUnit:GetPlot()
					if tResources[pPlot:GetResourceType()] then
						iCheckAgainst = iCheckAgainst + 3
					end					
					if tStrategicResources[pPlot:GetResourceType()] then
						iCheckAgainst = iCheckAgainst - 3
					end
					if pPlot:GetImprovementType() ~= -1 then
						iCheckAgainst = iCheckAgainst + 12
					end
					if iRandomSeed >= iCheckAgainst then
						Mori_DoButtonEffect(pPlayer, pUnit)
						--print("AI Mori placed holy site")
					end
				end
			end
		end
	end
end

local function Initialize()	
	Events.LoadScreenClose.Add(Mori_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(Mori_SerialEventUnitInfoDirty);
end

if isMoriCivActive then
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, Mori_UnitActionButton);
	IconHookup(1, 45, "EXPANSION_UNIT_ACTION_ATLAS", Controls.UnitActionIcon);
	GameEvents.PlayerDoTurn.Add(Mori_AI_Build_HolySite)
	Initialize();
end

function AIRepairHolySites(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and not pPlayer:IsHuman() then
		if pPlayer:GetImprovementCount(iHolySite) > 0 then
			local pTeam = Teams[pPlayer:GetTeam()]
			if pTeam:GetAtWarCount(true) == 0 then
				for pCity in pPlayer:Cities() do
					for i = 0, pCity:GetNumCityPlots()-1, 1 do
						local pPlot = pCity:GetCityIndexPlot(i)
						if (pPlot) then
							if pPlot:GetTerrainType() == iCoast then
								if pPlot:GetImprovementType() == iHolySite then
									if pPlot:IsImprovementPillaged() then
										pPlot:SetImprovementPillaged(false)
										--print("AI repaired a holy site", pPlayer);
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AIRepairHolySites)
