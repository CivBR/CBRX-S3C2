-- ========= --
-- UTILITIES --
-- ========= --

local activePlayerID = Game.GetActivePlayer()

function JFD_GetRandom(lower, upper)
	return Game.Rand((upper + 1) - lower, "") + lower
end

local iMaxNumPotlatch = 36
local tPotlatchBuildings = {}

--hi Sas here these 3 things were breaking the whole lua file so I broke it completely by commenting them out url welcome urd no thanks necessary--

--for i = 1, iMaxNumPotlatch, 1 do
--	local iPotlatch = GameInfoTypes["BUILDING_US_POTLATCH_HOUSE_" .. i]
--	local iChanceDenominator = 2 + i
--	tPotlatchBuildings[iPotlatch] = iChanceDenominator
--end


--local tLandAnimals = {}
--tLandAnimals[1] = {Type=GameInfoTypes["RESOURCE_HORSE"], Name=Locale.ConvertTextKey("TXT_KEY_RESOURCE_HORSES")}
--local iLandTableNum = 2
--for ("SELECT * FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_PASTURE') UNION SELECT * FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CAMP')") do
--	tLandAnimals[iLandTableNum] = {Type=row.ID, Name=Locale.ConvertTextKey(row.Description)}
--	iLandTableNum = iLandTableNum + 1
--end


--local tSeaAnimals = {}
--local iSeaTableNum = 1
--for ("SELECT * FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_FISHING_BOATS')") do
--	tSeaAnimals[iSeaTableNum] = {Type=row.ID, Name=Locale.ConvertTextKey(row.Description)}
--end

-- ========= --
-- FUNCTIONS --
-- ========= --

local tTeamPlayers = {}
function TabulateCivsPerTeam()
	for teamID, pTeam in pairs(Teams) do
		if (not pTeam:IsBarbarian()) and (not pTeam:IsMinorCiv()) then
			tTeamPlayers[teamID] = {}
		end
	end
	
	for playerID, pPlayer in pairs(Players) do
		if (not pPlayer:IsBarbarian()) and (not pPlayer:IsMinorCiv()) then
			local iLocalTeam = pPlayer:GetTeam()
			local iNumber = #tTeamPlayers[iLocalTeam] or 0
			tTeamPlayers[iLocalTeam][iNumber + 1] = playerID
		end
	end
end

function FindValidPotlatchPlot(pCity)
	-- we skip 0 to avoid the city plot itself
	for i = 1, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if (pPlot:GetResourceType() == -1) and (not pPlot:IsImpassable()) and (pPlot:GetOwner() == pCity:GetOwner()) then
			return pPlot
		end
	end
	return
end

function Kwak_PotlatchBuilt(kwakPlayerID, cityID, buildingType)
	if tPotlatchBuildings[buildingType] then
		local pPlayer = Players[kwakPlayerID]
		
		-- distribute gold among all met civs
		local teamID = pPlayer:GetTeam()
		local pTeam = Teams[teamID]
		local tPlayersWhoGetGold = {}
		local iPlayerNum = 1
		for k, v in pairs(tTeamPlayers) do
			if k ~= teamID and pTeam:IsHasMet(k) then
				for _, playerID in pairs(tTeamPlayers[k]) do
					tPlayersWhoGetGold[iPlayerNum] = playerID
					iPlayerNum = iPlayerNum + 1
				end
			end
		end
		local iOwnedGold = pPlayer:GetGold()
		local iNumReceivers = #tPlayersWhoGetGold
		local iAmountToGiveEachPlayer = math.floor(iOwnerGold / iNumReceivers)
		local iTotalAmountGiven = iAmountToGiveEachPlayer * iNumReceivers
		for k, v in pairs(tPlayersWhoGetGold) do
			local pReceivingPlayer = Players[v]
			pReceivingPlayer:ChangeGold(iAmountToGiveEachPlayer)
			if v == activePlayerID then
				Events.GameplayAlertMessage("The Kwakwakawak'w have given you " .. iAmountToGiveEachPlayer .. " [ICON_GOLD] Gold to celebrate a Potlatch!")
			end
		end
		pPlayer:ChangeGold(-iTotalAmountGiven)
		if kwakPlayerID == activePlayerID then
			Events.GameplayAlertMessage("To celebrate a Potlatch, you gave away " .. iAmountToGiveEachPlayer .. " [ICON_GOLD] Gold to each other known civilization!")
		end
		
		-- chance of getting an animal resource
		-- 100% chance for the first one, then 75%, 60%, etc...
		-- the odds are 3/(n+2) where 'n' is the number of the current potlatch
		local iRandDenominator = tPotlatchBuildings[buildingType]
		local bDoesAnimalTrigger = (JFD_GetRandom(1, iRandDenominator) < 4)
		if bDoesAnimalTrigger then
			local pCity = pPlayer:GetCityByID(cityID)
			local pPlot = FindValidPotlatchPlot(pCity)
			if pPlot then
				if pPlot:IsWater() then
					local iRand = JFD_GetRandom(1, #tSeaAnimals)
					local iRes = tSeaAnimals[iRand].Type
					local sName = tSeaAnimals[iRand].Name
					pPlot:SetResourceType(iRes, 1)
					if playerID == activePlayerID then
						Events.GameplayAlertMessage("Your Potlatch revealed a source of " .. sName .. "!")
					end
				else
					local iRand = JFD_GetRandom(1, #tLandAnimals)
					local iRes = tLandAnimals[iRand].Type
					local sName = tLandAnimals[iRand].Name
					pPlot:SetResourceType(iRes, 1)
					if playerID == activePlayerID then
						Events.GameplayAlertMessage("Your Potlatch revealed a source of " .. sName .. "!")
					end
				end
			end
		end
	end
end

Events.LoadScreenClose.Add(TabulateCivsPerTeam)
GameEvents.CityConstructed.Add(Kwak_PotlatchBuilt)