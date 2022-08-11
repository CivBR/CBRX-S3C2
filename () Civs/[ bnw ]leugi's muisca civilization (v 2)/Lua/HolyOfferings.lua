-- HolyOfferings
-- Author: Leugi
-- DateCreated: 7/4/2014 2:28:50 PM
--------------------------------------------------------------


local direction_types = {
	DirectionTypes.DIRECTION_NORTHEAST,
	DirectionTypes.DIRECTION_NORTHWEST,
	DirectionTypes.DIRECTION_EAST,
	DirectionTypes.DIRECTION_SOUTHEAST,
	DirectionTypes.DIRECTION_SOUTHWEST,
	DirectionTypes.DIRECTION_WEST,
}

pFarm = GameInfoTypes.PROMOTION_FARM;
pPasture = GameInfoTypes.PROMOTION_PASTURE;
pPlantation = GameInfoTypes.PROMOTION_PLANTATION;
pFort = GameInfoTypes.PROMOTION_FORT;
pMine = GameInfoTypes.PROMOTION_MINE;
pMine = GameInfoTypes.PROMOTION_MILL;

pGold = GameInfoTypes.PROMOTION_OFFERINGS_GOLD;
Ugoldbonus = 400
Ufaithbonus = 200

p1 = GameInfoTypes.PROMOTION_OFFERINGS_1;
lvl1gold = 100
lvl1faith = 50

p2 = GameInfoTypes.PROMOTION_OFFERINGS_2;
lvl2gold = 200
lvl2faith = 70

p3 = GameInfoTypes.PROMOTION_OFFERINGS_3;
lvl3gold = 450
lvl3faith = 80

p4 = GameInfoTypes.PROMOTION_OFFERINGS_4;
lvl4gold = 700
lvl4faith = 90

local iOffered = GameInfo.Units.UNIT_XUEPRIEST_OFFERING.ID
local iXue = GameInfo.Units.UNIT_XUEPRIEST.ID
local inotXue = GameInfo.Units.UNIT_XUEPRIEST_NOBUILD.ID

