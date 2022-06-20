include("AdditionalAchievementsUtility");

--===========================================================================
-- GLOBALS
--===========================================================================
local iTimorLeste = GameInfoTypes["CIVILIZATION_JWW_TIMOR-LESTE"]
local iIndonesia = GameInfoTypes["CIVILIZATION_INDONESIA"]
--===========================================================================
-- Oh, How the Turn Tables Turn (As Timor-Leste, take Indonesia's capital)
--===========================================================================


function JWW_TurnTables(iPlayer)
	local pPlayer = Players[iPlayer]
	if pPlayer:IsHuman() and pPlayer:GetCivilizationType() == iTimorLeste then
		for pCity in pPlayer:Cities() do
			local pOtherPlayer = Players[pCity:GetPreviousOwner()]
			if pOtherPlayer and pOtherPlayer:GetCivilizationType() == iIndonesia then
				if pCity:IsOriginalMajorCapital() then
					UnlockAA('AA_JWW_TIMOR-LESTE_SPECIAL')
				end
			end
		end
	end
end

if not IsAAUnlocked('AA_JWW_TIMOR-LESTE_SPECIAL') then
	GameEvents.PlayerDoTurn.Add(JWW_TurnTables);
end