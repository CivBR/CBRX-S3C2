--Authors: Chrisy15, JFD, Arilasqueto
--[[
Great General: Get science when a military land unit is produced -- Tick!
Great Admiral: Get science when a naval unit is produced -- Tick!
Great Scientist: Increased science from Academies -- Tick!
Great Engineer: Science from manufacturies and strategic resources -- Tick!
Great Merchant: Get Science from resource diversity in cities -- Tick!
Great Artist: +science from great works -- Tick!
Great Writer: Science from adopting policies -- Tick!
Great Musician: bonus science in the capital for each civ you are familiar+ with -- Tick!
Great Prophet: +1 science for every 4 citizens in a city -- Tick!
]]

include("IconSupport.lua")
include("FLuaVector.lua")
--include("TableSaverLoader016.lua");
--include("ASQ_AlliRani_GlobalDefines.lua");

-- I don't really know if this is how you're meant to set it up, if it doesn't work then make the edits in ASQ_AlliRani_TSLSerializerV3.lua instead as it instructs
-- Would also recommend prefixing with g_ for clarity and because it's easier to autocomplete but /shrug
ASQ_Civs_SangamPandya = {}

tableRoot = ASQ_Civs_SangamPandya
tableName = "ASQ_Civs_SangamPandya"

--include("ASQ_AlliRaniTSLSerializerV3.lua");

--TableLoad(tableRoot, tableName)


local bRandomSangramNaturalGA = false

local iCiv = GameInfoTypes["CIVILIZATION_ASQ_SANGAMPANDYA"] -- Smh it's current year ur at least meant to use the Leader :sus
local iTrait = GameInfoTypes["TRAIT_ASQ_ALLIRANI"]
local iBuilding = GameInfoTypes["BUILDING_ASQ_PEARL_FISHERY"]
local iMaraval = GameInfoTypes["UNIT_ASQ_MARAVAL"]
local iPearls = GameInfoTypes["RESOURCE_PEARLS"]
local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]

local ucArtist = GameInfoTypes.UNITCLASS_ARTIST;
local ucWriter = GameInfoTypes.UNITCLASS_WRITER;
local ucMusician = GameInfoTypes.UNITCLASS_MUSICIAN;
local ucScientist = GameInfoTypes.UNITCLASS_SCIENTIST;
local ucMerchant = GameInfoTypes.UNITCLASS_MERCHANT;
local ucEngineer = GameInfoTypes.UNITCLASS_ENGINEER;
local ucGreatGeneral = GameInfoTypes.UNITCLASS_GREAT_GENERAL;
local ucAdmiral = GameInfoTypes.UNITCLASS_GREAT_ADMIRAL;
local ucProphet = GameInfoTypes.UNITCLASS_PROPHET;

local tPolicies = {}
tPolicies[-1] = GameInfoTypes["POLICY_ASQ_PANDYA_DEFAULT"] -- No effect
tPolicies[ucScientist] = GameInfoTypes["POLICY_ASQ_PANDYA_SCIENCE"] -- Scientist
tPolicies[ucEngineer] = GameInfoTypes["POLICY_ASQ_PANDYA_ENGINEE"] -- Engineer
-- C15 --
tPolicies[ucAdmiral] = GameInfoTypes["POLICY_ASQ_PANDYA_ADMIRAL"]
tPolicies[ucWriter] = GameInfoTypes["POLICY_ASQ_PANDYA_WRITER"]
tPolicies[ucMusician] = GameInfoTypes["POLICY_ASQ_PANDYA_MUSICIAN"]
tPolicies[ucMerchant] = GameInfoTypes["POLICY_ASQ_PANDYA_MERCHANT"]
tPolicies[ucGreatGeneral] = GameInfoTypes["POLICY_ASQ_PANDYA_GENERAL"]
tPolicies[ucProphet] = GameInfoTypes["POLICY_ASQ_PANDYA_PROPHET"]
-- /C15 --

local iEngineerDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_ENGINEER"]
local iArtistDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_ARTIST"] -- +1 Science
local iMusicianDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_MUSIC"] -- +1 Science, I think it could be the same Building as iArtistDummy?
local iMerchantDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_MERCH"] -- +1 Science, I reckon this could be the same too but I'll keep them as separate variables for consistency by this point
local iProphetDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_PROPH"] -- Library
local iGPDummy = GameInfoTypes["BUILDING_ASQ_PANDYA_GP"]

