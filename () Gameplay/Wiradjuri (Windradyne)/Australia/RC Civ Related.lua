print("OMG, this is Russel Crowe!")

include( "IconSupport" );
IconHookup(0, 128, "AUS_LS_RESOURCES_ATLAS", Controls.Icon);
local HappDummy = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_HAPPINESS;
local MarketBC = GameInfoTypes.BUILDINGCLASS_DUMMY_LS_BELAUS_MARKER;
local UnModDummy = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_HAPPINESS;
local oldPlayer = -1;
local BesYields = {YieldTypes.YIELD_FOOD, YieldTypes.YIELD_PRODUCTION, YieldTypes.YIELD_GOLD, YieldTypes.YIELD_SCIENCE, YieldTypes.YIELD_CULTURE, YieldTypes.YIELD_FAITH}
local fForest = GameInfoTypes.FEATURE_FOREST;
local AusCiv = GameInfoTypes.CIVILIZATION_AUSTRALIA_LS_MOD;
local AusUB = GameInfoTypes.BUILDING_AUSTRALIA_LS;
local HelpMMC = GameDefines.MAX_MAJOR_CIVS - 1;
local IsNaturalWonder = {}
local DoublePressureB = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_DOUBLEPRESSURE;
local IncreasedGA = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_GOLDEN_AGE;
local IncreasedDefense = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_DEFENSE
local RusCrowePlots = {}
local ExtraScience = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_SCIENCE;
local ThreeSistersB = GameInfoTypes.BUILDING_DUMMY_LS_BELAUS_NW_THREE;
local UIQueue = {}
local UIon = false;
local plotDelay = {}

for row in GameInfo.Features() do
	if row.NaturalWonder then
		IsNaturalWonder[row.ID] = true;
	end
end

local BeliefT = {}
local BeliefRiverHap = {}
local BeliefCityHap = {}
for row in GameInfo.Beliefs() do
	if row.Pantheon then
		BeliefT[row.ID] = 1;
		if row.RiverHappiness > 0 then
			BeliefT[row.ID] = 2;
			table.insert(BeliefRiverHap, {ID = row.ID, HappVal = row.RiverHappiness})
		end
		if row.HappinessPerCity > 0 then
			BeliefT[row.ID] = 2;
			table.insert(BeliefCityHap, {ID = row.ID, HappVal = row.HappinessPerCity})
		end
	end
end

local validBCT = {}
local validBCheck = {}

local BeliefBuildingCY = {}
for row in GameInfo.Belief_BuildingClassYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefBuildingCY, {ID = bID, BuildingType = GameInfo.BuildingClasses[row.BuildingClassType].ID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.YieldChange})
		BeliefT[bID] = 2;
		validBCT[GameInfo.BuildingClasses[row.BuildingClassType].ID] = 1;
	end
end

local BeliefBuildingCH = {}
for row in GameInfo.Belief_BuildingClassHappiness() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefBuildingCH, {ID = bID, BuildingType = GameInfo.BuildingClasses[row.BuildingClassType].ID, HappVal = row.Happiness})
		BeliefT[bID] = 2;
		validBCT[GameInfo.BuildingClasses[row.BuildingClassType].ID] = 1;
	end
end

for row in GameInfo.Buildings() do
	if validBCT[GameInfo.BuildingClasses[row.BuildingClass].ID] then
		validBCheck[row.ID] = GameInfo.BuildingClasses[row.BuildingClass].ID;
	end
end

