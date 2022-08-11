-- Bengal Functions
-- Author: Jarcast
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("RiverConnections.lua")
include("IconSupport")
include("InstanceManager.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsUsingMod
local CBPmodID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
local CBOmodID = "8411a7a8-dad3-4622-a18e-fcc18324c799"
local CSDmodID = "eead0050-1e3f-4178-a91f-26cf1881ac39"
local EEraModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
local EECBPmodID  = "87b2deae-83cb-9b88-9017-79e741d3739c"
local IGEmodID  = "170c8ed1-b516-4fe2-b571-befeac39d220"

function Game_IsUsingMod(modID)
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == modID then
			return true
		end
	end
	return false
end

local isUsingEEra = Game_IsUsingMod(EEraModID) or Game_IsUsingMod(EECBPmodID)
local isUsingCBP  = Game_IsUsingMod(CBPmodID)
local isUsingCBO  = Game_IsUsingMod(CBOmodID)
local isUsingIGE  = Game_IsUsingMod(IGEmodID)
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Game_IsUsingMod(CBPmodID) then 
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
-------------------------------------------------------------------------------------------------------------------------
-- GetRandom
function GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
-------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
if Game then
	--Game.GetUserSetting
	function Game.GetUserSetting(type)
		for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
			return row.Value
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
function IsInteger(n)
  return n==math.floor(n)
end
-------------------------------------------------------------------------------------------------------------------------
local gRiverManager = nil
local gNeedRescan = false

function getRiverManager()    
    if (gRiverManager == nil) then
        gRiverManager = RiverManager:new()
        gNeedRescan = false
    end
    if (gNeedRescan) then
        gRiverManager:rescanMap()
        gNeedRescan = false
    end
    return gRiverManager
end
-------------------------------------------------------------------------------------------------------------------------
if Game then
    --Game.GetUserSetting
    function Game.GetCustomModOptions(type)
        for row in GameInfo.CustomModOptions("Name = '" .. type .. "'") do
            return row.Value
        end
    end
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local BengalcivID = GameInfoTypes["CIVILIZATION_ERJAR_BENGAL"]
local traitBengalID = GameInfoTypes["TRAIT_ERJAR_BENGAL"]
local ManufactoryID = GameInfo.Improvements["IMPROVEMENT_MANUFACTORY"].ID
local iTimerDummy = GameInfoTypes["BUILDING_ERJAR_TIMER"]
local UUPaikID = GameInfoTypes["UNIT_ERJAR_PAIK"]
local promotionPaik = GameInfoTypes["PROMOTION_ERJAR_PAIK_OFF"] -- dummy promo to keep on upgrade
local PaikRangeRiverPromo = GameInfoTypes["PROMOTION_ERJAR_PAIK_ON"]
local PaikRangeShipPromo = GameInfoTypes["PROMOTION_ERJAR_SHIP_RANGE"]
local UBKatraID = GameInfoTypes["BUILDING_ERJAR_KATRA"]
local DummyKatraGrowth = GameInfoTypes["BUILDING_ERJAR_KATRA_DUMMY"]
local TerraformingEvents = (Game.GetCustomModOptions("EVENTS_TERRAFORMING") == 1)
------------------------------------------------------------------------------------------------------------------------
-- QUICK MOD BALANCING PANEL
------------------------------------------------------------------------------------------------------------------------
-- Here are the changeable values that determine the strength of the effects described in the design.
-- 1) UA: Cities send Food and Production to other cities on the same river (ref: lines 202, 203)
local UAFoodBonusBase = 1		--== X Food per specialist in destination city
local UAFoodBonusMax = 15		--  
local UAFoodBonusXEra = 2		-- e.g. each era from Classical onwards adds 2 food
--
local UAProdBonusBase = 2		-- Production scales also for game speed
local UAProdBonusMax = 15
local UAProdBonusXEra = 2

-- 2) Manufactories increase yields of trade routes in the nearest city (ref: lines 250, 281)
local UAManufTRyield = 3		-- +2% yield increase
local UAManufTRyieldMax = 15	-- max 10%

-- 3) UB: Completing of a Trade Route grants engineer points and a temporary boost to population growth
--		  depending upon the amount of Gold generated (ref: lines 373-383)
local UBTREngineerPoints = 5	-- i.e. TR GPT yield times 10 (lump sum)
local UBTRPopGrowthBonus = 1	-- % food bonus per TR GPT yield
local UBTRPopGrowthTurns = 5	-- number of turns in Standard game speed (adjusted)

