--============================================================
-- GLOBALS
--============================================================
include("FLuaVector.lua")

local iTetouan = GameInfoTypes["CIVILIZATION_JWW_TETOUAN"]
local iPrivateerClass = GameInfoTypes["UNITCLASS_PRIVATEER"]

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
local bIsActive = JFD_IsCivilisationActive(iTetouan)

function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--===========================================================================
-- UA (Pirate Queen of the Western Seas)
--===========================================================================
local iMazmorra = GameInfoTypes["BUILDING_JWW_MAZMORRA"]
local iNoCaptivesPromo = GameInfoTypes["PROMOTION_JWW_TETOUAN_CAPTIVES_0"]
local iCaptivesPromo10 = GameInfoTypes["PROMOTION_JWW_TETOUAN_CAPTIVES_10"]
local iSea = GameInfoTypes["DOMAIN_SEA"]
local iCoastalRaider = GameInfoTypes["PROMOTION_COASTAL_RAIDER_1"]

local tPromos = {}
local iVal = 0
repeat
	tPromos[iVal] = {Promo=GameInfoTypes["PROMOTION_JWW_TETOUAN_CAPTIVES_" .. iVal]}
	iVal = iVal + 1
until iVal == 11 --Can only have 10 captives at once
print(tPromos)
-----------------------------------------------------------------------------
-- Naval Units acquire captives upon capturing cities
-----------------------------------------------------------------------------
function JWW_PiratesStealFromCities(iOldPlayer, bCapital, iPlotX, iPlotY, iNewPlayer, iOldPop, bConquest, iGreatWorkCount)
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	local pPlayer = Players[iNewPlayer]
	if pPlayer and pPlayer:GetCivilizationType() == iTetouan then
		local pUnit = pPlot:GetUnit()
		if pUnit and pUnit:GetDomainType() == iSea then
			 for k, v in ipairs(tPromos) do
                if pUnit:IsHasPromotion(v.Promo) then
					if k < 8 then
						pUnit:SetHasPromotion(v.Promo, false)
						local iVal = k + 3
						pUnit:SetHasPromotion(tPromos[iVal].Promo, true)
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+3 Captives[ENDCOLOR]", 0)
						break
					elseif k < 10 then
						pUnit:SetHasPromotion(v.Promo, false)
						pUnit:SetHasPromotion(iCaptivesPromo10, true)
						local iNum = 10 - k
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+" .. iNum .. " Captives[ENDCOLOR]", 0)
						break
					end
				end
			end
		end
	end