local BeliefTerrainY = {}
for row in GameInfo.Belief_TerrainYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefTerrainY, {ID = bID, TerrainType = GameInfo.Terrains[row.TerrainType].ID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefCityConnections = {}
for row in GameInfo.Belief_YieldChangeTradeRoute() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefCityConnections, {ID = bID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefNaturalW = {}
for row in GameInfo.Belief_YieldChangeNaturalWonder() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefNaturalW, {ID = bID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefResourceY = {}
for row in GameInfo.Belief_ResourceYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefResourceY, {ID = bID, TerrainType = GameInfo.Resources[row.ResourceType].ID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefImprovementY = {}
for row in GameInfo.Belief_ImprovementYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefImprovementY, {ID = bID, TerrainType = GameInfo.Improvements[row.ImprovementType].ID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefFeatureY = {}
for row in GameInfo.Belief_FeatureYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefFeatureY, {ID = bID, TerrainType = GameInfo.Features[row.FeatureType].ID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefCityY = {}
for row in GameInfo.Belief_CityYieldChanges() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefCityY, {ID = bID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local BeliefWorldWond = {}
for row in GameInfo.Belief_YieldChangeWorldWonder() do
	local bID = GameInfo.Beliefs[row.BeliefType].ID;
	if BeliefT[bID] then
		table.insert(BeliefWorldWond, {ID = bID, YieldType = GameInfo.Yields[row.YieldType].ID, YieldB = row.Yield})
		BeliefT[bID] = 2;
	end
end

local iBeliefsT = {}
for i, v in pairs(BeliefT) do
	if v == 2 then
		table.insert(iBeliefsT, i)
	end
end
BeliefT = nil;

function PDT(playerID)
	if Players[playerID]:GetCivilizationType() == AusCiv then
		CheckHapFromENW(playerID)
		for iCity in Players[playerID]:Cities() do
			local iYield = 1;
			local cB = iCity:GetBuildingYieldChange(MarketBC, iYield);
			if cB ~= 0 then
				local cProd = iCity:GetProduction()
				iCity:ChangeProduction(cB)
				if cProd ~= iCity:GetProduction() then
					iCity:SetBuildingYieldChange(MarketBC, iYield, 0)
				end
			end
			local iYield = 3;
			local cB = iCity:GetBuildingYieldChange(MarketBC, iYield);
			if cB ~= 0 then
				if CanProcessExtraScience(playerID, cB) then
					iCity:SetBuildingYieldChange(MarketBC, iYield, 0)
				end
			end
			iCity:SetNumRealBuilding(HappDummy, 0);
			if iCity:IsHasBuilding(AusUB) then
				local vData = GetNewDataBeliefFromCity(iCity, (Game.GetGameTurn() % 3 ~= 2), playerID);
				if vData ~= -1 then
					local string = ""
					for i, iYield in pairs(BesYields) do
						if vData[iYield] ~= 0 then
							if iYield == 0 then
								iCity:ChangeFood(vData[iYield])
							elseif iYield == 1 then
								local cProd = iCity:GetProduction()
								iCity:ChangeProduction(vData[iYield])
								if cProd == iCity:GetProduction() then
									iCity:SetBuildingYieldChange(MarketBC, iYield, iCity:GetBuildingYieldChange(MarketBC, iYield) + vData[iYield])
								end
							elseif iYield == 2 then
								Players[playerID]:ChangeGold(vData[iYield])
							elseif iYield == 3 then
								if not CanProcessExtraScience(playerID, vData[iYield]) then
									iCity:SetBuildingYieldChange(MarketBC, iYield, iCity:GetBuildingYieldChange(MarketBC, iYield) + vData[iYield])
								end
							elseif iYield == 4 then
								Players[playerID]:ChangeJONSCulture(vData[iYield])
							elseif iYield == 5 then
								Players[playerID]:ChangeFaith(vData[iYield])
							end
--							string = string .. "+" .. vData[iYield] .. GameInfo.Yields[iYield].IconString .. " ";
						end
					end
					if vData.Hap ~= 0 then
						iCity:SetNumRealBuilding(HappDummy, vData.Hap);
--						string = string .. "+" .. vData.Hap .. "[ICON_HAPPINESS_1]";
					end
					if playerID == Game.GetActivePlayer() then
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), Locale.Lookup(GameInfo.Beliefs[vData.Type].ShortDescription), 0)
--						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), string, 0.5)
					end
				end
			end
		end
	end
	if oldPlayer ~= -1 then
		if Players[oldPlayer]:GetCivilizationType() == AusCiv then
			CheckHapFromENW(oldPlayer)
		end
	end
	oldPlayer = playerID;
end
GameEvents.PlayerDoTurn.Add(PDT)

function GetNewDataBeliefFromCity(iCity, bForced, playerID)
	local vData = {}
	for i, iYield in pairs(BesYields) do
		vData[iYield] = 0;
	end
	vData.Hap = 0;
	local valid = bForced;
	local WorkingPlots = {}
	plotDelay = {}
	for i = 0, iCity:GetNumCityPlots() -1 do
		local iPlot = iCity:GetCityIndexPlot(i);
		if iPlot then
			if iCity:IsWorkingPlot(iPlot) then
				WorkingPlots[iPlot] = 1;
			end
		end
	end
	local CityTHB = {}
	for iType, iClass in pairs(validBCheck) do
		if iCity:IsHasBuilding(iType) then
			CityTHB[iClass] = true;
		end
	end
	local ShuffleBeliefT = Shuffle(iBeliefsT);
	for v, iType in pairs(ShuffleBeliefT) do
		if iCity:GetPopulation() >= GameInfo.Beliefs[iType].MinPopulation then
			for int, hData in pairs(BeliefTerrainY) do
				if hData.ID == iType then
					for plot, sth in pairs(WorkingPlots) do
						if plot:GetTerrainType() == hData.TerrainType then
							if plot:GetFeatureType() ~= fForest then
								valid = true;
								vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
								if playerID == Game.GetActivePlayer() then
									local delay = plotDelay[plot] or 0;
									plotDelay[plot] = delay + 0.5;
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(),plot:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
								end
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefNaturalW) do
				if hData.ID == iType then
					for plot, sth in pairs(WorkingPlots) do
						if IsNaturalWonder[plot:GetFeatureType()] then
							valid = true;
							vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
							if playerID == Game.GetActivePlayer() then
								local delay = plotDelay[plot] or 0;
								plotDelay[plot] = delay + 0.5;
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(),plot:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefResourceY) do
				if hData.ID == iType then
					for plot, sth in pairs(WorkingPlots) do
						if plot:GetResourceType() == hData.TerrainType then
							valid = true;
							vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
							if playerID == Game.GetActivePlayer() then
								local delay = plotDelay[plot] or 0;
								plotDelay[plot] = delay + 0.5;
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(),plot:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefFeatureY) do
				if hData.ID == iType then
					for plot, sth in pairs(WorkingPlots) do
						if plot:GetFeatureType() == hData.TerrainType then
							valid = true;
							vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
							if playerID == Game.GetActivePlayer() then
								local delay = plotDelay[plot] or 0;
								plotDelay[plot] = delay + 0.5;
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(),plot:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefImprovementY) do
				if hData.ID == iType then
					for plot, sth in pairs(WorkingPlots) do
						if plot:GetImprovementType() == hData.TerrainType then
							if not plot:IsImprovementPillaged() then
								valid = true;
								vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
								if playerID == Game.GetActivePlayer() then
									local delay = plotDelay[plot] or 0;
									plotDelay[plot] = delay + 0.5;
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(plot:GetX(),plot:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
								end
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefCityY) do
				if hData.ID == iType then
					valid = true;
					vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
					if playerID == Game.GetActivePlayer() then
						local delay = plotDelay[iCity:Plot()] or 0;
						plotDelay[iCity:Plot()] = delay + 0.5;
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
					end
				end
			end
			for int, hData in pairs(BeliefWorldWond) do
				if hData.ID == iType then
					if iCity:GetNumWorldWonders() > 0 then
						valid = true;
						vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB * iCity:GetNumWorldWonders();
						if playerID == Game.GetActivePlayer() then
							local delay = plotDelay[iCity:Plot()] or 0;
							plotDelay[iCity:Plot()] = delay + 0.5;
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
						end
					end
				end
			end
			for int, hData in pairs(BeliefBuildingCY) do
				if hData.ID == iType then
					if CityTHB[hData.BuildingType] then
						valid = true;
						vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
						if playerID == Game.GetActivePlayer() then
							local delay = plotDelay[iCity:Plot()] or 0;
							plotDelay[iCity:Plot()] = delay + 0.5;
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
						end
					end
				end
			end
			for int, hData in pairs(BeliefCityConnections) do
				if hData.ID == iType then
					if not iCity:IsCapital() then
						if Players[iCity:GetOwner()]:IsCapitalConnectedToCity(iCity) then
							valid = true;
							vData[hData.YieldType] = vData[hData.YieldType] + hData.YieldB;
							if playerID == Game.GetActivePlayer() then
								local delay = plotDelay[iCity:Plot()] or 0;
								plotDelay[iCity:Plot()] = delay + 0.5;
								Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.YieldB .. GameInfo.Yields[hData.YieldType].IconString, delay + 0.5)
							end
						end
					end
				end
			end
			for int, hData in pairs(BeliefRiverHap) do
				if hData.ID == iType then
					if iCity:Plot():IsRiver() then
						valid = true;
						vData.Hap = vData.Hap + hData.HappVal;
						if playerID == Game.GetActivePlayer() then
							local delay = plotDelay[iCity:Plot()] or 0;
							plotDelay[iCity:Plot()] = delay + 0.5;
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.HappVal .. "[ICON_HAPPINESS_1]", delay + 0.5)
						end
					end
				end
			end
			for int, hData in pairs(BeliefCityHap) do
				if hData.ID == iType then
					valid = true;
					vData.Hap = vData.Hap + hData.HappVal;
					if playerID == Game.GetActivePlayer() then
						local delay = plotDelay[iCity:Plot()] or 0;
						plotDelay[iCity:Plot()] = delay + 0.5;
						Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.HappVal .. "[ICON_HAPPINESS_1]", delay + 0.5)
					end
				end
			end
			for int, hData in pairs(BeliefBuildingCH) do
				if hData.ID == iType then
					if CityTHB[hData.BuildingType] then
						valid = true;
						vData.Hap = vData.Hap + hData.HappVal;
						if playerID == Game.GetActivePlayer() then
							local delay = plotDelay[iCity:Plot()] or 0;
							plotDelay[iCity:Plot()] = delay + 0.5;
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), "+" .. hData.HappVal .. "[ICON_HAPPINESS_1]", delay + 0.5)
						end
					end
				end
			end
			if valid then
				vData["Type"] = iType;
				return vData;
			end
		end
	end
	return -1;