if isUsingCBO then
    UAFoodBonusBase = 2
    UAFoodBonusMax = 20
    UAProdBonusBase = 3
    UAProdBonusMax = 21
    UAManufTRyield = 5 
    UAManufTRyieldMax = 25
    UBTREngineerPoints = 10
end
--========================================================================================================================
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
-- UA: Paradise of Nations
--========================================================================================================================
if isUsingCBP and TerraformingEvents then
	function OnTerraformingPlot(iEvent, iPlotX, iPlotY, iInfo, iNewValue, iOldValue, iNewExtra, iOldExtra)
		if (not gNeedRescan) then
			if (iEvent == TerraformingEventTypes.TERRAFORMINGEVENT_TERRAIN and (iNewValue == TerrainTypes.TERRAIN_COAST or iOldValue == TerrainTypes.TERRAIN_COAST)) then
			-- If a plot terrain has changed to/from coast (lake), invalidate the river manager
				gNeedRescan = true
			elseif (iEvent == TerraformingEventTypes.TERRAFORMINGEVENT_RIVER) then
			-- If a river segment changes, invalidate the river manager
				gNeedRescan = true
			end
		end
	end
	GameEvents.TerraformingMap.Add(function(iEvent, iLoad)  GameEvents.TerraformingPlot.Add(OnTerraformingPlot) end)
else
	function Jar_IGERescanMap(iPlayer)
		local currturn = Game.GetElapsedGameTurns()
		local frequency = 30
		local pPlayer = Players[iPlayer];
		if (HasTrait(pPlayer, traitBengalID) and pPlayer:IsAlive()) then
			if isUsingIGE then
				gNeedRescan = true
			else
				if IsInteger(currturn/frequency) then
					gNeedRescan = true
				end
			end
		end
	end
	if JFD_IsCivilisationActive(BengalcivID) then GameEvents.PlayerDoTurn.Add(Jar_IGERescanMap) end;
end

-- Cities send Food and Production to other cities on the same river based on the number of specialists in the destination city.
function Jar_GetCitiesOnSameRiver(pCity, iPlayer)
    local pPlayer = Players[iPlayer];
    local tCitiesSameRiver= {}
    local pCityX, pCityY = pCity:Plot():GetX(), pCity:Plot():GetY()
    for cCity in pPlayer:Cities() do
        if pCity ~= cCity then
            local cCityX, cCityY = cCity:Plot():GetX(), cCity:Plot():GetY()
            --local tCommonRivers = getRiverManager():getCommonRivers(cCityX, cCityY, pCityX, pCityY)            
            local tCommonRivers = getRiverManager():getRiverBankRoute(cCityX, cCityY, pCityX, pCityY)
            local numcommonrivers = #tCommonRivers
            if numcommonrivers > 0 then
                table.insert(tCitiesSameRiver, cCity:GetID() )
            end
        end
    end
    return tCitiesSameRiver
end

function Jar_ShadowRiverTradeRoutes(iPlayer)
    local pPlayer = Players[iPlayer];
    if (HasTrait(pPlayer, traitBengalID) and pPlayer:IsAlive()) and pPlayer:GetNumCities() > 1 then
        for pCity in pPlayer:Cities() do
            local specialistcount = 0
            for specialist in GameInfo.Specialists() do
                local specialistID = specialist.ID;
                specialistcount = specialistcount + pCity:GetSpecialistCount( specialistID)
            end
            local tCitiesOnSameRiver = Jar_GetCitiesOnSameRiver(pCity, iPlayer)
            local numCitiesOnSameRiver = #tCitiesOnSameRiver
            if numCitiesOnSameRiver > 0 then
                local foodbonus =  math.floor( numCitiesOnSameRiver*( math.min(specialistcount*UAFoodBonusBase, UAFoodBonusMax) + math.floor((pPlayer:GetCurrentEra()*UAFoodBonusXEra)/2)) )
                local prodbonus =  math.floor( numCitiesOnSameRiver*( math.min(specialistcount*UAProdBonusBase, UAProdBonusMax) + math.floor((pPlayer:GetCurrentEra()*UAProdBonusXEra)/2)) )
            
                pCity:ChangeFood(foodbonus) 
                pCity:ChangeProduction(prodbonus) 
                if pPlayer:IsHuman() and (foodbonus > 0 or prodbonus > 0) then
                    Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:Plot():GetX(), pCity:Plot():GetY()))), "+" .. foodbonus .. "[ICON_FOOD], +" .. prodbonus .. " [ICON_PRODUCTION] from Paradise", 2.5)
                end
            end
        end
    end