end		
-----------------------------------------------------------------------------
-- Naval Units acquire captives upon defeating other Naval Units
-----------------------------------------------------------------------------
function JWW_PiratesStealFromShips(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	local bKill = false
	local pPlot = Map.GetPlot(iX, iY)
	if not bDelay then return end
	local pUnit = pPlot:GetUnit(0)
	if pUnit and pUnit:GetDomainType() == iSea then
		local pPlayer = Players[pUnit:GetOwner()] 
		if pUnit ~= pPlayer:GetUnitByID(unitID) then
			if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
				for k, v in ipairs(tPromos) do
					if pUnit:IsHasPromotion(v.Promo) then
						if k < 9 then
							pUnit:SetHasPromotion(v.Promo, false)
							local iVal = k + 2
							pUnit:SetHasPromotion(tPromos[iVal].Promo, true)
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+2 Captives[ENDCOLOR]", 0)
							break
						else
							pUnit:SetHasPromotion(v.Promo, false)
							pUnit:SetHasPromotion(iCaptivesPromo10, true)
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+1 Captives[ENDCOLOR]", 0)
						end
					end
				end
			end

		else --if the killed unit is captured (because Privateers be annoying like that)
			for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
				local pPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
				if pPlot and pPlot:IsUnit() then
					for i = 0, pPlot:GetNumUnits() - 1 do
						local pEnemyUnit = pPlot:GetUnit(i)
						if pEnemyUnit and (pEnemyUnit ~= pUnit) then
							if pEnemyUnit:GetUnitClassType() == iPrivateerClass or pEnemyUnit:IsRanged() then
								if killerID ~= pUnit:GetOwner() then
									local pPlayer = Players[pEnemyUnit:GetOwner()] 
									if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
										for k, v in ipairs(tPromos) do
											if pEnemyUnit:IsHasPromotion(v.Promo) then
												if k < 9 then
													pEnemyUnit:SetHasPromotion(v.Promo, false)
													local iVal = k + 2
													pEnemyUnit:SetHasPromotion(tPromos[iVal].Promo, true)
													Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+2 Captives[ENDCOLOR]", 0)
													break
												else
													pEnemyUnit:SetHasPromotion(v.Promo, false)
													pEnemyUnit:SetHasPromotion(iCaptivesPromo10, true)
													Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+1 Captives[ENDCOLOR]", 0)
												end
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
		end
	end
end	
-----------------------------------------------------------------------------
-- Naval Units acquire captives upon plundering Trade Routes
-----------------------------------------------------------------------------
function JWW_CargoShipsSuck(iPlayer, iUnit) --adapted from TarcisioCM
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == GameInfoTypes["UNIT_CARGO_SHIP"] then	
		local pPlot = pUnit:GetPlot()
		local enemyUnit = pPlot:GetUnit()
		if enemyUnit and enemyUnit:GetDomainType() == iSea then
			local enemyPlayer = Players[enemyUnit:GetOwner()]
			if enemyPlayer:IsAlive() and enemyPlayer:GetCivilizationType() == iTetouan then
				for k, v in ipairs(tPromos) do
					if enemyUnit:IsHasPromotion(v.Promo) then
						if k < 10 then
							enemyUnit:SetHasPromotion(v.Promo, false)
							local iVal = k + 1
							enemyUnit:SetHasPromotion(tPromos[iVal].Promo, true)
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_POSITIVE_TEXT]+1 Captives[ENDCOLOR]", 0)
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Returning captives to a city not in Resistance yields a burst of Production
-----------------------------------------------------------------------------
function JWW_AhoyLandHo(iPlayer)
	local iGoldModifier = 0
	local iTotalVal = 0
	local iTotalProd = 0
	local bHome = false
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
		for pUnit in pPlayer:Units() do
			local iProdModifier = 0
			if pUnit:GetDomainType() == iSea then
				if not pUnit:IsHasPromotion(iNoCaptivesPromo) then
					local pPlot = pUnit:GetPlot()
					if pPlayer:IsHuman() then
						if (pPlot:GetOwner() == iPlayer) and pPlot:IsCity() then --City plot itself needed
							local pCity = pPlot:GetPlotCity()
							if pCity and (not pCity:IsOccupied()) then
								for k, v in ipairs(tPromos) do
									if pUnit:IsHasPromotion(v.Promo) then
										pUnit:SetHasPromotion(v.Promo, false)
										pUnit:SetHasPromotion(iNoCaptivesPromo, true)
										iTotalVal = iTotalVal + k
										iProdModifier = iProdModifier + (k * 20)
										iTotalProd = iTotalProd + iProdModifier

										if pCity:IsHasBuilding(iMazmorra) then --UB effects are here
											iGoldModifier = iGoldModifier + iProdModifier
										end

										bHome = true
										break
									end
								end
								pCity:ChangeProduction(iProdModifier)
							end
						end

					elseif (pPlot:GetOwner() == iPlayer) then --For AI. Since I bet the AI won't bring the ships back to the city tile itself, I made it easier for them to get the loot they deserve.
						local pCity = pPlot:GetWorkingCity()
						if pCity and (not pCity:IsOccupied()) then
							for k, v in ipairs(tPromos) do
								if pUnit:IsHasPromotion(v.Promo) then
									pUnit:SetHasPromotion(v.Promo, false)
									pUnit:SetHasPromotion(iNoCaptivesPromo, true)
									iTotalVal = iTotalVal + k
									iProdModifier = iProdModifier + (k * 20)
									iTotalProd = iTotalProd + iProdModifier

									if pCity:IsHasBuilding(iMazmorra) then --UB effects are here
										iGoldModifier = iGoldModifier + iProdModifier
									end

									bHome = true
									break
								end
							end
						end
					end
				end
			end
		end
		pPlayer:ChangeGold(iGoldModifier)
		if bHome then
			if pPlayer:IsHuman() then
				Events.GameplayAlertMessage('When our ships returned home, they brought back ' .. iTotalVal .. ' in Captives, granting us [COLOR_POSITIVE_TEXT]+' .. iTotalProd .. ' Production[ENDCOLOR][ICON_PRODUCTION] and [COLOR_POSITIVE_TEXT]+' .. iGoldModifier .. ' Gold[ENDCOLOR][ICON_GOLD] in loot!')
			end
		end
	end