end

function Shuffle(iTable)
	local n, order, oTable = #iTable, {}, {}
	for i=1,n do order[i] = { rnd = math.random(), idx = i } end
	table.sort(order, function(a,b) return a.rnd < b.rnd end)
	for i=1,n do oTable[i] = iTable[order[i].idx] end
	return oTable;
end

function CanProcessExtraScience(playerID, value)
	local techVal = Players[playerID]:GetCurrentResearch();
	if techVal == -1 then
		return false;
	end
	local iTeam = Players[playerID]:GetTeam();
	local tTechs = Teams[iTeam]:GetTeamTechs();
	tTechs:ChangeResearchProgress(techVal, value, playerID)
	return true;
end

-----------------------------------------------
-----------------------------------------------
-----------------------------------------------
-----------------------------------------------

local newGame = false;
local AusDPolicy = GameInfoTypes.POLICY_LS_AUS_STH;
local numENW = 0;
local ExtraNW = {}
for i = 1, 9 do
	ExtraNW[GameInfo.Resources["RESOURCE_LS_NW_" .. i].ID] = 1;
end
local TeamWithAus = {}
local TeamToDiscover = {}
local ExtraResourceNW = {}
local RealNaturalW = {}
local FirstTypeENW = {GameInfoTypes.RESOURCE_LS_NW_1, GameInfoTypes.RESOURCE_LS_NW_3}
FirstTypeENW = Shuffle(FirstTypeENW);
local ThirdTypeENW = {GameInfoTypes.RESOURCE_LS_NW_4, GameInfoTypes.RESOURCE_LS_NW_5, GameInfoTypes.RESOURCE_LS_NW_7, GameInfoTypes.RESOURCE_LS_NW_8, GameInfoTypes.RESOURCE_LS_NW_9}
ThirdTypeENW = Shuffle(ThirdTypeENW);
local FourthTypeENW = {GameInfoTypes.RESOURCE_LS_NW_2, GameInfoTypes.RESOURCE_LS_NW_10}
FourthTypeENW = Shuffle(FourthTypeENW);
local ValidTerrainT = {}
ValidTerrainT[GameInfoTypes.TERRAIN_GRASS] = 1;
ValidTerrainT[GameInfoTypes.TERRAIN_PLAINS] = 1;
ValidTerrainT[GameInfoTypes.TERRAIN_DESERT] = 1;
ValidTerrainT[GameInfoTypes.TERRAIN_COAST] = 1;
local twApo = GameInfoTypes.RESOURCE_LS_NW_6;
local twelveApoPolicy = GameInfoTypes.POLICY_LS_AUS_APO;