end
if JFD_IsCivilisationActive(BengalcivID) then GameEvents.PlayerDoTurn.Add(Jar_ShadowRiverTradeRoutes) end;

-- Manufactories increase yields of trade routes in the nearest city.
function Jar_GetNumImprovementCity(iPlayer, pCity, improvementID)
	local improvcount = 0
	for i = 0, pCity:GetNumCityPlots() - 1, 1 do
		local pPlot = pCity:GetCityIndexPlot(i)
		if pPlot and pPlot:GetOwner() == iPlayer and (pPlot:GetImprovementType() == improvementID) then
			improvcount = improvcount+1
		end			
	end
	return improvcount
end

function Jar_ManufactoriesTradeRoutes(iPlayer)
	local pPlayer = Players[iPlayer];
	if (HasTrait(pPlayer, traitBengalID) and pPlayer:IsAlive()) then
		local tManufFood = {}
		local tManufProd = {}
		local tManufGold = {}
		local tManufScie = {}
		local tManufCult = {}
		-- table for total bonuses initialization
		for pCity in pPlayer:Cities() do
			tManufFood[pCity] = 0
			tManufProd[pCity] = 0
			tManufGold[pCity] = 0
			tManufScie[pCity] = 0
			tManufCult[pCity] = 0
		end
		-- assess bonus for each trade route then sum if apply to the same city
		for _, route in ipairs(pPlayer:GetTradeRoutes()) do
			if route.ToCivilizationType == BengalcivID then
				local pCity = route.ToCity
				local Manufcount = Jar_GetNumImprovementCity(iPlayer, pCity, ManufactoryID)
				local manufbase = math.min(UAManufTRyield*Manufcount, UAManufTRyieldMax)/100
				local yield = 0
				if route.ToFood > 0 then
					yield = route.ToFood /100
					local manufbonus = yield*manufbase
					tManufFood[pCity] = tManufFood[pCity] + manufbonus
				end		
				if route.ToProduction > 0 then
					yield = route.ToProduction /100 
					local manufbonus = yield*manufbase
					tManufProd[pCity] = tManufProd[pCity] + manufbonus
				end
				if route.ToGPT > 0 then
					yield = route.ToGPT /100
					local manufbonus = yield*manufbase
					tManufGold[pCity] = tManufGold[pCity] + manufbonus
				end	
				if route.ToScience > 0 then
					yield = route.ToScience /100 
					local manufbonus = yield*manufbase
					tManufScie[pCity] = tManufScie[pCity] + manufbonus	
				end	
				if route.ToCulture and route.ToCulture > 0 then -- CBP compatibility
					yield = route.ToCulture /100
					local manufbonus = yield*manufbase
					tManufCult[pCity] = tManufCult[pCity] + manufbonus
				end
			elseif route.FromCivilizationType == BengalcivID and route.FromID ~= route.ToID then				
				local pCity = route.FromCity
				local Manufcount = Jar_GetNumImprovementCity(iPlayer, pCity, ManufactoryID)
				local manufbase = math.min(UAManufTRyield*Manufcount, UAManufTRyieldMax)/100
				local yield = 0
				if route.FromGPT > 0 then
					yield = route.FromGPT /100
					local manufbonus = yield*manufbase
					tManufGold[pCity] = tManufGold[pCity] + manufbonus
				end	
				if route.FromScience > 0 then
					yield = route.FromScience /100
					local manufbonus = yield*manufbase
					tManufScie[pCity] = tManufScie[pCity] + manufbonus	
				end	
				if route.FromCulture and route.FromCulture > 0 then -- CBP compatibility
					local yield = route.FromCulture /100
					local manufbonus = yield*manufbase
					tManufCult[pCity] = tManufCult[pCity] + manufbonus
				end			
			end			
		end
		-- give total bonus to each cities where applies
		for pCity in pPlayer:Cities() do
			local totManufFood = math.ceil( tManufFood[pCity])
            local totManufProd = math.ceil( tManufProd[pCity]) 
            local totManufGold = math.ceil( tManufGold[pCity])
            local totManufScie = math.floor( tManufScie[pCity] +0.5) --doens't work because the game is a whiny bitch
            local totManufCult = math.floor( tManufCult[pCity] +0.5)
