include("FLuaVector.lua")
-- MohaveUBUU
-- Author: EmeraldRange
-- DateCreated: 7/4/2021 8:36:25 AM
--------------------------------------------------------------

--=======================================================================================================================
-- JFD_IsCivilisationActive
--=======================================================================================================================
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
--=======================================================================================================================
local tPlayers = {}
function ER_Mohave_CheckPlayers()
--Credits to ExplosiveWatermelon
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer and pPlayer:IsAlive() and (not pPlayer:IsBarbarian()) then
			tPlayers[iPlayer] = pPlayer
			
		end
	end
end
--=======================================================================================================================
-- ER_IsAtWar
--=======================================================================================================================
function ER_IsAtWar(pPlayer)
	local pTeam = Teams[pPlayer:GetTeam()]
	local bWar = false
	for k, v in pairs(tPlayers) do
		local pEnemy = v:GetTeam()
		if pTeam:IsAtWar(pEnemy) then
			bWar = true
			break
		end
	end
	return bWar
end
--=======================================================================================================================

function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPActive = Game_IsCPActive()

function HasTrait(player, traitID)
    if isCPActive then 
        return player:HasTrait(traitID)
    else
        local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
        local traitType  = GameInfo.Traits[traitID].Type
        for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
            return true
        end
    end
end

local iCiv = GameInfoTypes["CIVILIZATION_SAS_MOHAVE"]
local bIsCivActive = JFD_IsCivilisationActive(iCiv)

local traitMohaveID = GameInfoTypes.TRAIT_SAS_IRATABA

local iKutinyam = GameInfoTypes["BUILDING_SAS_KUTINYAM"]
local iRiverGoldDummy = GameInfoTypes["BUILDING_ER_MOHAVEGOLDDUMMY"]
local iRiverFoodDummy = GameInfoTypes["BUILDING_ER_MOHAVEFOODDUMMY"]

local buildingMohaveEmbassyMarker = GameInfoTypes["BUILDING_DJ_MOHAVE_EM_MARKER"]

local iUU = GameInfoTypes["PROMOTION_ER_KWANAMI"]
local tGrowthSpeeds = {}
for row in DB.Query("SELECT ID, GrowthPercent FROM GameSpeeds") do -- Not most efficient way but I'm never sure how to use direct GameInfo queries
	tGrowthSpeeds[row.ID] = row.GrowthPercent
end
local iWLTKDLength = math.floor((3)*(tGrowthSpeeds[Game.GetGameSpeedType()] / 100))

--====BALANCE=======
local iExtendChance = 50 --Chance for garrisoned UU to extend WLTKD on regular speed
--==================

if bIsCivActive then
	Events.SequenceGameInitComplete.Add(ER_Mohave_CheckPlayers)
end
--=======================================================================================================================
-- ER_MohaveDoTurn
-- Checks if at war or peace and then loop through every city
-- War: If WLTKD and UB than give River Gold Dummy
-- Peace: If WLTKD and UB than give Food Gold Dummy. If UU garrisoned, 50% chance to extend WLTKD.
-- UB is not capturable 
--=======================================================================================================================
function ER_MohaveDoTurn(playerID)
	local pPlayer = Players[playerID]
	if not pPlayer then return end
	if not pPlayer:IsAlive()then return end
	   if HasTrait(pPlayer, traitMohaveID) then --only UB
		--Set Buildings
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iRiverFoodDummy) then pCity:SetNumRealBuilding(iRiverFoodDummy, 0) end
			if pCity:IsHasBuilding(iRiverGoldDummy) then pCity:SetNumRealBuilding(iRiverGoldDummy, 0) end
			if pCity:GetWeLoveTheKingDayCounter() > 0 and pCity:IsHasBuilding(iKutinyam) then
				if ER_IsAtWar(pPlayer) then
					pCity:SetNumRealBuilding(iRiverGoldDummy, 1)
				else				
					pCity:SetNumRealBuilding(iRiverFoodDummy, 1)
				end
			end
			
		end
	else --basically the same code but UU only for Peace
		if ER_IsAtWar(pPlayer) then return end
		--Check if UU garrisoned
		for pCity in pPlayer:Cities() do
			local iWLTKDTurnsLeft = pCity:GetWeLoveTheKingDayCounter()
			if iWLTKDTurnsLeft > 0 then 
				local pPlot = pCity:Plot()
				for i = 0, pPlot:GetNumUnits()-1, 1 do
					if pPlot:GetUnit(i):IsHasPromotion(iUU) then 
						 --found UU
                        if GetRandom(1, 100) <= iExtendChance then  --iExtendChance% chance to extend
                            pCity:ChangeWeLoveTheKingDayCounter(1)
                            if pPlayer:IsHuman() then
                                local stringtext = "Your Kwanami adds [COLOR_YIELD_FOOD]+ 1[ENDCOLOR] WLTKD Turn"
                                Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pPlot:GetX(), pPlot:GetY()))), stringtext, 2)
                            end
                        end
					end
				end
			end
		end
	end
end
--=======================================================================================================================
-- ER_MohaveUnitPromoted
-- When unit promoted, check if unit is UU
-- Loop through cities and give WLTKD
--=======================================================================================================================
function ER_MohaveUnitPromoted(playerID, unitID, promotionID)
	local pPlayer = Players[playerID]
	if not pPlayer or not pPlayer:IsAlive()then return end
	local pUnit = pPlayer:GetUnitByID(unitID)
	if not pUnit or not pUnit:IsCombatUnit() then return end
	if pUnit:IsHasPromotion(iUU) and ER_IsAtWar(pPlayer) then 
		for pCity in pPlayer:Cities() do
			pCity:ChangeWeLoveTheKingDayCounter(iWLTKDLength)
		end
	end
end

if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(ER_MohaveDoTurn)
	GameEvents.UnitPromoted.Add(ER_MohaveUnitPromoted)
end


function DJ_MohaveEmbassies(playerID)
    local player = Players[playerID]
    if not player or not player:IsAlive() then return end
    local myCapital = player:GetCapitalCity()
    if not myCapital then return end
    
    if HasTrait(player, traitMohaveID) then    
        local iMutualEmbassies = 0
        for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
            local otherPlayer = Players[otherPlayerID]
            if otherPlayer and otherPlayer:IsAlive() then
                local otherTeam = Teams[otherPlayer:GetTeam()]
                local otherTeamLeader = Players[otherTeam:GetLeaderID()]
                local myCapital = player:GetCapitalCity()
                local myTeam = Teams[player:GetTeam()]
                local myTeamTechs = myTeam:GetTeamTechs()
                if otherPlayer:IsBarbarian() or not HasTrait(otherPlayer, traitMohaveID) then
                    if myTeam:HasEmbassyAtTeam(otherTeam) and otherTeam:HasEmbassyAtTeam(myTeam) then
                        --print("Mutual embassies established with Mohave")
                        iMutualEmbassies = iMutualEmbassies + 1
                        myCapital:SetNumRealBuilding(buildingMohaveEmbassyMarker, 1)
                        --print("Embassy marker set for " .. otherPlayer:GetCapitalCity():GetName())
                    end  
                end
            end
        end
        myCapital:SetNumRealBuilding(buildingMohaveEmbassyMarker, iMutualEmbassies)
    end
end

if bIsCivActive then
	GameEvents.PlayerDoTurn.Add(DJ_MohaveEmbassies)
end