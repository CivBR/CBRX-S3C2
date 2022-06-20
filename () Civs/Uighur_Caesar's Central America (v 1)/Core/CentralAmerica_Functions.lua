-- CentralAmerica_Functions
-- Author: pedro
-- DateCreated: 12/22/20 6:30:18 PM
--------------------------------------------------------------
include("PlotIterators")
include("FLuaVector.lua")

local upcaID = GameInfoTypes["CIVILIZATION_UC_CENTRAL_AMERICA"]
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

local tSpecialists = {}
for tSpecialist in GameInfo.Specialists() do
	if tSpecialist.ID ~= GameInfoTypes["SPECIALIST_CITIZEN"] then
		table.insert(tSpecialists, tSpecialist.ID)
	end
end

--Source: Tophat Latvia

local tGPImprovements = {}

-- intermediate table that has the build as its key, the improvement as its value
local tBuilds = {}
for row in DB.Query("SELECT * FROM Builds WHERE ImprovementType IN (SELECT Type FROM Improvements WHERE CreatedByGreatPerson = 1)") do
	tBuilds[row.ID] = GameInfoTypes[row.ImprovementType]
end

-- final table that has the improvement as its key, the unit as its value
for row in DB.Query("SELECT * FROM Unit_Builds WHERE UnitType IN (SELECT Type FROM Units WHERE Special = 'SPECIALUNIT_PEOPLE')") do
	local iValue = tBuilds[GameInfoTypes[row.BuildType]]
	if iValue and (not tGPImprovements[iValue]) then
		tGPImprovements[iValue] = GameInfoTypes[row.UnitType]
	end
end

local isUPCAActive = JFD_IsCivilisationActive(upcaID)

function UPCA_Specialists(playerID)
	local player = Players[playerID];
	if (player:IsAlive() and player:GetCivilizationType() == upcaID) then
			for city in player:Cities() do
				local numSpecialists = 0
				for keyID, specialistID in ipairs(tSpecialists) do
					numSpecialists = numSpecialists + city:GetSpecialistCount(specialistID)
					if city:GetReligiousMajority() <= 0 then
						city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_UPCA_CULTURE, numSpecialists * 2)
					else
						city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_UPCA_CULTURE, numSpecialists)
						end
					end
				end
			end
		end
if isUPCAActive then
GameEvents.PlayerDoTurn.Add(UPCA_Specialists)
end

local eap_Promotion = GameInfoTypes.PROMOTION_UC_EAP

function EAP_Healing(playerID)
	local player = Players[playerID];
	if (player:IsAlive()) then
	--if player:GetUnitClassCount(GameInfoTypes.UNITCLASS_GREAT_WAR_INFANTRY) > 0 then
		for unit in player:Units() do
			if unit:IsHasPromotion(eap_Promotion) then
			local plot = unit:GetPlot()
			for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
				if tGPImprovements[adjacentPlot:GetImprovementType()] then
					unit:ChangeDamage(-15)
						break
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(EAP_Healing)

function EAP_Promoted(ownerIdId, ePromotion)
local player = Players[ownerId]
	if player:IsAlive() then
		local unit = player:GetUnitByID(unitId)
		if unit:GetUnitType() == GameInfoTypes.UNIT_UC_EAP then
			local needed = unit:ExperienceNeeded()
			local general_Points = math.ceil(needed / 2)
				player:ChangeCombatExperience(general_Points)
				if player:IsHuman() then
					local hex = ToHexFromGrid(Vector2(unit:GetX():GetY()))
					Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE]", general_Points), true)
				end
			end
		end
	end
GameEvents.UnitPromoted.Add(EAP_Promoted)

function EAP_Upgrade(playerIdId, newUnitId, bGoodyHut)
		local player = Players[playerId];
		local unit = player:GetUnitByID(unitId)
		if unit:GetUnitType() == GameInfoTypes.UNIT_UC_EAP then
			local experience = math.ceil(unit:GetExperience() / 2)
				player:ChangeJONSCulture(experience)
					if player:IsHuman() then
						local plotX = unit:GetX()
						local plotY = unit:GetY()
						local hex = ToHexFromGrid(Vector2(plotX, plotY))
						Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE]+{1_Num}[ENDCOLOR] [ICON_CULTURE]", experience), true)
					end
				end
			end
GameEvents.UnitUpgraded.Add(EAP_Upgrade)

