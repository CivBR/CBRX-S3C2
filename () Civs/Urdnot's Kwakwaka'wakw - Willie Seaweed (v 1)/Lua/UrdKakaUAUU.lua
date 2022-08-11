
--[[
UA: Lands of Supernatural Treasure
Great Works reduce the cost of purchasing in all cities, and provide food equal to their theming bonus. 
While below 100 gold, animal resources increase the generation of Great Artists, Writers and Musicians. 

UB: Potlach House (Amphitheatre) 
May only be bought, though may be bought multiple times. 
Provides a random animal resource when built the first time, but distributes your gold to all met civs. 
After this, the cost of future Potlach's increases, while the chance of receiving a resource decreases. +1 culture. 

UU: Hamatsa Dancer (Scout)
May remove animal resources in exchange for xp. If destroyed, provides Great Artist points based on its level
]]

load("PlotIterators.lua")
load("FLuaVector.lua")
load("C15_IteratorPack_v3.lua")

local tAnimalResources = {} -- Ye we including Truffles what else is the Camp meant to be doing just special case it out if you don't like it
for row in DB.Query("SELECT ID FROM Resources WHERE Type IN (SELECT ResourceType FROM Improvement_ResourceTypes WHERE ImprovementType IN ('IMPROVEMENT_CAMP', 'IMPROVEMENT_FISHING_BOATS', 'IMPROVEMENT_PASTURE'))") do
	tAnimalResources[row.ID] = true
end

local tGreatWorkBuildings = {}
for row in DB.Query("SELECT a.ID BuildingID, a.GreatWorkCount Count, b.ID ClassID FROM Buildings a, BuildingClasses b WHERE GreatWorkCount > 0 AND a.BuildingClass = b.Type") do
	tGreatWorkBuildings[row.ID] = {Count = row.GreatWorkCount, Class = row.ClassID}
end

local tFreeWorkBuildings = {}
for row in DB.Query("SELECT a.ID BuildingID, b.ID ClassID FROM Buildings a, BuildingClasses b WHERE a.FreeGreatWork IS NOT NULL AND a.BuildingClass = b.Type") do
	tFreeWorkBuildings[row.BuildingID] = row.ClassID
end

local iLeader = GameInfo.Leaders["LEADER_URD_SEAWEED"].ID
local iUU = GameInfoTypes["UNIT_URD_HAMATSA"]

local iRemovalImprovement = GameInfo.Improvements["IMPROVEMENT_URD_KWAK"].ID -- Weird one this: Work on the same premise as the Archaeological Dig, whereby it's an Improvement that's gonna leave no trace. Can have it be instant or w/e, just ensure the UU has a WorkRate for it, it's enabled by the relevant Resources, and that you've got the RemovesResource column set to true 
local iPurchaseReductionDummy = GameInfo.Buildings["BUILDING_URD_KWAKREDUCE"].ID
local iFoodDummy = GameInfo.Buildings["BUILDING_URD_KWAKFOOD"].ID

local iArtist = GameInfoTypes["SPECIALIST_ARTIST"]

local iAnimalThreshold = 100
local tPointsFromAnimals = {}
	tPointsFromAnimals[GameInfoTypes["SPECIALIST_WRITER"]] = {Points = 1, Desc = Locale.ConvertTextKey(GameInfo.Specialists["SPECIALIST_WRITER"].Description)}
	tPointsFromAnimals[iArtist] = {Points = 1, Desc = Locale.ConvertTextKey(GameInfo.Specialists["SPECIALIST_ARTIST"].Description)}
	tPointsFromAnimals[GameInfoTypes["SPECIALIST_MUSICIAN"]] = {Points = 1, Desc = Locale.ConvertTextKey(GameInfo.Specialists["SPECIALIST_MUSICIAN"].Description)}	
local iRemovalXP = 5
local iDeathPointsMod = 10

function C15_ProdTextOnPlot(iX, iY, sString) -- Code's basically Suk's fwiw 
    local pHexPos = ToHexFromGrid{x=iX, y=iY}
    local pWorldPos = HexToWorld(pHexPos)
    Events.AddPopupTextEvent(pWorldPos, sString)
end

function C15_Urd_Kaka_BuildFinished(playerID, iX, iY, iImprovement)
	if iImprovement == iRemovalImprovement then
		local pPlot = Map.GetPlot(iX, iY)
		pPlot:SetImprovementType(-1)
		for pUnit in C15_PlotUnitsIterator(pPlot) do
			if pUnit:GetUnitType() == iUU and pUnit:GetOwner() == playerID then
				pUnit:ChangeExperience(iRemovalXP)
				break
			end
		end
	end
