-- Lua Script1
-- Author: DivineYuri
-- DateCreated: 7/22/2016 12:17:43 AM
--------------------------------------------------------------


print("Co-op Lua loaded")

local factoryID = GameInfoTypes["BUILDING_COOPERATIVE"]
local PercentOfProductionIntoCulture = 10
production = GameInfoTypes.YIELD_PRODUCTION
local allendeChile = GameInfoTypes["CIVILIZATION_CHILE_ALLENDE"]

function HT_FactoryProductionToCulture(playerID)
    local player = Players[playerID]
    if ( player:IsAlive() and player:GetCivilizationType() == allendeChile ) then
		--local givenCulture = C15_GetCulture(playerID)
		local givenCulture = 0
		for city in player:Cities() do
			if (city:IsHasBuilding(factoryID)) then
				givenCulture = givenCulture + math.floor(city:GetYieldRate(production) * (PercentOfProductionIntoCulture / 100))
			end
		end
		if givenCulture > 0 then
			player:ChangeJONSCulture(givenCulture)
			if player:IsHuman() then
				Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_HOOP_CULTURE_FROM_PROD", givenCulture))
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(HT_FactoryProductionToCulture)