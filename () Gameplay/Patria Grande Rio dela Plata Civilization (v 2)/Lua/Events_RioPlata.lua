--================================================================================================================
-- Rio dela Plata Event scripts
--================================================================================================================
-- Utilities
---------------------------

print ("Rio dela Plata Event Scripts LOADED");

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

-- Random from Table
function tablerandom(tbl)
	local keys = {}
	for k in pairs(tbl) do
		table.insert(keys, k)
	end
	local randIndex = math.random(#keys)
	local randKey = keys[randIndex]
	return tbl[randKey]
end

---------------------------
-- Variables
---------------------------
local civilizationID			= GameInfoTypes["CIVILIZATION_PG_RIODELAPLATA"]
-- Patricios
local PatriciosCultureCost		= 400
local NumPatricios				= 4
local PatriciosID				= GameInfoTypes["UNIT_PG_SANMARTIN_PATRICIOS"]
local WorkersCultureCost		= 150
local NumWorkers				= 2
local WorkersID					= GameInfoTypes["UNIT_WORKER"]
local ResistanceTurns			= 5
local LowerResistanceTurns		= 2
-- Clasico
local StadiumID					= GameInfoTypes["BUILDING_STADIUM"]
local LoserResistanceTurns		= 1 --NoMod!
local WLTKDTurns				= 10
local StadiumCitiesTb = {}
-- LogiaLautaro
local LogiaID					= GameInfoTypes["POLICY_PG_LOGIALAUTARO"]
local noLogiaID					= GameInfoTypes["POLICY_PG_NO_LOGIALAUTARO"]
local noLogiaID2				= GameInfoTypes["POLICY_PG_NO_LOGIALAUTARO_2"]
local ChileID					= GameInfoTypes["CIVILIZATION_CHILE"]
local newChileID				= GameInfoTypes["CIVILIZATION_PG_CHILE"]
local ColombiaID				= GameInfoTypes["CIVILIZATION_GRANCOLOMBIA"]
local newColombiaID				= GameInfoTypes["CIVILIZATION_PG_GRANCOLOMBIA"]

--=================================================================================================================
--=================================================================================================================
-- Enter the Patricios!
---------------------------
local	Events_PG_RiodelaPlata_PatriciosDec = {}
		Events_PG_RiodelaPlata_PatriciosDec.Name	= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS"
		Events_PG_RiodelaPlata_PatriciosDec.Desc	= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_DESC"
		Events_PG_RiodelaPlata_PatriciosDec.Weight = 9

-- Conditions:
-- · Being at War
-- · Renaissance or Industrial era
-- · Must have more than the Culture costs
-- · Must only happen once
--------------------------
Events_PG_RiodelaPlata_PatriciosDec.CanFunc = (
function(player)
	-- Check if it happened once
	if load(player, "Events_PG_RiodelaPlata_PatriciosDec_Fired") == true then return false end
	-- Check civ
	if player:GetCivilizationType() ~= civilizationID then return false end
	-- Check Era
	yea = 0
	if player:GetCurrentEra() == GameInfoTypes["ERA_RENAISSANCE"] then yea = 1 end
	if player:GetCurrentEra() == GameInfoTypes["ERA_INDUSTRIAL"]  then yea = 1 end
	if player:GetCurrentEra() == GameInfoTypes["ERA_ENLIGHTENMENT"] then yea = 1 end
	if yea ~= 1 then return false end
	-- Check War
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
	if isWar <= 0 then return false end
	-- Check Culture
	local iCost = math.ceil((PatriciosCultureCost) * iMod)
	if player:GetJONSCulture() < iCost then return false end
	-- DO IT! (If chances are met xD)
	return true
end	
)

Events_PG_RiodelaPlata_PatriciosDec.Outcomes = {}
-- Outcome 1
-- Allow the Patricios to join:
-- · Loses Culture
-- · Gains Patricios (Not sure why would someone not choose this but w/e)
---------------------------
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1]			= {}
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].Name		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_1"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_1"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].Weight		= 8

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].CanFunc = (
	function (player)
		-- Create Description
		local iCost = math.ceil((PatriciosCultureCost) * iMod)			
		Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_1", iCost, NumPatricios)
		return true
	end
	)

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[1].DoFunc = (
	function (player)
		-- Remove Culture
		local iCost = math.ceil((PatriciosCultureCost) * iMod)
		player:ChangeJONSCulture(-iCost)
		-- Give Patricios
		InitUnitFromCity(player:GetCapitalCity(), PatriciosID, NumPatricios)
		-- Save Event
		save(player, "Events_PG_RiodelaPlata_PatriciosDec_Fired", true)
		-- Alert the world!
		JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_1_NOTIFICATION"))
	end
	)