for i, player in pairs(Players) do
	if player:GetCivilizationType() == AusCiv then
		if not ( player:HasPolicy(AusDPolicy)) then
			newGame = true;
			player:SetHasPolicy(AusDPolicy, true);
			player:SetHasPolicy(twelveApoPolicy, false);
			player:ChangeScoreFromFutureTech(-8);
		end
		TeamWithAus[player:GetTeam()] = 1;
	end
end

function GetNumNatureWonders()
	local iCount = 0;
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if IsNaturalWonder[fPlot:GetFeatureType()] then
			RealNaturalW[fPlot] = 1;
			iCount = iCount + 1;
		end
	end
	return iCount;
end

function IsAdjacentLand(fPlot)
 	for i = 0, 5 do
		local iPlot = Map.PlotDirection(fPlot:GetX(), fPlot:GetY(), i);
		if iPlot then
			if not iPlot:IsWater() then
				return true;
			end
		end
	end
	return false;
end

function GetValidPlots()
	local iData = {}
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if fPlot:GetFeatureType() == -1 then
			if fPlot:GetResourceType() == -1 then
				if fPlot:IsLake() or ValidTerrainT[fPlot:GetTerrainType()] then
					local can = true;
					if fPlot:GetTerrainType() == GameInfoTypes.TERRAIN_COAST then
						if math.random(1,4) == 3 then
							can = IsAdjacentLand(fPlot);
						else
							can = false;
						end
					end
					for iTeam, sth in pairs(TeamWithAus) do
						if fPlot:IsRevealed(iTeam) then
							can = false;
						end
					end
					if can then
						table.insert(iData, fPlot)
					end
				end
			end
		end
	end
	return iData;
