-- ========= --
-- UTILITIES --
-- ========= --

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

-- ======= --
-- DEFINES --
-- ======= --

local iCiv = GameInfoTypes["CIVILIZATION_SAS_CHAD"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

-- ==================================== --
-- UA: GAIN POPULATION FROM TRADE TECHS --
-- ==================================== --

local iActivePlayer = Game.GetActivePlayer()
local iDesert = GameInfoTypes["TERRAIN_DESERT"]

local tChadTeams = {}
function TabulateChadTeams()
	for playerID, pPlayer in pairs(Players) do
		if pPlayer:GetCivilizationType() == iCiv then
			local iTeam = pPlayer:GetTeam()
			-- if there are multiple chads on the same team, the first player is marked as "correct"
			-- this doesn't AVOID bugs w/ multiple chads on a team, but it means that they won't affect the human player
			-- in any case, nobody plays with teams so i doubt anyone will complain about this :b
			if not tChadTeams[iTeam] then
				tChadTeams[iTeam] = playerID
			end
		end
	end
end

local tTradeTechs = {}
for row in DB.Query("SELECT * FROM Technologies WHERE InternationalTradeRoutesChange > 0") do
	tTradeTechs[row.ID] = Locale.ConvertTextKey(row.Description)
end

function Chad_ResearchPop(teamID, techID, bValue)
	if not bValue then return end
	print("CHAD | TeamSetHasTech fired")
	if tTradeTechs[techID] then
		print("CHAD | new tech is a trade tech")
		local iChadPlayer = tChadTeams[teamID]
		if iChadPlayer then
			print("CHAD | there's a chad player on this team")
			local pPlayer = Players[iChadPlayer]
			
			-- first, collect trade route destinations
			-- remember that GetTradeRoutesToYou doesn't include internal trade, hence why we do this multi-step process
			local tDestinations = {}
			for k, v in pairs(pPlayer:GetTradeRoutes()) do
				if v.FromID == v.ToID then
					tDestinations[v.ToCity] = true
				end
			end
			for k, v in pairs(pPlayer:GetTradeRoutesToYou()) do
				tDestinations[v.ToCity] = true
			end
			
			-- now iterate through cities to give the appropriate amount of population
			for pCity in pPlayer:Cities() do
				local iPopAmount = 1
				if tDestinations[pCity] then
					iPopAmount = iPopAmount + 1
				end
				if pCity:Plot():GetTerrainType() == iDesert then
					iPopAmount = iPopAmount + 1
				end
				print("CHAD | " .. pCity:GetName() .. " should be gaining " .. iPopAmount .. " Population")
				pCity:ChangePopulation(iPopAmount, true)
			end
			
			if iChadPlayer == iActivePlayer then
				Events.GameplayAlertMessage("Researching " .. tTradeTechs[techID] .. " has led to a boom in [ICON_CITIZEN] Population!")
			end
		end
	end
end

if bIsActive then
	GameEvents.TeamSetHasTech.Add(Chad_ResearchPop)
	Events.LoadScreenClose.Add(TabulateChadTeams)
end

-- ============================================== --
-- UU: MOVEMENT FOR UNITS ADJACENT TO A TECHNICAL --
-- ============================================== --

local iNumDirections = DirectionTypes.NUM_DIRECTION_TYPES - 1
local iTechnicalClass = GameInfoTypes["UNITCLASS_ANTI_TANK_GUN"]
local iTechnical = GameInfoTypes["UNIT_SAS_TECHNICAL"]

function Chad_AddMovesNearTechnical(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:HasUnitOfClassType(iTechnicalClass) then
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == iTechnical then
				local iX, iY = pUnit:GetX(), pUnit:GetY()
				for iDir = 0, iNumDirections, 1 do
					local pAdjPlot = Map.PlotDirection(iX, iY, iDir)
					if pAdjPlot then
						local iNumUnits = pAdjPlot:GetNumUnits()
						if iNumUnits >= 1 then
							for iUnitNum = 0, iNumUnits - 1, 1 do
								local pAdjUnit = pAdjPlot:GetUnit(iUnitNum)
								local iNewMoves = pAdjUnit:MaxMoves() + 60
								-- we use Set rather than Change in case a unit is adjacent to multiple
								pAdjUnit:SetMoves(iNewMoves)
							end
						end
					end
				end
			end
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(Chad_AddMovesNearTechnical)
end
