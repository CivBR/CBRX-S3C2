-- Sas_SRB_Functions
-- Author: JFD
-- DateCreated: 4/13/2014 4:19:30 PM

include("IconSupport")
include("FLuaVector.lua")
include("PlotIterators.lua")

local buildingSRBID = GameInfoTypes["BUILDING_SAS_SRB"]
local unitRSRID = GameInfoTypes["UNIT_SAS_RSR"]
local buildingIconAtlas = "SAS_UGANDA_ICON_ATLAS" 
local buildingIconIndex = 3 

local numSRBGoldGainXCityGoldPerTurn = 5 
local numRSRXPGain = 15 

local civilizationID = GameInfoTypes["CIVILIZATION_SAS_UGANDA"]

local yieldGoldID = GameInfoTypes["YIELD_GOLD"]
-------------------------------------------------------------------------------------------------------------------------
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

function Sas_SRB_DoCommitGenocide(player, city)
	local numGold = (numSRBGoldGainXCityGoldPerTurn*city:GetBaseYieldRate(yieldGoldID))

	city:ChangePopulation(-1, true)
	player:ChangeGold(numGold)

	local unitGarrison = city:GetGarrisonedUnit()
	if unitGarrison then
		if unitGarrison:GetUnitType() == unitRSRID then
			unitGarrison:ChangeExperience(numRSRXPGain)
		end
	end
	
	if player:IsHuman() and player:IsTurnActive() then
		Events.AudioPlay2DSound("AS2D_INTERFACE_CITY_SCREEN_PURCHASE")
		
		local hex = ToHexFromGrid(Vector2(city:GetX(), city:GetY()))
		Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]-1[ENDCOLOR] [ICON_CITIZEN] Citizen, +[COLOR_YIELD_GOLD]{1_Num}[ENDCOLOR] [ICON_GOLD] Gold", numGold), true)
	end

	local hasKilledUnit = false
	local plot = Map.GetPlot(city:GetX(),city:GetY())
	for loopPlot in PlotAreaSpiralIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
		for index = 0,(loopPlot:GetNumUnits() - 1) do
			local adjUnit = loopPlot:GetUnit(index)
			if adjUnit then
				local adjUnitOwnerID = adjUnit:GetOwner()
				if adjUnitOwnerID ~= playerID and adjUnit:IsCombatUnit() then
					local unitPlot = Map.GetPlot(adjUnit:GetX(), adjUnit:GetY())
					if (player:IsHuman() and player:IsTurnActive()) then
						UI.LookAt(unitPlot, 0)
						local hex = ToHexFromGrid{ x=unitPlot:GetX(), y=unitPlot:GetY() }
						Events.GameplayFX( hex.x, hex.y, -1 )
						Events.GameplayAlertMessage(Locale.ConvertTextKey("An enemy [COLOR_POSITIVE_TEXT]{1_Adj} {2_Desc}[ENDCOLOR] has been killed!", Players[adjUnit:GetOwner()]:GetCivilizationAdjective(), adjUnit:GetName()))
					end
					adjUnit:Kill(-1)
					hasKilledUnit = true
					break 
				end
			end
		end
	end
	if (not hasKilledUnit) then
		for otherPlayerID = 0, 64 - 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer:IsAlive() then
				if Teams[otherPlayer:GetTeam()]:IsAtWar(playerTeamID) then
					for unit in otherPlayer:Units() do
						local unitPlot = Map.GetPlot(unit:GetX(), unit:GetY())
						if unitPlot:GetOwner() ~= playerID then
							if (player:IsHuman() and player:IsTurnActive()) then
								UI.LookAt(unitPlot, 0)
								local hex = ToHexFromGrid{ x=unitPlot:GetX(), y=unitPlot:GetY() }
								Events.GameplayFX( hex.x, hex.y, -1 )
								Events.GameplayAlertMessage(Locale.ConvertTextKey("An enemy [COLOR_POSITIVE_TEXT]{1_Adj} {2_Desc}[ENDCOLOR] has been killed!", otherPlayer:GetCivilizationAdjective(), adjUnit:GetName()))
							end
							adjUnit:Kill(-1)
							break
						end
					end
				end
			end
		end
	end
