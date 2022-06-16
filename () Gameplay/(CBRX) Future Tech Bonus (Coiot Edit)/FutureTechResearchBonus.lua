include("UnitSpawnHandler.lua")

local tUnits = {}
tUnits[GameInfoTypes["UNIT_FW_RAILGUN_TANK"]] = true
tUnits[GameInfoTypes["UNIT_FW_MECH_ARTILLERY"]] = true
tUnits[GameInfoTypes["UNIT_FW_HOVERTANK"]] = true
tUnits[GameInfoTypes["UNIT_XCOM_SQUAD"]] = true
tUnits[GameInfoTypes["UNIT_FW_BATTLESUIT"]] = true

local techFutureID = GameInfo.Technologies["TECH_FUTURE_TECH"].ID

function unitSpawner(iTeam, iTech, iChange)
	if iTech ~= techFutureID then return end

	for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if pPlayer then
			if (Teams[pPlayer:GetTeam()] == iTeam) then

				local city = pPlayer:GetCapitalCity()

				local iVar = 0
				local tRand = {}
				for k, v in pairs(tUnits) do
					iVar = iVar + 1
					tRand[iVar] = k
				end

				local iRand = Game.Rand(#tRand, "Beans")
				local pUnit = tRand[iRand]
				pPlayer:InitUnit(pUnit, city:GetX(), city:GetY())
				pPlayer:InitUnit(pUnit, city:GetX(), city:GetY())
				pPlayer:InitUnit(pUnit, city:GetX(), city:GetY())
			end
		end
	end
end
GameEvents.TeamTechResearched.Add(unitSpawner)
--print("Future Tech Research Bonus Initialized")