--			print(pCity:GetName())
--			print("Food", "Prod", "Gold", "Sci", "Cult")
--			print(totManufFood, totManufProd, totManufGold, totManufScie, totManufCult)
			if totManufFood >0 then
				pCity:ChangeFood(totManufFood)
			end
			if totManufProd >0 then
				pCity:ChangeProduction(totManufProd)		
			end
			if totManufGold >0 then
				pPlayer:ChangeGold(totManufGold)		
			end
			if totManufScie >0 then
				local fTeamID = pPlayer:GetTeam();
				local fTeam = Teams[fTeamID];
				local fTeamTechs = fTeam:GetTeamTechs();
				fTeamTechs:ChangeResearchProgress(pPlayer:GetCurrentResearch(), totManufScie, iPlayer)	
			end
			if totManufCult >0 then
				pPlayer:ChangeJONSCulture(totManufCult)
			end
			-- notification on city tile for the player (if you want to do a proper better UI you're welcome)
			if pPlayer:IsHuman() then
				local textstrfood = ""
				local textstrprod = ""
				local textstrgold = ""
				local textstrscie = ""
				local textstrcult = ""
				local textstrmanuf = ""
				local bManuf = false
				if totManufFood>0 then
					textstrfood = "+" .. totManufFood .. " [ICON_FOOD] "
					bManuf = true
				end
				if totManufProd>0 then
					textstrprod = "+" .. totManufProd .. " [ICON_PRODUCTION] "
					bManuf = true
				end
				if totManufGold>0 then
					textstrgold = "+" .. totManufGold .. " [ICON_GOLD] "
					bManuf = true
				end
				if totManufScie>0 then
					textstrscie = "+" .. totManufScie .. " [ICON_RESEARCH] "
					bManuf = true
				end
				if totManufCult>0 then
					textstrcult = "+" .. totManufCult .. " [ICON_CULTURE] "
					bManuf = true
				end
				if bManuf then textstrmanuf = "from Manufactories" end
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:Plot():GetX(), pCity:Plot():GetY()))), textstrfood .. textstrprod .. textstrgold .. textstrscie .. textstrcult .. textstrmanuf, 4.5)
			end				
		end
	end
end
if JFD_IsCivilisationActive(BengalcivID) then GameEvents.PlayerDoTurn.Add(Jar_ManufactoriesTradeRoutes) end;
--=========================================================================================================================
-- UB: Katra
--=========================================================================================================================
-- There is no event that triggers upon completion of a trade route,
-- so all the bonuses are given 1 turn before expiration.

