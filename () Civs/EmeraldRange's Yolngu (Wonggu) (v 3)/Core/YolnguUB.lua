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

local iCiv = GameInfoTypes["CIVILIZATION_ER_YOLNGU"]
local bIsActive = JFD_IsCivilisationActive(iCiv)

local iLarrakitj = GameInfoTypes["BUILDING_ER_LARRAKITJ"]
local iGPDummy = GameInfoTypes["BUILDING_ER_YOLNGU_GP_BONUS"] -- SET GreatPeopleRateModifier = 5
local iTempleClass = GameInfoTypes["BUILDINGCLASS_TEMPLE"]

-- ============================================================================ --
-- UB: FILLED GREAT WORK SLOTS INCREASE GP GENERATION IN TRADE-CONNECTED CITIES --
-- ============================================================================ --

function YolnguUB(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:CountNumBuildings(iLarrakitj) > 0 then
		local tFilledSlots = {}
		local tDeservedNumber = {}
		
		-- first, reset existing ones
		for pCity in pPlayer:Cities() do
			tDeservedNumber[pCity] = 0
			pCity:SetNumRealBuilding(iGPDummy, 0)
			if pCity:IsHasBuilding(iLarrakitj) then
				tFilledSlots[pCity] = (pCity:GetNumGreatWorksInBuilding(iTempleClass) > 0)
			end
		end
		
		-- now, set up new ones
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			if tFilledSlots[v.FromCity] then
				if v.ToCity:GetOwner() == playerID then
					tDeservedNumber[v.ToCity] = tDeservedNumber[v.ToCity] + 1
				end
			end
			if tFilledSlots[v.ToCity] then
				if v.FromCity:GetOwner() == playerID then
					tDeservedNumber[v.FromCity] = tDeservedNumber[v.FromCity] + 1
				end
			end
		end
		for pCity, iNum in pairs(tDeservedNumber) do
			pCity:SetNumRealBuilding(iGPDummy, iNum)
		end
	elseif pPlayer:CountNumBuildings(iGPDummy) > 0 then
		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(iGPDummy, 0)
		end
	end
end

if bIsActive then
	GameEvents.PlayerDoTurn.Add(YolnguUB)
end