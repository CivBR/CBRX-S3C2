-- Lua Script1
-- Author: pedro
-- DateCreated: 08/14/16 7:00:24 PM
--------------------------------------------------------------
include("FLuaVector.lua")

local ataturkID = GameInfoTypes.CIVILIZATION_UC_TURKEY

function AtaturkPromotion(ownerId, unitId, ePromotion)
local player = Players[ownerId]
	if player:IsAlive() and player:GetCivilizationType() == ataturkID then
	local unit = player:GetUnitByID(unitId)
	if unit:GetDomainType() == GameInfoTypes.DOMAIN_LAND then
	local xp = unit:GetExperience()
	local needed = unit:ExperienceNeeded()
		if player:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL then
		local faith = math.ceil(needed / 3)
		player:ChangeFaith(faith)
		if player:IsHuman() then
		local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_PEACE]", faith), true)
			end
		else
		local culture = math.ceil((needed / 3) * 1.25)
		player:ChangeJONSCulture(culture)
		if player:IsHuman() then
		local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_CULTURE]", culture), true)
					end
				end
			end
		end
	end
GameEvents.UnitPromoted.Add(AtaturkPromotion)

local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)

function TurkeyPolicy(playerID, policyID)
    local player = Players[playerID]
	local team = Teams[player:GetTeam()]
    if (player:IsAlive() and player:GetCivilizationType() == ataturkID) then
        local iCivsAlive = 0
        local iAtaturkScience = 0        
        for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
            local otherPlayer = Players[iPlayer]
            if iPlayer ~= playerID and otherPlayer:IsAlive() then
                iCivsAlive = iCivsAlive + 1
				local otherTeam = Teams[otherPlayer:GetTeam()]
                 if otherPlayer:HasPolicy(policyID) and otherTeam:IsHasMet(team) then
				 local science = otherPlayer:GetScience()
                    iAtaturkScience = iAtaturkScience + science
                 end
            end
        end
        if iCivsAlive > 0 then
            local reward = math.floor((iAtaturkScience * iMod) / iCivsAlive)
            local pTeamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			pTeamTechs:ChangeResearchProgress(player:GetCurrentResearch(), reward, player:GetID())
		if player:IsHuman() then
			local alertmessage = Locale.ConvertTextKey("TXT_KEY_ATATURK_UA", reward)
			Events.GameplayAlertMessage(alertmessage)
			end
        end
    end
end
GameEvents.PlayerAdoptPolicy.Add(TurkeyPolicy)

function TurkeyPlayerDoTurn(playerID)
local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == ataturkID) then
	for city in player:Cities() do
	if city:IsHasBuilding(GameInfoTypes.BUILDING_UC_HALKEVLERI) then
		local science = city:GetBaseYieldRate(GameInfoTypes.YIELD_FAITH)
		player:ChangeFaith(math.ceil(science * -.25))
		city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_HAL_SCIENCE, math.ceil(science * .75))
		for specialist in GameInfo.Specialists("GreatPeopleRateChange > 0") do
		local specialistCount = (city:GetSpecialistCount(specialist.ID))
		player:ChangeGoldenAgeProgressMeter(specialistCount * 2)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(TurkeyPlayerDoTurn)

function KuvaPerTurn(playerID)
local player = Players[playerID]
    if (player:IsAlive()) then
	if player:GetUnitClassCount(GameInfoTypes.UNITCLASS_GREAT_WAR_INFANTRY) > 0 or player:GetUnitClassCount(GameInfoTypes.UNITCLASS_INFANTRY) > 0 or player:GetUnitClassCount(GameInfoTypes.UNITCLASS_MECHANIZED_INFANTRY) > 0 then
 	local highLevel = 0
	for unit in player:Units() do
	if unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_KUVA) then
		if unit:IsNearGreatGeneral() then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_KUVA_GENERAL, true)
			else
		if unit:IsHasPromotion(GameInfoTypes.PROMOTION_UC_KUVA_GENERAL) then
		unit:SetHasPromotion(GameInfoTypes.PROMOTION_UC_KUVA_GENERAL, false)
							end
						end
					end
				end
			end
		end
	end
GameEvents.PlayerDoTurn.Add(KuvaPerTurn)
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(ataturkID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == ataturkID then
				return true
			end
		end
	end
	return false
end


-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID		= Game.GetActivePlayer()
local activePlayer			= Players[activePlayerID]
local isTurkeyActivePlayer = activePlayer:GetCivilizationType() == ataturkID
if isAtaturkCivActive then
	print("Ataturk MCIS is loaded!")
end

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "UC_Halkevleri_MCIS", ["SortOrder"] = 1})
end
if isTurkeyActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "UC_Halkevleri_MCIS" then return end
	ProcessCityScreen(instance)
end
if isTurkeyActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_UC_Halkevleri_MCIS_TipControls = {}
TTManager:GetTypeControlTable("UC_Halkevleri_MCIS_Tooltip", g_UC_Halkevleri_MCIS_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("city == true")
	if not (city:IsHasBuilding(GameInfoTypes.BUILDING_UC_HALKEVLERI)) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("UC_Halkevleri_MCIS_Tooltip")
	IconHookup(2, 64, "UC_TURKEY_ATLAS", instance.IconImage)
	local science = (city:GetNumRealBuilding(GameInfoTypes.BUILDING_UC_HAL_SCIENCE))
	if science <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_HALKEVLERI_UI_DESC")) .. "[ENDCOLOR]" -- Header
	local textHelp = Locale.ConvertTextKey("TXT_KEY_HALKEVLERI_UI_HELP", science) -- Text
	g_UC_Halkevleri_MCIS_TipControls.Heading:SetText(textDescription)
	g_UC_Halkevleri_MCIS_TipControls.Body:SetText(textHelp)
	g_UC_Halkevleri_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end