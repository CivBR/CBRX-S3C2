-- JFD_Civs_AngloNorse_Functions
-- Author: JFD
-- DateCreated: 5/4/2014 12:54:31 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("AdditionalAchievementsUtility.lua")
include("FLuaVector.lua")
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
-- UTILITIES
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
local isCPActive = Game_IsCPActive()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if isCPActive then 
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
-------------------------------------------------------------------------------------------------------------------------
--Player_GetAtWarCount
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
function Player_GetAtWarCount(player, isLarger)
	local playerTeam = Teams[player:GetTeam()]
	local numAtWar = 0
	local numCities = player:GetNumCities()
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if playerTeam:IsAtWar(otherPlayer:GetTeam()) and ((not isLarger) or (isLarger and otherPlayer:GetNumCities() > numCities)) then
			numAtWar = numAtWar + 1
		end
	end
	return numAtWar
end	
--=======================================================================================================================
-- MOD USE
--=======================================================================================================================
-- MODS
-------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------
--Game_IsAAActive
function Game_IsAAActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "432bc547-eb05-4189-9e46-232dbde8f09f" then
			return true
		end
	end
	return false
end
local isAAActive = Game_IsAAActive()
-------------------------------------------------------------------------------------------------------------------------
-- SETTINGS
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local buildingCourthouseID 			   = GameInfoTypes["BUILDING_COURTHOUSE"]
local traitAngloNorseID   			   = GameInfoTypes["TRAIT_JFD_ANGLO_NORSE"]
local promotionDrakkerID  			   = GameInfoTypes["PROMOTION_JFD_DRAKKER"]
local promotionDrakkerCoastalRaiderID  = GameInfoTypes["PROMOTION_JFD_DRAKKER_COASTAL_RAIDER"]
local promotionTinglidActiveID  	   = GameInfoTypes["PROMOTION_JFD_TINGLID_ACTIVE"]
local promotionTinglidInactiveID  	   = GameInfoTypes["PROMOTION_JFD_TINGLID_INACTIVE"]
local unitDrakkerID  	  			   = GameInfoTypes["UNIT_JFD_DRAKKER"]
local unitTinglid  	  			  	   = GameInfo.Units["UNIT_JFD_TINGLID"]
local unitTinglidID  	  			   = GameInfoTypes["UNIT_JFD_TINGLID"]
--------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------------------------------------------------
--JFD_AngloNorse_PlayerDoTurn
local buildingAngloNorseProductionID   = GameInfoTypes["BUILDING_JFD_ANGLO_NORSE_PRODUCTION"]
local domainLandID  				   = GameInfoTypes["DOMAIN_LAND"]
local function JFD_AngloNorse_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	
	--NORTH SEA EMPIRE
	if HasTrait(player, traitAngloNorseID) then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingAngloNorseProductionID, 0)
			
			local currentBuildingID = city:GetProductionBuilding()
			local hasBuilding = false
			
			for city2 in player:Cities() do
				if (city2:GetOriginalOwner() ~= playerID and city2:IsOriginalCapital() and city2:IsHasBuilding(currentBuildingID)) then
					hasBuilding = true
					break
				end	
			end
			
			if hasBuilding then
				city:SetNumRealBuilding(buildingAngloNorseProductionID, 1)
			end
		end	
	end
	
	--DRAKKER
	for unit in player:Units() do
		if (unit:IsCombatUnit() and unit:GetDomainType() == domainLandID) then
			local plot = unit:GetPlot()
			local isWithinDistance = false
			if isCPActive then
				isWithinDistance = unit:IsWithinDistanceOfUnit(unitDrakkerID, 2, true, false)
			else
				for loopPlot in PlotAreaSpiralIterator(plot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					local plotUnit = loopPlot:GetUnit()
					isWithinDistance = (plotUnit and plotUnit:GetOwner() == playerID and plotUnit:GetUnitType() == unitDrakkerID)
					if isWithinDistance then break end
				end		
			end		
			unit:SetHasPromotion(promotionDrakkerCoastalRaiderID, isWithinDistance)
		end
	end
	
	--TINGLID
	local numGAXP = 0
	local numGGXP = 0
	for unit in player:Units() do
		if (unit:IsHasPromotion(promotionTinglidActiveID) or unit:IsHasPromotion(promotionTinglidInactiveID)) then 
			local plotCity = unit:GetPlot():GetPlotCity()
			if plotCity then
				unit:SetHasPromotion(promotionTinglidActiveID, 	  true)
				unit:SetHasPromotion(promotionTinglidInactiveID,  false)
				if plotCity:GetOriginalOwner() == playerID then
					numGAXP = unit:GetLevel()
				else
					numGGXP = unit:GetLevel()
				end
			else
				unit:SetHasPromotion(promotionTinglidActiveID, 	  false)
				unit:SetHasPromotion(promotionTinglidInactiveID,  true)
			end
		end
	end
	if numGAXP > 0 then
		player:ChangeNavalCombatExperience(numGAXP)
	end
	if numGGXP > 0 then
		player:ChangeCombatExperience(numGGXP)
	end
						
	--SPECIAL ACHIEVEMENT
	if playerID ~= activePlayerID then return end
	if (not isAAActive) then return end
	if IsAAUnlocked('AA_JFD_ANGLO_NORSE_SPECIAL') then return end
	local numCapitals = 0
	local hasOriginalCapital = false
	for city in player:Cities() do
		if city:IsOriginalCapital() then
			numCapitals = numCapitals + 1
			if city:GetOriginalOwner() == playerID then
				hasOriginalCapital = true
			end
		end
	end
	if (hasOriginalCapital and numCapitals >= 3 and player:GetExcessHappiness() >= 10) then
		UnlockAA('AA_JFD_ANGLO_NORSE_SPECIAL');
	end
end
GameEvents.PlayerDoTurn.Add(JFD_AngloNorse_PlayerDoTurn)
--------------------------------------------------------------------------------------------------------------------------
--JFD_AngloNorse_CityCaptureComplete
local buildingCourthousePrereqTechID = GameInfoTypes[GameInfo.Buildings["BUILDING_COURTHOUSE"].PrereqTech]
local function JFD_AngloNorse_CityCaptureComplete(oldPlayerID, isCapital, plotX, plotY, newPlayerID)
	local player = Players[newPlayerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
			
	--NORTH SEA EMPIRE
	if (not HasTrait(player, traitAngloNorseID)) then return end
	
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if city:GetOriginalOwner() == newPlayerID then return end
	if (not city:IsOriginalCapital()) then return end
	city:ChangeResistanceTurns(-city:GetResistanceTurns())
	
	if (not playerTeam:GetTeamTechs():HasTech(buildingCourthousePrereqTechID)) then return end
	local numProduction = player:GetBuildingProductionNeeded(buildingCourthouseID)
	city:ChangeBuildingProduction(buildingCourthouseID, (numProduction/2))
end
GameEvents.CityCaptureComplete.Add(JFD_AngloNorse_CityCaptureComplete)
--------------------------------------------------------------------------------------------------------------------------
--JFD_AngloNorse_SerialEventCityInfoDirty
function JFD_AngloNorse_SerialEventCityInfoDirty()
	local city = UI.GetHeadSelectedCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsHuman() then return end
	if player:IsTurnActive() then return end
	
	--NORTH SEA EMPIRE
	if HasTrait(player, traitAngloNorseID) then
		city:SetNumRealBuilding(buildingAngloNorseProductionID, 0)
		
		local currentBuildingID = city:GetProductionBuilding()
		if currentBuildingID == -1 then return end
		local hasBuilding = false
		
		for city2 in player:Cities() do
			if (city2:GetOriginalOwner() ~= playerID and city2:IsOriginalCapital() and city2:IsHasBuilding(currentBuildingID)) then
				hasBuilding = true
				break
			end	
		end
		
		if hasBuilding then
			city:SetNumRealBuilding(buildingAngloNorseProductionID, 1)
		end
	end
end
-- Events.SerialEventCityScreenDirty.Add(JFD_AngloNorse_SerialEventCityInfoDirty);
-- Events.SerialEventCityInfoDirty.Add(JFD_AngloNorse_SerialEventCityInfoDirty);
--------------------------------------------------------------------------------------------------------------------------
--JFD_AngloNorse_CityConstructed
local unitTinglidPrereqTechID = GameInfoTypes[unitTinglid.PrereqTech]
local unitTinglidObsoleteTechID = GameInfoTypes[unitTinglid.ObsoleteTech]
local function JFD_AngloNorse_CityConstructed(playerID, cityID, buildingID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if (not HasTrait(player, traitAngloNorseID)) then return end
	
	---TINGLID
	if buildingID ~= buildingCourthouseID then return end
	if (not playerTeam:GetTeamTechs():HasTech(unitTinglidPrereqTechID)) then return end
	if playerTeam:GetTeamTechs():HasTech(unitTinglidObsoleteTechID) then return end
	local city = player:GetCityByID(cityID)
	player:InitUnit(unitTinglidID, city:GetX(), city:GetY())
end
GameEvents.CityConstructed.Add(JFD_AngloNorse_CityConstructed)
--=======================================================================================================================
--=======================================================================================================================
