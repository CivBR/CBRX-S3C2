-- Cooperative_DTP
-- C15_Co-op_DTP
-- Author: Chrisy15
-- DateCreated: 11-Sep-16 23:32:32
--------------------------------------------------------------

print("DTP Lua added")

local factoryID = GameInfoTypes["BUILDING_COOPERATIVE"]
local PercentOfProductionIntoCulture = 10
local production = GameInfoTypes.YIELD_PRODUCTION
local allendeChile = GameInfoTypes["CIVILIZATION_CHILE_ALLENDE"]

function C15_GetCulture(playerID)
	--print("Firing DTP")
	local player = Players[playerID]
	local givenCulture = 0
	for city in player:Cities() do
		if (city:IsHasBuilding(factoryID)) then
			--local givenCulture = math.ceil(city:GetBaseYieldRate(GameInfoTypes.YIELD_PRODUCTION)*(PercentOfProductionIntoCulture/100))
			--givenCulture = givenCulture + math.ceil(city:GetProduction() * (PercentOfProductionIntoCulture / 100))
			--player:ChangeJONSCulture(givenCulture)
			--print("givenCulture = ", givenCulture)
			givenCulture = givenCulture + math.floor(city:GetYieldRate(production) * (PercentOfProductionIntoCulture / 100))
		end
	end
	--print("givenCulture = ", givenCulture)
	return givenCulture
end