end

local AlreadyUsed = {}

function GetFirstType(table)
	for i, dType in pairs(table) do
		if not AlreadyUsed[dType] then
			return dType;
		end
	end
	return -1;
end

function OnNewGame()
	local NNWTP = GetNumNatureWonders();
	local considerplots = Shuffle(GetValidPlots());
	local NENWP = 0;
	for int, plot in pairs(considerplots) do
		if NENWP >= NNWTP then
			break;
		else
			local cPlace = true;
			local cType = -1;
			local tType = 0;
			if plot:IsLake() then
				tType = 1;
				cType = GetFirstType(FirstTypeENW)
			elseif plot:GetTerrainType() == GameInfoTypes.TERRAIN_COAST then
				if not AlreadyUsed[twApo] then
					cType = twApo;
				end
			elseif plot:IsHills() then
				cType = GetFirstType(ThirdTypeENW)
				tType = 3;
			elseif plot:IsFlatlands() then
				if plot:GetTerrainType() == GameInfoTypes.TERRAIN_DESSERT then
					if not plot:IsCoastalLand() then
						cType = GetFirstType(FourthTypeENW)
						tType = 4;
					end
				end
			end
			if cType ~= -1 then
				for Nplot, type in pairs(ExtraResourceNW) do
					if Map.PlotDistance(plot:GetX(), plot:GetY(), Nplot:GetX(), Nplot:GetY()) < 7 then
						cPlace = false
					end
				end
				for Nplot, type in pairs(RealNaturalW) do
					if Map.PlotDistance(plot:GetX(), plot:GetY(), Nplot:GetX(), Nplot:GetY()) < 7 then
						cPlace = false
					end
				end
				for i, player in pairs(Players) do
					if player:IsAlive() then
						if not player:IsBarbarian() then
							local dis = 3;
							if i <= HelpMMC then
								dis = 5;
							end
							local Nplot = Players[i]:GetStartingPlot();
							if Nplot then
								if Map.PlotDistance(plot:GetX(), plot:GetY(), Nplot:GetX(), Nplot:GetY()) < dis then
									cPlace = false
								end
							end
						end
					end
				end
				if cPlace then
					plot:SetResourceType(cType);
					ExtraResourceNW[plot] = cType;
					if cType == GameInfoTypes.RESOURCE_LS_NW_9 then
						AddRusselCroweSpiritToGame(plot)
					end
					NENWP = NENWP + 1;
					AlreadyUsed[cType] = 1;
				end
			end
		end
	end
	for iTeam, sth in pairs(TeamWithAus) do
		TeamToDiscover[iTeam] = {}
		for fPlot, type in pairs(ExtraResourceNW) do
			TeamToDiscover[iTeam][fPlot] = type;
		end
	end
