-- JFD_Civs_AngloNorse_Tinglid_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey

local Players 			= Players

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]

local civilizationID	= GameInfoTypes["CIVILIZATION_JFD_ANGLO_NORSE"]
local isCivActive		= (activePlayer:GetCivilizationType() == civilizationID)
if (not isCivActive) then return end
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
--CityInfoStackDataRefresh
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_AngloNorse_Tinglid_CityInfo", ["SortOrder"] = 1})

   table.insert(tEventsToHook, LuaEvents.ProductionPopup)
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()
 
 --CityInfoStackDirty
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_AngloNorse_Tinglid_CityInfo" then return end
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILITIES
------------------------------------------------------------------------------------------------------------------------
--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- UI FUNCTIONS	
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local promotionTinglidActiveID = GameInfoTypes["PROMOTION_JFD_TINGLID_ACTIVE"]
local unitTinglidID			   = GameInfoTypes["UNIT_JFD_TINGLID"]

local g_ProductionPanelOpen = false

g_JFD_AngloNorse_Tinglid_TipControls = {}
TTManager:GetTypeControlTable("JFD_AngloNorse_Tinglid_ToolTip", g_JFD_AngloNorse_Tinglid_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------------
--OnProductionPopup
function OnProductionPopup(isHide)
	g_ProductionPanelOpen = (not isHide)
end
LuaEvents.ProductionPopup.Add(OnProductionPopup)
-------------------------------------------------------------------------------------------------------------------------
--ProcessCityScreen
function ProcessCityScreen(instance)
	local city = UI.GetHeadSelectedCity()
	if (not city) or g_ProductionPanelOpen then
		instance.IconFrame:SetHide(true)
		return
	end
	local unitGarrison = city:GetGarrisonedUnit()
	local hasGarrison = (unitGarrison and unitGarrison:HasPromotion(promotionTinglidActiveID))
	if (not hasGarrison) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_AngloNorse_Tinglid_ToolTip")
	IconHookup(3, 64, "JFD_ANGLO_NORSE_ICON_ATLAS", instance.IconImage)
	
	local numXP = unitGarrison:GetLevel()
	local strTitle = string.upper(g_ConvertTextKey("TXT_KEY_UNIT_JFD_TINGLID"))
	local strHelp = g_ConvertTextKey("TXT_KEY_JFD_TINGLID_GREAT_ADMIRAL_POINTS_CITY_VIEW_HELP", numXP)
	if city:GetOriginalOwner() ~= activePlayerID then
		strHelp = g_ConvertTextKey("TXT_KEY_JFD_TINGLID_GREAT_GENERAL_POINTS_CITY_VIEW_HELP", numXP)
	end

	local tipControls = g_JFD_AngloNorse_Tinglid_TipControls
	tipControls.Heading:SetText("[COLOR_POSITIVE_TEXT]" .. strTitle .. "[ENDCOLOR]")
	tipControls.Body:SetText(strHelp)
	tipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================
