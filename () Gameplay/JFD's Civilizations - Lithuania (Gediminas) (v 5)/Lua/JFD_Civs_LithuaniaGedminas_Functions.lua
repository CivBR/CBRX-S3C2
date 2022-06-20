-- JFD_Civs_LithuaniaGediminas_Functions
-- Author: JFD
-- DateCreated: 1/17/2014 12:14:14 AM
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
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
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
local civilizationLithuaniaGediminasID = GameInfoTypes["CIVILIZATION_JFD_LITHUANIA_GEDIMINAS"]
local traitLithuaniaGediminasID = GameInfoTypes["TRAIT_JFD_LITHUANIA_GEDIMINAS"]
local buildingSacredGroveID = GameInfoTypes["BUILDING_JFD_SACRED_GROVE"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--g_Religions_Table
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end

--JFD_LithuaniaGediminas_PlayerDoTurn
local featureForestID = GameInfoTypes["FEATURE_FOREST"]
local religionPantheonID = GameInfoTypes["RELIGION_PANTHEON"]
local promotionSamogitianWarriorID = GameInfoTypes["PROMOTION_JFD_SAMOGITIAN_WARRIOR"]
local function JFD_LithuaniaGediminas_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsBarbarian()) then return end
	if (player:IsMinorCiv()) then return end

	--SAMOGITIAN WARRIOR
	for unit in player:Units() do
		if unit:IsHasPromotion(promotionSamogitianWarriorID) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY()) 
			if plot:GetFeatureType() == featureForestID then
				unit:ChangeDamage(-5)
			end
		end
	end

	--SACRED GROVE
	if (not player:HasCreatedPantheon()) then return end
	for city in player:Cities() do
		if city:IsHasBuilding(buildingSacredGroveID) then
			local numForests = 0 
			local plot = Map.GetPlot(city:GetX(), city:GetY())
			for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (adjacentPlot:GetOwner() == playerID and adjacentPlot:GetFeatureType() == featureForestID) then
					numForests = numForests + 1
				end
			end
			numForests = (numForests*10)

			--g_Religions_Table
			local religionsTable = g_Religions_Table
			local numReligions = #religionsTable
			for index = 1, numReligions do
				local row = religionsTable[index]
				local religionID = row.ID
				city:ConvertPercentFollowers(religionPantheonID, religionID, numForests) 
			end
			city:ConvertPercentFollowers(religionPantheonID, -1, numForests)
		end
	end
end 
GameEvents.PlayerDoTurn.Add(JFD_LithuaniaGediminas_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_LithuaniaGediminas_CityConstructed
local function JFD_LithuaniaGediminas_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local teamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if (player:IsBarbarian()) then return end
	if (player:IsMinorCiv()) then return end

	--SACRED GROVE
	if buildingID ~= buildingSacredGroveID then return end
	local city = player:GetCityByID(cityID)
	local plot = Map.GetPlot(city:GetX(), city:GetY())
	for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		if (adjacentPlot:GetOwner() == -1 and adjacentPlot:GetFeatureType() == featureForestID) then
			adjacentPlot:SetOwner(playerID, cityID, true, true)
			adjacentPlot:SetRevealed(teamID, true)
		end
	end 	
end
GameEvents.CityConstructed.Add(JFD_LithuaniaGediminas_CityConstructed)
----------------------------------------------------------------------------------------------------------------------------
--JFD_LithuaniaGediminas_CityTrained
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local promotionLithuaniaGediminasID = GameInfoTypes["PROMOTION_JFD_LITHUANIA_GEDIMINAS"]
local unitCombatMeleeID = GameInfoTypes["UNITCOMBAT_MELEE"]
function JFD_LithuaniaGediminas_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if (player:IsMinorCiv()) then return end

	--THE OLD GODS
	if HasTrait(player, traitLithuaniaGediminasID) then
		local city = player:GetCityByID(cityID)
		local unit = player:GetUnitByID(unitID)
		if city:GetReligiousMajority() == religionPantheonID then
			if ((unit:GetUnitCombatType() == unitCombatMeleeID) or (unit:GetDomainType() == domainLandID and (not unit:IsCombatUnit()))) then
				unit:SetHasPromotion(promotionLithuaniaGediminasID, true)
			end
		end
	end
end
GameEvents.CityTrained.Add(JFD_LithuaniaGediminas_CityTrained)
--==========================================================================================================================
--==========================================================================================================================

