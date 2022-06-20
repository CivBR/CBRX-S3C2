--===========================================================================
-- GLOBALS
--===========================================================================
local iTimorLeste = GameInfoTypes["CIVILIZATION_JWW_TIMOR-LESTE"]

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
local bIsActive = JFD_IsCivilisationActive(iTimorLeste)
--===========================================================================
-- UA
--===========================================================================
-- Religious Units give strength to adjacent units
-----------------------------------------------------------------------------
local iUAPromotion = GameInfoTypes["PROMOTION_JWW_TL_UA"]

local tReligUnits = {}
for row in DB.Query("SELECT ID FROM Units WHERE ReligiousStrength > 0") do
    tReligUnits[row.ID] = true
end

--Kudos to Chrisy
function C15_ReligiousUnitsBoostCombat(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTimorLeste and pPlayer:HasCreatedReligion() then
		for pUnit in pPlayer:Units() do
			if not tReligUnits[pUnit:GetUnitType()] then
				local bAdjReligious = false
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local pAdjacentPlot = Map.PlotDirection(pUnit:GetX(), pUnit:GetY(), direction)
					if pAdjacentPlot and pAdjacentPlot:IsUnit() then
						for i = 0, pAdjacentPlot:GetNumUnits() - 1 do
							local pAdjUnit = pAdjacentPlot:GetUnit(i)
							if tReligUnits[pAdjUnit:GetUnitType()] then
								bAdjReligious = true
								break
							end
						end
					end
				end
				if bAdjReligious and (not pUnit:IsHasPromotion(iUAPromotion)) then
					pUnit:SetHasPromotion(iUAPromotion, true)
					local iStrength = pUnit:GetBaseCombatStrength()
					local iAddStrength = iStrength / 2
					pUnit:SetBaseCombatStrength(iStrength + iAddStrength)
				elseif (not bAdjReligious) and pUnit:IsHasPromotion(iUAPromotion) then
					pUnit:SetHasPromotion(iUAPromotion, false)
					local iStrength = pUnit:GetBaseCombatStrength()
					local iSubtractStrength = iStrength / 3
					pUnit:SetBaseCombatStrength(iStrength - iSubtractStrength)
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Gain Faith per Trained Unit
-----------------------------------------------------------------------------
function JWW_FaithPerTrainedUnit(iPlayer, iCity, iUnit)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTimorLeste then
		local iEra = pPlayer:GetCurrentEra()
		iEra = iEra + 1
		pPlayer:ChangeFaith(iEra * 5)
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(C15_ReligiousUnitsBoostCombat)
	GameEvents.CityTrained.Add(JWW_FaithPerTrainedUnit)
end
--===========================================================================
-- UU (FALINTIL)
--===========================================================================
local iFalintil = GameInfoTypes["UNIT_JWW_FORCAS_DA_FALINTIL"]
-----------------------------------------------------------------------------
-- Gain promotion when at war with a civilization with a different religion or ideology.
-----------------------------------------------------------------------------
local iFreedom = GameInfoTypes["POLICY_BRANCH_FREEDOM"]
local iOrder = GameInfoTypes["POLICY_BRANCH_ORDER"]
local iAutocracy = GameInfoTypes["POLICY_BRANCH_AUTOCRACY"]
local iUUPromotion = GameInfoTypes["PROMOTION_JWW_TL_UU"]

function JWW_PromotionIfDiffReligionOrIdeology(iPlayer)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if pPlayer:IsAlive() then
		for pUnit in pPlayer:Units() do 
			if pUnit:GetUnitType() == iFalintil then
				for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
					local pOtherPlayer = Players[iPlayer]
					if pOtherPlayer ~= pPlayer then
						local pOtherTeam = pOtherPlayer:GetTeam()
						if pTeam:IsAtWar(pOtherTeam) then
							if pPlayer:HasCreatedReligion() then
								local pReligion = pPlayer:GetReligionCreatedByPlayer()
								if not pOtherPlayer:HasReligionInMostCities(pReligion) or pOtherPlayer:HasCreatedReligion() then
									if not pUnit:IsHasPromotion(iUUPromotion) then
										pUnit:SetHasPromotion(iUUPromotion, true)
										local pStrength = pUnit:GetBaseCombatStrength()
										local pAddStrength = pStrength + 25
										pUnit:SetBaseCombatStrength(pAddStrength)
										break
									else
										break
									end
								elseif pPlayer:IsPolicyBranchUnlocked(iFreedom) then
									if not pOtherPlayer:IsPolicyBrandUnlocked(iFreedom) then
										if not pUnit:IsHasPromotion(iUUPromotion) then
											pUnit:SetHasPromotion(iUUPromotion, true)
											local pStrength = pUnit:GetBaseCombatStrength()
											local pAddStrength = pStrength + 25
											pUnit:SetBaseCombatStrength(pAddStrength)
											break
										else
											break
										end
									end
								elseif pPlayer:IsPolicyBranchUnlocked(iOrder) then
									if not pOtherPlayer:IsPolicyBrandUnlocked(iOrder) then
										if not pUnit:IsHasPromotion(iUUPromotion) then
											pUnit:SetHasPromotion(iUUPromotion, true)
											local pStrength = pUnit:GetBaseCombatStrength()
											local pAddStrength = pStrength + 25
											pUnit:SetBaseCombatStrength(pAddStrength)
											break
										else
											break
										end
									end
								elseif pPlayer:IsPolicyBranchUnlocked(iAutocracy) then
									if not pOtherPlayer:IsPolicyBrandUnlocked(iAutocracy) then
										if not pUnit:IsHasPromotion(iUUPromotion) then
											pUnit:SetHasPromotion(iUUPromotion, true)
											local pStrength = pUnit:GetBaseCombatStrength()
											local pAddStrength = pStrength + 25
											pUnit:SetBaseCombatStrength(pAddStrength)
											break
										else
											break
										end
									end
								elseif pUnit:IsHasPromotion(iUUPromotion) then
									pUnit:SetHasPromotion(iUUPromotion, false)
									local pStrength = pUnit:GetBaseCombatStrength()
									local pSubtractStrength = pStrength - 25
									pUnit:SetBaseCombatStrength(pSubtractStrength)
									break
								else
									break
								end
							else
								for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
									local pExtraPlayer = Players[iPlayer]
									if pExtraPlayer ~= pPlayer then
										if pExtraPlayer:HasCreatedReligion() then
											local pReligion = pExtraPlayer:GetReligionCreatedByPlayer()
											if pPlayer:HasReligionInMostCities(pReligion) then
												if not pOtherPlayer:HasReligionInMostCities(pReligion) then
													if not pUnit:IsHasPromotion(iUUPromotion) then
														pUnit:SetHasPromotion(iUUPromotion, true)
														local pStrength = pUnit:GetBaseCombatStrength()
														local pAddStrength = pStrength + 25
														pUnit:SetBaseCombatStrength(pAddStrength)
														break
													else
														break
													end
												elseif pPlayer:IsPolicyBranchUnlocked(iFreedom) then
													if not pOtherPlayer:IsPolicyBrandUnlocked(iFreedom) then
														if not pUnit:IsHasPromotion(iUUPromotion) then
															pUnit:SetHasPromotion(iUUPromotion, true)
															local pStrength = pUnit:GetBaseCombatStrength()
															local pAddStrength = pStrength + 25
															pUnit:SetBaseCombatStrength(pAddStrength)
															break
														else
															break
														end
													end
												elseif pPlayer:IsPolicyBranchUnlocked(iOrder) then
													if not pOtherPlayer:IsPolicyBrandUnlocked(iOrder) then
														if not pUnit:IsHasPromotion(iUUPromotion) then
															pUnit:SetHasPromotion(iUUPromotion, true)
															local pStrength = pUnit:GetBaseCombatStrength()
															local pAddStrength = pStrength + 25
															pUnit:SetBaseCombatStrength(pAddStrength)
															break
														else
															break
														end
													end
												elseif pPlayer:IsPolicyBranchUnlocked(iAutocracy) then
													if not pOtherPlayer:IsPolicyBrandUnlocked(iAutocracy) then
														if not pUnit:IsHasPromotion(iUUPromotion) then
															pUnit:SetHasPromotion(iUUPromotion, true)
															local pStrength = pUnit:GetBaseCombatStrength()
															local pAddStrength = pStrength + 25
															pUnit:SetBaseCombatStrength(pAddStrength)
															break
														else
															break
														end
													end
												elseif pUnit:IsHasPromotion(iUUPromotion) then
													pUnit:SetHasPromotion(iUUPromotion, false)
													local pStrength = pUnit:GetBaseCombatStrength()
													local pSubtractStrength = pStrength - 25
													pUnit:SetBaseCombatStrength(pSubtractStrength)
													break
												else
													break
												end
											elseif pUnit:IsHasPromotion(iUUPromotion) then
												pUnit:SetHasPromotion(iUUPromotion, false)
												local pStrength = pUnit:GetBaseCombatStrength()
												local pSubtractStrength = pStrength - 25
												pUnit:SetBaseCombatStrength(pSubtractStrength)
											else
												break
											end
										end
									end
								end
							end
						elseif pUnit:IsHasPromotion(iUUPromotion) then
							pUnit:SetHasPromotion(iUUPromotion, false)
							local pStrength = pUnit:GetBaseCombatStrength()
							local pSubtractStrength = pStrength - 25
							pUnit:SetBaseCombatStrength(pSubtractStrength)
						else
							break
						end
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------
-- Upon death, Gives the enemy capital unhappiness dummy
-----------------------------------------------------------------------------
local iUUTurnDummy = GameInfoTypes["BUILDING_JWW_TL_UU_TURN_DUMMY"]
local iUUSadDummy = GameInfoTypes["BUILDING_JWW_TL_UU_SAD_DUMMY"]
											
function JWW_OnDeathGiveDummies(iPlayer, iUnit, iPlotX, iPlotY, bDelay, iByPlayer)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnit)
	if pUnit:GetUnitType() == iFalintil then
		local pPlot = pUnit:GetPlot()
		local pTeam = Teams[pPlayer:GetTeam()]
		for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
			local pOtherPlayer = Players[iPlayer]
			if pOtherPlayer ~= pPlayer then
				local iOtherTeam = pOtherPlayer:GetTeam()
				if pTeam:IsAtWar(iOtherTeam) then
					local pCap = pOtherPlayer:GetCapitalCity()
					local iNumDummies = pCap:GetNumBuilding(iUUTurnDummy)
					iNumDummies = iNumDummies + 10
					pCap:SetNumRealBuilding(iUUTurnDummy, iNumDummies)
					if pCap:IsHasBuilding(iUUTurnDummy) then
						local iNumSadDummies = math.ceil(iNumDummies / 10)
						if iNumSadDummies == 1 then
							pCap:SetNumRealBuilding(iUUSadDummy, 1)
						elseif iNumSadDummies == 2 then
							pCap:SetNumRealBuilding(iUUSadDummy, 2)
						elseif iNumSadDummies == 3 then
							pCap:SetNumRealBuilding(iUUSadDummy, 3)
						elseif iNumSadDummies == 4 then
							pCap:SetNumRealBuilding(iUUSadDummy, 4)
						elseif iNumSadDummies == 5 then
							pCap:SetNumRealBuilding(iUUSadDummy, 5)
						elseif iNumSadDummies == 6 then
							pCap:SetNumRealBuilding(iUUSadDummy, 6)
						elseif iNumSadDummies == 7 then
							pCap:SetNumRealBuilding(iUUSadDummy, 7)
						elseif iNumSadDummies == 8 then
							pCap:SetNumRealBuilding(iUUSadDummy, 8)
						elseif iNumSadDummies == 9 then
							pCap:SetNumRealBuilding(iUUSadDummy, 9)
						elseif iNumSadDummies <= 10 then
							pCap:SetNumRealBuilding(iUUSadDummy, 10)
						end
					end
				end
			end
		end
	end
