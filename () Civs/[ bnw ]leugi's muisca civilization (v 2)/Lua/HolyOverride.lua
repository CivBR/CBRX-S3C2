-- ProphetReplacer
-- Author: LastSword
-- DateCreated: 8/24/2013 2:56:18 PM
--------------------------------------------------------------
local sUnitType = "UNIT_PROPHET"
local iProphetID = GameInfo.Units.UNIT_PROPHET.ID
local iProphetOverride = GameInfo.Units.UNIT_XUEPRIEST.ID
local iProphetOverrideAI = GameInfo.Units.UNIT_XUEPRIEST_AI.ID
local iCivType = GameInfo.Civilizations["CIVILIZATION_MUISCA"].ID

function ProphetOverride(iPlayer, iUnit)
    local pPlayer = Players[iPlayer];
    if (pPlayer:IsEverAlive()) then
        if (pPlayer:GetCivilizationType() == iCivType) then
       	    if pPlayer:GetUnitByID(iUnit) ~= nil then
			pUnit = pPlayer:GetUnitByID(iUnit);
                if (pUnit:GetUnitType() == iProphetID) then
			Events.SerialEventUnitCreated.Remove(ProphetOverride)
			rNum = (Game.Rand(22, "Chyquy names"))
			nn = rNum + 1
			if nn < 10 then
				pUnit:SetName(Locale.ConvertTextKey("TXT_KEY_CHYQUY_0" .. nn));
			else
				pUnit:SetName(Locale.ConvertTextKey("TXT_KEY_CHYQUY_" .. nn));
			end
            if (pPlayer:IsHuman()) then 
				newUnit = pPlayer:InitUnit(iProphetOverride, pUnit:GetX(), pUnit:GetY())
			else
				newUnit = pPlayer:InitUnit(iProphetOverrideAI, pUnit:GetX(), pUnit:GetY())					
			end
			newUnit:Convert(pUnit);	
			Events.SerialEventUnitCreated.Add(ProphetOverride)
                end
            end
        end
    end
end

Events.SerialEventUnitCreated.Add(ProphetOverride)