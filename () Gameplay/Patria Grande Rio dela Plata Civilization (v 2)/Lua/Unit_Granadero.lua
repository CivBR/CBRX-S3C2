--================================================================================================================
-- Granaderos Abilities scripts
--================================================================================================================
-- Utilities
---------------------------

print ("Granaderos Scripts LOADED");

---------------------------
-- Variables
---------------------------

local Promo01			= GameInfoTypes.PROMOTION_PG_GRANADEROS_PRE;
local Promo02			= GameInfoTypes.PROMOTION_PG_GRANADEROS_ON;
local Promo03			= GameInfoTypes.PROMOTION_PG_GRANADEROS_OFF;
local PromoXPBonus		= 10;
local MaxHealthHealPerc	= 11;

--=================================================================================================================
--=================================================================================================================
-- Grant XP Script
---------------------------

function GrantXP(iPlayer, iUnit)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:IsHasPromotion(Promo01)) then
				local CurrXP = pUnit:GetExperience();
				local XPbonus = (CurrXP + PromoXPBonus);
				pUnit:SetExperience(XPbonus)
				pUnit:SetHasPromotion(Promo02,true);
				pUnit:SetHasPromotion(Promo01,false);
			end
		end
	end
end

--Events.SerialEventUnitCreated.Add(GrantXP)

----------------------------
-- Heal on 10 HP
----------------------------

function OneTimeHeal(iPlayer, iUnit)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:IsHasPromotion(Promo02)) then
				if ((pUnit:GetCurrHitPoints()/pUnit:GetMaxHitPoints())*100 < MaxHealthHealPerc) then
					pUnit:SetHasPromotion(Promo03,true);
					pUnit:SetHasPromotion(Promo02,false);
					pUnit:SetDamage(0)
					if (pPlayer:IsHuman()) then
						iUnitName = Locale.ConvertTextKey(pUnit:GetName());
						local alert = Locale.ConvertTextKey("TXT_KEY_PROMOTION_PG_GRANADEROS_ACTIVATION", iUnitName);
						Events.GameplayAlertMessage(alert)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(OneTimeHeal)
