-- Gokturk_Functions
-- Author: User
-- DateCreated: 4/4/2019 6:06:16 PM
--------------------------------------------------------------
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("IconSupport")
include("PlotIterators.lua")
include("AdditionalAchievementsUtility.lua")
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
-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
-- UNIQUE UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- GetNearestCity
function GetNearestCity(player, plot)
    local distance = 9999
    for city in player:Cities() do
        local cityPlot = city:Plot()
        local between = Map.PlotDistance(cityPlot:GetX(), cityPlot:GetY(), plot:GetX(), plot:GetY())
        if between < distance then
            distance = between
            closestCity = city
        end
    end
    return closestCity
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
local civilizationID = GameInfoTypes["CIVILIZATION_GT_GOKTURKS"]
local traitGokturkID = GameInfoTypes["TRAIT_GT_GOKTURKS"]
local unitToygunlarID = GameInfoTypes["UNIT_GT_TOYGUNLAR"]
local buildingVassalForgeID	= GameInfoTypes["BUILDING_GT_VASSAL_FORGE"]
local isGokturksActivePlayer 	= activePlayer:GetCivilizationType() == civilizationID
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
----------------------------
-- DIVINE MISTS OF ORKHON --
----------------------------
local promoSilverSoldiers	= GameInfoTypes["PROMOTION_GT_SILVER_SOLDIERS"]
local promoGoldGuardians	= GameInfoTypes["PROMOTION_GT_GOLD_GUARDIANS"]
local promoCopperCavalry	= GameInfoTypes["PROMOTION_GT_COPPER_CAVALRY"]
local promoIronWolves		= GameInfoTypes["PROMOTION_GT_IRON_WOLVES"]
local promoAluminiumValkryies = GameInfoTypes["PROMOTION_GT_ALUMINUM_VALKRYIES"]
local promoUraniumSentries = GameInfoTypes["PROMOTION_GT_URANIUM_SENTRIES"]
local resourceAluminium	= GameInfoTypes["RESOURCE_ALUMINUM"]
local resourceCopper = GameInfoTypes["RESOURCE_COPPER"]
local resourceGold = GameInfoTypes["RESOURCE_GOLD"]
local resourceIron = GameInfoTypes["RESOURCE_IRON"]
local resourceSilver = GameInfoTypes["RESOURCE_SILVER"]
local resourceUranium = GameInfoTypes["RESOURCE_URANIUM"]
local militaryBuildings = {}
for row in DB.Query("SELECT * FROM Buildings WHERE Defense > 0 OR NeverCapture > 0;") do
	militaryBuildings[row.ID] = true
end
local featureMountainID = GameInfoTypes["FEATURE_MOUNTAIN"]
local promoFaith = GameInfoTypes["PROMOTION_GT_DIVINE_MIST"]
local unitCombatMounted = GameInfoTypes["UNITCOMBAT_MOUNTED"]
function GT_DivineMistsOfOrkhon_PDT(playerID)
	local player = Players[playerID]
	local numMilitaryBuildings = 0
	if not HasTrait(player, traitGokturkID) then return end
	for unit in player:Units() do
		local plot = unit:GetPlot()
		local capital = player:GetCapitalCity()
		local distance = Map.PlotDistance(capital:GetX(), capital:GetY(), unit:GetX(), unit:GetY())
		if not unit:GetUnitCombatType() == unitCombatMounted then return end
		for ID = 0,(plot:GetNumUnits() - 1) do
			local plotUnit = plot:GetUnit(ID)
			if plotUnit then
				if plotUnit:IsHasPromotion(promoFaith) or unit:IsHasPromotion(promoFaith) then 
					for adjacentPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						if adjacentPlot:IsMountain() or adjacentPlot:IsHills() then
							if adjacentPlot:GetOwner() == -1 then
								local rand = JFD_GetRandom(1, 100) 
								if rand > 90 then
									local city = GetNearestCity(player, adjacentPlot)
									adjacentPlot:SetOwner(playerID, city:GetID())
									for ID = 0, city:GetNumCityPlots()-1, 1 do
										local cityPlot = city:GetCityIndexPlot(ID)
										if unit:IsHasPromotion(promoSilverSoldiers) and cityPlot:GetResourceType() == resourceSilver then
											cityPlot:ChangeNumResource(2)
										elseif unit:IsHasPromotion(promoIronWolves) and cityPlot:GetResourceType() == resourceIron then
											cityPlot:ChangeNumResource(3)
										elseif unit:IsHasPromotion(promoUraniumSentries) and cityPlot:GetResourceType() == resourceUranium then
											cityPlot:ChangeNumResource(2)
										elseif unit:IsHasPromotion(promoAluminiumValkryies) and cityPlot:GetResourceType() == resourceAluminium then
											cityPlot:ChangeNumResource(3)
										elseif unit:IsHasPromotion(promoGoldGuardians) and cityPlot:GetResourceType() == resourceGold then
											cityPlot:ChangeNumResource(2)
										elseif unit:IsHasPromotion(promoCopperCavalry) and cityPlot:GetResourceType() == resourceCopper then
											cityPlot:ChangeNumResource(4)
										end
									end
								end
							end
						end
					end
				end
			end
		end
		unit:ChangeExperience(g_MathMin(distance/10))
	end
	for city in player:Cities() do
		for kBuilding, v in pairs(militaryBuildings) do
			if city:IsHasBuilding(kBuilding) then
				numMilitaryBuildings = numMilitaryBuildings + 1
			end
		end	
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if plot:GetResourceType() == resourceIron then
				player:ChangeFaith(numMilitaryBuildings)
			end
		end
	end							