-- These functions might have to be defined before this table, idr
-- I think it'd also technically be better to just have a singular function that disseminates via if-elseif, but this structure makes it easier to hypothetically convert into a database-centric system that allows for mod support but you aren't going to do that and no-one would support that so it's just for demonstration I guess
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
----------------------------------------------------------------------------------------------------------------------------

function C15_ASQ_PolicySet(pPlayer, iNewPolicyIndex)
	for k, v in pairs(tPolicies) do
		if pPlayer:HasPolicy(v) and k ~= iNewPolicyIndex then
			if Player.RevokePolicy then
				pPlayer:RevokePolicy(v)
			else
				pPlayer:SetHasPolicy(v, false)
			end
		end
		if Player.GrantPolicy then
			pPlayer:GrantPolicy(tPolicies[iNewPolicyIndex], true)
		else
			pPlayer:SetHasPolicy(tPolicies[iNewPolicyIndex], true)
		end
	end
end

-- C15 --
function C15_ASQ_PolicyGet(pPlayer)
	for k, v in pairs(tPolicies) do
		if pPlayer:HasPolicy(v) then
			return k
		end
	end

	return -1
end
-- /C15 --

local tGreatPeople = {
    {GP = ucArtist, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_ARTIST", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucArtist].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucArtist].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucWriter, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_WRITER", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucWriter].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucWriter].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucMusician, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_MUSICIAN", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucMusician].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucMusician].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucScientist, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_SCIENTIST", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucScientist].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucScientist].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucMerchant, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_MERHCANT", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucMerchant].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucMerchant].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucEngineer, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_ENGINEER", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucEngineer].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucEngineer].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucGreatGeneral, 	Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_GENERAL", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucGreatGeneral].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucGreatGeneral].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucAdmiral, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_ADMIRAL", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucAdmiral].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucAdmiral].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet},
    {GP = ucProphet, 		Desc = "TXT_KEY_ASQ_PANDYA_MCIS_HELP_PROPHET", IconAtlas = GameInfo.Units[GameInfo.UnitClasses[ucProphet].DefaultUnit].IconAtlas, PortraitIndex = GameInfo.Units[GameInfo.UnitClasses[ucProphet].DefaultUnit].PortraitIndex, Func = C15_ASQ_PolicySet}
}


local tGPIndex = {}
for k, v in ipairs(tGreatPeople) do
	tGPIndex[v.GP] = k
end

local iGPLength = #tGreatPeople

local tDomains = {}
tDomains[DomainTypes.DOMAIN_SEA] = ucAdmiral
tDomains[DomainTypes.DOMAIN_LAND] = ucGreatGeneral

local tResources = {}
for row in DB.Query("SELECT ID FROM Resources WHERE ResourceUsage IN (1, 2)") do
	tResources[row.ID] = true
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

function C15_ProdTextOnPlot(iX, iY, sString) -- Code's basically Suk's fwiw
    local pHexPos = ToHexFromGrid{x=iX, y=iY}
    local pWorldPos = HexToWorld(pHexPos)
    Events.AddPopupTextEvent(pWorldPos, sString)
end

-- Lee's Science-granting function. Highlights how much stuff there is to consider, but the use of GameInfo is ofc depressing. Use if you want, or rewrite if u want.
function ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
	if iValue <= pTeamTechs:GetResearchLeft(iTechnology) then
		pTeamTechs:ChangeResearchProgress(iTechnology, iValue, iPlayer)
		return 0
	else
		local iChange = iValue - pTeamTechs:GetResearchLeft(iTechnology)
		pTeam:SetHasTech(iTechnology, true)
		return iChange
	end
	return -1
