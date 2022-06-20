--================================================================================================================
-- Rio dela Plata Decisions scripts
--================================================================================================================
-- Utilities
---------------------------

print ("Rio dela Plata Decision Scripts LOADED");

--JFD_SendWorldEvent
function JFD_SendWorldEvent(player, description)
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	elseif player == activePlayer then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 

-- ChangeNameFunction
function PG_ChangeName(player)
	PreGame.SetCivilizationShortDescription(player:GetID(), "TXT_KEY_CIV_PG_RIODELAPLATA_SHORT_DESC_ENACTED")
	PreGame.SetCivilizationAdjective(player:GetID(), "TXT_KEY_CIV_PG_RIODELAPLATA_ADJECTIVE_ENACTED")
	PreGame.SetCivilizationDescription(player:GetID(), "TXT_KEY_CIV_PG_RIODELAPLATA_DESC_ENACTED")
	-- Let's change all units yay!
	for pUnit in player:Units() do
		Events.UnitNameChanged( pUnit:GetOwner(), pUnit:GetID() );
	end
	--
	print("No more Rio dela Plata! Only Argentina Lives!")
end
---------------------------
-- Variables
---------------------------
local civilizationID			= GameInfoTypes["CIVILIZATION_PG_RIODELAPLATA"]

local CruceAndesCultureCost		= 300
local CruceAndesMagistrateCost	= 2
local CruceAndesNumGranaderos	= 3
local CruceAndesGranaderoID		= GameInfoTypes["UNIT_PG_GRANADEROS"]
local CruceAndesNumGenerals		= 1
local CruceAndesGeneralsID		= GameInfoTypes["UNIT_GREAT_GENERAL"]

local CongresoTucumanCultureCost	= 395
local CongresoTucumanMagistrateCost = 4
local CongresoTucumanNumCitiesReq	= 4
local CongresoTucumanNewName		= "TXT_KEY_CIV_PG_RIODELAPLATA_SHORT_DESC_ENACTED"
local CongresoTucumanNewAdj			= "TXT_KEY_CIV_PG_RIODELAPLATA_ADJECTIVE_ENACTED"
local CongresoTucumanPrereqTech		= GameInfoTypes["TECHNOLOGIES_CIVIL_SERVICE"]
local CongresoTucumanPolicy			= GameInfoTypes["POLICY_PG_CONGRESOTUCUMAN"]


--Check name on load
function CheckStuffOnLoad (arg0, currPlayer)
	for _, iPlayer in pairs(Players) do
		if (iPlayer:IsAlive()) then
			if iPlayer:GetCivilizationType() == civilizationID then
				if load(iPlayer, "Decisions_PG_RiodelaPlata_CongresoTucuman_Enacted") == true then 
					PG_ChangeName(iPlayer)					
				end
			end
		end
	end
end

Events.LoadScreenClose.Add(CheckStuffOnLoad)

--=================================================================================================================
--=================================================================================================================
-- Cruce de los Andes Decision
---------------------------
local	Decisions_PG_RiodelaPlata_CruceAndes = {}
		Decisions_PG_RiodelaPlata_CruceAndes.Name	= "TXT_KEY_DECISIONS_PG_RIODELAPLATA_CRUCEANDES"
		Decisions_PG_RiodelaPlata_CruceAndes.Desc	= "TXT_KEY_DECISIONS_PG_RIODELAPLATA_CRUCEANDES_DESC"
		HookDecisionCivilizationIcon(Decisions_PG_RiodelaPlata_CruceAndes, "CIVILIZATION_PG_RIODELAPLATA")

-- Conditions:
-- · Only Rio dela Plata
-- · War!
-- · Renaissance
-- · Only Once
-- · Culture Cost
-- · Magistrate Cost
----------------------
Decisions_PG_RiodelaPlata_CruceAndes.CanFunc = (
function(player)
	if player:GetCivilizationType() ~= civilizationID then return false, false end
	if load(player, "Decisions_PG_RiodelaPlata_CruceAndes_Enacted") == true then
		Decisions_PG_RiodelaPlata_CruceAndes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PG_RIODELAPLATA_CRUCEANDES_ENACTED_DESC")
		return false, false, true
	end
	-- CultureCost
	local iCost = math.ceil((CruceAndesCultureCost) * iMod)
	if (player:GetJONSCulture() < iCost) then CA_rtf = 1 end
	
	Decisions_PG_RiodelaPlata_CruceAndes.Desc	= Locale.ConvertTextKey("TXT_KEY_DECISIONS_PG_RIODELAPLATA_CRUCEANDES_DESC", iCost, CruceAndesMagistrateCost, CruceAndesNumGranaderos, CruceAndesNumGenerals)
	-- Check EE
	if GameInfoTypes["UNIT_EE_CUIRASSIER"] ~= nil then 
	Decisions_PG_RiodelaPlata_CruceAndes.Desc	= Locale.ConvertTextKey("TXT_KEY_DECISIONS_PG_RIODELAPLATA_CRUCEANDES_DESC_EE", iCost, CruceAndesMagistrateCost, CruceAndesNumGranaderos, CruceAndesNumGenerals)
	end
	--
	if CA_rtf == 1 then return true, false end
	-- IsWar
	local team = player:GetTeam();
	local isWar = 0;
	for oPlayer=0, GameDefines.MAX_MAJOR_CIVS-1 do
		local oPlayer = Players[oPlayer];
		if oPlayer ~= player then
			if (oPlayer:IsAlive()) then
				local oTeam = oPlayer:GetTeam();
				if Teams[team]:IsAtWar(oTeam) then
					isWar = isWar + 1;
					break
				end
			end
		end
	end
	if isWar <= 0 then return true, false end
	-- Era Check
	if player:GetCurrentEra() ~= GameInfoTypes["ERA_INDUSTRIAL"] or player:GetCurrentEra() ~= GameInfoTypes["ERA_ENLIGHTENMENT"] then return true, false end
	--Magistrates
	if player:GetNumResourceAvailable(iMagistrate, false) < CruceAndesMagistrateCost then return true, false end
	return true, true
end
)

