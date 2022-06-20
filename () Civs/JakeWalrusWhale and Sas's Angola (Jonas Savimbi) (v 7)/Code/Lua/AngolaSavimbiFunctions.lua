--============================================================
-- GLOBALS
--============================================================
include("UniqueDiplomacyUtils.lua")

local iAngola = GameInfoTypes["CIVILIZATION_JWW_ANGOLA"]

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
local bIsActive = JFD_IsCivilisationActive(iAngola)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--===========================================================================
-- UA (Three-Day Halloween)
--===========================================================================
local iMine = GameInfoTypes["IMPROVEMENT_MINE"]
local iBloodDiamonds = GameInfoTypes["RESOURCE_JWW_BLOOD_DIAMONDS"]
-----------------------------------------------------------------------------
-- Defeating enemy units on their mines will automatically pillage their mine and grant a free "Blood Diamonds" resource for the remainer of the war.
-----------------------------------------------------------------------------
local tAlivePlayers = {} --Table of all Alive Players who are not Angola
function JWW_WhereThePlayersAt()
	for k, v in pairs(Players) do
		tAlivePlayers[k] = {War = false, Diamonds = 0}
	end
end

function JWW_UpdateAtWarPlayers(iPlayer) --include city-states somehow later
	local iTotalDiamonds = 0
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAngola then
		local bWar = false
		for k, v in pairs(tAlivePlayers) do
			local kPlayer = Players[k]
			if kPlayer ~= pPlayer then
				local iNumDiamondsLost = 0
				local iEnemyTeam = kPlayer:GetTeam()
				if pTeam:IsAtWar(iEnemyTeam) then
					v.War = true
					bWar = true
				else
					if tAlivePlayers[k].Diamonds and (tAlivePlayers[k].Diamonds > 0) then
						iTotalDiamonds = iTotalDiamonds - tAlivePlayers[k].Diamonds
						tAlivePlayers[k] = {War = false, Diamonds = 0}
					end
				end
			end
		end
		if iTotalDiamonds < 0 then
			pPlayer:ChangeNumResourceTotal(iBloodDiamonds, iTotalDiamonds)
		end
		if not bWar then
			local iTotalDiamonds = (pPlayer:GetNumResourceTotal(iBloodDiamonds) * -1)
			pPlayer:ChangeNumResourceTotal(iBloodDiamonds, iTotalDiamonds)
		end
	end
end

function JWW_ThxForTheDiamondsNerd(iPlayer, iUnit, unitType, iX, iY, bDelay, killerID)
	if bDelay == true then return end
	if (killerID == -1) then return end
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pKiller = Players[Map.GetPlot(iX,iY):GetUnit(0):GetOwner()] --might return an error sometimes but oh well
	if (pKiller ~= pPlayer) and pKiller then
		if pKiller:IsAlive() and pKiller:GetCivilizationType() == iAngola then
			local pPlot = pUnit:GetPlot()
			if pPlot:IsOwned() and (pPlot:GetOwner() == iPlayer) then
				if pPlot:GetImprovementType() == iMine and (not pPlot:IsImprovementPillaged()) then
					pPlot:SetImprovementPillaged(true)
					pKiller:ChangeNumResourceTotal(iBloodDiamonds, 1)
					for k, v in pairs(tAlivePlayers) do
						if k == iPlayer then
							local iDiamonds = (tAlivePlayers[k].Diamonds + 1)
							tAlivePlayers[k] = {War = true, Diamonds = iDiamonds}
							if pKiller:IsHuman() then
								Events.GameplayAlertMessage('You have gained +1 [ICON_RES_JWW_BLOOD_DIAMONDS]! You have a total of ' .. iDiamonds .. ' [ICON_RES_JWW_BLOOD_DIAMONDS] gained in this war against ' .. pPlayer:GetName() ..'.')
							end
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- For every newly acquired luxury resource connected to Angola, you get a free random land unit.
-----------------------------------------------------------------------------
--Arigato Chrisy-san