function GrantGoldFaith (iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			local uPlot = pUnit:GetPlot();
			if uPlot ~= nil then
			if uPlot:IsCity() then
				
				if ( uPlot:GetOwner() == pUnit:GetOwner()) then
					if (pUnit:IsHasPromotion(pGold)) then
						goldbonus = Ugoldbonus
						faithbonus = Ufaithbonus
						TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
					elseif (pUnit:IsHasPromotion(p1)) then
						goldbonus = lvl1gold
						faithbonus = lvl1faith
						TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
					elseif (pUnit:IsHasPromotion(p2)) then
						goldbonus = lvl2gold
						faithbonus = lvl2faith
						TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
					elseif (pUnit:IsHasPromotion(p3)) then
						goldbonus = lvl3gold
						faithbonus = lvl3faith
						TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
					elseif (pUnit:IsHasPromotion(p4)) then
						goldbonus = lvl4gold
						faithbonus = lvl4faith
						TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
					end
				end
			end
			end
		end
	end
end

function TriggerGoldFaith (pPlayer, pUnit, goldbonus, faithbonus)
	pPlayer:ChangeGold(goldbonus)
	pPlayer:ChangeFaith(faithbonus)
	if (pPlayer:IsHuman()) then
		local alert = Locale.ConvertTextKey("TXT_KEY_CHYQUY_OFFERING_ALERT", goldbonus, faithbonus);
		Events.GameplayAlertMessage(alert)
	else
		--print("The AI delivered the Offerings!!! :O")
	end
	--print("Holy Offerings!")
	
	pUnit:SetHasPromotion(p1,false)
	pUnit:SetHasPromotion(p2,false)
	pUnit:SetHasPromotion(p3,false)
	pUnit:SetHasPromotion(p4,false)
	pUnit:SetHasPromotion(pGold,false)

	GameEvents.UnitSetXY.Remove(GrantGoldFaith)
	GameEvents.CanSaveUnit.Remove(OnCanSaveUnit)
	pUnit:Kill(true, -1);
	GameEvents.UnitSetXY.Add(GrantGoldFaith)
	GameEvents.CanSaveUnit.Add(OnCanSaveUnit)
end

GameEvents.UnitSetXY.Add(GrantGoldFaith)

local g_infoAboutUnit = {}
local function OnCanSaveUnit(iPlayer, iUnit)
	--fires for both combat and non-combat death (disband, settler settled, etc)
	--for combat death, fires right before and after OnUnitKilledInCombat; use this to capture unit data before death
	local unit = Players[iPlayer]:GetUnitByID(iUnit)
	local unitTypeID = unit and unit:GetUnitType()
	print("CanSaveUnit Listener test; iPlayer, iUnit, unitType = ", iPlayer, iUnit, unitTypeID and GameInfo.Units[unitTypeID].Type)
	g_infoAboutUnitX = unit:GetX()
	g_infoAboutUnitY = unit:GetY()
	g_infoAboutUnitDMG = unit:GetDamage()
	--etc...
	--return false
	local pPlayer = Players[iPlayer]

	--Normal Offering

	unitplot = Map.GetPlot(g_infoAboutUnitX, g_infoAboutUnitY)
	if unitplot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_OFFERING.ID then
		--print("OFFERING!")
		unitplot:SetImprovementType(-1)
		local name = unit:GetNameNoDesc()
		local newUnit = pPlayer:InitUnit(iOffered, unitplot:GetX(), unitplot:GetY())
		newUnit:FinishMoves()
		newUnit:SetHasPromotion(pGold,true);
		newUnit:SetName(name)
	end

	-- CS Offering

	unitplot = Map.GetPlot(g_infoAboutUnitX, g_infoAboutUnitY)
	if unitplot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_CITYSTATE_OFFERING.ID then
		--print("OFFERING!")
		if (unit:IsHasPromotion(pFarm)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_FARM.ID)
		elseif (unit:IsHasPromotion(pPasture)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_PASTURE.ID)
		elseif (unit:IsHasPromotion(pPlantation)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_PLANTATION.ID)
		elseif (unit:IsHasPromotion(pMine)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_MINE.ID)
		elseif (unit:IsHasPromotion(pFort)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_FORT.ID)
		elseif (unit:IsHasPromotion(pMill)) then
			unitplot:SetImprovementType(GameInfo.Improvements.IMPROVEMENT_LUMBERMILL.ID)
		else
			unitplot:SetImprovementType(-1)
		end	
		csID = unitplot:GetOwner();
		local csPlayer = Players[csID]
		local eReligion = pPlayer:GetReligionCreatedByPlayer();
		if eReligion == nil then
			eReligion = 0
		end
		for csCity in csPlayer:Cities() do
			if csCity:IsCapital() then
				local totalpop = csCity:GetPopulation();
				local followers = csCity:GetNumFollowers(eReligion);
				boost = followers / totalpop
			end
		end
		if boost >= 0.9 then
				actualP = p4

		elseif boost >= 0.6 then
				actualP = p3

		elseif boost >= 0.3 then
				actualP = p2

		else
			actualP = p1
		end
		local name = unit:GetName()
		local newUnit = pPlayer:InitUnit(iOffered, unitplot:GetX(), unitplot:GetY())
		newUnit:SetHasPromotion(actualP,true);
		newUnit:FinishMoves()
		newUnit:SetName(name)
	end
end
GameEvents.CanSaveUnit.Add(OnCanSaveUnit)


-- AI

function OnChyquyCross(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
	if not pPlayer:IsHuman() then
		local eReligion = pPlayer:GetReligionCreatedByPlayer();
		if eReligion == nil then
			eReligion = 0
		end
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == iXue) then
				local uPlot = pUnit:GetPlot();
				if uPlot ~= nil then
				csID = uPlot:GetOwner();
				for i = GameDefines.MAX_MAJOR_CIVS, GameDefines.MAX_CIV_PLAYERS - 2 do 
					local tPlayer = Players[i];
					if (tPlayer:GetMinorCivFriendshipLevelWithMajor(pPlayer:GetID()) >= 1) then
						for cscity in tPlayer:Cities() do
							if (csId == tPlayer) then
								if csCity:IsCapital() then
									local totalpop = csCity:GetPopulation();
									local followers = csCity:GetNumFollowers(eReligion);
									boost = followers / totalpop
								end
							end
							if boost > 0.5 then
								if boost >= 0.9 then
									actualP = p4

								elseif boost >= 0.6 then
									actualP = p3
								
								elseif boost >= 0.3 then
									actualP = p2

								else
									actualP = p1
								end
								local name = pUnit:GetName()
								local newUnit = pPlayer:InitUnit(iOffered, uPlot:GetX(), uPlot:GetY())
								newUnit:Convert(pUnit);
								newUnit:SetHasPromotion(actualP,true);
								newUnit:SetName(name)
								--print("The AI got Offerings")
								break
							end
						end
					end
				end
				if (not uPlot:IsOwned()) then
					--print("Empty")
					if (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_GOLD) or (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_SILVER) or (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_COPPER) or (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_GEMS) or (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_JADE) or (uPlot:GetResourceType() == GameInfoTypes.RESOURCE_AMBER) then
							uPlot:SetResourceType(-1)
							local newUnit = pPlayer:InitUnit(iOffered, uPlot:GetX(), uPlot:GetY())
							newUnit:Convert(pUnit);
							newUnit:SetHasPromotion(pGold,true);
							newUnit:SetName(name)
							--print("The AI got Offerings")
					end
				end
			end
			end
		end
	end
	end
end

--GameEvents.UnitSetXY.Add(OnChyquyCross)


-- The following are to make sure the Chyquy can revert CS improvements after the offering.




function ChangeChyquy(iPlayer)
	GameEvents.UnitSetXY.Remove(ChangeChyquy)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive()) then
		for pUnit in pPlayer:Units() do
			if (pUnit:GetUnitType() == iXue) then
				local uPlot = pUnit:GetPlot();
				if uPlot ~= nil then
					if (uPlot:GetImprovementType() ~= -1) then
						if  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FARM.ID then
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMine,false);
							pUnit:SetHasPromotion(pPlantation,false);
							pUnit:SetHasPromotion(pPasture,false);
							pUnit:SetHasPromotion(pFarm,true);
							pUnit:SetHasPromotion(pMill,false);
						elseif  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_PASTURE.ID then
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMine,false);
							pUnit:SetHasPromotion(pPlantation,false);
							pUnit:SetHasPromotion(pPasture,true);
								pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMill,false);
						elseif  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_PLANTATION.ID then
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMine,false);
							pUnit:SetHasPromotion(pPlantation,true);
							pUnit:SetHasPromotion(pPasture,false);
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMill,false);
						elseif  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_MINE.ID then
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMine,true);
							pUnit:SetHasPromotion(pPlantation,false);
							pUnit:SetHasPromotion(pPasture,false);
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMill,false);
						elseif  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FORT.ID then
							pUnit:SetHasPromotion(pFort,true);
							pUnit:SetHasPromotion(pMine,false);
							pUnit:SetHasPromotion(pPlantation,false);
							pUnit:SetHasPromotion(pPasture,false);
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMill,false);
						elseif  uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_LUMBERMILL.ID then
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMine,false);
							pUnit:SetHasPromotion(pPlantation,false);
							pUnit:SetHasPromotion(pPasture,false);
							pUnit:SetHasPromotion(pFort,false);
							pUnit:SetHasPromotion(pMill,true);
						else
							pUnit:SetHasPromotion(pFort,false);
						pUnit:SetHasPromotion(pMine,false);
						pUnit:SetHasPromotion(pPlantation,false);
						pUnit:SetHasPromotion(pPasture,false);
						pUnit:SetHasPromotion(pFarm,false);
							pUnit:SetHasPromotion(pMill,false);
						end
					else
						pUnit:SetHasPromotion(pFort,false);
						pUnit:SetHasPromotion(pMine,false);
						pUnit:SetHasPromotion(pPlantation,false);
						pUnit:SetHasPromotion(pPasture,false);
						pUnit:SetHasPromotion(pFarm,false);
						pUnit:SetHasPromotion(pMill,false);
					end
				end
			--elseif
				--(pUnit:GetUnitType() == inotXue) then
				--local uPlot = pUnit:GetPlot();
				--if uPlot ~= nil then
		--			if (uPlot:GetImprovementType() ~= -1) then
		--				if uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FARM.ID or uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_PASTURE.ID or uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_PLANTATION.ID or uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_MINE.ID or uPlot:GetImprovementType() == GameInfo.Improvements.IMPROVEMENT_FORT.ID then
		--					
		--					local newUnit = pPlayer:InitUnit(iXue, pUnit:GetX(), pUnit:GetY())
		--					newUnit:Convert(pUnit);
		--					
		--				end
		--			else
		--				--GameEvents.UnitSetXY.Remove(ChangeChyquy)
		--				local newUnit = pPlayer:InitUnit(iXue, pUnit:GetX(), pUnit:GetY())
		--				newUnit:Convert(pUnit);
		--				--GameEvents.UnitSetXY.Add(ChangeChyquy)
		--			end
		--		end
			end
		end
	end
	GameEvents.UnitSetXY.Add(ChangeChyquy)
end




GameEvents.UnitSetXY.Add(ChangeChyquy)
