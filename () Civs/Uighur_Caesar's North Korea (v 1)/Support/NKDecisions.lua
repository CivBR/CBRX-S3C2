-- Lua Script1
-- Author: pedro
-- DateCreated: 12/27/16 1:28:36 PM
--------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- NK: Rocket Man by Elton John
--------------------------------------------------------------------------------------------------------------------------
local nkID = GameInfoTypes["CIVILIZATION_UC_BEST_KOREA"]
local NKMissiles = GameInfoTypes["POLICY_UC_NK_MISSILES"]
local techTheologyID = GameInfoTypes["TECH_ROCKETRY"]

local Decisions_NKMissiles = {}
	Decisions_NKMissiles.Name = "TXT_KEY_DECISIONS_UC_NK_MISSILES"
	Decisions_NKMissiles.Desc = "TXT_KEY_DECISIONS_UC_NK_MISSILES_DESC"
	HookDecisionCivilizationIcon(Decisions_NKMissiles, "CIVILIZATION_UC_BEST_KOREA")
	Decisions_NKMissiles.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= nkID then return false, false end
		if load(player, "Decisions_NKMissiles") == true then
			Decisions_NKMissiles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_NK_MISSILES_ENACTED_DESC")
			return false, false, true
		end
		
		
		
		Decisions_NKMissiles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_NK_MISSILES_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) <	1	then return true, false end	
		if player:GetGold() < 2500 								then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))  then return true, false end

		return true, true
	end
	)
		
	
	Decisions_NKMissiles.DoFunc = (
	function(player, otherPlayer)
		player:ChangeGold(-2500)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(NKMissiles, true)
		save(player, "Decisions_NKMissiles", true)
	end
	)
	
Decisions_AddCivilisationSpecific(nkID, "Decisions_NKMissiles", Decisions_NKMissiles)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Turkey: Laws
--------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------
-- MC_Chinook_GetRoutesFromPlayer
-------------------------------------------------------------------------------------------------------------------------
function MC_Chinook_GetRoutesFromPlayer(pPlayer)
	local tCities = {}
	
	local tTradeRoutes = pPlayer:GetTradeRoutes()
	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.FromID == pPlayer:GetID()) and (tRoute.FromID ~= tRoute.ToID) then
			table.insert(tCities, tRoute.ToCity)
		end
	end	
	
	return tCities
end

local NKJucheID = GameInfoTypes["POLICY_NK_JUCHE"]

--=======================================================================================================================
-- JFD_IsHasIdeology
--------------------------------------------------------------------------------------------------------------------------
local policyBranchAutocracyID	= GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local policyBranchFreedomID		= GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local policyBranchOrderID		= GameInfoTypes["POLICY_BRANCH_ORDER"]

function JFD_IsHasIdeology(playerID)
	local player = Players[playerID]
	local isHasIdeology = false
	if player:IsPolicyBranchUnlocked(policyBranchAutocracyID) then
		isHasIdeology = true
	elseif player:IsPolicyBranchUnlocked(policyBranchFreedomID) then
		isHasIdeology = true
	elseif player:IsPolicyBranchUnlocked(policyBranchOrderID) then
		isHasIdeology = true
	end
	
	return isHasIdeology
end

local Decisions_NKJuche = {}
	Decisions_NKJuche.Name = "TXT_KEY_DECISIONS_NK_JUCHE"
	Decisions_NKJuche.Desc = "TXT_KEY_DECISIONS_NK_JUCHE_DESC"
	HookDecisionCivilizationIcon(Decisions_NKJuche, "CIVILIZATION_UC_BEST_KOREA")
	Decisions_NKJuche.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UC_BEST_KOREA"] then return false, false end
		if load(player, "Decisions_NKJuche") == true then
			Decisions_NKJuche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NK_JUCHE_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_NKJuche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NK_JUCHE_DESC")
		local cultureCost = 800 * iMod
		Decisions_NKJuche.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_NK_JUCHE_DESC", cultureCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (player:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL)	then return true, false end		
		if player:GetJONSCulture() < cultureCost then return true, false end
		if math.floor(#MC_Chinook_GetRoutesFromPlayer(player) / player:GetNumInternationalTradeRoutesAvailable()) > .5 then return true, false end
				
		return true, true
	end
	)
		
	