end

function JWW_DummyTurnCounter(iPlayer) -- Unhappiness Dummy Deteriorates Over Time)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then
		for pCity in pPlayer:Cities() do

			if pCity ~= (pPlayer:GetCapitalCity()) then -- if Dummies are not in a capital, delete them
				pCity:SetNumRealBuilding(iUUSadDummy, 0)
				pCity:SetNumRealBuilding(iUUTurnDummy, 0)
			end

			if pCity:IsHasBuilding(iUUTurnDummy) then
				local iNumDummies = pCity:GetNumBuilding(iUUTurnDummy)
				local iNewNumDummies = iNumDummies - 1
				pCity:SetNumRealBuilding(iUUTurnDummy, iNewNumDummies)
				local iNumSadDummies = math.ceil(iNewNumDummies / 10)
				if iNumSadDummies == 1 then
					pCity:SetNumRealBuilding(iUUSadDummy, 1)
				elseif iNumSadDummies == 2 then
					pCity:SetNumRealBuilding(iUUSadDummy, 2)
				elseif iNumSadDummies == 3 then
					pCity:SetNumRealBuilding(iUUSadDummy, 3)
				elseif iNumSadDummies == 4 then
					pCity:SetNumRealBuilding(iUUSadDummy, 4)
				elseif iNumSadDummies == 5 then
					pCity:SetNumRealBuilding(iUUSadDummy, 5)
				elseif iNumSadDummies == 6 then
					pCity:SetNumRealBuilding(iUUSadDummy, 6)
				elseif iNumSadDummies == 7 then
					pCity:SetNumRealBuilding(iUUSadDummy, 7)
				elseif iNumSadDummies == 8 then
					pCity:SetNumRealBuilding(iUUSadDummy, 8)
				elseif iNumSadDummies == 9 then
					pCity:SetNumRealBuilding(iUUSadDummy, 9)
				elseif iNumSadDummies <= 10 then
					pCity:SetNumRealBuilding(iUUSadDummy, 10)
				else
					pCity:SetNumRealBuilding(iUUSadDummy, 0)
				end
			end
		end
	end