-- Outcome 2
-- Don't allow the Patricios to join:
-- · Enters Resistance D:
-- · Gains Culture (the combination of both costs, just for fun and balance)
---------------------------
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2]			= {}
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].Name		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_2"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_2"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].Weight		= 8

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].CanFunc = (
	function (player)
		-- Create Description
		local iCost = math.ceil(WorkersCultureCost * iMod)	
		local iResistance = math.ceil((ResistanceTurns) * iMod)		
		Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_2", iResistance, iCost)
		return true
	end
	)

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[2].DoFunc = (
	function (player)
		-- Give Culture
		local iCost = math.ceil((PatriciosCultureCost + WorkersCultureCost) * iMod)	
		player:ChangeJONSCulture(iCost)
		-- Give Resistance
		local iResistance = math.ceil((ResistanceTurns) * iMod)		
		city = player:GetCapitalCity()
		city:ChangeResistanceTurns(iResistance)
		-- Save Event
		save(player, "Events_PG_RiodelaPlata_PatriciosDec_Fired", true)
		-- Alert the world!
		JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_2_NOTIFICATION"))
	end
	)

-- Outcome 3
-- Allow them to join as workers:
-- · Enters Resistance ):
-- · Loses Culture
-- · Gains Workers!
---------------------------
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3]			= {}
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].Name		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_3"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_3"
	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].Weight		= 2

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].CanFunc = (
	function (player)
		-- Create Description
		local iCost = math.ceil(WorkersCultureCost * iMod)	
		local iResistance = math.ceil(LowerResistanceTurns * iMod)		
		Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_3", ResistanceTurns, iCost, NumWorkers)
		return true
	end
	)

	Events_PG_RiodelaPlata_PatriciosDec.Outcomes[3].DoFunc = (
	function (player)
		-- Reduce Culture
		local iCost = math.ceil(WorkersCultureCost * iMod)	
		player:ChangeJONSCulture(-iCost)
		-- Give Resistance
		local iResistance = math.ceil((LowerResistanceTurns) * iMod)		
		city = player:GetCapitalCity()
		city:ChangeResistanceTurns(iResistance)
		-- Give Workers
		InitUnitFromCity(player:GetCapitalCity(), WorkersID, NumWorkers)
		-- Save Event
		save(player, "Events_PG_RiodelaPlata_PatriciosDec_Fired", true)
		-- Alert the world!
		JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_PATRICIOS_OUTCOME_RESULT_3_NOTIFICATION"))
	end
	)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PG_RIODELAPLATA"], "Events_PG_RiodelaPlata_PatriciosDec", Events_PG_RiodelaPlata_PatriciosDec)


--=================================================================================================================
--=================================================================================================================
-- Boca vs River!
---------------------------
local	Events_PG_RiodelaPlata_Clasico = {}
		Events_PG_RiodelaPlata_Clasico.Name		= "TXT_KEY_EVENT_PG_RIOPLATA_CLASICO"
		Events_PG_RiodelaPlata_Clasico.Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_DESC"
		Events_PG_RiodelaPlata_Clasico.Weight = 5

-- Conditions:
-- · Have at least an Stadium.
-- · That's it :D
--------------------------
Events_PG_RiodelaPlata_Clasico.CanFunc = (
function(player)
	-- Check civ
	if player:GetCivilizationType() ~= civilizationID then return false end
	-- Check Stadiums
	NumStadiums = 0
	for city in player:Cities() do
			if city:IsHasBuilding(StadiumID) then
				NumStadiums = NumStadiums + 1
			end
		end
	if NumStadiums < 1 then return false end
	-- Look for cities with Stadiums and pick one.
		for city in player:Cities() do
			if city:IsHasBuilding(StadiumID) then
				table.insert(StadiumCitiesTb, city)
			end
		end
		eCity = tablerandom(StadiumCitiesTb)
		ID = eCity:GetID()
		save (player, "Clasico City", ID)
		CityName = Locale.ConvertTextKey(eCity:GetName());
		-- Create Description	
		Events_PG_RiodelaPlata_Clasico.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_DESC", CityName)
	return true
end
)

