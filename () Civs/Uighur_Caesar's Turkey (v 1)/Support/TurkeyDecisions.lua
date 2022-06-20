-- Lua Script1
-- Author: pedro
-- DateCreated: 08/18/16 10:11:09 PM
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Turkey Script
--------------------------------------------------------------------------------------------------------------------------
local turkeyID = GameInfoTypes["CIVILIZATION_UC_TURKEY"]
local turkeyScript = GameInfoTypes["POLICY_UC_TURKEY_SCRIPT"]

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

local Decisions_TurkeyScript = {}
	Decisions_TurkeyScript.Name = "TXT_KEY_DECISIONS_UC_TURKEY_SCRIPT"
	Decisions_TurkeyScript.Desc = "TXT_KEY_DECISIONS_UC_TURKEY_SCRIPT_DESC"
	HookDecisionCivilizationIcon(Decisions_TurkeyScript, "CIVILIZATION_UC_TURKEY")
	Decisions_TurkeyScript.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= turkeyID then return false, false end
		if load(player, "Decisions_TurkeyScript") == true then
			Decisions_TurkeyScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_TURKEY_SCRIPT_ENACTED_DESC")
			return false, false, true
		end
		
		
		
		Decisions_TurkeyScript.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_UC_TURKEY_SCRIPT_DESC")
		if player:GetNumResourceAvailable(iMagistrate, false) <	1	then return true, false end	
		if player:GetGold() < 500 								then return true, false end
		if (player:GetCurrentEra() < GameInfoTypes.ERA_INDUSTRIAL) then return true, false end
		local tCSFriendly = {}
		Decisions_TurkeyScript.Data1 = nil
		for iLPlayer, pLPlayer in pairs(Players) do
			if pLPlayer:IsEverAlive() then
				if (pLPlayer:IsAlive() and (player:IsDoF(pLPlayer:GetID()))) then
					table.insert(tCSFriendly, iLPlayer)
				end
			end
		end
		if #tCSFriendly < 1 then
			print("No Friendlies")
			return true, false
		end
		Decisions_TurkeyScript.Data1 = Players[tCSFriendly[GetRandom(1, #tCSFriendly)]]

		return true, true
	end
	)
		
	
	Decisions_TurkeyScript.DoFunc = (
	function(player, otherPlayer)
		player:ChangeGold(-500)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(turkeyScript, true)
		local science = otherPlayer:GetScience()
		local pTeamTechs = Teams[player:GetTeam()]:GetTeamTechs()
			pTeamTechs:ChangeResearchProgress(player:GetCurrentResearch(), science * 2, player:GetID())
		save(player, "Decisions_TurkeyScript", true)
	end
	)
	
Decisions_AddCivilisationSpecific(turkeyID, "Decisions_TurkeyScript", Decisions_TurkeyScript)
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Turkey: Laws
--------------------------------------------------------------------------------------------------------------------------
local techTheologyID = GameInfoTypes["TECH_SCIENTIFIC_THEORY"]
local TurkeyLawsID = GameInfoTypes["POLICY_TURKEY_LAWS"]

local Decisions_TurkeyLaws = {}
	Decisions_TurkeyLaws.Name = "TXT_KEY_DECISIONS_TURKEY_LAWS"
	Decisions_TurkeyLaws.Desc = "TXT_KEY_DECISIONS_TURKEY_LAWS_DESC"
	HookDecisionCivilizationIcon(Decisions_TurkeyLaws, "CIVILIZATION_UC_TURKEY")
	Decisions_TurkeyLaws.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_UC_TURKEY"] then return false, false end
		if load(player, "Decisions_TurkeyLaws") == true then
			Decisions_TurkeyLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TURKEY_LAWS_ENACTED_DESC")
			return false, false, true
		end
		
		Decisions_TurkeyLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TURKEY_LAWS_DESC")
		local goldCost = 800 *iMod
		Decisions_TurkeyLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TURKEY_LAWS_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 2	then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techTheologyID))	then return true, false end		
		if player:GetGold() < goldCost then return true, false end
				
		return true, true
	end
	)
		
	
Decisions_TurkeyLaws.DoFunc = (
    function(player)
        player:ChangeNumResourceTotal(iMagistrate, -2)
        local goldCost = 800 * iMod
        player:ChangeGold(-goldCost)
        player:SetNumFreePolicies(1)
        player:SetNumFreePolicies(0)
        player:SetHasPolicy(TurkeyLawsID, true)
		local cultureReward = 0
		local scienceReward = 0
			for policy in GameInfo.Policies("PolicyBranchType = 'POLICY_BRANCH_PIETY'") do
				if player:HasPolicy(policy.ID) then
					scienceReward = scienceReward + math.ceil(150*iMod)
					cultureReward = cultureReward + math.ceil(150*iMod)
					player:SetHasPolicy(policy.ID, false)
				player:ChangeJONSCulture(cultureReward)
				local pTeamTechs = Teams[player:GetTeam()]:GetTeamTechs()
				pTeamTechs:ChangeResearchProgress(player:GetCurrentResearch(), scienceReward, player:GetID())					
				end
			end
        save(player, "Decisions_TurkeyLaws", true)
    end
    )
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_UC_TURKEY, "Decisions_TurkeyLaws", Decisions_TurkeyLaws)