end

function OnLoadGame()
	for i = 0, Map:GetNumPlots() - 1, 1 do
		local fPlot = Map.GetPlotByIndex( i );
		if ExtraNW[fPlot:GetResourceType()] then
			ExtraResourceNW[fPlot] = fPlot:GetResourceType();
			if fPlot:GetResourceType() == GameInfoTypes.RESOURCE_LS_NW_9 then
				AddRusselCroweSpiritToGame(fPlot)
			end
		end
	end
	for iTeam, sth in pairs(TeamWithAus) do
		TeamToDiscover[iTeam] = {}
		for fPlot, type in pairs(ExtraResourceNW) do
			if not fPlot:IsRevealed(iTeam) then
				TeamToDiscover[iTeam][fPlot] = type;
			end
		end
	end
end

function OnHexFogEvent( hexPos, fowType, bWholeMap )
	if fowType == 2 then
		local gridPosX, gridPosY = ToGridFromHex( hexPos.x, hexPos.y );
		local plot = Map.GetPlot( gridPosX, gridPosY );
		if plot ~= nil then
			if ExtraResourceNW[plot] then
				local iPlayer = Game.GetActivePlayer();
				if TeamToDiscover[Players[iPlayer]:GetTeam()][plot] then
					CheckHapFromENW(iPlayer)
				end
			end
		end
	end
end

Events.SequenceGameInitComplete.Add(function()
	if newGame then
		OnNewGame()
	else
		OnLoadGame()
	end
	if Players[Game.GetActivePlayer()]:GetCivilizationType() == AusCiv then
		for iPlot, sth in pairs(TeamToDiscover[Players[Game.GetActivePlayer()]:GetTeam()]) do	
			Events.HexFOWStateChanged.Add( OnHexFogEvent );
			break;
		end	
	end
end)

