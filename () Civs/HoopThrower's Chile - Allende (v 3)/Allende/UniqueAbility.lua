-- UniqueAbility
-- Author: LeeS
-- DateCreated: 7/21/2016 3:20:49 AM
--------------------------------------------------------------

local iAllendeCiv = GameInfoTypes.CIVILIZATION_CHILE_ALLENDE
local tPolicyBranchEraConditions = {
	[GameInfoTypes.POLICY_BRANCH_PATRONAGE] = { DefaultRequirement=GameInfoTypes.ERA_CLASSICAL, AllendeRequirement=GameInfoTypes.ERA_ANCIENT },
	[GameInfoTypes.POLICY_BRANCH_AESTHETICS] = { DefaultRequirement=GameInfoTypes.ERA_CLASSICAL, AllendeRequirement=GameInfoTypes.ERA_ANCIENT },
	[GameInfoTypes.POLICY_BRANCH_COMMERCE] = { DefaultRequirement=GameInfoTypes.ERA_MEDIEVAL, AllendeRequirement=GameInfoTypes.ERA_ANCIENT },
	[GameInfoTypes.POLICY_BRANCH_EXPLORATION] = { DefaultRequirement=GameInfoTypes.ERA_MEDIEVAL, AllendeRequirement=GameInfoTypes.ERA_ANCIENT },
	[GameInfoTypes.POLICY_BRANCH_RATIONALISM] = { DefaultRequirement=GameInfoTypes.ERA_RENAISSANCE, AllendeRequirement=GameInfoTypes.ERA_ANCIENT }
}

-------------------------------------------------------
-- REDIRECTS WHEN ENLIGHTENMENT ERA IS ACTIVE
-------------------------------------------------------
for row in GameInfo.Eras("Type='ERA_ENLIGHTENMENT'") do
	for row in GameInfo.Policy_BuildingClassHappiness("BuildingClassType='BUILDINGCLASS_EE_DRYDOCK'") do
		print("Enlightenment Era Active, and the Enlightenment_Policies.xml file has actually been activated: redirecting data in table tPolicyBranchEraConditions")
		tPolicyBranchEraConditions[GameInfoTypes.POLICY_BRANCH_EXPLORATION] = { DefaultRequirement=GameInfoTypes.ERA_RENAISSANCE, AllendeRequirement=GameInfoTypes.ERA_ANCIENT }
		tPolicyBranchEraConditions[GameInfoTypes.POLICY_BRANCH_RATIONALISM] = { DefaultRequirement=GameInfoTypes.ERA_ENLIGHTENMENT, AllendeRequirement=GameInfoTypes.ERA_ANCIENT }
	end
end
-------------------------------------------------------
-- REDIRECTS WHEN JFD PIETY IS ACTIVE
-------------------------------------------------------
for row in GameInfo.Processes("Type='PROCESS_JFD_PIETY'") do
	local tTempTable = {}
	for row in DB.Query("SELECT Type, Value FROM JFD_GlobalUserSettings WHERE Type = 'JFD_RTP_PIETY_POLICY_CHANGES' OR Type = 'JFD_RTP_COMMUNITY_BALANCE_PATCH'") do
		tTempTable[row.Type] = row.Value
	end
	if (tTempTable.JFD_RTP_COMMUNITY_BALANCE_PATCH and (tTempTable.JFD_RTP_COMMUNITY_BALANCE_PATCH == 0)) and (tTempTable.JFD_RTP_PIETY_POLICY_CHANGES and (tTempTable.JFD_RTP_PIETY_POLICY_CHANGES == 1)) then
		print("JFD's Piety Active, redirecting data in table tPolicyBranchEraConditions")
		tPolicyBranchEraConditions[GameInfoTypes.POLICY_BRANCH_PIETY] = { DefaultRequirement=GameInfoTypes.ERA_CLASSICAL, AllendeRequirement=GameInfoTypes.ERA_ANCIENT }
	end
end

function AllendePolicyBranchAffects(iPlayer, iPolicyBranch)
	if tPolicyBranchEraConditions[iPolicyBranch] then
		--print("AllendePolicyBranchAffects fired for values iPlayer " .. iPlayer .. ", iPolicyBranch " .. iPolicyBranch)
		local pPlayer = Players[iPlayer]
		local iCurrentEra = pPlayer:GetCurrentEra()
		if pPlayer:GetCivilizationType() == iAllendeCiv then
			--print("iPlayer was evaluated as Allende player and the result for the policy branch was " .. tostring(iCurrentEra >= tPolicyBranchEraConditions[iPolicyBranch]["AllendeRequirement"]))
			return (iCurrentEra >= tPolicyBranchEraConditions[iPolicyBranch]["AllendeRequirement"])
		else
			--print("iPlayer was evaluated as being someone besides Allende and the result for the policy branch was " .. tostring(iCurrentEra >= tPolicyBranchEraConditions[iPolicyBranch]["DefaultRequirement"]))
			return (iCurrentEra >= tPolicyBranchEraConditions[iPolicyBranch]["DefaultRequirement"])
		end
	end
	return true
end
GameEvents.PlayerCanAdoptPolicyBranch.Add(AllendePolicyBranchAffects)





print("UniqueAbility lua loaded to the end")