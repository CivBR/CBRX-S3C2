-- HolyGold
-- Author: Tomatekh
-- DateCreated: 7/2/2013 3:12:43 PM
--------------------------------------------------------------
--print("This is the 'Muisca Holy Gold' mod script.")

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "MuiscaFaithFromGold";


local eRen = GameInfoTypes.ERA_RENAISSANCE;


function GrantMuiscaFaith(pPlayer, HolyGold)
	local pTeam = pPlayer:GetTeam();
	if (Teams[pTeam]:GetCurrentEra() < eRen) then	
		rFaith = math.floor(HolyGold)
	else
		rFaith = 0
	end
	for pCity in pPlayer:Cities() do
		if (pCity:IsCapital()) then
			CityID = pCity:GetID()
			pPlot = pCity:Plot()
			iOldFaith = load ( pPlot, "" .. CityID .. "MuiscaFaithFromGold")
			save( pPlot, "" .. CityID .. "MuiscaFaithFromGold", rFaith)
			if iOldFaith == nil then
				Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, rFaith)
			else
				Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, rFaith - iOldFaith)
        		end
		end
	end
end

function MuiscaGetGold(pPlayer)
	print ("MuiscaGetsGoldFaith!")
	local ReserveGold = pPlayer:GetGold();
	local HolyGold = (ReserveGold / 125)
	GrantMuiscaFaith(pPlayer, HolyGold)
end

--Scripts fire for this civilization

function MuiscaHolyGold(iPlayer)
	local pPlayer = Players[iPlayer];
	if pPlayer:IsAlive() then
		if (pPlayer:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MUISCA"]) then
			MuiscaGetGold(pPlayer)
		end
	end
end



GameEvents.PlayerDoTurn.Add(MuiscaHolyGold)


-- If the city is conquered we must remove the gold somehow:


function OnCityCaptureComplete(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
	local pCity = Map.GetPlot(iCityX, iCityY):GetPlotCity()
	CityID = pCity:GetID()
	pPlot = pCity:Plot()
	iOldFaith = load ( pPlot, "" .. CityID .. "MuiscaFaithFromGold")
	local rFaith = 0
	save( pPlot, "" .. CityID .. "MuiscaFaithFromGold", rFaith)
	if iOldFaith == nil then
		Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, rFaith)
	else
		Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), GameInfoTypes.YIELD_FAITH, rFaith - iOldFaith)
        end
end

GameEvents.CityCaptureComplete.Add(OnCityCaptureComplete)





----------------------------
-- Elite Promotion Script
-- Author: Leugi
------------------------
local ElitePromo = GameInfoTypes.PROMOTION_ELITE;
local EliteDone = GameInfoTypes.PROMOTION_ELITE_CONSUMED;
local EliteXP = 15;

function Elitism(iPlayer, iUnit)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:IsHasPromotion(ElitePromo)) then
				local CurrXP = pUnit:GetExperience();
				local XPbonus = (CurrXP + EliteXP);
				pUnit:SetExperience(XPbonus)
				pUnit:SetHasPromotion(EliteDone,true);
				pUnit:SetHasPromotion(ElitePromo,false);
			end
		end
	end
end


Events.SerialEventUnitCreated.Add(Elitism)