--g_Belief_BuildingClassFaithPurchase_Table
local g_Belief_BuildingClassFaithPurchase_Table = {}
local g_Belief_BuildingClassFaithPurchase_Count = 1
for row in DB.Query("SELECT * FROM Belief_BuildingClassFaithPurchase") do 	
	g_Belief_BuildingClassFaithPurchase_Table[g_Belief_BuildingClassFaithPurchase_Count] = row
	g_Belief_BuildingClassFaithPurchase_Count = g_Belief_BuildingClassFaithPurchase_Count + 1
end

local institutoID = GameInfoTypes.BUILDING_UC_INSTITUTO_LAICO

function UPCA_Laicist_Buildings(playerID)
	local player = Players[playerID];
	if (player:IsAlive() and player:GetCivilizationType() == upcaID) then
			for city in player:Cities() do
				if city:IsHasBuilding(institutoID) then
					local beliefsTable = g_Belief_BuildingClassFaithPurchase_Table
					for i,v in pairs(beliefsTable) do
					local row = beliefsTable[i]
					local buildingType = GameInfo.BuildingClasses[row.BuildingClassType].DefaultBuilding
					local buildingID = GameInfoTypes[buildingType]
						if city:IsHasBuilding(buildingID) then
						city:SetNumRealBuilding(buildingID, 0)
						local newBuildingID = GameInfoTypes["BUILDING_UC_UPCA_" .. buildingType] 
						city:SetNumRealBuilding(newBuildingID, 1)
						end
					end
				end
			end
		end
	end
if isUPCAActive then
GameEvents.PlayerDoTurn.Add(UPCA_Laicist_Buildings)
end

function UPCA_Laicist_Temple(playerID)
	local player = Players[playerID];
	if (player:IsAlive() and player:GetCivilizationType() == upcaID) then
			for city in player:Cities() do
				if city:IsHasBuilding(institutoID) then
					if city:IsHasBuilding(GameInfoTypes.BUILDING_TEMPLE) then
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_TEMPLE, 0)
					city:SetNumRealBuilding(GameInfoTypes.BUILDING_UC_UPCA_TEMPLE, 1)
					end
				end
			end
		end
	end
if isUPCAActive then
GameEvents.PlayerDoTurn.Add(UPCA_Laicist_Temple)
end

--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("IconSupport.lua")
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID = Game.GetActivePlayer()
local activePlayer	 = Players[activePlayerID]
local activePlayerTeam	= Teams[Game.GetActiveTeam()]
local isCityViewOpen = false
local isUPCAActivePlayer = activePlayer:GetCivilizationType() == upcaID
local morazanID = GameInfoTypes.CIVILIZATION_UC_CENTRAL_AMERICA
local civilizationUPCA = GameInfo.Civilizations[morazanID]
local iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- UA
----------------------------------------------------------------------------------------------------------------------------
function UPCA_Secularize()
	Controls.UPCABackground:SetHide(true)
	Controls.UPCAImage:SetHide(true)
	Controls.UPCAButton:SetDisabled(true)
	Controls.UPCAButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if city then
	if city:IsHasBuilding(institutoID) then
	local majReligion = city:GetReligiousMajority()
	if majReligion > 0 then
		local followers = city:GetNumFollowers(majReligion)	
		local toConvert = math.ceil(followers / 2)
		local isDisabled = true
		local cost = math.ceil(toConvert * 150 * iMod)
		local buttonText = Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]Secularize Citizens ({1_Num}) [ICON_GOLD][ENDCOLOR]", cost)
		local buttonToolTip = Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]Spend {1_Num} [ICON_GOLD] Gold to remove {2_Num} Religious Followers?[ENDCOLOR]", cost, toConvert)
		if activePlayer:GetGold() < cost then
		buttonText = Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]Secularize Citizens({1_Num}) [ICON_GOLD][ENDCOLOR]", cost)
		buttonToolTip = Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]You do not have enough [ICON_GOLD] Gold![ENDCOLOR]")
					else
			isDisabled = false
		end
		IconHookup(civilizationUPCA.PortraitIndex, 64, civilizationUPCA.IconAtlas, Controls.UPCAImage)
		Controls.UPCABackground:SetHide(false)
		Controls.UPCAImage:SetHide(false)
		Controls.UPCALabel:SetText(buttonText)
		Controls.UPCAButton:SetToolTipString(buttonToolTip)
		Controls.UPCAButton:SetDisabled(isDisabled)	
			end
		end
	end
end