end


local isCityViewOpen = false
-- Sas_SRB_UpdateButton
function Sas_SRB_UpdateButton()
	Controls.SRBBox:SetHide(true)
	Controls.SRBImage:SetHide(true)
	Controls.SRBButton:SetDisabled(true)
	Controls.SRBButton:LocalizeAndSetToolTip(nil)
	local city = UI.GetHeadSelectedCity()
	if city then
		local cityID = city:GetID()
		if city:IsHasBuilding(buildingSRBID) then
			local numGold = (numSRBGoldGainXCityGoldPerTurn*city:GetBaseYieldRate(yieldGoldID))
			
			if (city:GetPopulation() < 2) then
				Controls.SRBButton:SetDisabled(true)
				Controls.SRBButton:LocalizeAndSetText("TXT_KEY_SAS_SRB")
				Controls.SRBButton:LocalizeAndSetToolTip("TXT_KEY_SAS_SRB_DISABLED_TT", numGold)
			else
				Controls.SRBButton:LocalizeAndSetText("Purge Population")
				Controls.SRBButton:LocalizeAndSetToolTip("TXT_KEY_SAS_SRB_TT", numGold)
				Controls.SRBButton:SetDisabled(false)
			end
			IconHookup(buildingIconIndex, 64, buildingIconAtlas, Controls.SRBImage)
			Controls.SRBBox:SetHide(false)
			Controls.SRBImage:SetHide(false)
		end
	end
end

-- SRBButton
function SRBButton()
	local city = UI.GetHeadSelectedCity()
	if city then
		if city:IsHasBuilding(buildingSRBID) then
			Controls.ChooseConfirm:SetHide(false)
			Controls.ConfirmText:LocalizeAndSetText("TXT_KEY_SAS_SRB_CONFIRM", city:GetName())
		end
	end
end
Controls.SRBButton:RegisterCallback(Mouse.eLClick, SRBButton)

-- SerialEventEnterCityScreen
function SerialEventEnterCityScreen()
	isCityViewOpen = true
	Sas_SRB_UpdateButton()
end

-- SerialEventExitCityScreen
function SerialEventExitCityScreen()
	isCityViewOpen = false
	Sas_SRB_UpdateButton()
end

-- SerialEventCityScreenDirty
function SerialEventCityScreenDirty()
	if isCityViewOpen then
		Sas_SRB_UpdateButton()
	end
end
if JFD_IsCivilisationActive(civilizationID) then
	Events.SerialEventEnterCityScreen.Add(SerialEventEnterCityScreen)
	Events.SerialEventExitCityScreen.Add(SerialEventExitCityScreen)
	Events.SerialEventCityScreenDirty.Add(SerialEventCityScreenDirty)
	Events.SerialEventCityInfoDirty.Add(SerialEventEnterCityScreen)
end
-------------------------------------------------------------------------------
function ConfirmYes()
	local activePlayerID = Game.GetActivePlayer()
	local activePlayer = Players[activePlayerID]
	local city = UI.GetHeadSelectedCity()
	Controls.ChooseConfirm:SetHide(true);
	Sas_SRB_DoCommitGenocide(activePlayer, city)
	SerialEventEnterCityScreen()
end
if JFD_IsCivilisationActive(civilizationID) then
	Controls.ConfirmYes:RegisterCallback(Mouse.eLClick, ConfirmYes );
end
-------------------------------------------------------------------------------
function ConfirmNo()
	Controls.ChooseConfirm:SetHide(true);
end
if JFD_IsCivilisationActive(civilizationID) then
	Controls.ConfirmNo:RegisterCallback(Mouse.eLClick, ConfirmNo );
end