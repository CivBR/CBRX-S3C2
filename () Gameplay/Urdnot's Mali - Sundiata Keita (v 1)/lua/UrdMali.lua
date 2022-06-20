
print("Urd Mali Loaded")

--[[
 UA: The Lion King
Making purchases rushes the production of units or military buildings in that city, and -- tick
heals your units during a Golden Age. -- tick
Trade buildings pacify conquered cities -- Tick
and yield +2 happiness.

UU: Ton-tigi (Knight) 
Is a ranged unit unlike the Knight it replaces, and has the indirect fire promotion, but must set up to fire. 
Lacks the Knight's penalty versus cities, and receives the siege promotion if bought rather than trained. -- tick

UU: Donson Ton (Barracks) 
The Donson Ton is much more expensive than the barracks and costs +1 maintenance but may be both purchased -- tick
and constructed, allowing for two in the same city. +1 happiness.
]]

include("IconSupport.lua")

local tMilitaryBuildings = {}
for row in DB.Query("SELECT a.ID BuildingID FROM Buildings a, BuildingClasses b WHERE a.BuildingClass = b.Type AND b.MaxPlayerInstances = -1 AND b.MaxTeamInstances = -1 AND b.MaxGlobalInstances = -1 AND a.Type IN (SELECT DISTINCT BuildingType FROM Building_DomainFreeExperiences)") do
	tMilitaryBuildings[row.BuildingID] = true
end

local tTradeBuildings = {}
-- Remember the SQL has to case out dummy Buildings
for row in DB.Query("SELECT a.ID BuildingID FROM Buildings a, BuildingClasses b WHERE a.BuildingClass = b.Type AND b.MaxPlayerInstances = -1 AND b.MaxTeamInstances = -1 AND b.MaxGlobalInstances = -1 AND a.Type IN (SELECT BuildingType FROM Building_YieldChanges WHERE YieldType = 'YIELD_GOLD' AND Yield > 0)") do
	tTradeBuildings[row.BuildingID] = true
end

local sTrait = "TRAIT_US_MALI_SUNDIATA" -- TRAIT_
local iUU = GameInfoTypes["UNIT_US_TON_TIGI"] -- UNIT_
local iCourthouseDummy = GameInfoTypes["BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY"] -- Dummy Building with NoUnoccupiedUnhappiness = 1
local iHappinessDummy = GameInfoTypes["BUILDING_HAPPINESS_DUMMY_SUNDIATA"] -- +2 Happiness
local iPurchaseUB = GameInfoTypes["BUILDING_DUMMY_US_DONSON_TON"] -- The Building that will be purchase only; needs a valid Cost value, so can't be a dummy building and is instead restricted through CanConstruct; idk if purchase only limitation is even possible, but try a HurryCostModifier value of -1. If not, then a different approach can be tried
local sUBTech = GameInfo.Buildings["BUILDING_US_DONSON_TON"].PrereqTech
local iUBTech = sUBTech and GameInfoTypes[sUBTech] or nil

-- All these are expecting a place to put the Gold cost
local sButtonText = "TXT_KEY_SUNDIATA_BUTTON_TEXT_ENABLED" -- Text on Button, enabled
local sButtonToolTip = "TXT_KEY_SUNDIATA_BUTTON_TOOLTIP_ENABLED"  -- Tooltip on Button, enabled
local sDisabledText = "TXT_KEY_SUNDIATA_BUTTON_TEXT_DISABLED" -- Text on Button, disabled
local sDisabledTT = "TXT_KEY_SUNDIATA_BUTTON_TOOLTIP_DISABLED" -- Tooltip on Button, disabled

local tLeaders = {}
for row in DB.Query("SELECT ID FROM Leaders WHERE Type IN (SELECT LeaderType FROM Leader_Traits WHERE TraitType = '"..sTrait.."')") do
	tLeaders[row.ID] = true
end

local iSiege = GameInfoTypes["PROMOTION_SIEGE"]