Events_PG_RiodelaPlata_Clasico.Outcomes = {}
-- Outcome:
-- · Resistance in the city
-- · WLTKD in the city
-- · Random notification for winner
-------------------------------------
	Events_PG_RiodelaPlata_Clasico.Outcomes[1]			= {}
	Events_PG_RiodelaPlata_Clasico.Outcomes[1].Name		= "TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_OUTCOME_1"
	Events_PG_RiodelaPlata_Clasico.Outcomes[1].Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_OUTCOME_RESULT_1"
	Events_PG_RiodelaPlata_Clasico.Outcomes[1].Weight	= 10

	Events_PG_RiodelaPlata_Clasico.Outcomes[1].CanFunc = (
	function (player)
		
		return true
	end
	)

	Events_PG_RiodelaPlata_Clasico.Outcomes[1].DoFunc = (
	function (player)
		-- load
		cityID = load(player, "Clasico City")
		city = player:GetCityByID(cityID);
				-- Add turns of WLTKD
		local wltkd = math.ceil((WLTKDTurns) * iMod)
		city:ChangeWeLoveTheKingDayCounter(wltkd)
		-- Add a turn of resistance
		city:ChangeResistanceTurns(LoserResistanceTurns)

		-- Get random result
		CityName = Locale.ConvertTextKey(city:GetName());
		local iWinner = math.random(1, 2)
		if iWinner == 1 then
			JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_OUTCOME_RESULT_1_NOTIFICATION", CityName))
		else
			JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_CLASICO_OUTCOME_RESULT_2_NOTIFICATION", CityName))
		end
	end
	)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PG_RIODELAPLATA"], "Events_PG_RiodelaPlata_Clasico", Events_PG_RiodelaPlata_Clasico)

--=================================================================================================================
--=================================================================================================================
-- Logia Lautaro
---------------------------
local	Events_PG_RiodelaPlata_LogiaLautaro = {}
		Events_PG_RiodelaPlata_LogiaLautaro.Name		= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO"
		Events_PG_RiodelaPlata_LogiaLautaro.Desc		= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_DESC"
		Events_PG_RiodelaPlata_LogiaLautaro.Weight = 2

-- Conditions:
-- · Must have discovered Civil Service
-- · Must not be at war
-- · Can't have happened before
--------------------------
Events_PG_RiodelaPlata_LogiaLautaro.CanFunc = (
function(player)
	-- Check civ
	if player:GetCivilizationType() ~= civilizationID then return false end
	-- fired before?
	if load(player, "Events_PG_RiodelaPlata_LogiaLautaro_Fired") == true then return false end 
	-- Has Tech?
	local team = player:GetTeam();
	if not (Teams[team]:IsHasTech(CongresoTucumanPrereqTech)) then return false end
	-- Is War?
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
	if isWar ~= 0 then return false end
	return true
end
)

Events_PG_RiodelaPlata_LogiaLautaro.Outcomes = {}
-- Outcome 1
-- Found the Logia:
-- · Gets Logia Policy
-- · Gets Free Policy
---------------------------
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1]			= {}
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1].Name	= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_1"
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1].Desc	= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_RESULT_1"
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1].Weight	= 10

	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1].CanFunc = (
	function(player)
		return true
	end
	)

	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[1].DoFunc = (
	function(player)
		-- Grant Policy
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(LogiaID, true);
		-- Give Free Policy
		player:ChangeNumFreePolicies(1)
		-- Save
		save (player, "Events_PG_RiodelaPlata_LogiaLautaro_Fired", true)
		-- Alert the World
		JFD_SendWorldEvent(player, Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_RESULT_1_NOTIFICATION"))
	end
	)


-- Outcome 2
-- Dismiss the Logia:
-- · Gets the No Logia Policy
-- · Gets Denounced from member players if they exist
---------------------------
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2]			= {}
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].Name	= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_2"
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].Desc	= "TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_RESULT_2"
	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].Weight	= 0

	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].CanFunc = (
	function(player)
		-- Check members!
		iNumMembers = 0;
		for _, iPlayer in pairs(Players) do
			if (iPlayer:IsAlive()) then
				if iPlayer:GetCivilizationType() == ChileID or iPlayer:GetCivilizationType() == NewChileID or iPlayer:GetCivilizationType() == ColombiaID or iPlayer:GetCivilizationType() == newColombiaID then
				iNumMembers = iNumMembers + 1
				end
			end
		end
		if iNumMembers > 0 then
			Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_PG_RIOPLATA_LOGIALAUTARO_OUTCOME_RESULT_2_CIVS")
		end
		return true
	end
	)

	Events_PG_RiodelaPlata_LogiaLautaro.Outcomes[2].DoFunc = (
	function(player)
		-- Check members!
		iNumMembers = 0;
		for _, iPlayer in pairs(Players) do
			if (iPlayer:IsAlive()) then
				if iPlayer:GetCivilizationType() == ChileID or iPlayer:GetCivilizationType() == NewChileID or iPlayer:GetCivilizationType() == ColombiaID or iPlayer:GetCivilizationType() == newColombiaID then
				iNumMembers = iNumMembers + 1
				iPlayer:DoForceDenounce(player)
				end
			end
		end
		-- Grant Policy
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(NoLogiaID, true);
		-- Save
		save (player, "Events_PG_RiodelaPlata_LogiaLautaro_Fired", true)
	end
	)

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_PG_RIODELAPLATA"], "Events_PG_RiodelaPlata_LogiaLautaro", Events_PG_RiodelaPlata_LogiaLautaro)
