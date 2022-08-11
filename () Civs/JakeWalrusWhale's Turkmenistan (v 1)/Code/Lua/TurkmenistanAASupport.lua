--===========================================================================
-- GLOBALS
--===========================================================================
include("AdditionalAchievementsUtility");

local iTurkmenistan = GameInfoTypes["CIVILIZATION_JWW_TURKMENISTAN"]
--===========================================================================
-- #1 Ashgabat Times Bestseller (As Turkmenistan, get the "Ruhnama" Great Work of Writing)
--===========================================================================
tGreatWorksOfWritingBuildings = {}
for row in DB.Query("SELECT BuildingClass FROM Buildings WHERE GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'") do
   tGreatWorksOfWritingBuildings[row.BuildingClass] = {}
end

function JWW_RuhnamaCeption(iPlayer) --checks for Great Work every turn
	local pPlayer = Players[iPlayer]
	if pPlayer:IsHuman() and pPlayer:IsAlive() and (pPlayer:GetCivilizationType() == iTurkmenistan) then
		for pCity in pPlayer:Cities() do
			for k, v in pairs(tGreatWorksOfWritingBuildings) do
				if pCity:IsHoldingGreatWork(GameInfoTypes[k]) then
					for i = 0, pCity:GetNumGreatWorkSlots() - 1 do
						if Game.GetGreatWorkType(pCity:GetBuildingGreatWork(GameInfoTypes[k], i)) == GameInfoTypes["GREAT_WORK_JWW_RUHNAMA"] then
							UnlockAA('AA_JWW_TURKMENISTAN_SPECIAL')
						end
					end
				end
			end
		end
	end
end

if not IsAAUnlocked('AA_JWW_TURKMENISTAN_SPECIAL') then
    GameEvents.PlayerDoTurn.Add(JWW_RuhnamaCeption)
end