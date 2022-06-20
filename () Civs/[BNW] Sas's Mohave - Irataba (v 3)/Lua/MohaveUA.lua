-- MohaveUA
-- Author: Sasquatch
-- DateCreated: 7/5/2021 9:30:20 AM
--------------------------------------------------------------
--=======================================================================================================================
-- UTILITY FUNCTIONS    
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local civilisationID        = GameInfoTypes["CIVILIZATION_SAS_MOHAVE"]
local isMohaveCivActive        = JFD_IsCivilisationActive(civilisationID)
local isMohaveActivePlayer    = Players[Game.GetActivePlayer()]:GetCivilizationType() == civilisationID
local mathMin                = math.min

if isMohaveCivActive then
    print("Mohave is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
--InitHaakon
-------------------------------------------------------------------------------------------------------------------------
local terrainDesertID    = GameInfoTypes["TERRAIN_DESERT"]
local worldHugeID        = GameInfoTypes["WORLDSIZE_HUGE"]

local tLuxuries = {}
for row in DB.Query("SELECT * FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY'") do
	tLuxuries[row.ID] = true
end

function JFD_RevealDesert(playerID)
    local startingPlot = Players[playerID]:GetStartingPlot()
    local teamID = Players[playerID]:GetTeam()
    local distance = 15
    local mapSize = Map.GetWorldSize()
    if mapSize >= worldHugeID then distance = 25 end

    for i = 0, Map.GetNumPlots() - 1, 1 do
        local plot = Map.GetPlotByIndex(i)
        local plotX = plot:GetX()
        local plotY = plot:GetY()
        local startingPlotX = startingPlot:GetX()
        local startingPlotY = startingPlot:GetY()
        if (plot:GetTerrainType() == terrainDesertID and tLuxuries[plot:GetResourceType()] or plot:GetFeatureType() == GameInfoTypes.FEATURE_OASIS and Map.PlotDistance(startingPlotX, startingPlotY, plotX, plotY) <= distance) then
            plot:SetRevealed(teamID, true)
        end
    end
end

function JFD_RevealCityDesert(playerID, cityX, cityY)
    --function falsely accredited to JFD. He didn't write it but I ripped it off his, what else is new? NTF
    if Players[playerID]:GetCivilizationType() ~= civilisationID then
        return end
    local teamID = Players[playerID]:GetTeam()
    local distance = 15
    local mapSize = Map.GetWorldSize()
    if mapSize >= worldHugeID then distance = 25 end

    for i = 0, Map.GetNumPlots() - 1, 1 do
        local plot = Map.GetPlotByIndex(i)
        local plotX = plot:GetX()
        local plotY = plot:GetY()
        local startingPlotX = cityX
        local startingPlotY = cityY
        if (plot:GetTerrainType() == terrainDesertID and tLuxuries[plot:GetResourceType()] or plot:GetFeatureType() == GameInfoTypes.FEATURE_OASIS and Map.PlotDistance(startingPlotX, startingPlotY, plotX, plotY) <= distance) then
            plot:SetRevealed(teamID, true)
        end
    end
end

function JFD_InitIrataba(player)
    for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
        local player = Players[playerID]
        if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
            JFD_RevealDesert(playerID)
        end
    end 
end

if isMohaveCivActive then
    Events.LoadScreenClose.Add(JFD_InitIrataba)
    GameEvents.PlayerCityFounded.Add(JFD_RevealCityDesert)
end