function TeamDiscoveredENW(fPlot, playerID)
	--if has some bonuses
	local feature = fPlot:GetResourceType();

	if fPlot:GetOwner() == -1 then
		if feature == GameInfoTypes.RESOURCE_LS_NW_1 then
			for iCity in Players[playerID]:Cities() do
				iCity:ChangePopulation(1, true);
			end
		elseif feature == GameInfoTypes.RESOURCE_LS_NW_3 then
			Players[playerID]:ChangeJONSCulture(50);
		elseif feature == GameInfoTypes.RESOURCE_LS_NW_4 then
			for iCity in Players[playerID]:Cities() do
				for i=0, 2 do
					iPlot = iCity:GetNextBuyablePlot();
					if iPlot then
						iPlot:SetOwner(playerID, iCity:GetID(), true, true);
					end
				end
			end
		end
	end
	if playerID == Game.GetActivePlayer() then
		local info = GameInfo.Resources[feature];
		local numtofind = 0;
		for fPlot, type in pairs(TeamToDiscover[Players[playerID]:GetTeam()]) do
			numtofind = numtofind + 1;
		end
		local notstring = "You have discovered " .. Locale.Lookup(info.Description) .. "! You have " .. numtofind .. " extra Natural Wonders still to find."
		Players[playerID]:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE, notstring, "Natural Wonder discovered", fPlot:GetX(), fPlot:GetY(), fPlot:GetResourceType())
		TriggerUI(fPlot, playerID, feature)
	end
end



function CheckHapFromENW(playerID)
	if Players[playerID]:GetCivilizationType() == AusCiv then
		local archae = 0;
		local has12apo = false;
		if Teams[Players[playerID]:GetTeam()]:IsHasTech(GameInfoTypes.TECH_ARCHAEOLOGY) then
			arche = 1;
		end
		for iCity in Players[playerID]:Cities() do
			iCity:SetNumRealBuilding(DoublePressureB, 0);
			iCity:SetNumRealBuilding(IncreasedGA, 0);
			iCity:SetNumRealBuilding(IncreasedDefense, 0);
			iCity:SetNumRealBuilding(ExtraScience, arche);
			iCity:SetNumRealBuilding(ThreeSistersB, 0);
		end
		local points = 0;
		local iTeam = Players[playerID]:GetTeam();
		for fPlot, type in pairs(ExtraResourceNW) do
			if fPlot:IsRevealed(iTeam) then
				points = points + 1;
				if TeamToDiscover[iTeam][fPlot] then
					TeamToDiscover[iTeam][fPlot] = nil;
					TeamDiscoveredENW(fPlot, playerID)
				end
				if type == GameInfoTypes.RESOURCE_LS_NW_5 then
					if fPlot:GetOwner() == playerID then
						local fCity = Players[playerID]:GetCityByID(fPlot:GetCityPurchaseID());
						if fCity then
							fCity:SetNumRealBuilding(DoublePressureB, 1);
						end
					end
				elseif type == GameInfoTypes.RESOURCE_LS_NW_2 then
					if fPlot:GetOwner() == playerID then
						local fCity = Players[playerID]:GetCityByID(fPlot:GetCityPurchaseID());
						if fCity then
							fCity:SetNumRealBuilding(IncreasedDefense, 1);
						end
					end
				elseif type == GameInfoTypes.RESOURCE_LS_NW_10 then
					if fPlot:GetOwner() == playerID then
						local fCity = Players[playerID]:GetCityByID(fPlot:GetCityPurchaseID());
						if fCity then
							fCity:SetNumRealBuilding(ThreeSistersB, 1);
						end
					end
				elseif type == GameInfoTypes.RESOURCE_LS_NW_7 then
					if fPlot:GetOwner() == playerID then
						local fCity = Players[playerID]:GetCapitalCity();
						if fCity then
							fCity:SetNumRealBuilding(IncreasedGA, 1);
						end
					end
				elseif type == GameInfoTypes.RESOURCE_LS_NW_6 then
					if fPlot:GetOwner() == playerID then
						has12apo = true;
					end
				end
			end
		end
		Players[playerID]:SetHasPolicy(twelveApoPolicy, has12apo);
		for iCity in Players[playerID]:Cities() do
			if iCity:IsCapital() then
				iCity:SetNumRealBuilding(UnModDummy, points)
			else
				iCity:SetNumRealBuilding(UnModDummy, 0)
			end
		end
	end
