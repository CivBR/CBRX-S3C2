print("Russel Crowe")

include("FLuaVector.lua")
local SwissID = GameInfoTypes.CIVILIZATION_AUSTRALIA_LS_MOD;
local PSpikeman = GameInfoTypes.UNIT_LS_WAMARR;
local Cosmetic = {}

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == SwissID then
			include("RC Civ Related")
			break;
		end
	end
end

GameEvents.UnitSetXY.Add(function(player, unit, x, y)
	local cUnit = Players[player]:GetUnitByID(unit);
	if cUnit then
		if cUnit:GetUnitType() == PSpikeman then
			if Cosmetic[cUnit] then
				if cUnit:GetMoves() == 0 then
					if math.random(1, 4) == 3 then
						cUnit:SetMoves(60);
						if player == Game.GetActivePlayer() then
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2( x, y))), "+1[ICON_MOVES]", 0)
							Events.SerialEventUnitInfoDirty()
						end
					end
				end
			else
				Cosmetic[cUnit] = 1;
			end
		end
	end
end)

function InputHandler( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyDown then
        if wParam == Keys.VK_ESCAPE or wParam == Keys.VK_RETURN then
            OnCloseButtonClicked();
            return true;
        end
    end
end
ContextPtr:SetInputHandler( InputHandler );

ContextPtr:SetHide(true);


























































































































function HelpFunctionAtF(playerID)
	if playerID == Game.GetActivePlayer() then
		Events.AudioPlay2DSound("AS2D_LEADER_MUSIC_AUSTRALIA_LS_MOD_RUSSEL_CROWE_AMBIENCE")
		local iCity = Players[playerID]:GetCapitalCity();
		if iCity then
			Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), Locale.Lookup("TXT_KEY_RESOURCE_AUS_LS_EXTRA_WONDERFUL_TEXT"), 0)
		end
	end
end
local table = os.date("*t")
if table.month == 4 and table.day == 1 then
	GameEvents.PlayerDoTurn.Add(HelpFunctionAtF)
end