end
-- (You're meant to use this one in your code, the other function is a utility)
function ChangePlayerResearchProgress(iPlayer, iValue, bOnlyCurrentTech)
	local CurrentTechOnly = ((bOnlyCurrentTech ~= nil) and bOnlyCurrentTech or false)
	local pPlayer = Players[iPlayer]
	local iCurrentResearchItem = pPlayer:GetCurrentResearch()
	local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTechs = pTeam:GetTeamTechs()
	local iChange = iValue
	if (iCurrentResearchItem ~= -1) and (iCurrentResearchItem ~= nil) then
		iChange = ChangeTechProgressAndReturnOverflow(iValue, iCurrentResearchItem, pTeamTechs, pTeam, iPlayer)
		if CurrentTechOnly or (iChange <= 0) then
			return
		end
	end
	local tTechsNotResearched = {}
	local iLowestGridWithUnResearchedTech = 1000
	local iLargestTechGridX = 0
	local bUnresearchedTechExists = false
	for Tech in GameInfo.Technologies() do
		if not Tech.Disable and not pTeamTechs:HasTech(Tech.ID) then
			bUnresearchedTechExists = true
			if Tech.GridX < iLowestGridWithUnResearchedTech then
				iLowestGridWithUnResearchedTech = Tech.GridX
			end
			if not tTechsNotResearched[Tech.GridX] then
				tTechsNotResearched[Tech.GridX] = {}
			end
			table.insert(tTechsNotResearched[Tech.GridX], {TechID=Tech.ID, Progress=pTeamTechs:GetResearchProgress(Tech.ID)})
		end
		if Tech.GridX > iLargestTechGridX then
			iLargestTechGridX = Tech.GridX
		end
	end
	if bUnresearchedTechExists then
		local iSelection = JFD_GetRandom(1, #tTechsNotResearched[iLowestGridWithUnResearchedTech])
		local iSelectedTech = tTechsNotResearched[iLowestGridWithUnResearchedTech][iSelection].TechID
		ChangeTechProgressAndReturnOverflow(iChange, iSelectedTech, pTeamTechs, pTeam, iPlayer)
	end
end

function C15_ASQ_LoadScreen()
	for k, v in pairs(Players) do
		if v:GetCivilizationType() == iCiv then
			if not ASQ_Civs_SangamPandya[k] then
				-- C15 --
				--ASQ_Civs_SangamPandya[k] = {bGAState = false, iCurrentBonus = -1}
				ASQ_Civs_SangamPandya[k] = {bGAState = v:IsGoldenAge(), iCurrentBonus = C15_ASQ_PolicyGet(v)}

				if not v:HasPolicy(tPolicies[ASQ_Civs_SangamPandya[k].iCurrentBonus]) then
					if Player.GrantPolicy then
						v:GrantPolicy(tPolicies[ASQ_Civs_SangamPandya[k].iCurrentBonus], true)
					else
						v:SetNumFreePolicies(v:GetNumFreePolicies()+1)
						v:SetNumFreePolicies(v:GetNumFreePolicies()-1)
						v:SetHasPolicy(tPolicies[ASQ_Civs_SangamPandya[k].iCurrentBonus], true)
					end
				end
				-- /C15 --
			end
		end
	end
end

Events.LoadScreenClose.Add(C15_ASQ_LoadScreen)

function C15_ASQ_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local bGA = pPlayer:IsGoldenAge()
		local bGATrack = ASQ_Civs_SangamPandya[playerID].bGAState
		if bGA and (not bGATrack) then
			-- GA Started!
			ASQ_Civs_SangamPandya[playerID].bGAState = true
			if ASQ_Civs_SangamPandya[playerID].iCurrentBonus == -1 and bRandomSangramNaturalGA then
				local iRand = JFD_GetRandom(1, iGPLength)
				local tGP = tGreatPeople[iRand]
				ASQ_Civs_SangamPandya[playerID].iCurrentBonus = tGP.GP
				if tGP.Func then
					tGP.Func(pPlayer, tGP.GP)
				end
			end
		elseif (not bGA) and bGATrack then
			-- GA Ended!
			ASQ_Civs_SangamPandya[playerID].bGAState = false
			ASQ_Civs_SangamPandya[playerID].iCurrentBonus = -1
			-- Whatever you need to do on GAEnd
			C15_ASQ_PolicySet(pPlayer, -1)
		end

		local iCurrentBonus = ASQ_Civs_SangamPandya[playerID].iCurrentBonus
		if iCurrentBonus == ucArtist or pPlayer:CountNumBuildings(iArtistDummy) > 0 then
			for pCity in pPlayer:Cities() do
				local iCount = (iCurrentBonus == ucArtist and pCity:GetNumGreatWorks()) or 0
				pCity:SetNumRealBuilding(iArtistDummy, iCount)
			end
		end
		if iCurrentBonus == ucMusician or pPlayer:CountNumBuildings(iMusicianDummy) > 0 then
			local iCount = 0
			if iCurrentBonus == ucMusician then
				for k, v in pairs(Players) do
					if v and v:IsAlive() and (not v:IsBarbarian()) and (not v:IsMinorCiv()) then
						if pPlayer:GetInfluenceLevel(k) >= 1 then -- Hardcoded by Firaxis, idc enough not to hardcode it
							iCount = iCount + 1
						end
					end
				end
			end
			if pPlayer:CountNumBuildings(iMusicianDummy) ~= iCount then
				for pCity in pPlayer:Cities() do
					if pCity:IsCapital() then
						pCity:SetNumRealBuilding(iMusicianDummy, iCount)
					else
						pCity:SetNumRealBuilding(iMusicianDummy, 0)
					end
				end
			end
		end
		if iCurrentBonus == ucProphet or pPlayer:CountNumBuildings(iProphetDummy) > 0 then
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(iProphetDummy, (iCurrentBonus == ucProphet and 1) or 0)
			end
		end
		if iCurrentBonus == ucMerchant or pPlayer:CountNumBuildings(iMerchantDummy) > 0 then
			local teamID = pPlayer:GetTeam()
			for pCity in pPlayer:Cities() do
				-- Now I don't actually know whether Resource Diversity accounts for the 4th and 5th rings, and I can't *really* be bothered to check...
				-- Eh I'm curious
				-- It does not! Well, that makes it easier!
				local iCount = 0
				local tAccounted = {}
				if iCurrentBonus == ucMerchant then
					for i = 0, pCity:GetNumCityPlots() - 1 do
						local pPlot = pCity:GetCityIndexPlot(i)
						if pPlot and pPlot:GetWorkingCity() == pCity then
							local iResource = pPlot:GetResourceType(teamID)
							if tResources[iResource] and (not tAccounted[iResource]) then
								if pPlot:IsResourceConnectedByImprovement(pPlot:GetImprovementType()) then -- Woo new experimental method to give to someone else to test!
									iCount = iCount + 1
									tAccounted[iResource] = true
								end
							end
						end
					end
				end

				pCity:SetNumRealBuilding(iMerchantDummy, iCount)
			end
		end
		if iCurrentBonus == ucEngineer or pPlayer:CountNumBuildings(iEngineerDummy) > 0 then
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(iEngineerDummy, iCurrentBonus == ucEngineer and 1 or 0)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(C15_ASQ_DoTurn)

function C15_Asq_CityTrained(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit:IsCombatUnit() then
			local iDomain = pUnit:GetDomainType()
			if tDomains[iDomain] and tDomains[iDomain] == ASQ_Civs_SangamPandya[playerID].iCurrentBonus then
				local iScience = math.max(pUnit:GetBaseCombatStrength(), pUnit:GetBaseRangedCombatStrength()) -- Change calculation as you wish
				ChangePlayerResearchProgress(playerID, iScience, false)
				if Game.GetActivePlayer() == playerID then
					C15_ProdTextOnPlot(pUnit:GetX(), pUnit:GetY(), "+" .. iScience .. "[ICON_RESEARCH]")
				end
			end
		end
	end
end

GameEvents.CityTrained.Add(C15_Asq_CityTrained)

function C15_ASQ_Policy(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		if ASQ_Civs_SangamPandya[playerID].iCurrentBonus == ucWriter then
			local iCulture = pPlayer:GetTotalJONSCulturePerTurn() -- Or whatever calculation you desire
			ChangePlayerResearchProgress(playerID, iCulture, false)
			if Game.GetActivePlayer() == playerID then
				local sMessage = Locale.ConvertTextKey("TXT_KEY_ASQ_PANDYA_POLICY_SCIENCE", iCulture)
				Events.GameplayAlertMessage(sMessage)
			end
		end
	end
end

GameEvents.PlayerAdoptPolicy.Add(C15_ASQ_Policy)
GameEvents.PlayerAdoptPolicyBranch.Add(C15_ASQ_Policy)

function C15_ASQ_GPMission(playerID, unitID) -- Make sure this function is only callable for Players who have their saved table set up, which should be the case since the UI should only show up for valid Civs but y'know
	local pPlayer = Players[playerID]
	local pUnit = pPlayer:GetUnitByID(unitID)
	local iUnitClass = pUnit:GetUnitClassType()
	pPlayer:ChangeGoldenAgeTurns(14) -- However many idk idc
	--if ASQ_Civs_SangamPandya[playerID].iCurrentBonus > 0 then
		-- Whatever you're doing in cases where a Sangam has already started
	--else
		ASQ_Civs_SangamPandya[playerID].bGAState = true
		ASQ_Civs_SangamPandya[playerID].iCurrentBonus = iUnitClass
		local iIndex = tGPIndex[iUnitClass]
		if tGreatPeople[iIndex].Func then
			tGreatPeople[iIndex].Func(pPlayer, iUnitClass)
		end
		C15_ASQ_DoTurn(playerID)
	--end

	pUnit:Kill(false, -1)
end
-- Then RegisterCallback that

-------------------------------------------------------------------------------------------------------------------------
-- UNIT PANEL
-------------------------------------------------------------------------------------------------------------------------
--JFD_RomeJulian_UI_UnitActionButton

Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, C15_ASQ_GPMission);

-------------------------------------------------------------------------------------------------------------------------
--ASQ_ALLIRANI_UI_SerialEventUnitInfoDirty
function ASQ_ALLIRANI_UI_SerialEventUnitInfoDirty()
	local activePlayerID = Game.GetActivePlayer()
	if Players[activePlayerID]:GetCivilizationType() == iCiv then

		local unit = UI.GetHeadSelectedUnit();
		if (not unit) then return end
		if tGPIndex[unit:GetUnitClassType()] then
			Controls.UnitActionButton:SetHide(false)
		else
			Controls.UnitActionButton:SetHide(true)
		end

		Controls.UnitActionButton:SetVoid1(activePlayerID)
		Controls.UnitActionButton:SetVoid2(unit:GetID())

		local buildCityButtonActive = unit:IsFound();

		local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
		local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
		primaryStack:CalculateSize();
		primaryStack:ReprocessAnchoring();

		local stackSize = primaryStack:GetSize();
		local stretchySize = primaryStretchy:GetSize();
		 local buildCityButtonSize = 0
		if buildCityButtonActive then
			if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
				buildCityButtonSize = 36;
			else
				buildCityButtonSize = 60;
			end
		end
		primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
	else
		Controls.UnitActionButton:SetHide(true)
	end
end
-------------------------------------------------------------------------------------------------------------------------
--ASQ_ALLIRANI_UI_UpdateUnitInfoPanel
local function ASQ_ALLIRANI_UI_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("ASQ_ALLIRANI_Goldenage_64.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("ASQ_ALLIRANI_Goldenage_45.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_ASQ_ALLIRANI_GP_TT")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end
 -------------------------------------------------------------------------------------------------------------------------
local function Initialize()
	Events.LoadScreenClose.Add(ASQ_ALLIRANI_UI_UpdateUnitInfoPanel);
	Events.SerialEventUnitInfoDirty.Add(ASQ_ALLIRANI_UI_SerialEventUnitInfoDirty);
end
Initialize();

-- AI Logic

function C15_ASQ_GPCreated(playerID, unitID)
	local pPlayer = Players[playerID]
	if (not pPlayer:IsHuman()) and pPlayer:GetCivilizationType() == iCiv then
		local pUnit = pPlayer:GetUnitByID(unitID)
		if pUnit and tGPIndex[pUnit:GetUnitClassType()] then
			if (not pPlayer:IsGoldenAge()) and JFD_GetRandom(1, 10) > 5 then
				C15_ASQ_GPMission(playerID, unitID)
			end
		end
	end
end

Events.SerialEventUnitCreated.Add(C15_ASQ_GPBorn)

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "C15_ASQ_PANDYA_MCIS_Tooltip", ["SortOrder"] = 1})
end
LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
LuaEvents.RequestCityInfoStackDataRefresh()

function CityInfoStackDirty(key, instance)
	if key ~= "C15_ASQ_PANDYA_MCIS_Tooltip" then return end
	ProcessCityScreen(instance)
end
LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end


function C15_ASQ_CanStartMission(playerID, unitID, iMission)
    if ASQ_Civs_SangamPandya[playerID] and iGAMission == iMission then
        local pPlayer = Players[playerID]
        local pUnit = pPlayer:GetUnitByID(unitID)
        if tGPIndex[pUnit:GetUnitClassType()] then
            return false
        end
    end

    return true
end

GameEvents.CanStartMission.Add(C15_ASQ_CanStartMission)
------------------------------------
-- UB
------------------------------------
function ASQ_Pandya_SpawnPearls(pCity)
    local numPearlsPlaced = 0
    for i = 0, pCity:GetNumCityPlots() - 1, 1 do
        local pPlot = pCity:GetCityIndexPlot(i)
        if pPlot and (pPlot:GetWorkingCity() == pCity) and (not pPlot:IsCity()) and (pPlot:GetResourceType() == -1) then
            if pPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] then
                    pPlot:SetResourceType(iPearls)
                    numPearlsPlaced = numPearlsPlaced + 1
                    if numPearlsPlaced >= 1 then break end
            end
        end
    end

    return false
end

function ASQ_Fishery_Pearls(playerID, cityID, buildingID)
  local pPlayer = Players[playerID]
  if buildingID == iBuilding then
     ASQ_Pandya_SpawnPearls(pPlayer:GetCityByID(cityID))
  end
end

function ASQ_Pandya_GibGPP(iPlayer)
    local pPlayer = Players[iPlayer]
    local numGPP = 0
    local numGPPPerResource = 5
    for pCity in pPlayer:Cities() do
		if pPlayer:GetCivilizationType()~=iCiv then return false end
		if (pCity:IsHasBuilding(iBuilding)) then
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and (pPlot:GetWorkingCity() == pCity) and (not pPlot:IsCity()) and (pPlot:GetResourceType() > -1) and (pPlot:GetTerrainType() == GameInfoTypes["TERRAIN_COAST"] or pPlot:GetTerrainType() == GameInfoTypes["TERRAIN_OCEAN"]) then
						numGPP = numGPP + 1
				end
            end
        end
		if numGPPPerResource > 0 then
			pCity:SetNumRealBuilding(iGPDummy, numGPP)
		end
    end
end
GameEvents.PlayerDoTurn.Add(ASQ_Pandya_GibGPP)

GameEvents.CityConstructed.Add(ASQ_Fishery_Pearls)

-------------------------
-- uu
-------------------------

function ASQ_Pandya_UU(iPlayer)
    local pPlayer = Players[iPlayer]
    for pUnit in pPlayer:Units() do
        pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_ASQ_MARAVAL"], false)
        if pUnit:GetUnitType() == iMaraval then --assuming here its the UU, and that they lose this ability on upgrade. Can amend if need be
            local pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())
            if pPlot and pPlot:IsAdjacentToShallowWater() and (not pPlot:IsLake()) then
                pUnit:SetHasPromotion(GameInfoTypes["PROMOTION_ASQ_MARAVAL"], true)
            end
        end
    end