end

function JWW_DeleteDummy(iOldPlayer, bCapital, iPlotX, iPlotY, iNewPlayer, iOldPop, bConquest, iGreatWorkCount) --if city changes owners, delete dummies
	local pPlot = Map.GetPlot(iPlotX, iPlotY)
	if pPlot:IsCity() then
		local pCity = pPlot:GetPlotCity()
		pCity:SetNumRealBuilding(iUUSadDummy, 0)
		pCity:SetNumRealBuilding(iUUTurnDummy, 0)
	end
end
-----------------------------------------------------------------------------
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_PromotionIfDiffReligionOrIdeology)
	GameEvents.UnitPrekill.Add(JWW_OnDeathGiveDummies)
	GameEvents.PlayerDoTurn.Add(JWW_DummyTurnCounter)
	GameEvents.CityCaptureComplete.Add(JWW_DeleteDummy)
end
--===========================================================================
-- UB (Igreja Costeira)
--===========================================================================
local iIgreja = GameInfoTypes["BUILDING_JWW_IGREJA_TIMORENSE"]
-----------------------------------------------------------------------------
-- Bonus Culture and Faith if Common Enemy
-----------------------------------------------------------------------------
function JWW_ExtraStuffWithCommonEnemy(iPlayer)
	local iNumPlayers = 0
	local iFaithCultureGained = 0
	local pPlayer = Players[iPlayer]
	local iTeam = pPlayer:GetTeam()
	local pTeam = Teams[pPlayer:GetTeam()]
	for k, v in pairs(Teams) do
		if v ~= pTeam then
			if v:IsAtWar(iTeam) then
				iNumPlayers = iNumPlayers + 1
				if Game.CountCivPlayersAlive() < iNumPlayers then return end
			end
		end
	end
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pTruePlayer = Players[iPlayer]
		if pTruePlayer and pTruePlayer ~= pPlayer then
			if pTruePlayer:GetCivilizationType() == iTimorLeste then
				for pCity in pTruePlayer:Cities() do
					if pCity:IsHasBuilding(iIgreja) then
						iFaithCultureGained = iNumPlayers - 1
						iFaithCultureGained = iFaithCultureGained * 3
					end
				end
			end
			pTruePlayer:ChangeFaith(iFaithCultureGained)
			pTruePlayer:ChangeJONSCulture(iFaithCultureGained)
		end
	end