function Jar_KatraBonusFromTradeRoutes(iPlayer)
	local pPlayer = Players[iPlayer];
	if (HasTrait(pPlayer, traitBengalID) and pPlayer:IsAlive()) then
		local tCityEngineer = {}
		local tCityPopGrowth = {}
		local bHasKatra = false
		-- table for total bonuses initialization
		for pCity in pPlayer:Cities() do
			if pCity:IsHasBuilding(UBKatraID) then
				bHasKatra = true
				tCityEngineer[pCity] = 0
				tCityPopGrowth[pCity] = 0
			end
		end
		if not bHasKatra then return end
		-- assess bonus for each trade route then sum if apply to the same city
		for _, route in ipairs(pPlayer:GetTradeRoutes()) do
			if route.TurnsLeft == 2 then -- trigger 1 turn before expiration 
				-- outgoing international trade routes
				if 	route.FromCivilizationType == BengalcivID and route.FromID ~= route.ToID and route.FromCity:IsHasBuilding( UBKatraID) then	
					local goldyield = route.FromGPT /100
					local enginepoints = UBTREngineerPoints*goldyield
					local TRbonus = UBTRPopGrowthBonus*goldyield
					tCityEngineer[route.FromCity] = tCityEngineer[route.FromCity] + enginepoints
					tCityPopGrowth[route.FromCity] = tCityPopGrowth[route.FromCity] + TRbonus
				-- ingoing international trade routes	
				elseif route.ToCivilizationType == BengalcivID and route.FromID ~= route.ToID and route.ToCity:IsHasBuilding( UBKatraID) then
					local goldyield = route.ToGPT /100
					local enginepoints = UBTREngineerPoints*goldyield
					local TRbonus = UBTRPopGrowthBonus*goldyield
					tCityEngineer[route.ToCity] = tCityEngineer[route.ToCity] + enginepoints
					tCityPopGrowth[route.ToCity] = tCityPopGrowth[route.FromCity] + TRbonus
				end
			end
		end
		for pCity in pPlayer:Cities() do
			local enbonus = tCityEngineer[pCity] or 0
            local popbonus = tCityPopGrowth[pCity] or 0
            local totEngpoints = math.floor(enbonus*100 )
            local totpopgrowth = math.floor(popbonus )
            -- give total bonus from expiring trade routes if any
            if pCity:IsHasBuilding(UBKatraID) then
				if totEngpoints > 0 then
					pCity:ChangeSpecialistGreatPersonProgressTimes100(GameInfoTypes["SPECIALIST_ENGINEER"], totEngpoints)
					if pPlayer:IsHuman() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pCity:Plot():GetX(), pCity:Plot():GetY()))), "+" .. totEngpoints/100 .. " [ICON_GREAT_ENGINEER] from [ICON_TRADE] Trade", 5.5)
					end				
				end
				if totpopgrowth > 0 then
					local turns = UBTRPopGrowthTurns*iMod +1
					pCity:SetNumRealBuilding(iTimerDummy,  turns)
					pCity:SetNumRealBuilding(DummyKatraGrowth,  totpopgrowth)
				end
			end
			-- update temporary growth bonus timer
			if pCity:IsHasBuilding(iTimerDummy) then
				local num= pCity:GetNumBuilding(iTimerDummy)
				if num >1 then
					pCity:SetNumRealBuilding(iTimerDummy,  num -1 )
					if pPlayer:IsHuman() then
						Events.GameplayAlertMessage('Growth boost in [COLOR_WARNING_TEXT]' .. pCity:GetName() .. '[ENDCOLOR]: +'.. pCity:GetNumRealBuilding(DummyKatraGrowth) .. '% [ICON_FOOD]: [COLOR_WARNING_TEXT]'.. num -1 .. "[ENDCOLOR] turns to end")
					end
				else
					pCity:SetNumRealBuilding(iTimerDummy,  0)
					pCity:SetNumRealBuilding(DummyKatraGrowth,  0)
					if pPlayer:IsHuman() then
						Events.GameplayAlertMessage('Growth boost ended in [COLOR_WARNING_TEXT]' .. pCity:GetName() .. '[ENDCOLOR].')
					end
				end
			end
		end
	end
end
if JFD_IsCivilisationActive(BengalcivID) then GameEvents.PlayerDoTurn.Add(Jar_KatraBonusFromTradeRoutes) end;
--=========================================================================================================================
-- UU: Paik
--=========================================================================================================================
-- The Paik abilities are coded twice:
-- 1) when Bengal is played by AI using PlayerDoTurn event (faster computation)
-- 2) when Bengal is played by human using UnitSetXY event (slower computation but dynamic update allows for convenient
-- strategies like: Paik starts turn stacked on ranged ship A --> A attacks with +1 range -->
-- Paik moves from A to adjacent ranged ship B --> A loses promo while B gains it and attack at +1 range --> 
-- Paik moves from B to adjacent ranged ship C --> B loses promo while C gains it and attack at +1 range --> ??? --> Profit)
local BengalHasRangedShipsPaiks = false -- this one is a check to speed up the game

