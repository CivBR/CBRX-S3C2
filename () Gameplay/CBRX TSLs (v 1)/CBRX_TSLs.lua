local cbrxTSLs = {}

cbrxTSLs["CIVILIZATION_BABYLON"] = {X = 46, Y = 0, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_WALES"] = {X = 3, Y = 46, S = "T", O = "T"}
cbrxTSLs["CIVILIZATION_UC_TEUTONS"] = {X = 15, Y = 45, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_PERM"] = {X = 27, Y = 52, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_LITE_TARCISIO_PTOLEMIES"] = {X = 19, Y = 29, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_MC_TUAREG"] = {X = 9, Y = 26, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_THP_SOMALIA"] = {X = 25, Y = 18, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_THP_NAMIBIA"] = {X = 16, Y = 7, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_BHUTAN"] = {X = 39, Y = 35, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SENSHI_MANCHU"] = {X = 52, Y = 50, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SM_KAKJAPAN"] = {X = 60, Y = 42, S = "T", O = "T"}
cbrxTSLs["CIVILIZATION_TAR_YUAN"] = {X = 49, Y = 45, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_C15_NVIET"] = {X = 46, Y = 33, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_VANA_VOC"] = {X = 49, Y = 17, S = "T", O = "T"}
cbrxTSLs["CIVILIZATION_THP_ANANGU"] = {X = 56, Y = 11, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_MC_CHINOOK"] = {X = 71, Y = 50, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_MC_MHA"] = {X = 77, Y = 51, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_VANA_NEWNETHERLAND"] = {X = 89, Y = 47, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_LEUGI_OLMEC"] = {X = 79, Y = 34, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_PI_JAMAICA"] = {X = 86, Y = 33, S = "T", O = "T"}
cbrxTSLs["CIVILIZATION_PG_GRANCOLOMBIA"] = {X = 85, Y = 25, S = "F", O = "F"}
cbrxTSLs["CIVILIZATION_SENSHI_PERUBOLIVIA"] = {X = 86, Y = 18, S = "F", O = "F"}

--local observerTechs = {GameInfoTypes["TECH_POTTERY"].ID, GameInfoTypes["TECH_ANIMAL_HUSBANDRY"].ID, GameInfoTypes["TECH_MINING"].ID, GameInfoTypes["TECH_CALENDAR"].ID, GameInfoTypes["TECH_MASONRY"].ID, GameInfoTypes["TECH_COMPASS"].ID}
-- Pottery, Animal Husbandry, Mining, Calendar, Masonry, Compass
local observerTechs = {1, 2, 4, 6, 10, 25}
local sailing = GameInfoTypes["TECH_SAILING"]
local optics = GameInfoTypes["TECH_OPTICS"]

function addSailing(iPlayer)
    if Game.GetGameTurn() > 2 then return end
    local player = Players[iPlayer]
    if not player then return end
    local sCivilizationType = GameInfo.Civilizations[player:GetCivilizationType()].Type
    if not sCivilizationType then return end
	if not cbrxTSLs[sCivilizationType] then return end
    
	for v in player:Units() do
		if v:GetUnitType() == 0 then
			v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
		end
	end
	
	local pTeam = Teams[player:GetTeam()]

    if cbrxTSLs[sCivilizationType].S == "T" then
        pTeam:SetHasTech(sailing, true)
        pTeam:SetHasTech(optics, true)
		player:InitUnit(81, cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
		player:InitUnit(81, cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
    end
end
GameEvents.PlayerDoTurn.Add(addSailing)

function setTSLs()
    if Game.GetGameTurn() > 2 then return end
	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local player = Players[iPlayer]
		if not player then return end
		local sCivilizationType = GameInfo.Civilizations[player:GetCivilizationType()].Type
		local pTeam = Teams[player:GetTeam()]
		local currentTeamID = pTeam:GetID()

		if iPlayer == 0 then
			for index, val in ipairs(observerTechs) do
				pTeam:SetHasTech(val, true)
			end
		end

		for i = 0, Map.GetNumPlots() - 1, 1 do
			local plot = Map.GetPlotByIndex(i)
			local oldVisibility = plot:GetVisibilityCount(currentTeamID)

			if oldVisibility > 0 then
				plot:ChangeVisibilityCount(currentTeamID, -1, -1, true, true)
				plot:SetRevealed(currentTeamID, false)
				plot:UpdateFog()
			end
		end
		Game.UpdateFOW(true)
		UI.RequestMinimapBroadcast()

		if cbrxTSLs[sCivilizationType] then
			print(sCivilizationType)
			for v in player:Units() do
				v:SetXY(cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
			end

			player:InitUnit(1, cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)
			player:InitUnit(81, cbrxTSLs[sCivilizationType].X, cbrxTSLs[sCivilizationType].Y)

			if cbrxTSLs[sCivilizationType].O == "T" then
				local worker = false

				for u in player:Units() do
					if u:GetUnitType() == 83 then
						local newTrireme = player:InitUnit(22, u:GetX(), u:GetY())
						newTrireme:JumpToNearestValidPlot()
						u:Kill()
					elseif u:GetUnitType() == 1 and (cbrxTSLs[sCivilizationType].S == "T" or worker == false) then
						local newWorkBoat = player:InitUnit(2, u:GetX(), u:GetY())
						newWorkBoat:JumpToNearestValidPlot()
						u:Kill()
						worker = true
					end
				end
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(setTSLs)
