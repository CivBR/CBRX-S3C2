include("FLuaVector.lua")

local IsSpinning = false;
local spamChance = 100;
local RandomText = {
"Aaaaaa!",
"I am gonna be sick!",
"Mercy! MERCY!",
"The Gods' wrath is upon us!",
"Who forgot to sacrifice firstborn?!?",
"The world is spinning!",
"What if our world is nothing more than pile of dust?",
"Best. Rollercoaster. Ever.",
"It's completely new point of view!",
"8 in Richter scale!",
"Is it me or the world?",
"Stop playing with us...",
"That's enough, we don't want such a leader!",
"Could you keep your hands off our fragile world?",
"Atlas, stop shaking it!",
"I sense great disturbance in Coriolis force!",
"That's great evidence that globe is plat!",
"That's great evidence that globe is round!",
"Stop acting like Keanu Reeves!",
"Great, my Kangaroo is now upside down.",
"I am sure it will help you build great empire...",
"My house have just collapsed, but our leader doesn't care..."
}
local tHelp = #RandomText;

if Players[Game.GetActivePlayer()]:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_AUSTRALIA_LS_MOD then
	ContextPtr:SetHide(true);
end

function SpamVoices()
	IsSpinning = false
	local delay = 0;
	local playerID = Game.GetActivePlayer();
	for iCity in Players[playerID]:Cities() do
		if math.random(1, 100) <= spamChance then
			spamChance = math.max(10, spamChance -3);
			local string = RandomText[math.random(1, tHelp)];
			if string then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iCity:GetX(),iCity:GetY()))), string, delay)
				delay = delay + 0.5;
			end
		end
	end
	for iUnit in Players[playerID]:Units() do
		if math.random(1, 100) <= spamChance then
			spamChance = math.max(10, spamChance -3);
			local string = RandomText[math.random(1, tHelp)];
			if string then
				Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(iUnit:GetX(),iUnit:GetY()))), string, delay)
				delay = delay + 0.5;
			end
		end
	end
end

function InputHandler( uiMsg, wParam, lParam )
     ----------------------------------------------------------------        
    -- Key Up Processing
    ----------------------------------------------------------------        
    if( uiMsg == KeyEvents.KeyUp )
    then
        if( wParam == Keys.VK_NUMPAD4 ) then
			Events.CameraStopRotatingCCW();
			if IsSpinning then
				SpamVoices()
			end
			return true;
        elseif( wParam == Keys.VK_NUMPAD6 )
        then
			if IsSpinning then
				SpamVoices()
			end
			Events.CameraStopRotatingCW();
			return true;
        end

    ----------------------------------------------------------------        
    -- Key Down Processing
    ----------------------------------------------------------------        
    elseif( uiMsg == KeyEvents.KeyDown ) and UIManager:GetControl()
    then
		if( wParam == Keys.VK_NUMPAD4 )  then
			Events.CameraStartRotatingCCW();
			IsSpinning = true;
			return true;
        elseif( wParam == Keys.VK_NUMPAD6 )
        then
			Events.CameraStartRotatingCW();
			IsSpinning = true;
			return true;			
		end
    end 
end
ContextPtr:SetInputHandler( InputHandler );