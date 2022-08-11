-- DMS_Botswana_Functions
-- Author: DMS
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("PlotIterators.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bPrintForDebug = DMS_GetUserSetting("DMS_BOTSWANA_DEBUGGING_ON") == 1
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
-- HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- Neirai_GetNearestCity
----------------------------------------------------------------------------------------------------------------------------
function Neirai_GetNearestCity(player, plot)
	local distance = 9999
	local nearestCity = nil
	for city in player:Cities() do
		local cityPlot = city:Plot()
		local between = Map.PlotDistance(plot:GetX(), plot:GetY(), cityPlot:GetX(), cityPlot:GetY())
		if between < distance then
			distance = between
			nearestCity = city
		end
	end
	return nearestCity
end
--==========================================================================================================================
-- VARIABLES
--==========================================================================================================================
-- Player and Components
----------------------------------------------------------------------------------------------------------------------------
local Players									= Players
local activePlayerID 							= Game.GetActivePlayer()
local activePlayer 								= Players[activePlayerID]
local activePlayerTeam 							= Teams[Game.GetActiveTeam()]
local civilisationBotswana						= GameInfoTypes["CIVILIZATION_DMS_BOTSWANA"]
local traitTheClayThatBinds						= GameInfoTypes["TRAIT_DMS_THE_CLAY_THAT_BINDS"]
local unitMophato								= GameInfoTypes["UNIT_DMS_MOPHATO"]
local buildingKgotla							= GameInfoTypes["BUILDING_DMS_KGOTLA"]
local buildingTheClayThatBinds					= GameInfoTypes["BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST"]
local buildingMophatoCulture					= GameInfoTypes["BUILDING_DMS_MOPHATO_CULTURE"]
local buildingMophatoProduction					= GameInfoTypes["BUILDING_DMS_MOPHATO_PRODUCTION"]
local buildingKgotlaHappiness					= GameInfoTypes["BUILDING_DMS_KGOTLA_HAPPINESS"]
local promotionKgotla							= GameInfoTypes["PROMOTION_DMS_KGOTLA"]
local promotionBogwera							= GameInfoTypes["PROMOTION_DMS_BOGWERA"]
local improvementMine							= GameInfoTypes["IMPROVEMENT_MINE"]

DMS_Botswana_BuildFinished_playerID				= 0
DMS_Botswana_BuildFinished_X					= 0
DMS_Botswana_BuildFinished_Y					= 0
DMS_Botswana_BuildFinished_improvement			= 0

local tableResourceTechs = {}
for row in DB.Query("SELECT a.ID ResourceID, e.ID TechID FROM Resources a, Improvements b, Builds c, Improvement_ResourceTypes d, Technologies e WHERE c.ImprovementType = b.Type AND a.Type = d.ResourceType AND b.Type = d.ImprovementType AND c.PrereqTech = e.Type") do
    if not tableResourceTechs[row.ResourceID] then
        tableResourceTechs[row.ResourceID] = {row.TechID}
    else
        table.insert(tableResourceTechs[row.ResourceID], row.TechID)
    end
end
local tableResourceImprovement = {}
for row in DB.Query("SELECT a.ID ResourceID, b.ID ImprovementID FROM Resources a, Improvements b, Improvement_ResourceTypes c WHERE a.Type = c.ResourceType and c.ImprovementType = b.Type") do
    if not tableResourceImprovement[row.ResourceID] then
        tableResourceImprovement[row.ResourceID] = row.ImprovementID
    end
end

local stringFormat								= string.format
local isBotswanaCivActive 						= JFD_IsCivilisationActive(civilisationMozambique)
local isBotswanaActivePlayer					= activePlayer:GetCivilizationType() == civilisationMozambique
if isBotswanaCivActive then
	print("Sir Seretse Khama tips his hat to you, lad!")
end
----------------------------------------------------------------------------------------------------------------------------
-- Math
----------------------------------------------------------------------------------------------------------------------------
local mathFloor 								= math.floor
local mathMin									= math.min
----------------------------------------------------------------------------------------------------------------------------
-- GameEvents
----------------------------------------------------------------------------------------------------------------------------
local PlayerDoTurn								= GameEvents.PlayerDoTurn.Add
local UnitSetXY									= GameEvents.UnitSetXY.Add
local BuildFinished								= GameEvents.BuildFinished.Add
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- C15_IsHasResourcePrereq
----------------------------------------------------------------------------------------------------------------------------
local function C15_IsHasResourcePrereq(team, resourceID)
    local b = false
	for k, v in ipairs(tableResourceTechs) do
		if k == resourceID then
			for i = 1, #v do
				if team:IsHasTech(v[i]) then
					b = true
				end
			end
		end
	end
	return b
	--for i = 1, #tableResourceTechs[resourceID] do
        --if team:IsHasTech(tableResourceTechs[resourceID][i]) then
            --return true
        --end
    --end
    --return false
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GetResourceImprovement
----------------------------------------------------------------------------------------------------------------------------
local function DMS_GetResourceImprovement(resource)
    local improvement = nil
	improvement = tableResourceImprovement[resource]
    return improvement
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UA_EngineersFromMines
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UA_EngineersFromMines(playerID, player, city, cityPlot)
	DMS_Print("DMS_Botswana_UA_EngineersFromMines: iterate city plots to count mines..")
	local numMines = 0
	for plot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if plot:GetOwner() == playerID then
			if plot:GetWorkingCity() == city or plot:GetPlotCity() == city then
				if plot:GetImprovementType() == improvementMine then
					numMines = numMines + 1
				end
			end
		end
	end
	DMS_Print("DMS_Botswana_PlayerDoTurn: numMines: " .. numMines .. "..")
	local numEngineers = mathFloor(numMines / 2)
	city:SetNumRealBuilding(buildingTheClayThatBinds, numEngineers)
	DMS_Print("DMS_Botswana_PlayerDoTurn: numEngineers: " .. numEngineers .. "..")
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UA_MinesClaimAndImproveAdjResources
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UA_MinesClaimAndImproveAdjResources(playerID, player, plot)
	DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: iterate adj plots to find improve-able and claim-able resources..")
	for adjPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if not adjPlot:IsWater() then
			local resourceType = adjPlot:GetResourceType()
			if resourceType ~= nil and resourceType ~= -1 then
				DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: plot (" .. adjPlot:GetX() .. ", " .. adjPlot:GetY() .. ") has a resource..")
				local team = Teams[player:GetTeam()]
				if C15_IsHasResourcePrereq(team, resourceType) then
					DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: Team has PrereqTech")
					if adjPlot:GetImprovementType() == nil or adjPlot:GetImprovementType() == -1 then
						DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: plot (" .. adjPlot:GetX() .. ", " .. adjPlot:GetY() .. ") is not already improved..")
						local improvmentType = DMS_GetResourceImprovement(resourceType)
						adjPlot:SetImprovementType(improvmentType, playerID)
						DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: plot (" .. adjPlot:GetX() .. ", " .. adjPlot:GetY() .. ") auto improved..")
						if adjPlot:GetOwner() == nil or adjPlot:GetOwner() == -1 then
							local city = Neirai_GetNearestCity(player, plot)
							if city ~= nil and city ~= -1 then
								adjPlot:SetOwner(playerID, city:GetID())
								DMS_Print("DMS_Botswana_UA_MinesClaimAndImproveAdjResources: set botswana as owner..")
							end
						end
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UU_ResetMophatoBonuses
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UU_ResetMophatoBonuses(playerID, player, city)
	if city:IsHasBuilding(buildingMophatoCulture) then
		city:SetNumRealBuilding(buildingMophatoCulture, 0)
	DMS_Print("DMS_Botswana_UU_ResetMophatoBonuses: removed culture dummy buildings..")
	end
	if city:IsHasBuilding(buildingMophatoProduction) then
		city:SetNumRealBuilding(buildingMophatoProduction, 0)
	DMS_Print("DMS_Botswana_UU_ResetMophatoBonuses: removed production dummy buildings..")
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UU_MophatoBonusesPDT
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UU_MophatoBonusesPDT(playerID, player, unit)
	if not unit:IsHasPromotion(promotionBogwera) then return end
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: found unit with Bogwera Promotion..")
	local plot = unit:GetPlot()
	if plot == nil or plot == -1 then return end
	local improvement = plot:GetImprovementType()
	local numUnimprovedOrPillaged = 0
	local numMines = 0
	if plot:IsImprovementPillaged() or improvement == -1 then
		numUnimprovedOrPillaged = 1
		DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: unit is on pillaged or unimproved plot..")
	end
	if improvement == improvementMine then
		numMines = 1
		DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: unit is on mine..")
	end
	local city = Neirai_GetNearestCity(player, plot)
	if city == nil or city == -1 then return end
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: nearest city is " .. city:GetName() .. "..")
	local numCultureBonus = city:GetNumRealBuilding(buildingMophatoCulture)
	local numProductionBonus = city:GetNumRealBuilding(buildingMophatoProduction)
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: old numCultureBonus =  " .. numCultureBonus .. "..")
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: old numProductionBonus =  " .. numProductionBonus .. "..")
	numCultureBonus = numCultureBonus + numUnimprovedOrPillaged
	numProductionBonus = numProductionBonus + numMines
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: new numCultureBonus =  " .. numCultureBonus .. "..")
	DMS_Print("DMS_Botswana_UU_MophatoBonusesPDT: new numProductionBonus =  " .. numProductionBonus .. "..")
	city:SetNumRealBuilding(buildingMophatoCulture, numCultureBonus)
	city:SetNumRealBuilding(buildingMophatoProduction, numProductionBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UU_MophatoBonusesUSXY
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UU_MophatoBonusesUSXY(playerID, player, unit, plot)
	if not unit:IsHasPromotion(promotionBogwera) then return end
	if plot:GetOwner() ~= playerID then return end
	local improvement = plot:GetImprovementType()
	local numUnimprovedOrPillaged = 0
	local numMines = 0
	if plot:IsImprovementPillaged() or improvement == -1 then
		numUnimprovedOrPillaged = 1
		DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: unit is on pillaged or unimproved plot..")
	end
	if improvement == improvementMine then
		numMines = 1
		DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: unit is on mine..")
	end
	local city = Neirai_GetNearestCity(player, plot)
	if city == nil or city == -1 then return end
	DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: nearest city is " .. city:GetName() .. "..")
	local numCultureBonus = city:GetNumRealBuilding(buildingMophatoCulture)
	local numProductionBonus = city:GetNumRealBuilding(buildingMophatoProduction)
	DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: old numCultureBonus =  " .. numCultureBonus .. "..")
	DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: old numProductionBonus =  " .. numProductionBonus .. "..")
	numCultureBonus = numCultureBonus + numUnimprovedOrPillaged
	numProductionBonus = numProductionBonus + numMines
	DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: new numCultureBonus =  " .. numCultureBonus .. "..")
	DMS_Print("DMS_Botswana_UU_MophatoBonusesUSXY: new numProductionBonus =  " .. numProductionBonus .. "..")
	city:SetNumRealBuilding(buildingMophatoCulture, numCultureBonus)
	city:SetNumRealBuilding(buildingMophatoProduction, numProductionBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UB_ResetKgotlaHappiness
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UB_ResetKgotlaHappiness(playerID, player, city, cityPlot)
	local hasBogwera = false
	local numUnits = cityPlot:GetNumUnits()
	for i = 0, numUnits do
		local unit = cityPlot:GetUnit(i)
		if unit ~= nil and unit ~= -1 then 
			if unit:IsHasPromotion(promotionKgotla) then
				hasBogwera = true
			end
		end
	end
	if hasBogwera == true then
		DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: " .. city:GetName() .. " has hasBogwera = true..")
		if not city:IsHasBuilding(buildingKgotlaHappiness) then
			DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: but does not have a dummy building..")
			city:SetNumRealBuilding(buildingKgotlaHappiness, 1)
			DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: added dummy building..")
		end
	elseif hasBogwera == false then
		DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: " .. city:GetName() .. " has hasBogwera = false..")
		if city:IsHasBuilding(buildingKgotlaHappiness) then
			DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: but has a dummy building..")
			city:SetNumRealBuilding(buildingKgotlaHappiness, 0)
			DMS_Print("DMS_Botswana_UB_ResetKgotlaHappiness: removed dummy building..")
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UB_KgotlaHappiness
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UB_KgotlaHappiness(playerID, player, unit, plot)
	if not unit:IsHasPromotion(promotionKgotla) then return end
	local city = plot:GetPlotCity()
	if city == nil or city == -1 then return end
	DMS_Print("DMS_Botswana_UB_KgotlaHappiness: unit with kgotla promotion is in city of " .. city:GetName() .. "..")
	if not city:IsHasBuilding(buildingKgotlaHappiness) then
		city:SetNumRealBuilding(buildingKgotlaHappiness, 1)
		DMS_Print("DMS_Botswana_UB_KgotlaHappiness: city did not have dummy building, added..")
	end
end
--==========================================================================================================================
-- MAIN FUNCTIONS
--==========================================================================================================================
-- DMS_Botswana_PlayerDoTurn
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitTheClayThatBinds) then return end
	local turn = Game.GetGameTurn()
	DMS_Print("DMS_Botswana_PlayerDoTurn: playerID: " .. playerID .. ", turn: " .. turn .. "..")
	for city in player:Cities() do
		local cityPlot = city:Plot()
		if cityPlot ~= nil and cityPlot ~= -1 then
			DMS_Print("DMS_Botswana_PlayerDoTurn: city: " .. city:GetName() .. "..")
			DMS_Botswana_UA_EngineersFromMines(playerID, player, city, cityPlot)
			DMS_Botswana_UB_ResetKgotlaHappiness(playerID, player, city, cityPlot)
			DMS_Botswana_UU_ResetMophatoBonuses(playerID, player, city)
		end
	end
	for unit in player:Units() do
		DMS_Botswana_UU_MophatoBonusesPDT(playerID, player, unit)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_BuildFinished
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_BuildFinished(playerID, iX, iY, improvement)
	if (DMS_Botswana_BuildFinished_playerID == playerID and DMS_Botswana_BuildFinished_X == iX and DMS_Botswana_BuildFinished_Y == iY and DMS_Botswana_BuildFinished_improvement == improvement) then return end
	DMS_Botswana_BuildFinished_playerID = playerID
	DMS_Botswana_BuildFinished_X = iX
	DMS_Botswana_BuildFinished_Y = iY
	DMS_Botswana_BuildFinished_improvement = improvement
	if improvement ~= improvementMine then return end
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitTheClayThatBinds) then return end
	local plot = Map.GetPlot(iX, iY)
	if plot == nil or plot == -1 then return end
	local turn = Game.GetGameTurn()
	DMS_Print("DMS_Botswana_BuildFinished: playerID: " .. playerID .. ", turn: " .. turn .. "..")
	DMS_Botswana_UA_MinesClaimAndImproveAdjResources(playerID, player, plot)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Botswana_UnitSetXY
----------------------------------------------------------------------------------------------------------------------------
local function DMS_Botswana_UnitSetXY(playerID, unitID, x, y)
local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	if unit == nil or unit == -1 then return end
	local plot = Map.GetPlot(x, y)
	if plot == nil or plot == -1 then return end
	DMS_Botswana_UU_MophatoBonusesUSXY(playerID, player, unit, plot)
	DMS_Botswana_UB_KgotlaHappiness(playerID, player, unit, plot)
end
--==========================================================================================================================
-- GAMEEVENTS
--==========================================================================================================================
PlayerDoTurn(DMS_Botswana_PlayerDoTurn)
BuildFinished(DMS_Botswana_BuildFinished)
UnitSetXY(DMS_Botswana_UnitSetXY)
--==========================================================================================================================
--==========================================================================================================================