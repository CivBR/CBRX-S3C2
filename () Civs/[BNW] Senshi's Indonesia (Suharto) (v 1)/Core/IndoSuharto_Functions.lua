-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- UA: The New Order
-- Gain Golden Age points from adopting Social Policies. During a Golden Age, Units heal at twice the usual rate and Naval Units may Paradrop.

-- UU: Kopassus (Paratrooper)
-- > Gains Golden Age points from Kills (DOABLE IN XML)
-- > During a Golden Age, gains the benefits of a Marine and receives +1 Paradrop Range for every completed Social Policy Tree/Level 3 Tenet

-- UB: Pancasila Monument (Constabulary)
-- > No Maintenance Cost (DOABLE IN XML)
-- > +2 Happiness when training Combat Units.
-- > +15 XP to units trained during a Golden Age.
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
local traitIndonesiaSuhartoID = GameInfoTypes["TRAIT_SENSHI_INDONESIA"]
local buildingPancasilaID = GameInfoTypes["BUILDING_SENSHI_PANCASILA_MONUMENT"]
local unitKopassusID = GameInfoTypes["UNIT_SENSHI_KOPASSUS"]
----------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------------------------------------------------------------------
--Senshi_IndonesiaSuharto_PlayerDoTurn
local buildingPancasilaHappinessID = GameInfoTypes["BUILDING_SENSH_PANCASILA_HAPPINESS"]
local domainSeaID = GameInfoTypes["DOMAIN_SEA"]
local promotionAmphibID = GameInfoTypes["PROMOTION_AMPHIBIOUS"]
local promotionEmbarkWithDefenseID = GameInfoTypes["PROMOTION_EMBARKED_SIGHT"]
local promotionEmbarkWithExtraSightID = GameInfoTypes["PROMOTION_DEFENSIVE_EMBARKATION"]
local promotionParadropID = GameInfoTypes["PROMOTION_PARADROP"]
local promotionSenshiSuhartoID = GameInfoTypes["PROMOTION_SENSH_INDONESIA_SUHARTO"]
local function Senshi_IndonesiaSuharto_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	local playerIsGoldenAge = player:IsGoldenAge()
	
	--PANCASILA MONUMENT
	for city in player:Cities() do	
		city:SetNumRealBuilding(buildingPancasilaHappinessID, 0)
		if city:IsHasBuilding(buildingPancasilaID) then
			local unitProductionID = city:GetProductionUnit()
			if unitProductionID > -1 then
				if GameInfo.Units[unitProductionID].Combat > 0 then
					city:SetNumRealBuilding(buildingPancasilaHappinessID, 1)
				end
			end
		end
	end
	
	--KOPASSUS
	for unit in player:Units() do
		if unit:GetUnitType() == unitKopassusID then
			unit:SetHasPromotion(promotionAmphibID, playerIsGoldenAge)
			unit:SetHasPromotion(promotionEmbarkWithDefenseID, playerIsGoldenAge)
			unit:SetHasPromotion(promotionEmbarkWithExtraSightID, playerIsGoldenAge)
			
			for num = 0, 15 - 1 do
				local promoParadropRange = "PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_" .. num
				local promoParadropRangeID = GameInfoTypes[promoParadropRange]
				unit:SetHasPromotion(promoParadropRangeID, false)
			end
			
			local promoParadropRange = "PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_"
			local numPolicyBranches = 0
			for branch in GameInfo.PolicyBranchTypes() do
				if player:IsPolicyBranchFinished(branch.ID) then
					numPolicyBranches = numPolicyBranches + 1
				end
			end
			
			local numLevel3Tenets = 0
			for tenet in GameInfo.Policies("Level = 3") do
				if player:HasPolicy(tenet.ID) then
					numLevel3Tenets = numLevel3Tenets + 1
				end
			end
			numLevel3Tenets = g_MathMin(numLevel3Tenets, 15)
			promoParadropRange = promoParadropRange .. (numLevel3Tenets+numPolicyBranches)
			local promoParadropRangeID = GameInfoTypes[promoParadropRange]
			if promoParadropRangeID then
				unit:SetHasPromotion(promoParadropRangeID, true)
			end
		end
	end
	
	--THE NEW ORDER
	if (not HasTrait(player, traitIndonesiaSuhartoID)) then return end
	for unit in player:Units() do
		unit:SetHasPromotion(promotionSenshiSuhartoID, playerIsGoldenAge)
		if unit:GetDomainType() == domainSeaID then
			unit:SetHasPromotion(promotionParadropID, playerIsGoldenAge)			
		end
	end	
end
GameEvents.PlayerDoTurn.Add(Senshi_IndonesiaSuharto_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--Senshi_IndonesiaSuharto_PlayerAdoptPolicy
local function Senshi_IndonesiaSuharto_PlayerAdoptPolicy(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--THE NEW ORDER
	if (not HasTrait(player, traitIndonesiaSuhartoID)) then return end
	
	local numGAP = 60
	player:ChangeGoldenAgeProgressMeter(numGAP)
	if player:IsHuman() and player:IsTurnActive() then
		Events.GameplayAlertMessage(g_ConvertTextKey("+[COLOR_POSITIVE_TEXT]{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE] from adopting a Social Policy!", numGAP))
	end
end
GameEvents.PlayerAdoptPolicyBranch.Add(Senshi_IndonesiaSuharto_PlayerAdoptPolicy)
GameEvents.PlayerAdoptPolicy.Add(Senshi_IndonesiaSuharto_PlayerAdoptPolicy)
--------------------------------------------------------------------------------------------------------------------------
--Senshi_IndonesiaSuharto_CityTrained
local function Senshi_IndonesiaSuharto_CityTrained(playerID, cityID, unitID, isGold, isFaith)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	local playerTeam = Teams[playerTeamID]
	if (not player:IsAlive()) then return end
	
	--PANCASILA MONUMENT
	if (not player:IsGoldenAge()) then return end
	local city = player:GetCityByID(cityID)
	if city:IsHasBuilding(buildingPancasilaID) then
		local unit = player:GetUnitByID(unitID)
		unit:ChangeExperience(15)
	end
end
GameEvents.CityTrained.Add(Senshi_IndonesiaSuharto_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