end

GameEvents.BuildFinished.Add(C15_Urd_Kaka_BuildFinished)

function C15_Urd_Kaka_CountGreatWorks(pPlayer)
	local tCities = {}
	for pCity in pPlayer:Cities() do
		local iNum = pCity:GetNumGreatWorks()
		local iTheming = 0
		if iNum > 0 then -- Maybe theming bonuses of 1 work are possible?
			for k, v in pairs(tGreatWorkBuildings) do
				if pCity:IsHasBuilding(k) then
					iTheming = iTheming + pCity:GetThemingBonus(v.Class)
				end
			end
		end
		
		tCities[pCity] = {Works = iNum, Theming = iTheming}
	end
	
	return tCities
end

function C15_Urd_Kaka_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetLeaderType() == iLeader then
		local iTeam = pPlayer:GetTeam()
		local bActive = Game.GetActivePlayer() == playerID
		local tCities = C15_Urd_Kaka_CountGreatWorks(pPlayer)
		for k, v in pairs(tCities) do
			k:SetNumRealBuilding(iPurchaseReductionDummy, v.Works)
			k:SetNumRealBuilding(iFoodDummy, v.Theming)
			
			for pIterPlot in PlotAreaSpiralIterator(k:Plot(), 5) do
				if pIterPlot and pIterPlot:GetWorkingCity() == k and tAnimalResources[pIterPlot:GetResourceType(iTeam)] then
					local iX, iY = pIterPlot:GetX(), pIterPlot:GetY()
					for k2, v2 in pairs(tPointsFromAnimals) do
						k:ChangeSpecialistGreatPersonProgressTimes100(k2, v2.Points * 100)
						local s = "+" .. v2.Points .. " [ICON_GREAT_PERSON] " .. v2.Desc
						if bActive then
							C15_ProdTextOnPlot(iX, iY, s)
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_Urd_Kaka_DoTurn)

function C15_Urd_Kaka_GP(playerID) -- Dun wanna bother with the DLL case so inefficiency w/e
	local pPlayer = Players[playerID]
	if pPlayer:GetLeaderType() == iLeader then
		local tCities = C15_Urd_Kaka_CountGreatWorks(pPlayer)
		for k, v in pairs(tCities) do
			k:SetNumRealBuilding(iPurchaseReductionDummy, v.Works)
			k:SetNumRealBuilding(iFoodDummy, v.Theming)
		end
	end
end

GameEvents.GreatPersonExpended.Add(C15_Urd_Kaka_GP)

function C15_Urd_Kaka_Constructed(playerID, cityID, iBuilding)
	if tFreeWorkBuildings[iBuilding] then
		local pPlayer = Players[playerID]
		if pPlayer:GetLeaderType() == iLeader then
			local pCity = pPlayer:GetCityByID(cityID)
			pCity:SetNumRealBuilding(iPurchaseReductionDummy, pCity:GetNumGreatWorks())
			pCity:SetNumRealBuilding(iFoodDummy, pCity:GetNumRealBuilding(iFoodDummy) + pCity:GetThemingBonus(tFreeWorkBuildings[iBuilding]))
		end
	end
end

GameEvents.CityConstructed.Add(C15_Urd_Kaka_Constructed)

function C15_Urd_Kaka_Prekill(playerID, unitID, unitType, iX, iY, bDelay)
	if bDelay and unitType == iUU then
		local pPlayer = Players[playerID]
		
		local pUnit = pPlayer:GetUnitByID(unitID)
		
		local iXP = pUnit:GetLevel()
		local tTarget = {City = false, Points = -1}
		for pCity in pPlayer:Cities() do
			local iPoints = pCity:GetSpecialistGreatPersonProgress(iArtist)
			if iPoints > tTarget.Points then
				tTarget.City = pCity
				tTarget.Points = iPoints
			end
		end
		
		if pTarget then
			local iSum = iDeathPointsMod * iXP
			pTarget:ChangeSpecialistGreatPersonProgressTimes100(iArtist, iSum)
			if Game.GetActivePlayer() == playerID then
				local sGoldenAgeMessage = Locale.ConvertTextKey("TXT_KEY_URD_KAKA_UU_ARTIST", iSum, pTarget:GetName())
				Events.GameplayAlertMessage(sGoldenAgeMessage)
			end
		end
	end
end

GameEvents.UnitPrekill.Add(C15_Urd_Kaka_Prekill)