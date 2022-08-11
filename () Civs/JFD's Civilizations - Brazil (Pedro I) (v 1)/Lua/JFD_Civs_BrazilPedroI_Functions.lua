-- JFD_Civs_BrazilPedroI_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
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

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local civilizationBrazilPedroIID = GameInfoTypes["CIVILIZATION_JFD_BRAZIL_PEDRO_I"]
local traitBrazilPedroIID = GameInfoTypes["TRAIT_JFD_BRAZIL_PEDRO_I"]
local unitIndependenceDragoonID = GameInfoTypes["UNIT_JFD_INDEPENDENCE_DRAGOON"]
local unitIndependenceDragoon = GameInfo.Units["UNIT_JFD_INDEPENDENCE_DRAGOON"]
local unitIndependenceDragoonPrereqTech = unitIndependenceDragoon.PrereqTech
local unitIndependenceDragoonPrereqTechID = GameInfoTypes[unitIndependenceDragoonPrereqTech]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--JFD_BrazilPedroI_PlayerDoTurn
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local function JFD_BrazilPedroI_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--INDEPENDENCE, OR DEATH
	local isAtWar = false
	local playerBrazilPedroID = false
	for otherPlayerID = 0, defineMaxMinorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsAlive() and otherPlayerID ~= playerID then
			if HasTrait(otherPlayer, traitBrazilPedroIID) then
				local otherPlayerTeam = Teams[otherPlayer:GetTeam()]
				if otherPlayerTeam:IsAtWar(playerTeamID) then
					isAtWar = true
					playerBrazilPedroID = otherPlayerID
					break
				end
			end
		end
	end
	if (not isAtWar) then return end
	
	local isAdjacentGreatGeneral = false
	for unit in player:Units() do
		local plot = g_MapGetPlot(unit:GetX(), unit:GetY())
		for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			for i = 0, adjacentPlot:GetNumUnits() - 1, 1 do
				local otherUnit = adjacentPlot:GetUnit(i)
				if otherUnit and otherUnit:GetOwner() == playerBrazilPedroID and otherUnit:GetUnitClassType() == unitClassGreatGeneralID then
					isAdjacentGreatGeneral = true
					break
				end
			end
			if isAdjacentGreatGeneral then
				break
			end
		end
		if isAdjacentGreatGeneral then
			local numMoves = g_MathFloor(unit:GetMoves()/2)
			unit:ChangeMoves(-numMoves)
			
			if player:IsHuman() or Players[playerBrazilPedroID]:IsHuman() then
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				Events.AddPopupTextEvent(HexToWorld(hex), g_ConvertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num} [ICON_MOVES] Movement[ENDCOLOR]", (numMoves/60)), true)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_BrazilPedroI_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_BrazilPedroI_DeclareWar
local function JFD_BrazilPedroI_DeclareWar(teamID, otherTeamID)
	local team = Teams[teamID]
	local otherTeam = Teams[otherTeamID]
	local attackingPlayerID = team:GetLeaderID()
	local attackingPlayer = Players[attackingPlayerID]
	local playerID = otherTeam:GetLeaderID()
	local player = Players[playerID]
	
	--INDEPENDENCE, OR DEATH
	if HasTrait(player, traitBrazilPedroIID) then
		local numGGPoints = player:GetExcessHappiness()
		player:ChangeCombatExperience(numGGPoints)
		
		if player:IsHuman() then
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_BRAZIL_PEDRO_I_MESSAGE", numGGPoints))
		end
	elseif HasTrait(attackingPlayer, traitBrazilPedroIID) then
		local numGGPoints = attackingPlayer:GetExcessHappiness()
		attackingPlayer:ChangeCombatExperience(numGGPoints)
		
		if attackingPlayer:IsHuman() then
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_BRAZIL_PEDRO_I_MESSAGE", numGGPoints))
		end
	end	
end
GameEvents.DeclareWar.Add(JFD_BrazilPedroI_DeclareWar)
----------------------------------------------------------------------------------------------------------------------------
--JFD_BrazilPedroI_SerialEventUnitCreated
local promotionIndependenceDragoonGreatGeneralID = GameInfoTypes["PROMOTION_JFD_INDEPENDENCE_DRAGOON_GREAT_GENERAL"]
local resourceHorsesID = GameInfoTypes["RESOURCE_HORSE"]
local function JFD_BrazilPedroI_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	
	--INDEPENDENCE DRAGOON
	if (not HasTrait(player, traitBrazilPedroIID)) then return end
	if (not playerTeam:GetTeamTechs():HasTech(unitIndependenceDragoonPrereqTechID)) then return end
	
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitClassType() ~= unitClassGreatGeneralID then return end
    if unit:IsHasPromotion(promotionIndependenceDragoonGreatGeneralID) then return end
	
	player:ChangeNumResourceTotal(resourceHorsesID, 1)
	player:InitUnit(unitIndependenceDragoonID, unit:GetX(), unit:GetY())
	unit:SetHasPromotion(promotionIndependenceDragoonGreatGeneralID, true)
end
if (not g_IsVMCActive) then
	Events.SerialEventUnitCreated.Add(JFD_BrazilPedroI_SerialEventUnitCreated)
end
----------------------------------------------------------------------------------------------------------------------------
--JFD_BrazilPedroI_UnitCreated
local function JFD_BrazilPedroI_UnitCreated(playerID, unitID, unitType, plotX, plotY)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	
	--INDEPENDENCE DRAGOON
	if (not HasTrait(player, traitBrazilPedroIID)) then return end
	if (not playerTeam:GetTeamTechs():HasTech(unitIndependenceDragoonPrereqTechID)) then return end
	
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitClassType() ~= unitClassGreatGeneralID then return end
	
	player:ChangeNumResourceTotal(resourceHorsesID, 1)
	player:InitUnit(unitIndependenceDragoonID, plotX, plotY)
end
if g_IsVMCActive then
	GameEvents.UnitCreated.Add(JFD_BrazilPedroI_UnitCreated)
end
--=======================================================================================================================
--=======================================================================================================================