end

GameEvents.CityCanConstruct.Add(function(playerID, cityID, buildingID)
	if buildingID == AusUB then
		if Players[playerID]:GetCityByID(cityID):GetReligiousMajority() == -1 then
			return false;
		end
	end
	return true;
--much lazy :D let it fire infinity times
end)

local nouspirit1 = GameInfoTypes.PROMOTION_NOUR_SPIRIT_LS;
local nouspirit2 = GameInfoTypes.PROMOTION_NOUR_SPIRIT_LS_2;
local dLand = DomainTypes.DOMAIN_LAND;

function RusselCroweSpirit(player, unit, x, y)
	if Players[player]:GetCivilizationType() == AusCiv then
		local cUnit = Players[player]:GetUnitByID(unit);
		if cUnit then
			local cPlot = cUnit:GetPlot();
			if cPlot then
				if RusCrowePlots[cPlot] then
					if cUnit:IsCombatUnit() then
						if cUnit:GetDomainType() == dLand then
							if not cUnit:IsHasPromotion(nouspirit1) then
								if not cUnit:IsHasPromotion(nouspirit2) then
									if math.random(1, 100) == 53 then
										cUnit:SetHasPromotion(nouspirit2, true)
									else
										cUnit:SetHasPromotion(nouspirit1, true)
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function AddRusselCroweSpiritToGame(fPlot)
	RusCrowePlots[fPlot] = 1;
	for i =0 , 5 do
		local iPlot = Map.PlotDirection(fPlot:GetX(), fPlot:GetY(), i);
		if iPlot then
			RusCrowePlots[iPlot] = 1;
		end
	end
	GameEvents.UnitSetXY.Add(RusselCroweSpirit)
end

function TriggerUI(fPlot, playerID, feature)
	if not UIon then
		UIon = true;
		PopulateData(fPlot, playerID, feature)
	else
		UIQueue[{plot = fPlot, player = playerID, type = feature}] = 1;
	end
end

function PopulateData(fPlot, playerID, feature)
	local info = GameInfo.Resources[feature];
	local yieldString = Locale.ConvertTextKey("TXT_KEY_POP_NATURAL_WONDER_FOUND_TT", info.Description);
	local numYields = 0;
	for i, yield in pairs(BesYields) do
		if fPlot:CalculateYield(yield, true) > 0 then
			numYields = numYields + 1;
			yieldString = yieldString .. " " .. fPlot:CalculateYield(yield, true) .. " ";
			yieldString = yieldString .. GameInfo.Yields[yield].IconString .. " ";
		end
	end	
	if (numYields == 0) then
		yieldString = yieldString .. " " .. Locale.ConvertTextKey( "TXT_KEY_PEDIA_NO_YIELD" );
	end
	yieldString = yieldString .. "[NEWLINE]" .. Locale.Lookup(info.Help);


	Controls.WonderLabel:LocalizeAndSetText(info.Description);
	Controls.DescriptionLabel:SetText(yieldString);
	ContextPtr:SetHide(false);
end

function OnCloseButtonClicked()
	local data = -1;
	for vData, i in pairs(UIQueue) do
		data = vData;
	end
	if data == -1 then
	    ContextPtr:SetHide(true);
	else
		UIQueue[data] = nil;
		PopulateData( data.plot, data.player, data.type)
	end
end
Controls.CloseButton:RegisterCallback( Mouse.eLClick, OnCloseButtonClicked );