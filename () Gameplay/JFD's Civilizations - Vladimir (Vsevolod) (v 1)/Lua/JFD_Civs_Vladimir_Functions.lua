-- JFD_Civs_VladimirSuzdal_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_Civs_VladimirSuzdal_DTP.lua")
include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
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
-- CORE UTILITIES
----------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if g_IsCPActive then 
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
------------------------------------------------------------------------------------------------------------------------
--Player_SendWorldEvent
local notificationWorldEventID = NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"]
function Player_SendWorldEvent(player, description, includeHuman)
	print("Sending World Event: ", description)
	local playerTeam = Teams[player:GetTeam()]
	if (not includeHuman) and player:IsHuman() then return end
	if (not playerTeam:IsHasMet(activeTeamID)) then return end
	activePlayer:AddNotification(notificationWorldEventID, description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
end 
-------------------------------------------------------------------------------------------------------------------------
--Player_SendNotification
function Player_SendNotification(player, notificationType, description, descriptionShort, global, data1, data2, unitID, data3, metOnly, includesSerialMessage)
	local notificationID = NotificationTypes[notificationType]
	local teamID = player:GetTeam()
	local data1 = data1 or -1
	local data2 = data2 or -1
	local unitID = unitID or -1
	local data3 = data3 or -1
	if global then
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	else
		if (not player:IsHuman()) then return end
		if (metOnly and activeTeam:IsHasMet(teamID) or (not metOnly)) then
			activePlayer:AddNotification(notificationID, description, descriptionShort, data1, data2, unitID, data3)
			if (includesSerialMessage and description) then Events.GameplayAlertMessage(description) end
		end
	end
end   
-------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingWhiteCathedralID = GameInfoTypes["BUILDING_JFD_WHITE_CATHEDRAL"]
local civilizationVladimirSuzdalID = GameInfoTypes["CIVILIZATION_JFD_VLADIMIR_SUZDAL"]
local traitVladimirSuzdalID = GameInfoTypes["TRAIT_JFD_VLADIMIR_SUZDAL"]
local unitPrincesRetinueID = GameInfoTypes["UNIT_JFD_PRINCES_RETINUE"]

local promotionVladimirSuzdalID = GameInfoTypes["PROMOTION_JFD_VLADIMIR_SUZDAL"]
local unitGreatWriterID = GameInfoTypes["UNIT_WRITER"]
-------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
-------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_PlayerDoTurn
local function JFD_VladimirSuzdal_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	
	--TALE OF IGOR'S CAMPAIGN
	if HasTrait(player, traitVladimirSuzdalID) then
		for unit in player:Units() do
			unit:SetHasPromotion(promotionVladimirSuzdalID, false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_VladimirSuzdal_PlayerDoTurn)
-------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_GreatPersonExpended
local unitMissionaryID = GameInfoTypes["UNIT_MISSIONARY"]
function JFD_VladimirSuzdal_GreatPersonExpended(playerID, unitID, unitType, plotX, plotY)
	local player = Players[playerID]
	if unitType ~= unitGreatWriterID then return end
	
	--WHITE CATHEDRAL
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if (not city) then
		for adjacentPlot in PlotAreaSweepIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
			local otherCity = adjacentPlot:GetPlotCity()
			if otherCity then
				city = otherCity
				break
			end
		end
	end
	if (not city:IsHasBuilding(buildingWhiteCathedralID)) then return end
	
	local religionID = city:GetReligiousMajority()
	if religionID > 0 then
		player:InitUnit(unitMissionaryID, city:GetX(), city:GetY()) 
	end
end
if g_IsCPActive then
	GameEvents.GreatPersonExpended.Add(JFD_VladimirSuzdal_GreatPersonExpended)
end

-- function WartimeInnovation(playerID, unitID, unitType, iX, iY, bDelay, killerID)
  -- if not bDelay then return end
  -- local pPlayer = Players[playerID]
  -- local pUnit = pPlayer:GetUnitByID(unitID)
  -- if pUnit:IsCombatUnit() then
    -- local pTeam = Teams[pPlayer:GetTeam()]
    -- local iCurrentTech = pPlayer:GetCurrentResearch()
    -- local iStrength = GameInfo.Units[unitType].Combat
    -- local iScienceGain = math.ceil(iStrength / 10)
    -- pTeam:GetTeamTechs():ChangeResearchProgress(iCurrentTech, iScienceGain, playerID)
  -- end
-- end
-- GameEvents.UnitPrekill.Add(WartimeInnovation)

-- function totalWar(teamID, otherTeamID)
    -- if teamID == 0 or otherTeamID == 0 then return end
    -- local mainTeam = Teams[teamID]
    -- mainTeam:DeclareWar(otherTeamID)
-- end
-- GameEvents.MakePeace.Add(totalWar)

--------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_UnitPrekill
local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]
local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]
function JFD_VladimirSuzdal_UnitPrekill(unitOwnerID, unitID, unitType, plotX, plotY, isDelay, playerID)
	local player = Players[playerID]
	if isDelay then return end
	
	--WHITE CATHEDRAL
	if playerID == -1 and (not g_IsCPActive) and HasTrait(Players[unitOwnerID], traitVladimirSuzdalID) then
		JFD_VladimirSuzdal_GreatPersonExpended(unitOwnerID, unitID, unitType, plotX, plotY)
	end

	if (not player) then return end
	if (not player:IsAlive()) then return end
	
	--TALE OF IGOR'S CAMPAIGN
	if unitOwnerID ~= playerID and HasTrait(player, traitVladimirSuzdalID) then
		local plot = Map.GetPlot(plotX, plotY)
		local plotOwnerID = plot:GetOwner()
		if (plotOwnerID == playerID or Players[plotOwnerID]:IsMinorCiv()) then
			local numWriterPoints = GameInfo.Units[unitType].Combat
			if numWriterPoints == 0 then return end

			local writerCity = player:GetCapitalCity()
			for city in player:Cities() do
				if city:IsHasBuilding(buildingWritersGuildID) then
					writerCity = city
					break
				end
			end
			writerCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, (numWriterPoints*100))

			if player:IsHuman() then
				local hex = ToHexFromGrid(Vector2(unitX, unitY))
				Events.AddPopupTextEvent(HexToWorld(hex), Locale.ConvertTextKey("[COLOR_GREAT_PEOPLE_STORED]+{1_Num}[ENDCOLOR] [ICON_GREAT_PEOPLE] Great Writer Points", numWriterPoints), true)
			end
		end
	end