function C15_Urd_Mali_TradeBuildingProcess(pPlayer, pCity)
	local iCount = 0
	for k, v in pairs(tTradeBuildings) do
		if pCity:IsHasBuilding(k) then
			iCount = iCount + 1
		end
	end
	
	if iCount > 0 then
		pCity:SetNumRealBuilding(iCourthouseDummy, 1)
		pCity:ChangeResistanceTurns(pCity:GetResistanceTurns() * -1)
		pCity:SetNumRealBuilding(iHappinessDummy, iCount)
	else
		pCity:SetNumRealBuilding(iCourthouseDummy, 0)
		pCity:SetNumRealBuilding(iHappinessDummy, 0)
	end
end

function C15_Urd_Mali_CityPurchase(playerID, cityID, rowID, bGold)
	if bGold then
		local pPlayer = Players[playerID]
		if tLeaders[pPlayer:GetLeaderType()] then
			local pCity = pPlayer:GetCityByID(cityID)
			if pCity:GetProductionUnit() ~= -1 or tMilitaryBuildings[pCity:GetProductionBuilding()] then
				--pCity:Hurry(iGoldHurry)
				local prod = pCity:GetProductionNeeded();
				pCity:SetProduction(prod);
				if pPlayer:IsGoldenAge() then
					for pUnit in pPlayer:Units() do
						local iDamage = pUnit:GetDamage()
						if iDamage > 0 then
							pUnit:ChangeDamage(-iDamage)
						end
					end
				end
			end
		end
	end
end

GameEvents.CityTrained.Add(C15_Urd_Mali_CityPurchase)
GameEvents.CityConstructed.Add(C15_Urd_Mali_CityPurchase)

function C15_Urd_Mali_UUPurchase(playerID, cityID, unitID, bGold) -- Tick!
	if bGold then
		local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:GetUnitType() == iUU then
			pUnit:SetHasPromotion(iSiege, true)
		end
	end
end

GameEvents.CityTrained.Add(C15_Urd_Mali_UUPurchase)