end
GameEvents.PlayerDoTurn.Add(GT_DivineMistsOfOrkhon_PDT)	

function GT_DivineMistsOfOrkhon_CityTrained(playerID, cityID, unitID, bGold, bFaithOrCulture)
	if bFaithOrCulture then
		local player = Players[playerID]
		if not HasTrait(player, traitGokturkID) then return end
		local unit = player:GetUnitByID(unitID)
		unit:SetHasPromotion(promoFaith, true)
	end
end
GameEvents.CityTrained.Add(GT_DivineMistsOfOrkhon_CityTrained)
---------------
-- TOYGUNLAR --
---------------
local buildingFreeToy = GameInfoTypes["BUILDING_GT_TOYGUNLAR_COURTHOUSE"]
function GT_Toygunlar_CityCanConstruct(playerID, cityID, buildingID)
	local player = Players[playerID]
	if buildingID == buildingFreeToy then
		local city = player:GetCityByID(cityID)
		local garrison = city:GetGarrisonedUnit()
		if garrison and garrison:GetUnitType() == unitToygunlarID then
			if HasTrait(player, traitGokturkID) then
				return true
			end
		end
		return false
	end
	return true
end
GameEvents.CityCanConstruct.Add(GT_Toygunlar_CityCanConstruct)

function GT_Toygunlar_Courthouse_PDT(playerID)
	local player = Players[playerID]
	local numGP = 0
	if not HasTrait(player, traitGokturkID) then return end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingFreeToy) then
			for ID = 0, city:GetNumCityPlots()-1, 1 do
				local plot = city:GetCityIndexPlot(ID)
				local plotUnit = plot:GetUnit()
				if plotUnit and plotUnit:IsGreatPerson() then
					numGP = numGP + 1 
				end
				player:ChangeFaith(numGP)
				local unit = city:GetProductionUnit() 
				if unit then
					local unitType = GameInfo.Units[unit]
					if (unitType.Combat < 1) or (unitType.RangedCombat < 1) then
						city:ChangeProduction(numGP * 2)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GT_Toygunlar_Courthouse_PDT)
------------------
-- VASSAL FORGE --
------------------
local improvementMineID = GameInfoTypes["IMPROVEMENT_MINE"]
local unitCombatAir = GameInfoTypes["UNITCOMBAT_FIGHTER"]
local unitCombatNavalMelee = GameInfoTypes["UNITCOMBAT_NAVALMELEE"]
local unitCombatNavalRanged = GameInfoTypes["UNITCOMBAT_NAVALRANGED"]
function GT_VassalForge_BuildFinished(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
	if not HasTrait(player, traitGokturkID) then return end
	if improvementID == improvementMineID then
		local plot = g_MapGetPlot(plotX, plotY)
		if plot:GetResourceType() == resourceIron then
			for ID = 0, defineMaxMinorCivs -1, 1 do
				local minorPlayer = Players[ID]
				local city = GetNearestCity(minorPlayer, plot)
				local minorCiv = Players[city:GetOwner()]
				minorCiv:ChangeFriendshipLevelWithMajor(10)
			end
		end
	end
end
GameEvents.BuildFinished.Add(GT_VassalForge_BuildFinished)

function GT_VassalForge_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if not HasTrait(player, traitGokturkID) then return end
	local city = player:GetCityByID(cityID)
	local unit = player:GetUnitByID(unitID)
	if unit and unit:IsCombatUnit() then
		for ID = 0, city:GetNumCityPlots()-1, 1 do
			local plot = city:GetCityIndexPlot(ID)
			if city:IsHasBuilding(buildingVassalForgeID) then
				if plot:GetResourceType() == resourceSilver then
					unit:SetHasPromotion(promoSilverSoldiers, true)
				elseif plot:GetResourceType() == resourceGold then
					unit:SetHasPromotion(promoGoldGuardians, true)
				elseif plot:GetResourceType() == resourceCopper then
					unit:SetHasPromotion(promoCopperCavalry, true)
				elseif plot:GetResourceType() == resourceIron then
					unit:SetHasPromotion(promoIronWolves, true)
				elseif plot:GetResourceType() == resourceAluminium then
					unit:SetHasPromotion(promoAluminiumValkryies, true)
				elseif plot:GetResourceType() == resourceUranium then
					unit:SetHasPromotion(promoUraniumSentries, true)
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(GT_VassalForge_CityTrained)
----------
-- MCIS --
----------
g_Gokturks_MCIS_TipControls = {}
TTManager:GetTypeControlTable("Gokturks_MCIS_Tooltip", g_Gokturks_MCIS_TipControls)
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "Gokturks_MCIS", ["SortOrder"] = 1})
end
if isGokturksActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
function CityInfoStackDirty(key, instance)
	if key ~= "Gokturks_MCIS" then return end
	ProcessCityScreen(instance)
end
if isGokturksActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
----------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("city == true")
	instance.IconFrame:SetToolTipType("Gokturks_MCIS_Tooltip")
	IconHookup(3, 64, "GT_GOKTURKS_ATLAS", instance.IconImage)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_VASSAL_FORGE")) .. "[ENDCOLOR]" -- Header
	local textHelp = Locale.ConvertTextKey("TXT_KEY_BUILDING_GT_VASSAL_FORGE_TOOLTIP") -- Text
	g_Gokturks_MCIS_TipControls.Heading:SetText(textDescription)
	g_Gokturks_MCIS_TipControls.Body:SetText(textHelp)
	g_Gokturks_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end		
--==========================================================================================================================
--==========================================================================================================================