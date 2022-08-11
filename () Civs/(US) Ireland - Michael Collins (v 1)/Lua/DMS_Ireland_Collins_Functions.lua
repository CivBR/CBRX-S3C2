-- DMS_Ireland_Collins_Functions
-- Author: DMS
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators.lua")
include("IconSupport")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local bPrintForDebug = DMS_GetUserSetting("US_IRELAND_COLLINS_DEBUGGING_ON") == 1
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
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
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
----------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_toBits
----------------------------------------------------------------------------------------------------------------------------
function DMS_toBits(num)
	DMS_Print("DMS_toBits called with num = " .. num .. "..")
	tableBits={}
    while num > 0 do
		DMS_Print("DMS_toBits: num = " .. num .. " > 0..")
        local remainder = math.fmod(num, 2)
		DMS_Print("DMS_toBits: remainder = " .. remainder .. " = math.fmod(num, 2)..")
        tableBits[#tableBits + 1] = remainder
		DMS_Print("DMS_toBits: remainder = " .. remainder .. " added to table at index " .. #tableBits + 1 .. "..")
        num = (num - remainder) / 2
    end
	DMS_Print("DMS_toBits: return table..")
    return tableBits
end
--==========================================================================================================================
-- VARIABLES
--==========================================================================================================================
-- Player and Components
----------------------------------------------------------------------------------------------------------------------------
local Players									= Players
local activePlayerID 							= Game.GetActivePlayer()
local activePlayer 								= Players[activePlayerID]
local activePlayerTeam 							= Teams[Game.GetActiveTeam()]
local civilisationIreland						= GameInfoTypes["CIVILIZATION_US_IRELAND"]
local isIrelandCivActive 						= JFD_IsCivilisationActive(civilisationIreland)
local isIrelandActivePlayer 					= activePlayer:GetCivilizationType() == civilisationIreland
local stringFormat								= string.format
local traitAugustDestiny						= GameInfoTypes["TRAIT_US_AUGUST_DESTINY"]
local buildingPublicHouse						= GameInfoTypes["BUILDING_US_PUBLIC_HOUSE"]
local buildingClassPublicHouse					= GameInfoTypes["BUILDINGCLASS_THEATRE"]
local unitFenian								= GameInfoTypes["UNIT_US_FENIAN"]
local promotionBloodOfTheMartyr					= GameInfoTypes["PROMOTION_US_BLOOD_OF_THE_MARTYRS"]
local buildingPublicHouseHappinessForeignCivs	= GameInfoTypes["BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS"]
local buildingAugustDestinyMusician				= GameInfoTypes["BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN"]
local buildingAugustDestinyWriter				= GameInfoTypes["BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER"]
local buildingAugustDestinyArtist				= GameInfoTypes["BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST"]
local buildingAugustDestinyDefense				= GameInfoTypes["BUILDING_US_AUGUST_DESTINY_DEFENSE"]
local buildingPublicHouseGreatWorkHappiness		= GameInfoTypes["BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS"]
local buildingPublicHouseIrelandHappiness		= GameInfoTypes["BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND"]
local resourceWheat								= GameInfoTypes["RESOURCE_WHEAT"]
local resourceWine								= GameInfoTypes["RESOURCE_WINE"]
local specialistMusician						= GameInfoTypes["SPECIALIST_MUSICIAN"]
local unitGreatWriter							= GameInfoTypes["UNIT_WRITER"]
local unitGreatArtist							= GameInfoTypes["UNIT_ARTIST"]
local unitGreatMusician							= GameInfoTypes["UNIT_MUSICIAN"]
local tablePublicHouseTourism = {}
for i = 1, 50 do
	tablePublicHouseTourism[i] = GameInfoTypes["BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_" .. i .. ""]
end
local tableGreatWorksTourism = {}
for i = 1, 50 do
	tableGreatWorksTourism[i] = GameInfoTypes["BUILDING_US_AUGUST_DESTINY_TOURISM_" .. i .. ""]
end
local tableGreatWorkBuildings = {}
for building in GameInfo.Buildings() do
	if building.GreatWorkCount > 0 then
		local buildingClass = GameInfo.BuildingClasses("Type = '" .. building.BuildingClass .. "'")()
		tableGreatWorkBuildings[buildingClass.ID] = buildingClass.Type
	end
end
local tableDefensiveBuildings = {}
for building in GameInfo.Buildings() do
	if building.Defense > 0 and building.Cost > 0 then
		tableDefensiveBuildings[building.ID] = building.Type
	end
end
local tablePromotionBloodOfTheMartyr = {}
for i = 1, 5 do
	tablePromotionBloodOfTheMartyr[i] = GameInfoTypes["PROMOTION_US_BLOOD_OF_THE_MARTYRS_" .. i .. ""]
end

if isIrelandCivActive then
	print("Michael Collins of the Irish Empire joins the game - watch out you English scum!")
end
----------------------------------------------------------------------------------------------------------------------------
-- Math
----------------------------------------------------------------------------------------------------------------------------
local mathCeil 									= math.ceil
local mathFloor									= math.floor
----------------------------------------------------------------------------------------------------------------------------
-- GameEvents
----------------------------------------------------------------------------------------------------------------------------
local PlayerDoTurn								= GameEvents.PlayerDoTurn.Add
local UnitSetXY									= GameEvents.UnitSetXY.Add
--==========================================================================================================================
-- FUNCTIONS
--==========================================================================================================================
-- DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists(city)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists: called for city: %s", city:GetName()))
	if city:IsHasBuilding(buildingAugustDestinyArtistID) then
		city:SetNumRealBuilding(buildingAugustDestinyArtistID, 0)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists: removed building buildingAugustDestinyArtistID"))
	end
	if city:IsHasBuilding(buildingAugustDestinyWriterID) then
		city:SetNumRealBuilding(buildingAugustDestinyWriterID, 0)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists: removed building buildingAugustDestinyWriterID"))
	end
	if city:IsHasBuilding(buildingAugustDestinyMusicianID) then
		city:SetNumRealBuilding(buildingAugustDestinyMusicianID, 0)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists: removed building buildingAugustDestinyMusicianID"))
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists(city)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists: called for city: %s", city:GetName()))
	local garrisonedUnit = city:GetGarrisonedUnit()
	if garrisonedUnit == nil or garrisonedUnit == -1 then return end
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists: garrisonedUnitType: %s", garrisonedUnit:GetName()))
	local unitLevel = garrisonedUnit:GetLevel()
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists: unitLevel: i%", unitLevel))
	if unitLevel > 0 and unitLevel <= 3 then
		city:SetNumRealBuilding(buildingAugustDestinyWriter, 1)
	elseif unitLevel > 3 and unitLevel <= 5 then
		city:SetNumRealBuilding(buildingAugustDestinyArtist, 1)
	elseif unitLevel > 5 then
		city:SetNumRealBuilding(buildingAugustDestinyMusician, 1)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UB_MusicianPointsFromWheatAndWine
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UB_MusicianPointsFromWheatAndWine(playerID, city)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_MusicianPointsFromWheatAndWine: called for city: %s", city:GetName()))
	local cityPlot = city:Plot()
	if cityPlot == nil or cityPlot == -1 then return end
	for plot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if plot:GetOwner() == playerID then
			if city:IsWorkingPlot(plot) then
				if plot:GetResourceType() == resourceWheat or plot:GetResourceType() == resourceWine then
					city:ChangeSpecialistGreatPersonProgressTimes100(specialistMusician, 2 * 100)
					DMS_Print(stringFormat("DMS_Ireland_Collins_UB_MusicianPointsFromWheatAndWine: found wheat or wine at plot: %i, %i", plot:GetX(), plot:GetY()))
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UB_HappinessFromGreatWork
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UB_HappinessFromGreatWork(city)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_HappinessFromGreatWork: called for city: %s", city:GetName()))
	if city:GetNumGreatWorksInBuilding(buildingClassPublicHouse) > 0 then
		if not city:IsHasBuilding(buildingPublicHouseGreatWorkHappiness) then
			city:SetNumRealBuilding(buildingPublicHouseGreatWorkHappiness, 1)
			DMS_Print(stringFormat("DMS_Ireland_Collins_UB_HappinessFromGreatWork: added a buildingPublicHouseGreatWorkHappiness building"))
		end
	else
		if city:IsHasBuilding(buildingPublicHouseGreatWorkHappiness) then
			city:SetNumRealBuilding(buildingPublicHouseGreatWorkHappiness, 0)
			DMS_Print(stringFormat("DMS_Ireland_Collins_UB_HappinessFromGreatWork: removed a buildingPublicHouseGreatWorkHappiness building"))
		end	
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UB_PlaceForeignPubs
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UB_PlaceForeignPubs(playerID, player, otherPlayerID, otherPlayer, capital, city)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_PlaceForeignPubs: called for city: %s", city:GetName()))
	if city:IsHasBuilding(buildingPublicHouseHappinessForeignCivs) then return end
	local chance = JFD_GetRandom(1,100)
	if chance < 10 then return end -- TODO: Set threshold to 2 when done testing
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_PlaceForeignPubs: chance: %i", chance))
	city:SetNumRealBuilding(buildingPublicHouseHappinessForeignCivs, 1)
	local numForeignPubs = capital:GetNumRealBuilding(buildingPublicHouseIrelandHappiness)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_PlaceForeignPubs: old numForeignPubs: %i", numForeignPubs))
	numForeignPubs = numForeignPubs + 1
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_PlaceForeignPubs: new numForeignPubs: %i", numForeignPubs))
	capital:SetNumRealBuilding(buildingPublicHouseIrelandHappiness, numForeignPubs)
	if player:IsHuman() then
		local description = "Public House"
		local descriptionShort = "A Public House has been built in the " .. otherPlayer:GetCivilizationAdjective() .. " City of " .. city:GetName() .. "."
		JFD_SendNotification(playerID, 'NOTIFICATION_GENERIC', description, descriptionShort, false, city:GetX(), city:GetY())
	elseif otherPlayer:IsHuman() then
		local description = "Public House"
		local descriptionShort = "An " .. pPlayer:GetCivilizationAdjective() .. " Public House has been built in our City, " .. city:GetName() .. "."
		JFD_SendNotification(otherPlayerID, 'NOTIFICATION_GENERIC', description, descriptionShort, false, city:GetX(), city:GetY())
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UB_FindCivsInfluentialOver
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UB_FindCivsInfluentialOver(playerID, player, otherPlayerID, otherPlayer, capital)
	if capital == nil then return end
	if not capital:IsHasBuilding(buildingPublicHouse) then return end
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: called for otherPlayer: %s", otherPlayer:GetCivilizationShortDescription()))
	if playerID == otherPlayerID then return end
	DMS_Print("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: Checking if a Pub should be placed in cities of " .. otherPlayer:GetCivilizationShortDescription())
	DMS_Print("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: GetInfluenceOn: " .. player:GetInfluenceOn(otherPlayer))
	DMS_Print("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: GetInfluenceLevel: " .. player:GetInfluenceLevel(otherPlayer))
	DMS_Print("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: GetInfluenceTrend: " .. player:GetInfluenceTrend(otherPlayer))
	
	-- INFLUENCE_LEVEL_UNKNOWN
	-- INFLUENCE_LEVEL_EXOTIC
	-- INFLUENCE_LEVEL_FAMILIAR
	-- INFLUENCE_LEVEL_POPULAR
	-- INFLUENCE_LEVEL_INFLUENTIAL
	-- INFLUENCE_LEVEL_DOMINANT
	
	if player:GetInfluenceOn(otherPlayer) < 4 then return end
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_FindCivsInfluentialOver: find cities to place pubs in"))
	for city in otherPlayer:Cities() do
		DMS_Ireland_Collins_UB_PlaceForeignPubs(playerID, player, otherPlayerID, otherPlayer, capital, city)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities(capital)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities: called for capital: %s", capital:GetName()))
	if not capital:IsHasBuilding(buildingPublicHouse) then return end
	local numForeignPubs = capital:GetNumRealBuilding(buildingPublicHouseIrelandHappiness)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities: numForeignPubs: %i", numForeignPubs))
	local tableTourism = DMS_toBits(numForeignPubs)
	for i, v in ipairs(tableTourism) do
		capital:SetNumRealBuilding(tablePublicHouseTourism[i], v)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities: set foreign pub tourism building %i to %i", i, v))
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields(playerID, player, otherPlayerID, otherPlayer, capital)
	local numIrishGreatWorks = 0
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields: called for otherPlayer: %s", otherPlayer:GetCivilizationShortDescription()))
	local greatWorks = otherPlayer:GetOthersGreatWorks()
	for greatWork in ipairs(greatWorks) do
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields: great work creator: %i", greatWork.iPlayer)) -- TODO: is this the id of the creator civ?
		if greatWork.iPlayer == playerID then
			numIrishGreatWorks = numIrishGreatWorks + 1
			DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields: numIrishGreatWorks: %i", numIrishGreatWorks))
		end
	end
	local yieldBonus = mathFloor(numIrishGreatWorks / 2)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields: yieldBonus: %i", yieldBonus))
	local tableTourism = DMS_toBits(yieldBonus)
	for i, v in ipairs(tableTourism) do
		capital:SetNumRealBuilding(tableGreatWorksTourism[i], v)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields: set august destiny tourism building %i to %i", i, v))
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense(playerID, city)
	local greatWorkDefenseBonus = 0
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense: called for city: %s", city:GetName()))
	for buildingClassID, buildingClassType in pairs(tableGreatWorkBuildings) do
		local currentWorks = city:GetNumGreatWorksInBuilding(buildingClassID)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense: city %s has i% great works in buildingclass %s", city:GetName(), currentWorks, buildingClassType))
		if currentWorks > 0 then
			for i = 0, currentWorks - 1, 1 do
				local greatWork = city:GetBuildingGreatWork(buildingClassID, i)
				local creator = Game.GetGreatWorkCreator(greatWork)
				DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense: great work %i in buildingclass %s is created by playerID %i", i, buildingClassType, creator))
				if creator == playerID then 
					greatWorkDefenseBonus = greatWorkDefenseBonus + 1
					DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense: greatWorkDefenseBonus: %i", greatWorkDefenseBonus))
				end
			end
		end
	end
	if greatWorkDefenseBonus == 0 then return end
	DMS_Print(stringFormat("DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense: total greatWorkDefenseBonus: %i, set dummy defense buildings", greatWorkDefenseBonus))
	city:SetNumRealBuilding(buildingAugustDestinyDefense, greatWorkDefenseBonus)
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength(playerID, unit, unitPlot)
	if not unit:IsHasPromotion(promotionBloodOfTheMartyr) then return end
	DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: playerID: %i, unitPlot: %i, %i", playerID, unitPlot:GetX(), unitPlot:GetY()))
	local numDefenseBuildings = 0
	for nearbyPlot in PlotAreaSweepIterator(unitPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
		if nearbyPlot:IsCity() then
			DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: city found at nearbyPlot: %i, %i", unitPlot:GetX(), unitPlot:GetY()))
			local city = nearbyPlot:GetPlotCity()
			if city ~= nil and city ~= -1 then
				if city:GetOwner() == playerID then
					DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: city: %i, city owner: %i", city:GetName(), playerID))
					for buildingID, buildingType in pairs(tableDefensiveBuildings) do
						if city:IsHasBuilding(buildingID) then
							numDefenseBuildings = numDefenseBuildings + 1
						end
					end
					DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: city: %i, numDefenseBuildings: %i", city:GetName(), numDefenseBuildings))
				end
			end
		end	
	end
	if numDefenseBuildings == 0 then return end
	numDefenseBuildings = mathMax(5, numDefenseBuildings)
	DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: capped total numDefenseBuildings: %i", numDefenseBuildings))
	for i = 1, 5 do
		local bool = false
		if i == numDefenseBuildings then
			bool = true
		end
		unit:SetHasPromotion(tablePromotionBloodOfTheMartyr[i], bool)
		DMS_Print(stringFormat("DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength: promotionBloodOfTheMartyr %i is set to %i", i, bool))
	end
end
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- DMS_Ireland_Collins_PlayerDoTurn
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	if not HasTrait(player, traitAugustDestiny) then return end
	local turn = Game.GetGameTurn()
	DMS_Print(stringFormat("DMS_Ireland_Collins_PlayerDoTurn: playerID: %i, turn: %i", playerID, turn))
	for city in player:Cities() do
		DMS_Print(stringFormat("DMS_Ireland_Collins_PlayerDoTurn: city: %s", city:GetName()))
		DMS_Ireland_Collins_UA_IrishGreatWorksInIrishCityDefense(playerID, city)
		DMS_Ireland_Collins_UA_GarrisonedUnitsResetSpecialists(city)
		DMS_Ireland_Collins_UA_GarrisonedUnitsProvideSpecialists(city)
		if city:IsHasBuilding(buildingPublicHouse) then
			DMS_Ireland_Collins_UB_MusicianPointsFromWheatAndWine(playerID, city)
			DMS_Ireland_Collins_UB_HappinessFromGreatWork(city)
		end
	end
	local capital = player:GetCapitalCity()
	if capital ~= nil or capital ~= -1 then
		for otherPlayerID = 0, GameDefines.MAX_CIV_PLAYERS - 1, 1 do
			local otherPlayer = Players[otherPlayerID]
			if otherPlayer ~= nil and otherPlayer ~= -1 then
				if otherPlayer:IsAlive() then
					DMS_Print(stringFormat("DMS_Ireland_Collins_PlayerDoTurn: otherPlayer: %s", otherPlayer:GetCivilizationShortDescription()))
					DMS_Ireland_Collins_UB_FindCivsInfluentialOver(playerID, player, otherPlayerID, otherPlayer, capital)
					DMS_Ireland_Collins_UA_IrishGreatWorksInForeignCityYields(playerID, player, otherPlayerID, otherPlayer, capital)
				end
			end
		end
		DMS_Ireland_Collins_UB_BonusFromPubsInForeignCities(capital)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_Ireland_Collins_UnitSetXY
----------------------------------------------------------------------------------------------------------------------------
function DMS_Ireland_Collins_UnitSetXY(playerID, unitID, x, y)
	local player = Players[playerID]
	if player == nil or player == -1 then return end
	if not player:IsAlive() then return end
	local unit = player:GetUnitByID(unitID)
	if unit == nil or unit == -1 then return end
	local unitPlot = Map.GetPlot(x, y)
	if unitPlot == nil or unitPlot == -1 then return end
	DMS_Ireland_Collins_UU_DefenseBuildingsCombatStrength(playerID, unit, unitPlot)
end
--==========================================================================================================================
-- GAMEEVENTS
--==========================================================================================================================
PlayerDoTurn(DMS_Ireland_Collins_PlayerDoTurn)
UnitSetXY(DMS_Ireland_Collins_UnitSetXY)
--==========================================================================================================================
--==========================================================================================================================