end
-----------------------------------------------------------------------------
-- All naval units start with the Coastal Raider I promotion
-----------------------------------------------------------------------------
function JWW_YouAreAPirate(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if (pUnit:GetDomainType() == iSea) and (pUnit:IsCombatUnit()) then
			if not pUnit:IsHasPromotion(iCoastalRaider) then
				pUnit:SetHasPromotion(iCoastalRaider, true)
			end
			pUnit:SetHasPromotion(iNoCaptivesPromo, true)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.CityCaptureComplete.Add(JWW_PiratesStealFromCities)
	GameEvents.UnitPrekill.Add(JWW_PiratesStealFromShips)
	GameEvents.PlayerDoTurn.Add(JWW_AhoyLandHo)
	GameEvents.CityTrained.Add(JWW_YouAreAPirate)
	GameEvents.CanSaveUnit.Add(JWW_CargoShipsSuck)
end
--===========================================================================
-- UU (Qursan)
--===========================================================================
local iQursan = GameInfoTypes["UNIT_JWW_QURSAN"]
-----------------------------------------------------------------------------
-- Heals in enemy territory if moves are left at the end of the turn
-----------------------------------------------------------------------------
function JWW_FreeHealsDude(iPlayer)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
		if pPlayer:HasUnitOfClassType(iPrivateerClass) then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == iQursan then
					if pUnit:GetMoves() > 0 then
						local pPlot = pUnit:GetPlot()
						if pPlot:IsOwned() then
							local pEnemy = Players[pPlot:GetOwner()]
							if pEnemy ~= pPlayer then
								iEnemyTeam = pEnemy:GetTeam()
								if pTeam:IsAtWar(iEnemyTeam) then
									pUnit:ChangeDamage(-10)
								end
							end
						end
					end

				elseif pUnit:GetDomainType() == iSea then -- Since Privateers/the UU can capture Ships, those ships need a way to gain captives
					local bProm = true
					for k, v in ipairs(tPromos) do
						if pUnit:IsHasPromotion(v.Promo) then
							bProm = false
						end
					end
					if bProm then
						pUnit:SetHasPromotion(iNoCaptivesPromo, true)
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Nearby enemy units give you small amounts of gold per turn
-----------------------------------------------------------------------------
function JWW_EnemyUnitsGiveMeGold(iPlayer)
	local iGold = 0
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTetouan then
		if pPlayer:HasUnitOfClassType(iPrivateerClass) then
			for pUnit in pPlayer:Units() do
				if pUnit:GetUnitType() == iQursan then
					for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
						local pPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
						if pPlot and pPlot:IsUnit() then
							for i = 0, pPlot:GetNumUnits() - 1 do
								local pEnemyUnit = pPlot:GetUnit(i)
								local pEnemyPlayer = Players[pEnemyUnit:GetOwner()]
								if pEnemyPlayer ~= pPlayer then
									local iEnemyTeam = pEnemyPlayer:GetTeam()
									if pTeam:IsAtWar(iEnemyTeam) then
										iGold = iGold + 10
										if pPlayer:IsHuman() then
											Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pEnemyUnit:GetX(), pEnemyUnit:GetY()))), "[COLOR_YIELD_GOLD]+10 [ICON_GOLD][ENDCOLOR]", 0)
										end
									end
								end
							end
						end
					end
				end
			end
			pPlayer:ChangeGold(iGold)
		end
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_FreeHealsDude)
	GameEvents.PlayerDoTurn.Add(JWW_EnemyUnitsGiveMeGold)
end
--===========================================================================
-- UB (Mazmorra)
--===========================================================================
-- Generates Gold equal to Production provided by captives brought to this City (in UA Code)
--===========================================================================