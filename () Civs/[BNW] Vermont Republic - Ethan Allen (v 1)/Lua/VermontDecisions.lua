-- Lua Script1
-- Author: pedro
-- DateCreated: 11/19/18 5:28:48 PM
--------------------------------------------------------------

--g_JFD_GlobalUserSettings_Table
local g_JFD_GlobalUserSettings_Table = {}
for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings;") do 	
	g_JFD_GlobalUserSettings_Table[row.Type] = row.Value
end

--Game_GetUserSetting
function Game_GetUserSetting(type)
	return g_JFD_GlobalUserSettings_Table[type]
end
local userSettingRTPPietyCore = (Game_GetUserSetting("JFD_RTP_PIETY_CORE") == 1)

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Titanic
--------------------------------------------------------------------------------------------------------------------------
local ulsterID = GameInfoTypes["CIVILIZATION_SAS_VERMONT"]
local bookID = GameInfoTypes["POLICY_SAS_VSCIENCE"]
local techTheologyID = GameInfoTypes["TECH_PRINTING_PRESS"]

local Decisions_VermontBook = {}
	Decisions_VermontBook.Name = "TXT_KEY_DECISIONS_VERMONT_BOOK"
	Decisions_VermontBook.Desc = "TXT_KEY_DECISIONS_VERMONT_BOOK_DESC"
	HookDecisionCivilizationIcon(Decisions_VermontBook, "CIVILIZATION_SAS_VERMONT")
	Decisions_VermontBook.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= ulsterID then return false, false end
		if load(player, "Decisions_VermontBook") == true then
			Decisions_VermontBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VERMONT_BOOK_ENACTED_DESC")
			return false, false, true
		end

		Decisions_VermontBook.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VERMONT_BOOK_DESC")
		if (player:GetNumResourceAvailable(iMagistrate) < 1) then return true, false end
		if player:GetFaith() < 400 then return true, false end
		if player:GetGold() < 400 then return true, false end
		local religionID = player:GetReligionCreatedByPlayer() or player:GetCapitalCity():GetReligiousMajority()
		if userSettingRTPPietyCore then religionID = pPlayer:GetStateReligion() end
		if religionID == -1 then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		return true, true
	end	
	)
		
	
	Decisions_VermontBook.DoFunc = (
	function(player)		
	    player:ChangeGold(-400)
		player:ChangeFaith(-400)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_SAS_FREEWRITER, 1)
		local capitalX = player:GetCapitalCity():GetX()
		local capitalY = player:GetCapitalCity():GetY()
		local unitOne = player:InitUnit(GameInfoTypes.UNIT_SAS_VWRITER, capitalX, capitalY)
		unitOne:JumpToNearestValidPlot()
		save(player, "Decisions_VermontBook", true)
	end
	)
	
Decisions_AddCivilisationSpecific(ulsterID, "Decisions_VermontBook", Decisions_VermontBook)
	
local slaveryID = GameInfoTypes["POLICY_SAS_THANKYOUSLAVES"]

local Decisions_VermontSlavery = {}
	Decisions_VermontSlavery.Name = "TXT_KEY_DECISIONS_VERMONT_SLAVERY"
	Decisions_VermontSlavery.Desc = "TXT_KEY_DECISIONS_VERMONT_SLAVERY_DESC"
	Decisions_VermontSlavery.Data1 = nil
	HookDecisionCivilizationIcon(Decisions_VermontSlavery, "CIVILIZATION_SAS_VERMONT")
	Decisions_VermontSlavery.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_SAS_VERMONT then return false, false end		
		if load(pPlayer, "Decisions_CodeOfLaws") ~= true then return false, false end
		
		if load(pPlayer, "Decisions_VermontSlavery") == true  then
			Decisions_VermontSlavery.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VERMONT_SLAVERY_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_VermontSlavery.Data1 = nil
		for pCity in pPlayer:Cities() do
		if pCity:IsCapital() then
			--Worker Check
			local pPlot = pCity:Plot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_WORKER) or (GameInfoTypes.UNITCLASS_JFD_WORKER and pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_JFD_WORKER) then
					Decisions_VermontSlavery.Data1 = pUnit
					end
				end
			end
		end
		
		local iGold = 0
		local iCulture = 0
		
		local numWorkers = 0
		for pCity in pPlayer:Cities() do
			--Worker Check
			local pPlot = pCity:Plot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_WORKER) or (GameInfoTypes.UNITCLASS_JFD_WORKER and pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_JFD_WORKER) then
					numWorkers = numWorkers + 1
				end
			end
		end
		iCulture = numWorkers * pPlayer:GetTotalJONSCulturePerTurn()
		iGold = numWorkers * 310
		
		Decisions_VermontSlavery.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_VERMONT_SLAVERY_DESC", iCulture, iGold)
		
		if pPlayer:GetGold() < iGold then return true, false end
		if not(Decisions_VermontSlavery.Data1) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate) < 2) then return true, false end
		
		
		
		return true, true
	end
	)
	
	Decisions_VermontSlavery.DoFunc = (
	function(pPlayer, pUnit)
		local numWorkers = 0
		for pCity in pPlayer:Cities() do
			--Worker Check
			local pPlot = pCity:Plot()
			local iNumUnits = pPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local pUnit = pPlot:GetUnit(iVal)
				if (pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_WORKER) or (GameInfoTypes.UNITCLASS_JFD_WORKER and pUnit:GetUnitClassType() == GameInfoTypes.UNITCLASS_JFD_WORKER) then
					numWorkers = numWorkers + 1
					pUnit:Kill()
				end
			end
		end
		pPlayer:ChangeGold(-numWorkers * 310)
		pPlayer:ChangeJONSCulture(numWorkers * pPlayer:GetTotalJONSCulturePerTurn())
		pPlayer:ChangeGoldenAgeProgressMeter(numWorkers * 100)
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_SAS_THANKYOUSLAVES, 1)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeAnarchyNumTurns(2)
		save(pPlayer, "Decisions_VermontSlavery", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_SAS_VERMONT, "Decisions_VermontSlavery", Decisions_VermontSlavery)
