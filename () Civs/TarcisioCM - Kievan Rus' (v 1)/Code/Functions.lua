--====================================================================================================
--====================================================================================================
WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "tcmKiev";
include("PlotIterators")
--====================================================================================================
--====================================================================================================
--Defines
--====================================================================================================
local civilizationID  = GameInfoTypes["CIVILIZATION_TCM_KIEV"]
local gostID  		  = GameInfoTypes["UNIT_TCM_GOST_CONVOY"]
local torgID  		  = GameInfoTypes["BUILDING_TCM_TORG"]
local goldDummy		  = GameInfoTypes["BUILDING_TCM_KIEV_GOLD_DUMMY"]
local productionDummy = GameInfoTypes["BUILDING_TCM_KIEV_PRODUCTION_DUMMY"]
local xpDummy		  = GameInfoTypes["BUILDING_TCM_KIEV_XP_DUMMY"]
--====================================================================================================
--Kievan Rus' Trait, Torg and Gost
--====================================================================================================
function KievDoTurn(playerID)
	local player = Players[playerID]
	if player:GetCivilizationType() == civilizationID then
		local Gosts = {}
		local capital = player:GetCapitalCity()
		if capital then
			local gold = player:GetGoldPerTurnFromDiplomacy()
			if gold > 0 then
				gold = math.floor(gold * 0.33)
			else
				gold = 0
			end
			capital:SetNumRealBuilding(goldDummy, gold)
		end
		if player:GetUnitClassCount(GameInfoTypes["UNITCLASS_PIKEMAN"]) > 0 then
			for unit in player:Units() do
				if unit:GetUnitType() == gostID then
					table.insert(Gosts, unit)
				end
			end
		end
		local ResourcesTraded = {}
		for resource in GameInfo.Resources() do
			local numExport = player:GetResourceExport(GameInfoTypes[resource.Type])
			local previousNumExport = load(player, 'tcmNumExportedResource' .. resource.Type)
			if previousNumExport == nil then previousNumExport = 0 end
			if numExport > previousNumExport and resource.Happiness > 0 then
				if Gosts then
					for key,unit in pairs(Gosts) do
						unit:ChangeExperience(2)
					end
				end
			end
			if numExport > 0 and resource.Happiness > 0 then
				table.insert(ResourcesTraded, resource.Type)
			end
			if not(numExport == previousNumExport) then 
				save(player, 'tcmNumExportedResource' .. resource.Type, numExport) 
				save(player, 'tcmNumExportedResourceForTorg' .. resource.Type, numExport) 
			end
		end
		-- Torg
		for city in player:Cities() do
			--ED stuff 
			if player:HasPolicy(GameInfoTypes["POLICY_TCM_KIEV_DECISION"]) then
				if city:IsPuppet() then
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_KIEV_GOLD_PUPPET_DUMMY"], 1)
				else
					city:SetNumRealBuilding(GameInfoTypes["BUILDING_TCM_KIEV_GOLD_PUPPET_DUMMY"], 0)
				end
			end
			--
			if city:IsHasBuilding(torgID) then
				--Luxury = Production stuff
				local numProduction = 0
				if ResourcesTraded then
					for key,resource in pairs(ResourcesTraded) do
						if city:IsHasResourceLocal(GameInfoTypes[resource]) then
							local numExport = load(player, 'tcmNumExportedResourceForTorg' .. resource)
							if numExport > 0 then
								for i = 0, city:GetNumCityPlots() - 1, 1 do
									if numExport > 0 then
										local plot = city:GetCityIndexPlot( i )
										if plot ~= nil then
											if plot:GetOwner() == playerID and city:IsWorkingPlot(plot) and plot:GetResourceType(GameInfoTypes[resource]) then
												numProduction = numProduction + 1
												local newNumExport = numExport - 1
												save(player, 'tcmNumExportedResourceForTorg' .. resource, newNumExport) 
												numExport = numExport - 1
											end
										end 
									else
										break
									end
								end
							end
						end
					end
				end
				city:SetNumRealBuilding(productionDummy, numProduction)
				--Specialist Stuff
				if city:GetNumSpecialistsInBuilding(torgID) > 0 then
					city:SetNumRealBuilding(xpDummy, 1)
				else
					city:SetNumRealBuilding(xpDummy, 0)
				end
			end
		end
		--
		for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
			local otherPlayer = Players[otherPlayerID];			
			if otherPlayer ~= nil and not(otherPlayer:IsMinorCiv()) then
				if player:IsPlayerHasOpenBorders(otherPlayer) then
					save(player,"tcmKievDeal.OpenBordersWith" .. otherPlayerID, 1)
				else
					if load(player,"tcmKievDeal.OpenBordersWith" .. otherPlayerID) == 1 then
						save(player,"tcmKievDeal.OpenBordersWith" .. otherPlayerID, 0)
					end
				end
				if Teams[player:GetTeam()]:HasEmbassyAtTeam(otherPlayer:GetTeam()) then
					save(player,"tcmKievDeal.EmbassiesWith" .. otherPlayerID, 1)
				else
					if load(player,"tcmKievDeal.EmbassiesWith" .. otherPlayerID) == 1 then
						save(player,"tcmKievDeal.EmbassiesWith" .. otherPlayerID, 0)
					end
				end
			end
		end
		local numCurrentDeals = UI.GetNumCurrentDeals(player)
		local diploGold = player:GetGoldPerTurnFromDiplomacy()
		local defensivePacts = Teams[player:GetTeam()]:GetDefensivePactCount()
		local researchAgreements = player:GetScienceFromResearchAgreementsTimes100()
		save(player,"tcmKievDeal.Gold", diploGold)
		save(player,"tcmKievDeal.DefensivePact", defensivePacts)
		save(player,"tcmKievDeal.ResearchAgreements", researchAgreements)
	end