local tLuxPolPairs = {}
for row in GameInfo.JWW_Angola_ResourcePolicyLink() do
	tLuxPolPairs[GameInfoTypes[row.ResourceType]] = GameInfoTypes[row.PolicyType]
end
-- Iterate our database table; set the key of our Lua table to be the ID of the Resource, and the value to be the ID of the dummy policy

local tUnits = {}
for row in DB.Query("SELECT ID, (SELECT ID FROM Eras WHERE Type = (SELECT Era FROM Technologies WHERE Type = PrereqTech)) EraID FROM Units WHERE Domain = 'DOMAIN_LAND' AND Combat > 0 AND Type != 'UNIT_MECH' AND Type IN (SELECT DefaultUnit FROM UnitClasses) AND CombatClass != 'UNITCOMBAT_RECON' AND Cost > 0") do
	-- Iterate through a table generated according to this query. I've basically shown you what it's returning already but if you wanna see the raw data then just paste it into SQLSpy
	local iEra = row.EraID or 0
	-- Warrior will have a nil Era, because it has no PrereqTech, so have to deal with that and any other techless Unit. Hm I hope this isn't gonna pick up dummy Units shud probs chuck in a cost check too or smth idk if there's an issue you'll hear about it
	if not tUnits[iEra] then
		tUnits[iEra] = {}
	end
	table.insert(tUnits[iEra], row.ID)
	-- Create a nested table, with the Key as the Era and the value as each Unit. This can then be used for randoming
end

local AttackID = GameInfoTypes["UNITAI_ATTACK"]

function C15_JWW_Angola_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAngola then
		-- tbh I prefer the nested format but /shrug
		local pCapital = pPlayer:GetCapitalCity()
		local pPlot = (pCapital and pCapital:Plot()) or (not pCapital and pPlayer:GetStartingPlot())
		-- Bit of Lua magic which hopefully won't backfire on me; should define pPlot as pCapital:Plot if pCapital isn't nil, otherwise it'll be GetStartingPlot.
		--print(pPlot:GetX(), pPlot:GetY()) -- For testing the above :p Just uncomment to run
		local tNowHad = {}
		for k, v in pairs(tLuxPolPairs) do
			-- Iterate our link table
			if pPlayer:GetNumResourceTotal(k) > 0 and not pPlayer:HasPolicy(v) then
				-- If the Player has the current Resource but doesn't have its respective Policy:
				if Player.GrantPolicy then
					pPlayer:GrantPolicy(v, true)
				else
					pPlayer:SetNumFreePolicies(1)
					pPlayer:SetNumFreePolicies(0)
					pPlayer:SetHasPolicy(v, true)
				end
				-- Snippet for granting policies, making use of the CP's more reliable method where possible
				local iEra = pPlayer:GetCurrentEra()
				local tEra = tUnits[iEra]
				-- Get a table of the Units valid for the current era
				local iUnit = tEra[JFD_GetRandom(1, #tEra)]
				-- Pick a random Unit from the Era
				local pUnit = pPlayer:InitUnit(iUnit, pPlot:GetX(), pPlot:GetY())
				-- Create and save Unit
				pUnit:JumpToNearestValidPlot()
				-- Just to make sure it doesn't spawn on something/in a conquered capital or smth
				tNowHad[k] = true
			end
		end
		for k, v in pairs(tNowHad) do
			-- Small little efficiency thing, doesn't permasave so will only be effective for that session, but should reduce the tme spent iterating the link table
			tLuxPolPairs[k] = nil
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	Events.SequenceGameInitComplete.Add(JWW_WhereThePlayersAt)
	GameEvents.PlayerDoTurn.Add(JWW_UpdateAtWarPlayers)
	GameEvents.UnitPrekill.Add(JWW_ThxForTheDiamondsNerd)
	GameEvents.PlayerDoTurn.Add(C15_JWW_Angola_DoTurn)
end
--===========================================================================
-- UU (T-55)
--===========================================================================
local iT55 = GameInfoTypes["UNIT_JWW_T55"]
local iTankClass = GameInfoTypes["UNITCLASS_TANK"]
local iReclaimedProm = GameInfoTypes["PROMOTION_JWW_T55_RECLAIMED"]
local iCapturedProm = GameInfoTypes["PROMOTION_JWW_T55_CAPTURED"]
-----------------------------------------------------------------------------
-- 1. Instead of dying, T-55s are instead captured by the enemy.
-- 2. Recapturing T-55s grant Golden Age Points.
-----------------------------------------------------------------------------
function JWW_TankCaptured(iPlayer, iUnit, unitType, iPlotX, iPlotY, bDelay, killerID)
	if bDelay == false then return end
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	local pKiller = Players[killerID]
	if pKiller ~= pPlayer then
		if pUnit:GetUnitType() == iT55 then
			if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAngola then
				if not pUnit:IsHasPromotion(iReclaimedProm) then
					local pPlot = pUnit:GetPlot()
					local pNewUnit = pKiller:InitUnit(iT55, pPlot:GetX(), pPlot:GetY(), pUnit:GetUnitAIType())
					pNewUnit:JumpToNearestValidPlot()
				end
			--2.
			elseif pKiller:IsAlive() and pKiller:GetCivilizationType() == iAngola then
				local pPlot = pUnit:GetPlot()
				local pNewUnit = pKiller:InitUnit(iT55, pPlot:GetX(), pPlot:GetY(), pUnit:GetUnitAIType())
				pNewUnit:JumpToNearestValidPlot()
				pNewUnit:SetHasPromotion(iReclaimedProm, true) --T-55s can only be reclaimed by Angola once.
				pKiller:ChangeGoldenAgeProgressMeter(25)
				if pKiller:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iX, iY))), "+25 [ICON_GOLDEN_AGE]", 1)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Angolan units will have a combat bonus in territories of Civs that have a captured T-55.