Decisions_NKJuche.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local cultureCost = 800 * iMod
        player:ChangeJONSCulture(-cultureCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(NKJucheID, true)			
			if JFD_IsHasIdeology(player:GetID()) then
				player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_JUCHE_2, 1)
			else 
				player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_UC_NK_JUCHE_1, 1)
				end
        save(player, "Decisions_NKJuche", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_UC_BEST_KOREA, "Decisions_NKJuche", Decisions_NKJuche)

function NorthKoreaRockets(playerID)
local player = Players[playerID]
	if player:IsAlive() and player:HasPolicy(NKMissiles) then
	for unit in player:Units() do
	if unit:GetUnitType() == GameInfoTypes.UNIT_NUCLEAR_MISSILE or unit:GetUnitType() == GameInfoTypes.UNIT_GUIDED_MISSILE then
		if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET"], true)
			end
		end
	if unit:GetUnitType() == GameInfoTypes.UNIT_ROCKET_ARTILLERY or unit:GetUnitType() == GameInfoTypes.UNIT_MOBILE_SAM then
		if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET_SCIENCE"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET_SCIENCE"], true)
			end
		end
	if unit:GetUnitType() == GameInfoTypes.UNIT_MISSILE_CRUISER or unit:GetUnitType() == GameInfoTypes.UNIT_NUCLEAR_SUBMARINE then
		if not unit:IsHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET_SHIP"]) then
				unit:SetHasPromotion(GameInfoTypes["PROMOTION_UC_NK_ROCKET_SHIP"], true)
					end
				end
			end
		end
	end
GameEvents.PlayerDoTurn.Add(NorthKoreaRockets)

function NKAdopt(playerID, policyID)
    local player = Players[playerID]
	local team = Teams[player:GetTeam()]
    if (player:IsAlive() and player:GetCivilizationType() == nkID and player:HasPolicy(NKJuche)) then
		for city in player:Cities() do
			city:ChangeWeLoveTheKingDayCounter(3)
        end
    end
end
GameEvents.PlayerAdoptPolicy.Add(NKAdopt)

local bDummy1 = GameInfoTypes.BUILDING_UC_NK_JUCHE_COST_1;
local bDummy2 = GameInfoTypes.BUILDING_UC_NK_JUCHE_COST_2;
local bDummy4 = GameInfoTypes.BUILDING_UC_NK_JUCHE_COST_4;
local bDummy8 = GameInfoTypes.BUILDING_UC_NK_JUCHE_COST_8;

function toBits(num)
    -- returns a table of bits, least significant first.
	t={} -- will contain the bits
    while num>0 do
        local rest=math.fmod(num,2)
        t[#t+1]=rest
        num=(num-rest)/2
    end
    return t
end

function NKJucheReduction(playerID)
	local pPlayer = Players[playerID];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == nkID) then
		if (not pPlayer:HasPolicy(NKJuche))	then return true, false end
         for city in pPlayer:Cities() do
		 if city:IsCapital() then
		 local nonForeign = #MC_Chinook_GetRoutesFromPlayer(pPlayer)
		local total = pPlayer:GetNumInternationalTradeRoutesAvailable()
		local num = total - nonForeign
						toBits(num)
				city:SetNumRealBuilding(bDummy1, t[1]);
				city:SetNumRealBuilding(bDummy2, t[2]);
				city:SetNumRealBuilding(bDummy4, t[3]);
				city:SetNumRealBuilding(bDummy8, t[4]);
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(NKJucheReduction)


