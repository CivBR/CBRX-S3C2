-- JFD_Civs_KhazariaBulan_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
--include("PlotIterators.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
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
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingShulID = GameInfoTypes["BUILDING_JFD_SHUL"]

local promotionBekID = GameInfoTypes["PROMOTION_JFD_BEK"]

local traitKhazariaBulanID = GameInfoTypes["TRAIT_JFD_KHAZARIA_BULAN"]

local unitBekID = GameInfoTypes["UNIT_JFD_BEK"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_KhazariaBulan_PlayerDoTurn
local buildingDummyShulID = GameInfoTypes["BUILDING_DUMMY_JFD_SHUL"]
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
local function JFD_KhazariaBulan_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if (not player:IsAlive()) then return end
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	--UNIQUE BUILDING
	local mainReligionID = player:GetReligionCreatedByPlayer()
	if Player.HasStateReligion then
		mainReligionID = player:GetStateReligion()
	end
	if mainReligionID == -1 then
		mainReligionID = playerCapital:GetReligiousMajority() 
	end
	if mainReligionID > 0 then
		for city in player:Cities() do
			city:SetNumRealBuilding(buildingDummyShulID, 0)
			if city:IsHasBuilding(buildingShulID) then
				local numFollowers = g_MathFloor((city:GetNumFollowers(mainReligionID)*50)/100)
				city:SetNumRealBuilding(buildingDummyShulID, numFollowers)
			end
		end
	end

	--UNIQUE UNIT
	if player:HasUnitOfClassType(unitClassGreatGeneralID) then
		for unit in player:Units() do
			if unit:GetUnitType() == unitBekID then
				local numMoves = 0
				for _, tradeRoute in ipairs(player:GetTradeRoutes()) do
					local cityFrom = tradeRoute.FromCity
					local cityTo = tradeRoute.ToCity
					if (cityFrom:GetX() == unit:GetX() and cityFrom:GetY() == unit:GetY()) then
						numMoves = numMoves + 60
					end
				end
				unit:ChangeMoves(numMoves)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_KhazariaBulan_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_KhazariaBulan_CityCaptureComplete
local function JFD_KhazariaBulan_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID, numPop, isConquest)
	
	local player = Players[newOwnerID]
	if oldOwnerID == newOwnerID then return end
	if (not isConquest) then return end

	--UNIQUE TRAIT
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do	
		local otherPlayer = Players[otherPlayerID]
		if otherPlayerID ~= oldOwnerID and otherPlayer:IsAlive() and HasTrait(otherPlayer, traitKhazariaBulanID) then
			local otherPlayerCapital = otherPlayer:GetCapitalCity()
			if otherPlayerCapital then
				local mainReligionID = otherPlayer:GetReligionCreatedByPlayer()
				if Player.HasStateReligion then
					mainReligionID = otherPlayer:GetStateReligion()
				end
				if mainReligionID == -1 then
					mainReligionID = otherPlayerCapital:GetReligiousMajority() 
				end
				if mainReligionID > -1 then 
					local numFollowers = city:GetNumFollowers(mainReligionID)
					if numFollowers > 0 then
						local numFood = g_MathFloor(15 + 6 * (numFollowers - 1) + ((numFollowers - 1) * 1.8))
						numFood = g_MathFloor((numFood*33)/100)
						otherPlayerCapital:ChangeFood(numFood)
						
						if otherPlayer:IsHuman() then
							Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_KHAZARIA_BULAN_MESSAGE_1", Game.GetReligionName(mainReligionID), city:GetName()))
						end	
					end
					if isCapital then
						local numThisInfluenceTotal = 0
						for minorPlayerID = 0, defineMaxMinorCivs - 1 do
							local otherOtherPlayer = Players[minorPlayerID]
							local otherOtherPlayerCapital = otherOtherPlayer:GetCapitalCity()
							if otherOtherPlayer:IsAlive() and otherOtherPlayerCapital then
								local numThisFollowers = otherOtherPlayerCapital:GetNumFollowers(mainReligionID)
								local numThisInfluence = (numThisFollowers*5)
								numThisInfluenceTotal = numThisInfluenceTotal + numThisInfluence
								if numThisInfluence > 0 then
									if (otherOtherPlayer:IsMinorCiv() and otherOtherPlayer:IsAlive()) then
										otherOtherPlayer:ChangeMinorCivFriendshipWithMajor(otherPlayerID, numThisInfluence)	
									end
								end
							end
						end
						
						if numThisInfluenceTotal > 0 then
							if otherPlayer:IsHuman() then
								Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_KHAZARIA_BULAN_MESSAGE_2", Game.GetReligionName(mainReligionID), city:GetName()))
							end	
						end
					end
				end
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JFD_KhazariaBulan_CityCaptureComplete)
-------------------------------------------------------------------------------------------------------------------------
--JFD_KhazariaBulan_CityTrained
local g_Religions_Table = {}
local g_Religions_Count = 1
for row in DB.Query("SELECT ID FROM Religions WHERE Type != 'RELIGION_PANTHEON';") do 	
	g_Religions_Table[g_Religions_Count] = row
	g_Religions_Count = g_Religions_Count + 1
end
local function JFD_KhazariaBulan_CityTrained(playerID, cityID, unitID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
	
	local city = player:GetCityByID(cityID) 
	local unit = player:GetUnitByID(unitID)
	
	--UNIQUE UNIT
	if player:HasUnitOfClassType(unitClassGreatGeneralID) then
		if unit:IsCombatUnit() then
			local mainReligionID = player:GetReligionCreatedByPlayer()
			if Player.HasStateReligion then
				mainReligionID = player:GetStateReligion()
			end
			if mainReligionID == -1 then
				mainReligionID = playerCapital:GetReligiousMajority() 
			end
			if mainReligionID == -1 then return end
		
			local plot = g_MapGetPlot(city:GetX(), city:GetY())
			for value = 0,(plot:GetNumUnits() - 1) do
				local adjacentUnit = plot:GetUnit(value)
				if (adjacentUnit:GetUnitType() == unitBekID and adjacentUnit:GetOwner() == playerID) then
					--g_Religions_Table
					local religionsTable = g_Religions_Table
					local numReligions = #religionsTable
					for index = 1, numReligions do
						local row = religionsTable[index]
						local religionID = row.ID
						city:ConvertPercentFollowers(mainReligionID, religionID, 10) 
					end
					break
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(JFD_KhazariaBulan_CityTrained)
--=======================================================================================================================
--=======================================================================================================================