-- Effects:
-- · Become Enacted for Ever!
-- · Remove Culture
-- · Remove Magistrates
-- · Grant Granaderos
-- · Grant Great General
---------------------------
Decisions_PG_RiodelaPlata_CruceAndes.DoFunc = (
function (player)
		local iCost = math.ceil((CruceAndesCultureCost) * iMod)
		player:ChangeJONSCulture(-iCost);
		player:ChangeNumResourceTotal(iMagistrate, -(CruceAndesMagistrateCost))
		InitUnitFromCity(player:GetCapitalCity(), CruceAndesGranaderoID, CruceAndesNumGranaderos)
		InitUnitFromCity(player:GetCapitalCity(), CruceAndesGeneralsID, CruceAndesNumGenerals)
		save(player, "Decisions_PG_RiodelaPlata_CruceAndes_Enacted", true)
		JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_PG_RIODELAPLATA_CRUCEANDES", player:GetName(), player:GetCivilizationShortDescription()))
end
)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_PG_RiodelaPlata_CruceAndes", Decisions_PG_RiodelaPlata_CruceAndes)

--=================================================================================================================
--=================================================================================================================
-- Congreso de Tucumán Decision
---------------------------
local	Decisions_PG_RiodelaPlata_CongresoTucuman = {}
		Decisions_PG_RiodelaPlata_CongresoTucuman.Name	= "TXT_KEY_DECISIONS_PG_RIODELAPLATA_CONGRESOTUCUMAN"
		Decisions_PG_RiodelaPlata_CongresoTucuman.Desc	= "TXT_KEY_DECISIONS_PG_RIODELAPLATA_CONGRESOTUCUMAN_DESC"
		HookDecisionCivilizationIcon(Decisions_PG_RiodelaPlata_CongresoTucuman, "CIVILIZATION_PG_RIODELAPLATA")

-- Conditions:
-- · Must be civ
-- · Must have researched Civil Service
-- · Must own more than x cities
-- · Only Once
-- · Culture Cost
-- · Magistrate Cost
------------------------
Decisions_PG_RiodelaPlata_CongresoTucuman.CanFunc = (
function (player)
	if player:GetCivilizationType() ~= civilizationID then return false, false 
	end
	if load(player, "Decisions_PG_RiodelaPlata_CongresoTucuman_Enacted") == true then
		Decisions_PG_RiodelaPlata_CongresoTucuman.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_PG_RIODELAPLATA_CONGRESOTUCUMAN_ENACTED_DESC")
		return false, false, true
	end
	-- Has Tech?
	local team = player:GetTeam();
	if not (Teams[team]:IsHasTech(CongresoTucumanPrereqTech)) then return false 
	end
	-- Has Cities?
	numCities = 0
	for city in player:Cities() do
		numCities = numCities + 1
	end
	if (numCities < CongresoTucumanNumCitiesReq) then rtf = 1 
	end
	-- MagistrateCost
	if player:GetNumResourceAvailable(iMagistrate, false) < CongresoTucumanMagistrateCost then rtf = 1 
	end
	-- CultureCost
	local iCost = math.ceil((CongresoTucumanCultureCost) * iMod)
	if (player:GetJONSCulture() < iCost) then rtf = 1  
	end
	Decisions_PG_RiodelaPlata_CongresoTucuman.Desc	= Locale.ConvertTextKey("TXT_KEY_DECISIONS_PG_RIODELAPLATA_CONGRESOTUCUMAN_DESC", CongresoTucumanNumCitiesReq, iCost, CongresoTucumanMagistrateCost, CongresoTucumanNewName)
	if rtf == 1 then return true, false end
	return true, true
end
)

-- Effects:
-- · Remove Culture
-- · Remove Magistrates
-- · Mark as Enacted
-- · Change Name
-- · Grant Policy for extra bonuses
-----------------------------
Decisions_PG_RiodelaPlata_CongresoTucuman.DoFunc = (
function (player)
	local iCost = math.ceil((CongresoTucumanCultureCost) * iMod)
	player:ChangeJONSCulture(-iCost);
	player:ChangeNumResourceTotal(iMagistrate, -(CongresoTucumanMagistrateCost))
	player:SetNumFreePolicies(1)
	player:SetNumFreePolicies(0)
	player:SetHasPolicy(CongresoTucumanPolicy, true);
	PG_ChangeName(player)
	save(player, "Decisions_PG_RiodelaPlata_CongresoTucuman_Enacted", true)
	JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_PG_RIODELAPLATA_CONGRESOTUCUMAN", player:GetName(), CongresoTucumanNewName))
end
)

Decisions_AddCivilisationSpecific(civilizationID, "Decisions_PG_RiodelaPlata_CongresoTucuman", Decisions_PG_RiodelaPlata_CongresoTucuman)