--================================================================================================================
-- Rio dela Plata Trait scripts
--================================================================================================================
-- Utilities
---------------------------

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Trait_RioPlata";
include("ChangePlayerResearchProgress");

print ("Rio dela Plata Trait Scripts LOADED");

---------------------------
-- Variables
---------------------------

iMod = ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].BuildPercent)/100)
local BaseBonus				= 4
local iCiv				= GameInfoTypes.CIVILIZATION_PG_RIODELAPLATA
local SpeedVar			= GameInfo.GameSpeeds[Game.GetGameSpeedType()]
local iGoldenAgeBonus	= GameInfoTypes.BUILDING_PG_RIODELAPLATA_GOLDENBONUS

--=================================================================================================================
--=================================================================================================================
-- Citizen Born Bonus
---------------------------

function GiveFocusBonus (iPlayer, iCity)
	focusType = iCity:GetFocusType();
	print("focusType")
	Bonus = BaseBonus * iMod
	------------------------
	if focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_PRODUCTION then
		-- PRODUCTION
		ProdperTurn = iCity:GetYieldRate(YieldTypes.YIELD_PRODUCTION);
		if ProdperTurn < 2 then
			ProdperTurn = 2
		elseif ProdperTurn > 10 then
			ProdperTurn = 10
		end
		ProdBonus = ProdperTurn * Bonus
		iCity:ChangeProduction(ProdBonus)
		BonusText = ("[COLOR_YIELD_FOOD]" .. ProdBonus .. " [ICON_PRODUCTION]Production[ENDCOLOR] for the city")
		--
	elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_GOLD then
		-- GOLD	
		GoldperTurn = iPlayer:CalculateGoldRate();
		if GoldperTurn < 5 then
			GoldperTurn = 5
		elseif GoldperTurn > 12 then
			GoldperTurn = 12
		end
		GoldBonus = GoldperTurn * Bonus
		iPlayer:ChangeGold(GoldBonus)
		BonusText = ("[COLOR_YIELD_GOLD]" .. GoldBonus .. " [ICON_GOLD]Gold[ENDCOLOR]")
		--
	elseif focusType == CityAIFocusTypes.CITY_AI_FOCUS_TYPE_SCIENCE then
		-- SCIENCE
		ResearchPerTurn = iPlayer:GetScience();
		if ResearchPerTurn == nil then
			ResearchPerTurn = 2
		elseif ResearchPerTurn < 2 then
			ResearchPerTurn = 2
		elseif ResearchPerTurn > 10 then
			ResearchperTurn = 10
		end
		ResearchBonus = ResearchPerTurn * Bonus
		ChangePlayerResearchProgress(iPlayer:GetID(), ResearchBonus, false)

		--teamID = iPlayer:GetTeam();
		--pTeam = Teams[teamID];
		--pTeamTechs = Teams[teamID]:GetTeamTechs();
		--iTech = iPlayer:GetCurrentResearch();
		--pTeamTechs:ChangeResearchProgress(iTech, ResearchBouns, iPlayer:GetID());
		BonusText = ("[COLOR_RESEARCH_STORED]" .. ResearchBonus .. " [ICON_RESEARCH]Science[ENDCOLOR]")
		--
	else
		-- CULTURE
		CultperTurn = iPlayer:GetTotalJONSCulturePerTurn()
		if CultperTurn < 2 then
			CultperTurn = 2
		elseif CultperTurn > 15 then
			CultperTurn = 15
		end
		CultBonus = CultperTurn * Bonus
		iPlayer:ChangeJONSCulture(CultBonus)
		BonusText = ("[COLOR_CULTURE_STORED]" .. CultBonus .. " [ICON_CULTURE]Culture[ENDCOLOR]")
		--
	end
	print ("Granted " .. BonusText .. "")
	if (iPlayer:IsHuman()) then
		iCityName = Locale.ConvertTextKey(iCity:GetName());
		local alert = Locale.ConvertTextKey("TXT_KEY_TRAIT_PG_RIODELAPLATA_ALERT", iCityName, BonusText);
		Events.GameplayAlertMessage(alert)
	end
end
		
function CheckCitizenBirth (iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive()) then
		 if (pPlayer:GetCivilizationType() == iCiv) then
			for pCity in pPlayer:Cities() do
				CityID = pCity:GetID()
				CurrentPop = math.floor(pCity:GetPopulation());
				OldPop = load ( pPlayer, "" .. CityID .. "NumPop")
				save (pPlayer, "" .. CityID .. "NumPop", CurrentPop)
				if OldPop == nil then
					
				elseif CurrentPop > OldPop then
					GiveFocusBonus (pPlayer, pCity)
				end
			end
		 end
	end
end

GameEvents.PlayerDoTurn.Add(CheckCitizenBirth)

----------------------
-- Golden Age Bonus
----------------------

function CheckGoldenAge (iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive()) then
		 if (pPlayer:GetCivilizationType() == iCiv) then
			local pCity = pPlayer:GetCapitalCity();
			if pPlayer:IsGoldenAge() == true then
				pCity:SetNumRealBuilding(iGoldenAgeBonus, 1)
			else
				pCity:SetNumRealBuilding(iGoldenAgeBonus, 0)
			end
		end
	end
end

--GameEvents.PlayerDoTurn.Add(CheckGoldenAge)