end
-----------------------------------------------------------------------------
-- If your Religion or Majority Religion controls city, give dummy with XP
-----------------------------------------------------------------------------
local iUBDummy = GameInfoTypes["BUILDING_JWW_TL_UB_DUMMY"]

function JWW_IfRelgionThenDummy(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() and pPlayer:GetCivilizationType() == iTimorLeste then
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(iIgreja) then
				if pPlayer:HasCreatedReligion() then
					local pReligion = pPlayer:GetReligionCreatedByPlayer()
					local iPop = pCity:GetPopulation()
					local iNumFollowers = pCity:GetNumFollowers(pReligion)
					iMinFollowers = math.floor(iPop * .75)
					if iNumFollowers >= iMinFollowers then
						if not pCity:IsHasBuilding(iUBDummy) then
							pCity:SetNumRealBuilding(iUBDummy, 1)
						end
					else
						if pCity:IsHasBuilding(iUBDummy) then
							pCity:SetNumRealBuilding(iUBDummy, 0)
						end
					end
				else
					for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
						local pOtherPlayer = Players[iPlayer]
						if pOtherPlayer ~= pPlayer then
							if pOtherPlayer:HasCreatedReligion() then
								local pReligion = pOtherPlayer:GetReligionCreatedByPlayer()
								if pPlayer:HasReligionInMostCities(pReligion) then
									local iPop = pCity:GetPopulation()
									local iNumFollowers = pCity:GetNumFollowers(pReligion)
									iMinFollowers = math.floor(iPop * .75)
									if iNumFollowers >= iMinFollowers then
										if not pCity:IsHasBuilding(iUBDummy) then
											pCity:SetNumRealBuilding(iUBDummy, 1)
											break
										end
									else
										if pCity:IsHasBuilding(iUBDummy) then
											pCity:SetNumRealBuilding(iUBDummy, 0)
											break
										end
									end
								else
									if pCity:IsHasBuilding(iUBDummy) then
										pCity:SetNumRealBuilding(iUBDummy, 0)
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
if bIsActive then
	GameEvents.PlayerDoTurn.Add(JWW_ExtraStuffWithCommonEnemy)
	GameEvents.PlayerDoTurn.Add(JWW_IfRelgionThenDummy)
end
--===========================================================================