end
GameEvents.UnitPrekill.Add(JFD_VladimirSuzdal_UnitPrekill)
--------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_SerialEventUnitCreated
local promotionVladimirSuzdalWriterID = GameInfoTypes["PROMOTION_JFD_VLADIMIR_SUZDAL_WRITER"]
local resourceIronID 	  		= GameInfoTypes["RESOURCE_IRON"]
local unitGreatGeneralID 	  	= GameInfoTypes["UNIT_GREAT_GENERAL"]
local function JFD_VladimirSuzdal_SerialEventUnitCreated(playerID, unitID)
    local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatWriterID then return end
	if unit:IsHasPromotion(promotionVladimirSuzdalWriterID) then return end
			
	--TALE OF IGOR'S CAMPAIGN
	if HasTrait(player, traitVladimirSuzdalID) then
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				unit:SetHasPromotion(promotionVladimirSuzdalID, true)
				unit:ChangeMoves(120)
			end
		end
		unit:SetHasPromotion(promotionVladimirSuzdalWriterID, true)
	end	
end
if (not g_IsCPActive) then
	Events.SerialEventUnitCreated.Add(JFD_VladimirSuzdal_SerialEventUnitCreated)
end
--------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_UnitCreated
local function JFD_VladimirSuzdal_UnitCreated(playerID, unitID, unitType, plotX, plotY)
    local player = Players[playerID]
	local unit = player:GetUnitByID(unitID)
	if (not unit) then return end
	if unit:GetUnitType() ~= unitGreatWriterID then return end
			
	--TALE OF IGOR'S CAMPAIGN
	if HasTrait(player, traitVladimirSuzdalID) then
		for unit in player:Units() do
			if unit:IsCombatUnit() then
				unit:SetHasPromotion(promotionVladimirSuzdalID, true)
				unit:ChangeMoves(120)
			end
		end
	end	
end
if g_IsCPActive then
	GameEvents.UnitCreated.Add(JFD_VladimirSuzdal_UnitCreated)
end
-------------------------------------------------------------------------------------------------------------------------
--JFD_VladimirSuzdal_CityTrained
local greatWorkLiteratureID = GameInfoTypes["GREAT_WORK_SLOT_LITERATURE"]
local function JFD_VladimirSuzdal_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end

	--PRINCE'S RETINUE
	local unit = player:GetUnitByID(unitID)
	if unit:GetUnitType() ~= unitPrincesRetinueID then return end
	if (not HasTrait(player, traitVladimirSuzdalID)) then return end

	local city = player:GetCityByID(cityID)
	local numGreatWorks = city:GetNumGreatWorks(greatWorkLiteratureID)
	if numGreatWorks == 0 then return end
	unit:ChangeExperience(numGreatWorks*5)
end
GameEvents.CityTrained.Add(JFD_VladimirSuzdal_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
