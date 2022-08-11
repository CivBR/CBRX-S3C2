-- Civs_GPuzz_Argies_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--include("UniqueDiplomacyUtilsV2.lua")
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
------------------------------------------------------------------------------------------------------------------------
--MATH UTILS
------------------------------------------------------------------------------------------------------------------------
--Game.GetRandom
function Game.GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end
local g_GetRandom = Game.GetRandom
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
local barbarianEncampments = {}

local buildingDumKayapoID = GameInfoTypes["BUILDING_DUMMY_GPUZ_NEKREX"]
local buildingDumKayapoEcologyID = GameInfoTypes["BUILDING_DUMMY_GPUZ_NEKREX_ECOLOGY"]
local techEcologyID = GameInfoTypes["TECH_ECOLOGY"]

local traitGPuzzArgentinaID = GameInfoTypes["TRAIT_GPUZ_RAONI"]
local civilizationID = GameInfoTypes["CIVILIZATION_GPUZ_KAYAPO"]

local specialistMusicianID = GameInfoTypes["SPECIALIST_MUSICIAN"]
local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]
local specialistArtistID = GameInfoTypes["SPECIALIST_ARTIST"]
local specialistScientistID = GameInfoTypes["SPECIALIST_SCIENTIST"]
local specialistEngineerID = GameInfoTypes["SPECIALIST_ENGINEER"]
local specialistMerchantID = GameInfoTypes["SPECIALIST_MERCHANT"]

local specialistType = {}
	specialistType[1]	= specialistMusicianID
	specialistType[2]	= specialistWriterID
	specialistType[3]   = specialistArtistID
	specialistType[4]	= specialistScientistID
	specialistType[5]	= specialistEngineerID
	specialistType[6] 	= specialistMerchantID
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--------------------------------------------
--GPuzz_Kayapo_PlayerDoTurn
--------------------------------------------
local function GPuzz_Kayapo_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end

	--UA
    local playerTeam = Teams[player:GetTeam()]
    if HasTrait(player, traitGPuzzArgentinaID) and player:IsAlive() then
		-- Culture from Marshes and Jungles
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDumKayapoID, 1)
			if player:GetCapitalCity():IsHasBuilding(buildingDumKayapoEcologyID) then
				city:SetNumRealBuilding(buildingDumKayapoEcologyID, 1)
			end
		end
		-- Trade Routes to other Civilizations provide their origin city with the Great Person points of the destination city
		for k, v in pairs(player:GetTradeRoutes()) do
        local numSpecialists = {0, 0, 0, 0, 0, 0}
            if (v.ToID ~= playerID) then
                local receiverCity = v.ToCity:GetOwner()
                for specialist in specialistType do
					numSpecialists[specialist] = city:GetSpecialistCount(specialist)
				end
            end
            local originCity = v.FromCity
            for i=1, 6, 1 do
                originCity:ChangeSpecialistGreatPersonProgressTimes100(specialistType[i], numSpecialists[i]*2)
            end
        end
	end
end
GameEvents.PlayerDoTurn.Add(GPuzz_Kayapo_PlayerDoTurn)

--------------------------------------------
-- GPuzz_Kayapo_TeamTechResearched
--------------------------------------------
function GPuzz_Kayapo_TeamTechResearched(teamID, techID)
	local playerID = Teams[teamID]:GetLeaderID()
	local player = Players[playerID]
	if techID == techEcologyID then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDumKayapoEcologyID, 1)
		end
	end
end

GameEvents.TeamTechResearched.Add(GPuzz_Kayapo_TeamTechResearched)
--------------------------------------------
--GPuzz_Kayapo_UnitKilledInCombat
--------------------------------------------
function GPuzz_Kayapo_UnitKilledInCombat(killerID, killedID, killedUnitType)
	local player = Players[killerID]
	if (not HasTrait(player, traitGPuzzArgentinaID)) then return end
	if (player:GetCivilizationType() == civilizationID and player:IsEverAlive()) then
		local reward = mathFloor(GameInfo.Units[killedUnitType].Combat)
		local capital = player:GetCapitalCity()
		capital:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, reward*100)
		if player:IsHuman() then
			Events.GameplayAlertMessage(Locale.ConvertTextKey("+{1_Num} [ICON_GREAT_PEOPLE] [COLOR_POSITIVE_TEXT]BenadioroENDCOLOR] points from defeating your enemies in battle!", reward))
		end
	end
end

GameEvents.UnitKilledInCombat.Add(GPuzz_Kayapo_UnitKilledInCombat)
--------------------------------------------
--GPuzz_Kayapo_BuildFinished
--------------------------------------------
local function GPuzz_Kayapo_BuildFinished(playerID, plotX, plotY, improvementID)
	local player = Players[playerID]
    if improvementID == -1 then
        local plot = Map.GetPlot(plotX, plotY)
        if plot:GetFeatureType() ~= forestID and plot:GetFeatureType() ~= jungleID and plot:GetFeatureType() ~= marshID then
			local isNearKayapo = false
			local owner
			local reward = 0
			for loopPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if loopPlot:GetOwner() == civilizationID then
					isNearKayapo = true
					capital = loopPlot:GetOwner():GetCapitalCity()
					
				end
			end
			if isNearKayapo then
				reward = (plot:GetYield(GameInfoTypes.YIELD_GOLD)+1)*4
				capital:ChangeSpecialistGreatPersonProgressTimes100(specialistMerchantID, reward*100)
			end
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("+{1_Num} [ICON_GREAT_PEOPLE] [COLOR_POSITIVE_TEXT]Benadioro[ENDCOLOR] points from the outrage of deflorestation!", reward))
			end
        end
    end
end
GameEvents.BuildFinished.Add(GPuzz_Kayapo_BuildFinished)
--=======================================================================================================================
--=======================================================================================================================

