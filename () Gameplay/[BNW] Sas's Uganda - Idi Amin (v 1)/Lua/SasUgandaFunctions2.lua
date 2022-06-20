function Sas_RSR_PlayerDoTurn(playerID)
    local player = Players[playerID]
    for unit in player:Units() do
        if unit:GetUnitType() == GameInfoTypes["UNIT_SAS_RSR"] then
            for numCS = 0, 5 - 1 do    
                local promoID = GameInfoTypes["PROMOTION_SAS_RSR_" .. numCS]
                unit:SetHasPromotion(promoID, false)
            end
            local numDenounce = 0
            for otherPlayerID = 0, 64 - 1 do
                local otherPlayer = Players[otherPlayerID]
                if otherPlayer:IsAlive() then
                    if otherPlayer:IsDenouncedPlayer(playerID) then
                        numDenounce = numDenounce + 1
                        if numDenounce >= 5 then break end
                    end
                end
            end
            local promoID = GameInfoTypes["PROMOTION_SAS_RSR_" .. numDenounce]
            unit:SetHasPromotion(promoID, true)
        end
    end
end
GameEvents.PlayerDoTurn.Add(Sas_RSR_PlayerDoTurn)

function Sas_Uganda_DeclareWar(teamID, otherTeamID)
    local team = Teams[teamID]
    local playerID = team:GetLeaderID()
    local player = Players[playerID]
    local oTeam = Teams[otherTeamID]
    local otherPlayerID = oTeam:GetLeaderID()
    if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_SAS_UGANDA"] then
        if player:IsDoF(otherPlayerID) then
            for city in player:Cities() do
                city:HurryProduction(1)
            end
        else
            local playerCap = player:GetCapitalCity()
            if playerCap then
                playerCap:HurryProduction(1)
            end
        end
    end
end
GameEvents.DeclareWar.Add(Sas_Uganda_DeclareWar)