-- UPCA_SecularizeRecruit
function UPCA_SecularizeRecruit()
	local city = UI.GetHeadSelectedCity()
	if city then
	if city:IsHasBuilding(institutoID) then
	local majReligion = city:GetReligiousMajority()
	if majReligion > 0 then
		local followers = city:GetNumFollowers(majReligion)		
		local toConvert = math.ceil(followers / 2)
		local isDisabled = false
		local cost = math.ceil(toConvert * 150 * iMod)
		local confirmText = Locale.ConvertTextKey("Spend {1_Num} [ICON_GOLD] Gold to remove {2_Num} Religious Followers?", cost, toConvert)
		Controls.ConfirmText:SetText(confirmText)
		Controls.UPCAConfirm:SetHide(false)
			end
		end
	end
end
Controls.UPCAButton:RegisterCallback(Mouse.eLClick, UPCA_SecularizeRecruit)	
	
-- UPCA_SecularizeOnYes
function UPCA_SecularizeOnYes()
	Controls.UPCAConfirm:SetHide(true)
	local city = UI.GetHeadSelectedCity();
	if city then
	if city:IsHasBuilding(institutoID) then
	local majReligion = city:GetReligiousMajority()
	if majReligion > 0 then
		local followers = city:GetNumFollowers(majReligion)		
		local toConvert = math.ceil(followers / 2)
		local isDisabled = false
		local cost = math.ceil(toConvert * 150 * iMod)
		activePlayer:ChangeGold(-cost)
	    city:ConvertPercentFollowers(-1, majReligion, 50)	
		player:ChangeGoldenAgeProgressMeter(toConvert * 40)
		end
	end
end
	UPCA_Secularize()
end
Controls.Yes:RegisterCallback(Mouse.eLClick, UPCA_SecularizeOnYes)

-- UPCA_SecularizeOnNo
function UPCA_SecularizeOnNo()
	Controls.UPCAConfirm:SetHide(true)
end
Controls.No:RegisterCallback(Mouse.eLClick, UPCA_SecularizeOnNo)

-- UPCA_SecularizeOnEnterCityScreen
function UPCA_SecularizeOnEnterCityScreen()
	isCityViewOpen = true
	UPCA_Secularize()
end

-- UPCA_SecularizeOnExitCityScreen
function UPCA_SecularizeOnExitCityScreen()
	isCityViewOpen = false
	UPCA_Secularize()
end

-- UPCA_SecularizeOnNextCityScren
function UPCA_SecularizeOnNextCityScren()
	if isCityViewOpen then
		UPCA_Secularize()
	end
end
if (isUPCAActive and isUPCAActivePlayer) then
	Events.SerialEventEnterCityScreen.Add(UPCA_SecularizeOnEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(UPCA_SecularizeOnExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(UPCA_SecularizeOnNextCityScren)
end
--=======================================================================================================================
--=======================================================================================================================]]--
local hasRunOnce = false
local tGeneralPlots = {}

function UPCA_GreatGeneralBuild(playerID, iX, iY, iImprovement)
	if hasRunOnce then 
	hasRunOnce = false;
		return;
	else
	hasRunOnce = true;
		end
	if iImprovement ~= GameInfoTypes.IMPROVEMENT_CITADEL then return end
	local player = Players[playerID]
	if player:GetCivilizationType() ~= upcaID then return end
	local plot = Map.GetPlot(iX, iY)
	table.insert(tGeneralPlots, plot)
	plot:SetImprovementType(-1)
	if player:IsHuman() then
		UPCA_ShowPopup()
	end
end

function UPCA_Citadel(playerID)
	local player = Players[playerID] or Players[Game.GetActivePlayer()]
	Controls.Button1:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_1")
	Controls.Button1:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_1_HELP")

	local generalPlot = tGeneralPlots[#tGeneralPlots]
	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_CITADEL, 1)

if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button1:RegisterCallback(Mouse.eLClick, UPCA_Citadel)

function ManufactoryCheck(activePlayer)
	local canManufactory = activePlayer:IsPolicyBranchFinished(GameInfoTypes.POLICY_BRANCH_TRADITION)
	if (not canManufactory) then
		Controls.Button2Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_2_DISABLED")
		Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_2_HELP_DISABLED")
	else
		Controls.Button2Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_2")
		Controls.Button2:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_2_HELP")
	end
		return canManufactory
	end

function UPCA_Manufactory(playerID)

	local generalPlot = tGeneralPlots[#tGeneralPlots]

	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_MANUFACTORY, 1)

	if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button2:RegisterCallback(Mouse.eLClick, UPCA_Manufactory)