function C15_Urd_Mali_Constructed(playerID, cityID, buildingID) -- Tick (probably
	if tTradeBuildings[buildingID] then
		local pPlayer = Players[playerID]
		if tLeaders[pPlayer:GetLeaderType()] then
			C15_Urd_Mali_TradeBuildingProcess(pPlayer, pPlayer:GetCityByID(cityID))
		end
	end
end

GameEvents.CityConstructed.Add(C15_Urd_Mali_Constructed)
GameEvents.CitySoldBuilding.Add(C15_Urd_Mali_Constructed)

function C15_Urd_Mali_Capture(oldID, bCap, iX, iY, newID) -- Tick!
	local pPlayer = Players[newID]
	if tLeaders[pPlayer:GetLeaderType()] then
		local pPlot = Map.GetPlot(iX, iY)
		local pCity = pPlot:GetPlotCity()
		if pCity then
			C15_Urd_Mali_TradeBuildingProcess(pPlayer, pCity)
		end
	end
end

GameEvents.CityCaptureComplete.Add(C15_Urd_Mali_Capture)

local isCityViewOpen = false

function C15_Urd_Mali_CanPurchaseDummy(pPlayer, pCity)
	if not pCity then return false, true end
	if pCity:GetOwner() ~= pPlayer:GetID() then return false, true end
	if not tLeaders[pPlayer:GetLeaderType()] then return false, true end
	if pCity:IsHasBuilding(iPurchaseUB) then return false, true end
	if iUBTech and (not Teams[pPlayer:GetTeam()]:IsHasTech(iUBTech)) then return false, true end
	
	local iGold = pCity:GetBuildingPurchaseCost(nil, iPurchaseUB)
	
	if iGold > pPlayer:GetGold() then return true, true, iGold end
	
	return true, false, iGold
end

function C15_Urd_Mali_Button() -- Tick!
	Controls.BuildingBackground:SetHide(true)
	Controls.BuildingImage:SetHide(true)
	Controls.BuildingButton:SetHide(true)
	Controls.BuildingButton:LocalizeAndSetToolTip(nil)
	local pCity = UI.GetHeadSelectedCity()
	local activePlayerID = Game.GetActivePlayer()
	local pPlayer = Players[activePlayerID]
	local bShow, bDisabled, iGold = C15_Urd_Mali_CanPurchaseDummy(pPlayer, pCity)
	if bShow then 
		local buttonText = Locale.ConvertTextKey(sButtonText, iGold)
		local buttonToolTip = Locale.ConvertTextKey(sButtonToolTip, iGold)
		if bDisabled then
			buttonText = Locale.ConvertTextKey(sDisabledText, iGold)
			buttonToolTip = Locale.ConvertTextKey(sDisabledTT, iGold)
		end
		Controls.Yes:SetVoid1(activePlayerID)
		Controls.Yes:SetVoid2(pCity:GetID())
		IconHookup(1, 64, 'BW_ATLAS_1', Controls.BuildingImage)
		Controls.BuildingBackground:SetHide(false)
		Controls.BuildingImage:SetHide(false)
		Controls.BuildingButton:SetHide(false)
		Controls.BuildingButton:SetText(buttonText)
		Controls.BuildingButton:SetToolTipString(buttonToolTip)
		Controls.BuildingButton:SetDisabled(bDisabled)
	end
end

function C15_Urd_Mali_UI_Purchase_Do()
	Controls.BuildingConfirm:SetHide(false)
end
Controls.BuildingButton:RegisterCallback(Mouse.eLClick, C15_Urd_Mali_UI_Purchase_Do)

function C15_Urd_Mali_UI_Purchase_Yes(playerID, cityID)
	Controls.BuildingConfirm:SetHide(true)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	if pCity then
		local iGold = pCity:GetBuildingPurchaseCost(nil, iPurchaseUB)
		pCity:SetNumRealBuilding(iPurchaseUB, 1)
		pPlayer:ChangeGold(-iGold)
	end
	C15_Urd_Mali_Button()
end
Controls.Yes:RegisterCallback(Mouse.eLClick, C15_Urd_Mali_UI_Purchase_Yes)

function C15_Urd_Mali_UI_Purchase_No()
	Controls.BuildingConfirm:SetHide(true)
end
Controls.No:RegisterCallback(Mouse.eLClick, C15_Urd_Mali_UI_Purchase_No)

function C15_Urd_Mali_UI_PurchaseOnEnterCityScreen()
	isCityViewOpen = true
	C15_Urd_Mali_Button()
end

function C15_Urd_Mali_UI_PurchaseOnExitCityScreen()
	isCityViewOpen = false
	C15_Urd_Mali_Button()
end

function C15_Urd_Mali_UI_PurchaseOnNextCityScreen()
	if isCityViewOpen then
		C15_Urd_Mali_Button()
	end
end

Events.SerialEventEnterCityScreen.Add(C15_Urd_Mali_UI_PurchaseOnEnterCityScreen)
Events.SerialEventExitCityScreen.Add(C15_Urd_Mali_UI_PurchaseOnExitCityScreen)
Events.SerialEventCityScreenDirty.Add(C15_Urd_Mali_UI_PurchaseOnNextCityScreen)

function C15_Urd_Mali_AI(playerID)
	local pPlayer = Players[playerID]
	if tLeaders[pPlayer:GetLeaderType()] and (not pPlayer:IsHuman()) then
		for pCity in pPlayer:Cities() do
			local bShow, bDisabled, iGold = C15_Urd_Mali_CanPurchaseDummy(pPlayer, pCity)
			if bShow and (not bDisabled) and iGold < (pPlayer:GetGold() / 2) then
				C15_Urd_Mali_UI_Purchase_Yes(playerID, pCity:GetID())
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Urd_Mali_AI)

function C15_Urd_Mali_CanConstruct(playerID, buildingID)
	return buildingID ~= iPurchaseUB
end

GameEvents.PlayerCanConstruct.Add(C15_Urd_Mali_CanConstruct)

print("Urd Mali Complete")