-----------------------------------------------------------------------------
function JWW_DeathToTheMPLA(iPlayer) --what the fuck did I just write, this is ugly as shit
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAngola then
		local tProm = {}
		for k, v in pairs(tAlivePlayers) do --checks for other player has a T55 and is at war with Angola
			local bTank = false
			local kPlayer = Players[k]
			if kPlayer:HasUnitOfClassType(iTankClass) then
				if v.War == true then
					for pUnit in kPlayer:Units() do
						if pUnit:GetUnitType() == iT55 then
							bTank = true
							break
						end
					end
				end
			end

			if bTank then
				for pUnit in pPlayer:Units() do
					local bProm = false
					pUnit:SetHasPromotion(iCapturedProm, false)
					local pPlot = pUnit:GetPlot()
					if pPlot:IsOwned() and (pPlot:GetOwner() == k) then
						bProm = true
						tProm[pUnit] = bProm
					end
				end
			else
				for pUnit in pPlayer:Units() do
					pUnit:SetHasPromotion(iCapturedProm, false)
				end
			end
		end		
						
		for unit, bool in pairs(tProm) do
			if bool == true then --if this unit met the conditions
				unit:SetHasPromotion(iCapturedProm, true)
			end
		end
	end
end						
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.UnitPrekill.Add(JWW_TankCaptured)
	GameEvents.PlayerDoTurn.Add(JWW_DeathToTheMPLA)