function HolySiteCheck(activePlayer)
	local canHolySite = activePlayer:IsPolicyBranchFinished(GameInfoTypes.POLICY_BRANCH_PIETY)
	if (not canHolySite) then
		Controls.Button3Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_3_DISABLED")
		Controls.Button3:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_3_HELP_DISABLED")
	else
		Controls.Button3Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_3")
		Controls.Button3:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_3_HELP")
		end
	return canHolySite	
end
		
function UPCA_HolySite(playerID)
	
	local generalPlot = tGeneralPlots[#tGeneralPlots]
	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_HOLY_SITE, 1)

	if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button3:RegisterCallback(Mouse.eLClick, UPCA_HolySite)
	
function LandmarkCheck(activePlayer)
	local canLandmark = activePlayer:IsPolicyBranchFinished(GameInfoTypes.POLICY_BRANCH_AESTHETICS)
	if (not canLandmark) then
		Controls.Button4Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_4_DISABLED")
		Controls.Button4:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_4_HELP_DISABLED")
		Controls.Button4:SetDisabled(true)
	else
		Controls.Button4Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_4")
		Controls.Button4:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_4_HELP")
		Controls.Button4:SetDisabled(false)
		end
	return canLandmark
end

function UPCA_Landmark(playerID)

	local generalPlot = tGeneralPlots[#tGeneralPlots]
	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_LANDMARK, 1)

	if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button4:RegisterCallback(Mouse.eLClick, UPCA_Landmark)

function CustomsHouseCheck(activePlayer)
	local canCustomsHouse = activePlayer:IsPolicyBranchFinished(GameInfoTypes.POLICY_BRANCH_COMMERCE)
	if (not canCustomsHouse) then
		Controls.Button5Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_5_DISABLED")
		Controls.Button5:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_5_HELP_DISABLED")
	else
		Controls.Button5Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_5")
		Controls.Button5:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_5_HELP")
		end
	return canCustomsHouse
end

function UPCA_CustomsHouse(playerID)

	local generalPlot = tGeneralPlots[#tGeneralPlots]
	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_CUSTOMS_HOUSE, 1)

	if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button5:RegisterCallback(Mouse.eLClick, UPCA_CustomsHouse)

function AcademyCheck(activePlayer)
	local canAcademy = activePlayer:IsPolicyBranchFinished(GameInfoTypes.POLICY_BRANCH_RATIONALISM)
	if (not canAcademy) then
		Controls.Button6Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_6_DISABLED")
		Controls.Button6:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_6_HELP_DISABLED")
	else
		Controls.Button6Text:LocalizeAndSetText("TXT_KEY_UC_UPCA_POPUP_CHOICE_6")
		Controls.Button6:LocalizeAndSetToolTip("TXT_KEY_UC_UPCA_POPUP_CHOICE_6_HELP")
	end
	return canAcademy
end

function UPCA_Academy(playerID)

	local generalPlot = tGeneralPlots[#tGeneralPlots]
	generalPlot:SetImprovementType(GameInfoTypes.IMPROVEMENT_ACADEMY, 1)

	if popupOpen then
	UPCA_ClosePopup()
	end
end
Controls.Button6:RegisterCallback(Mouse.eLClick, UPCA_Academy)

function UPCA_ShowPopup()
	CivIconHookup(activePlayerID, 64, Controls.CivIcon, Controls.CivIconBG, Controls.CivIconShadow, false, true)
	Controls.ButtonStack:CalculateSize()
	Controls.UPCAPopupUI:DoAutoSize()
	Controls.UPCAPopupUIBG:SetHide(false)
	Controls.UPCAPopupUI:SetHide(false)
	Controls.Button1:SetDisabled(false)
	Controls.Button2:SetDisabled(not ManufactoryCheck(activePlayer))
	Controls.Button3:SetDisabled(not HolySiteCheck(activePlayer))
	Controls.Button4:SetDisabled(not LandmarkCheck(activePlayer))
	Controls.Button5:SetDisabled(not CustomsHouseCheck(activePlayer))
	Controls.Button6:SetDisabled(not AcademyCheck(activePlayer))
	popupOpen = true
end

function UPCA_ClosePopup()
	Controls.UPCAPopupUIBG:SetHide(true)
	Controls.UPCAPopupUI:SetHide(true)
	popupOpen = false
end

if isUPCAActive then
GameEvents.BuildFinished.Add(UPCA_GreatGeneralBuild)
end