end
GameEvents.PlayerDoTurn.Add(KievDoTurn)

function warDeclared(teamId, otherTeamId)
	local player
	for iPlayer = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
		local newplayer = Players[iPlayer];			
		if newplayer ~= nil and newplayer:GetCivilizationType() == civilizationID then
			player = newplayer
			break
		end
	end
	if player then
		if player:GetTeam() == teamId or player:GetTeam() == otherTeamId then
			local numBroken = 0
			for resource in GameInfo.Resources() do
				local numExport = player:GetResourceExport(GameInfoTypes[resource.Type])
				local previousNumExport = load(player, 'tcmNumExportedResource' .. resource.Type)
				if previousNumExport == nil then previousNumExport = 0 end
				if previousNumExport > numExport then
					numBroken = numBroken + 1
				end
				if not(numExport == previousNumExport) then save(player, 'tcmNumExportedResource' .. resource.Type, numExport) end
			end
			for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1 do
				local otherPlayer = Players[otherPlayerID];			
				if otherPlayer ~= nil and not(otherPlayer:IsMinorCiv()) then
					if load(player,"tcmKievDeal.OpenBordersWith" .. otherPlayerID) == 1 then
						numBroken = numBroken + 1
						save(player,"tcmKievDeal.OpenBordersWith" .. otherPlayerID, 0)
					end
					if load(player,"tcmKievDeal.EmbassiesWith" .. otherPlayerID) == 1 then
						numBroken = numBroken + 1
						save(player,"tcmKievDeal.EmbassiesWith" .. otherPlayerID, 0)
					end
				end
			end
			local diploGold = player:GetGoldPerTurnFromDiplomacy()
			local defensivePacts = Teams[player:GetTeam()]:GetDefensivePactCount()
			local researchAgreements = player:GetScienceFromResearchAgreementsTimes100()
			if load(player,"tcmKievDeal.Gold") > diploGold then numBroken = numBroken + 1 end
			if load(player,"tcmKievDeal.DefensivePact") > defensivePacts then numBroken = numBroken + 1 end
			if load(player,"tcmKievDeal.ResearchAgreements") > researchAgreements then numBroken = numBroken + 1 end
			save(player,"tcmKievDeal.Gold", diploGold)
			save(player,"tcmKievDeal.DefensivePact", defensivePacts)
			save(player,"tcmKievDeal.ResearchAgreements", researchAgreements)
			local aPlayer = Teams[teamId]:GetLeaderID()
			local bPlayer = Teams[otherTeamId]:GetLeaderID()
			if Players[aPlayer]:IsFriendDeclaredWarOnUs(player:GetID()) then numBroken = numBroken + 1 end
			if Players[bPlayer]:IsFriendDeclaredWarOnUs(player:GetID()) then numBroken = numBroken + 1 end
			if player:IsFriendDeclaredWarOnUs(aPlayer) then numBroken = numBroken + 1 end
			if player:IsFriendDeclaredWarOnUs(bPlayer) then numBroken = numBroken + 1 end
			if numBroken > 7 then numBroken = 7 end

			local enemy
			if player:GetTeam() == teamId then
				enemy = Players[bPlayer]
			else
				enemy = Players[aPlayer]
			end
			local numCities = math.ceil(numBroken * 1.50)
			for city in enemy:Cities() do
				if numCities > 0 then
					local damage = city:GetMaxHitPoints() * (0.12 * numBroken)
					city:ChangeDamage(damage)
					numCities = numCities - 1
				end
			end
			local numUnits = math.ceil(numBroken * 2.50)
			for unit in enemy:Units() do
				if unit:IsCombatUnit() and numUnits > 0 then
					local damage = unit:GetMaxHitPoints() * (0.12 * numBroken)
					unit:ChangeDamage(damage)
					numUnits = numUnits - 1
				end
			end
		end
	end