end
GameEvents.PlayerDoTurn.Add(ASQ_Pandya_UU)
--=======================================================================================================================
-- CORE FUNCTIONS
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_C15_ASQ_PANDYA_MCIS_TipControls = {}
TTManager:GetTypeControlTable("C15_ASQ_PANDYA_MCIS_Tooltip", g_C15_ASQ_PANDYA_MCIS_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	local activePlayerID = city:GetOwner()
	if not ASQ_Civs_SangamPandya[activePlayerID] then instance.IconFrame:SetHide(true) return end
	local iCurrentBonus = ASQ_Civs_SangamPandya[activePlayerID].iCurrentBonus
	if iCurrentBonus == -1 then
		instance.IconFrame:SetHide(true)
		return
	end
	local tGPData = tGreatPeople[tGPIndex[iCurrentBonus]]
	instance.IconFrame:SetToolTipType("C15_ASQ_PANDYA_MCIS_Tooltip")
	IconHookup(tGPData.PortraitIndex, 64, tGPData.IconAtlas, instance.IconImage)
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey(tGPData.Desc)
	g_C15_ASQ_PANDYA_MCIS_TipControls.Heading:SetText(textDescription)
	g_C15_ASQ_PANDYA_MCIS_TipControls.Body:SetText(textHelp)
	g_C15_ASQ_PANDYA_MCIS_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end

