-- WilliamIII
-- Author: Vandon
-- DateCreated: 9/21/2020 9:02:35 PM
--------------------------------------------------------------

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "WilliamIII";
include("PlotIterators.lua")

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
------------------------------------------------------------------------------------------------------------------------



--==========================================================================================================================
-- Enemy cities of you Religion don’t enter Resistance or lose Citizens when captured.
--==========================================================================================================================

local civilizationAngloDutchID = GameInfoTypes["CIVILIZATION_SPLATDAY_DUTCH"]
local traitAngloDutchID = GameInfoTypes["TRAIT_SPLATDAY_DUTCH"]


function WilliamEnemyIndex(playerID)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	 if (player:IsAlive() and player:GetCivilizationType() == civilizationAngloDutchID) then
	 for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
            local otherPlayer = Players[iPlayer]
            if iPlayer ~= playerID and otherPlayer:IsAlive() then
				local otherTeam = Teams[otherPlayer:GetTeam()]
                 if otherTeam:IsAtWar(team) then
				 for city in otherPlayer:Cities() do
				 local plot = city:Plot()
				 local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
				 local population = city:GetPopulation()
				 local followers = city:GetNumFollowers(religionID)
					save(plot, "OriginalPopulation", population)
					save(plot, "OriginalFollowers", followers)
-- gets followers at the start of turn
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(WilliamEnemyIndex)




--Vana_WilliamIII_CityCaptureComplete
local function Vana_WilliamIII_CityCaptureComplete(oldPlayerID, isCapital, plotX, plotY, newPlayerID)
	local player = Players[newPlayerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
			
	--GLORIOUS REVOLUTION
	if (not HasTrait(player, traitAngloDutchID)) then return end
	local city = Map.GetPlot(plotX, plotY):GetPlotCity()	
	local plot = Map.GetPlot(plotX, plotY)

	local numPopulation = load(plot, "OriginalPopulation")
	local numFollowers = load(plot, "OriginalFollowers")

	local religionID = player:GetReligionCreatedByPlayer()
	local currentFollowers = city:GetNumFollowers(religionID)
	if city:GetNumFollowers(religionID) > 0 then
		local numTurns = city:GetResistanceTurns()
		city:ChangeResistanceTurns(-numTurns)
		city:SetPopulation(numPopulation, true)
	end
end
GameEvents.CityCaptureComplete.Add(Vana_WilliamIII_CityCaptureComplete)





--==========================================================================================================================
-- Upon the outbreak of War, enemy units near cities of your Religion may defect to your empire. Man-of-War increases this effect then in 5 tiles of the units
--==========================================================================================================================







--==========================================================================================================================
-- Blue Guard gains an attack bonus when starting adjacent to a friendly unit from a Civilisation following your religion. (allied CSes too)
--==========================================================================================================================

local unitBlueGuardID		= GameInfoTypes["UNIT_VANA_BLUE_GUARD"]
local BlueGuardPromoID	= GameInfoTypes["PROMOTION_VANA_BLUE_GUARD_BONUS"]

function BlueGuardBonus(playerID)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
		for unit in player:Units() do
			if unit:GetUnitType() == unitBlueGuardID then
			local plot = unit:GetPlot()
				for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				print("BlueGuardBonus: Looking for Allies")
					if adjacentPlot:IsUnit() then
					print("BlueGuardBonus: Found someone") -- fucked past here
					local adjacentUnit = adjacentPlot:GetUnit()
					local otherPlayer = Players[adjacentUnit:GetOwner()]
					local otherTeam = otherPlayer:GetTeam()
					local religionID = player:GetReligionCreatedByPlayer()
						if religionID == -1 then
						religionID = player:GetCapitalCity():GetReligiousMajority()
						end
					local otherReligionID = otherPlayer:GetReligionCreatedByPlayer()
						if otherReligionID == -1 then
						otherReligionID = otherPlayer:GetCapitalCity():GetReligiousMajority()
						end
						if	otherReligion == religionID and not team:IsAtWar(otherTeam) then
						unit:SetHasPromotion(BlueGuardPromoID, true)
						print("BlueGuardBonus: Giving Promotion")
					end
				end
			end
		end
	end
end


GameEvents.PlayerDoTurn.Add(BlueGuardBonus)



--==========================================================================================================================
-- Man-of-War places blockaded enemy cities into Resistance if they follow your Religion and your Religion differs from your enemy's
-- Man-of-War stronger in coast
--==========================================================================================================================


local unitManofWarID	 = GameInfoTypes["UNIT_VANA_MAN_OF_WAR"]
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]

function Man_of_War_Blockade(playerID)
	local player = Players[playerID]
	local isAtWar = false
	for ID = 0, defineMaxMajorCivs -1, 1 do
		local enemyPlayer = Players[ID]
		local playerTeam = Teams[player:GetTeam()]
		if Teams[enemyPlayer:GetTeam()]:IsAtWar(playerTeam) then
			print("Man_of_War_Blockade: King Billy at war")
			for unit in player:Units() do
				if unit:GetUnitType() == unitManofWarID then
				local plot = unit:GetPlot()
					for adjacentPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						print("Man_of_War_Blockade: Sweeping plots")
						if adjacentPlot:IsCity() then
							local city = adjacentPlot:GetPlotCity()
							local enemyCityOwner = Players[city:GetOwner()] 
							if city:IsBlockaded() then
								print("Players[city:GetOwner()]")
								print("Man_of_War_Blockade: blockading city")
								local religionID = player:GetReligionCreatedByPlayer() -- never gets past this stage pls help, im getting the impression that maybe the religionID stuff is very wrong -_-
								if religionID == -1 then
								religionID = player:GetCapitalCity():GetReligiousMajority()
								end
								local enemyReligonID = enemyCityOwner:GetReligionCreatedByPlayer()
								if enemyReligonID == -1 then
								enemyReligonID = enemyCityOwner:GetCapitalCity():GetReligiousMajority()
								end 
								local numResistanceTurns = 1
								if city:GetNumFollowers(religionID) > 0 and not enemyReligonID == religionID then
								print("Man_of_War_Blockade: Resistance")
								city:ChangeResistanceTurns(numResistanceTurns)
								end
							end
						end
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Man_of_War_Blockade)


local ManOfWarPromoID = GameInfoTypes["PROMOTION_VANA_MAN_OF_WAR_BONUS"]
local coastID			 = GameInfoTypes["TERRAIN_COAST"]

function Man_of_War_Coast(playerID) -- this whole little function is fucked idk, probably GetTerrainType not being real or sumting :,c
	local player = Players[playerID]
		for unit in player:Units() do
			if unit:GetUnitType() == unitManofWarID then
			local plot = unit:GetPlot()
				if plot:GetTerrainType() == coastID then
				print("Man_of_War_Coast: Found")
				unit:SetHasPromotion(ManOfWarPromoID, true)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Man_of_War_Coast)