function Jar_PaikRangePromo_AI(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsAlive() then --no check for bengal because militaristic city states
		BengalHasRangedShipsPaiks = false
		local BengalHasRangedShips = false
		local BengalHasPaiks = false
		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == UUPaikID then
				BengalHasPaiks = true
				break
			end			
		end
		for pUnit in pPlayer:Units() do
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and pUnit:GetBaseRangedCombatStrength() > 0 then
				BengalHasRangedShips = true
				break
			end			
		end
		BengalHasRangedShipsPaiks = BengalHasRangedShips and BengalHasPaiks
		if BengalHasRangedShipsPaiks and not pPlayer:IsHuman() then -- when Bengal is AI
			for zUnit in pPlayer:Units() do
				local zunitplot = zUnit:GetPlot()
				if zUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and zUnit:GetBaseRangedCombatStrength() > 0 then
					local bcheck = false
					for iPlotUnit = 0, zunitplot:GetNumUnits() -1, 1 do
						local pStkdUnit = zunitplot:GetUnit(iPlotUnit)
						if pStkdUnit and pStkdUnit:GetOwner() == iPlayer and pStkdUnit:GetUnitType() == UUPaikID then
							bcheck = true
							break
							end
					end
					zUnit:SetHasPromotion(PaikRangeShipPromo, bcheck)
				end
			end
		end
	end
end
if JFD_IsCivilisationActive(BengalcivID) then GameEvents.PlayerDoTurn.Add(Jar_PaikRangePromo_AI) end;

function Jar_PaikRangePromo_Human(iPlayer, iUnitID)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	local unitplot = pUnit:GetPlot()
	if pPlayer:IsAlive() and pUnit:IsCombatUnit() and unitplot then
		-- +1 range if on river to Paik and upgrades
		local rivercheck = unitplot:IsRiver() and pUnit:IsHasPromotion(promotionPaik)
		pUnit:SetHasPromotion(PaikRangeRiverPromo, rivercheck)
		
		if BengalHasRangedShipsPaiks and pPlayer:IsHuman() then -- the check avoids to run the following code when there are Paiks on water but no ranged ships
			-- Paik moves on ranged ship or elsewhere
			if pUnit:GetUnitType() == UUPaikID and unitplot:IsWater() then
			-- When Paik moves there is no starting plot to check for a ranged ship and remove the promo accordingly
			-- So when Paik moves the loop over ranged ships is needed to dynamically switch on/off the promo
				for zUnit in pPlayer:Units() do
					local zunitplot = zUnit:GetPlot()
					if zUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and zUnit:GetBaseRangedCombatStrength() > 0 then
						local bcheck = false
						for iPlotUnit = 0, zunitplot:GetNumUnits() -1, 1 do
							local pStkdUnit = zunitplot:GetUnit(iPlotUnit)
							if pStkdUnit and pStkdUnit:GetOwner() == iPlayer and pStkdUnit:GetUnitType() == UUPaikID then
								bcheck = true
								break
							end
						end
						zUnit:SetHasPromotion(PaikRangeShipPromo, bcheck)
					end
				end
			end		
			-- Ranged ship moves on Paik or elsewhere
			if pUnit:GetDomainType() == DomainTypes.DOMAIN_SEA and pUnit:GetBaseRangedCombatStrength() > 0 then
				local bcheck = false
				for iPlotUnit = 0, unitplot:GetNumUnits() -1, 1 do
					local pStkdUnit = unitplot:GetUnit(iPlotUnit)
					if pStkdUnit and pStkdUnit:GetOwner() == iPlayer and pStkdUnit:GetUnitType() == UUPaikID then
						bcheck = true
						break
					end
				end
				pUnit:SetHasPromotion(PaikRangeShipPromo, bcheck)
			end
		end
	end
end

if JFD_IsCivilisationActive(BengalcivID) then GameEvents.UnitSetXY.Add(Jar_PaikRangePromo_Human) end
--=======================================================================================================================
--TROLLER'S ADDITIONAL ACHIEVEMENTS
--=======================================================================================================================
include("AdditionalAchievementsUtility.lua");
local TAAid = "432bc547-eb05-4189-9e46-232dbde8f09f"
local isAAActive = Game_IsUsingMod(TAAid)
----------------------------------------
function UnlockBengalAchievement(iPlayer)
    local pPlayer = Players[iPlayer]
    if IsAAUnlocked('AA_ERJAR_BENGAL_SPECIAL') then return end
    if (HasTrait(pPlayer, traitBengalID) and pPlayer:IsAlive()) then
        local Manufcount = 0
        for pCity in pPlayer:Cities() do
            Manufcount = Manufcount + Jar_GetNumImprovementCity(iPlayer, pCity, ManufactoryID)
        end
        if Manufcount >=5 and pPlayer:GetCurrentEra() < GameInfo.Eras["ERA_INDUSTRIAL"].ID then
            UnlockAA('AA_ERJAR_BENGAL_SPECIAL')
        end
    end
end


if isAAActive then GameEvents.PlayerDoTurn.Add(UnlockBengalAchievement) end
--------------------------------------------------------------
print("Bengal functions loaded!")
--==========================================================================================================================
--==========================================================================================================================



