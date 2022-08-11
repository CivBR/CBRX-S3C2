-- JFD_Civs_AfghanistanDurrani_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingDivanID = GameInfoTypes["BUILDING_JFD_DIVAN"]
local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]

local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]

local traitAfghanistanDurraniID = GameInfoTypes["TRAIT_JFD_AFGHANISTAN_DURRANI"]

local unitJezailchiID = GameInfoTypes["UNIT_JFD_JEZAILCHI"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_AfghanistanDurrani_PlayerDoTurn
local plotMountainID = GameInfoTypes["PLOT_MOUNTAIN"]
local function JFD_AfghanistanDurrani_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	--UNIQUE TRAIT
	local playerAfghanistanID = nil
	local numGWP = 0
	for unit in player:Units() do
		local plot = Map.GetPlot(unit:GetX(), unit:GetY())
		local plotOwnerID = plot:GetOwner()
		if plotOwnerID > -1 and plotOwnerID ~= playerID then
			local plotOwner = Players[plotOwnerID]
			if HasTrait(plotOwner, traitAfghanistanDurraniID) then
				if playerTeam:IsAtWar(plotOwner:GetTeam()) then
					local isAdjacentMountain = false
					if g_IsVMCActive then
						isAdjacentMountain = unit:IsAdjacentToPlotType(plotMountainID)
					else
						for loopPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							if loopPlot:IsMountain() then
								isAdjacentMountain = true
								break
							end
						end
					end
					if (plot:IsHills() or isAdjacentMountain) then 
						unit:ChangeDamage(5)
						numGWP = numGWP + 5
						playerAfghanistanID = plotOwnerID
					end
				end
			end
		end
	end
	if playerAfghanistanID and numGWP > 0 then
		local playerAfghanistan = Players[playerAfghanistanID]
		local cityGWP = playerAfghanistan:GetCapitalCity()
		for city in playerAfghanistan:Cities() do
			if city:IsHasBuilding(buildingWritersGuildID) then
				cityGWP = city
				break
			end
		end
		cityGWP:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, (numGWP*100))
		if playerAfghanistan:IsHuman() then
			local hex = ToHexFromGrid(Vector2(cityGWP:GetX(), cityGWP:GetY()))
			Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_GREAT_PEOPLE_STORED]+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Writer Points", numGWP), true)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_AfghanistanDurrani_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_AfghanistanDurrani_UnitPrekill
local function JFD_AfghanistanDurrani_UnitPrekill(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, killingPlayerID)
	local player = Players[killingPlayerID]
	if unitOwnerID == killingPlayerID then return end
	if (not player) then return end
	if (not player:IsAlive()) then return end

	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE TRAIT
	if (not HasTrait(player, traitAfghanistanDurraniID)) then return end
	local plot = Map.GetPlot(plotX, plotY)
	if plot:GetOwner() == killingPlayerID then
		local unit = GameInfo.Units[unitType]
		local numGWP = unit.Combat
		if numGWP > 0 then
			local cityGWP = playerCapital
			for city in player:Cities() do
				if city:IsHasBuilding(buildingWritersGuildID) then
					cityGWP = city
					break
				end
			end
			cityGWP:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, (numGWP*100))
			if player:IsHuman() and player:IsTurnActive() then
				local hex = ToHexFromGrid(Vector2(plotX, plotY))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_GREAT_PEOPLE_STORED]+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Writer Points", numGWP), true)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(JFD_AfghanistanDurrani_UnitPrekill)
------------------------------------------------------------------------------------------------------------------------
--JFD_AfghanistanDurrani_CityBoughtPlot
local function JFD_AfghanistanDurrani_CityBoughtPlot(playerID, cityID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	--UNIQUE BUILDING
	local city = player:GetCityByID(cityID)
	if city:IsHasBuilding(buildingDivanID) then
		local numCulture = city:GetBaseJONSCulturePerTurn()
		player:ChangeJONSCulture(numCulture)
		if player:IsHuman() and player:IsTurnActive() then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plotX, plotY))), g_ConvertTextKey("[COLOR_CULTURE_STORED]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", numCulture), true)
		end
	end
end
GameEvents.CityBoughtPlot.Add(JFD_AfghanistanDurrani_CityBoughtPlot)
--=======================================================================================================================
--=======================================================================================================================