end
GameEvents.DeclareWar.Add(warDeclared)
--====================================================================================================
--Only Gost Convoy related
--====================================================================================================
local hasThisMatchEverEvenHadTheUnit

function uniqueBorn(playerID, unitID)
	if not(hasThisMatchEverEvenHadTheUnit) then
		local player = Players[playerID]
		local unit = player:GetUnitByID(unitID)
		if unit:GetUnitType() == gostID then
			hasThisMatchEverEvenHadTheUnit = yes
		end
	end
end
Events.SerialEventUnitCreated.Add(uniqueBorn)

function GostConvoyXP(playerID)
	local player = Players[playerID]
	if hasThisMatchEverEvenHadTheUnit and player:GetCivilizationType() ~= civilizationID and player:GetUnitClassCount(GameInfoTypes["UNITCLASS_PIKEMAN"]) > 0 then
		local Gosts = {}
		local hasGost = false
		for unit in player:Units() do
			if unit:GetUnitType() == gostID then
				table.insert(Gosts, unit)
				hasGost = true
			end
		end
		if hasGost == true then
			for resource in GameInfo.Resources() do
				if resource.Happiness > 0 then
					local numExport = player:GetResourceExport(GameInfoTypes[resource.Type])
					local previousNumExport = load(player, 'tcmNumExportedResource' .. resource.Type)
					if previousNumExport == nil then previousNumExport = 0 end
					if numExport > previousNumExport then
						for key,unit in pairs(Gosts) do
							unit:ChangeExperience(2)
						end
					end
					if not(numExport == previousNumExport) then save(player, 'tcmNumExportedResource' .. resource.Type, numExport) end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(GostConvoyXP)

function goldFromPromotion(ownerId, unitId, ePromotion)
	local player = Players[ownerId]
	local unit = player:GetUnitByID(unitId)
	if unit:GetUnitType() == gostID then
		local plot = unit:GetPlot()
		local doBreak = false
		for loopPlot in PlotAreaSweepIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if doBreak == true then break end
			for i = 0, loopPlot:GetNumUnits() - 1, 1 do  
				local otherUnit = loopPlot:GetUnit(i)
				if otherUnit and otherUnit:GetOwner() == ownerId and otherUnit:GetUnitType() == GameInfoTypes["UNIT_MERCHANT"] then
					local gold = 50
					player:ChangeGold(gold)
					doBreak = true
					break
				end
			end
		end
	end
end
GameEvents.UnitPromoted.Add(goldFromPromotion)
--====================================================================================================
--====================================================================================================