end
--===========================================================================
-- UB (Diamang Mine)
--===========================================================================
local iDiamangMine = GameInfoTypes["BUILDING_JWW_DIAMANG_MINE"]
local iDiamangMineDummy = GameInfoTypes["BUILDING_JWW_DIAMANG_TRAIN_UNITS"]
-----------------------------------------------------------------------------
-- 1. Units are trained faster for each resource in this city that is traded away.
-- 2. Trade Deals involving resources in city limits have a chance to grant extra gold, production, or even combat units.
-----------------------------------------------------------------------------
function Tar_ResourcesEqualAKs(iPlayer) --optimized from Tar
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iAngola then
		local ResourcesTraded = {}
		for resource in GameInfo.Resources() do
			local numExport = pPlayer:GetResourceExport(GameInfoTypes[resource.Type])
			if numExport > 0 --[[and resource.Happiness > 0--]] then
				table.insert(ResourcesTraded, resource.Type)
			end
		end

		for pCity in pPlayer:Cities() do
			local iProd = 0
			local iNum = 0
			if pCity:IsHasBuilding(iDiamangMine) then
				if ResourcesTraded then
					for k, resource in pairs(ResourcesTraded) do
						if pCity:IsHasResourceLocal(GameInfoTypes[resource]) then
							for i = 0, pCity:GetNumCityPlots() - 1, 1 do
								local pPlot = pCity:GetCityIndexPlot(i)
								if pPlot ~= nil then
									if pPlot:GetOwner() == iPlayer and pCity:IsWorkingPlot(pPlot) and pPlot:GetResourceType(GameInfoTypes[resource]) then
										iNum = iNum + 1
										if iNum < 5 then
											pCity:SetNumRealBuilding(iDiamangMineDummy, iNum)
										end
										
										--2.
										if JFD_GetRandom(1, 33) == 1 then
											local iNum = JFD_GetRandom(1, 4)
											if iNum == 1 then --Combat Unit
												local pPlot = pCity:Plot()
												local iEra = pPlayer:GetCurrentEra()
												local tEra = tUnits[iEra]
												local iUnit = tEra[JFD_GetRandom(1, #tEra)]
												local pUnit = pPlayer:InitUnit(iUnit, pPlot:GetX(), pPlot:GetY())
												pUnit:JumpToNearestValidPlot()
											elseif iNum == 2 then --Worker
												local pPlot = pCity:Plot()
												local pUnit = pPlayer:InitUnit(iWorker, pPlot:GetX(), pPlot:GetY())
												pUnit:JumpToNearestValidPlot()
											elseif iNum == 3 then --Gold
												pPlayer:ChangeGold(JFD_GetRandom(25,50))
											else --Prod
												iProd = iProd + 15
											end
										end	
										break	
									end
								end
							end
						end
					end
				end
			end
			pCity:ChangeProduction(iProd)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(Tar_ResourcesEqualAKs)
end
--===========================================================================
-- OTHER
--===========================================================================
local iDMSAngola = GameInfoTypes["CIVILIZATION_DMS_ANGOLA"]
-----------------------------------------------------------------------------
-- Unique Diplo Responses with DMS's Angola (the MPLA)
-----------------------------------------------------------------------------
--stolen from Typhlomence
function Typh_SavimbiNetoUniqueDiplo()
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
        local player = Players[playerID]
        if (player and player:IsAlive() and player:IsHuman()) then
			local civilizationID = player:GetCivilizationType()
			if civilizationID == iDMSAngola then
				ChangeDiplomacyResponse("LEADER_JWW_JONAS_SAVIMBI", "RESPONSE_FIRST_GREETING",  "TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_FIRSTGREETING%",	"TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NETO_FIRSTGREETING_1",	500)
				ChangeDiplomacyResponse("LEADER_JWW_JONAS_SAVIMBI", "RESPONSE_DEFEATED",  "TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DEFEATED%",	"TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NETO_DEFEATED_1",	500)
				ChangeDiplomacyResponse("LEADER_JWW_JONAS_SAVIMBI", "RESPONSE_WORK_AGAINST_SOMEONE",  "TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DENOUNCE%",	"TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NETO_DENOUNCE_1",	500)
				ChangeDiplomacyResponse("LEADER_JWW_JONAS_SAVIMBI", "RESPONSE_DOW_GENERIC",  "TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DOW_GENERIC%",	"TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NETO_DOW_GENERIC_1",	500)
				ChangeDiplomacyResponse("LEADER_JWW_JONAS_SAVIMBI", "RESPONSE_GREETING_HOSTILE_HELLO",  "TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_GREETING_HOSTILE_HELLO%",	"TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NETO_GREETING_HOSTILE_HELLO_1",	500)
				break
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(Typh_SavimbiNetoUniqueDiplo)
--===========================================================================