--================================================================================================================
-- Yerbamate Bonus scripts
--================================================================================================================
-- Utilities
---------------------------

WARN_NOT_SHARED = false; include( "SaveUtils" ); MY_MOD_NAME = "Improvement_Yerbamate";

print ("Yerbamate Scripts LOADED");
-- Top Panel Stuff


local mathCeil	   	      = math.ceil
function Leugi_RioDelaPlata_GetHappinessFromYerbamate(playerID)
	local player = Players[playerID]
	numHappiness = load(player, "AffectedCities")
	return numHappiness
end

---------------------------
-- Variables
---------------------------

numAffectedCities		= 0;
local iImprovement		= GameInfoTypes.IMPROVEMENT_PG_YERBAMATE_PLANTATION
local iImprovementBonus	= GameInfoTypes.BUILDING_PG_YERBAMATE_HAPPINESS
local iResource			= GameInfoTypes["RESOURCE_PG_YERBAMATE"]
local iGoldenAgePolicy	= GameInfoTypes["POLICY_PG_GOLDENAGE_MATE"]
local iNoGoldenAgePolicy	= GameInfoTypes["POLICY_PG_NO_GOLDENAGE_MATE"]
--=================================================================================================================
--=================================================================================================================
-- Grant Happiness Script
---------------------------

function YerbaHappiness(iPlayer)
	numImprovements = 0;
	numAffectedCities = 0;
	local pPlayer = Players[iPlayer];
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == iImprovement then
							numImprovements = numImprovements + 1			
						end
					end
					if numImprovements > 0 then
						pCity:SetNumRealBuilding(iImprovementBonus, 1)
						numAffectedCities = numAffectedCities + 1
						save (pPlayer, "AffectedCities", numAffectedCities)
					else
						pCity:SetNumRealBuilding(iImprovementBonus, 0)
					end
				end
			end
		end
end

GameEvents.PlayerDoTurn.Add(YerbaHappiness);

--=================================================================================================================
--=================================================================================================================
-- Grant Mate Script
---------------------------

function ToggleImprovement (iPlayer)
	local pPlayer = Players[iPlayer];
		for pCity in pPlayer:Cities() do
			local i;
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local plot = pCity:GetCityIndexPlot( i );
				if (plot ~= nil) then
					if ( plot:GetOwner() == pCity:GetOwner() ) then
						local ImpID = plot:GetImprovementType()
						if ImpID == iImprovement then
							if not load(plot, "PlotHasYerba") == true then
								plot:SetResourceType(-1)
								plot:SetResourceType(iResource, 1)
								save (plot, "PlotHasYerba", true)
							end
						end
					end
				end
			end
		end
end

GameEvents.PlayerDoTurn.Add(ToggleImprovement);

--==================================================================================================================
--==================================================================================================================
-- More food on Golden Ages
-------------------------

function CheckGoldenAgeMate (iPlayer)
	local pPlayer = Players[iPlayer]
	if (pPlayer:IsAlive()) then
		if pPlayer:HasPolicy(iGoldenAgePolicy) then
			if pPlayer:IsGoldenAge() == false then
				pPlayer:SetHasPolicy(iGoldenAgePolicy, false);
				pPlayer:SetHasPolicy(iNoGoldenAgePolicy, true);
			end
		elseif pPlayer:HasPolicy(iNoGoldenAgePolicy) then
			if pPlayer:IsGoldenAge() == true then
				pPlayer:SetHasPolicy(iNoGoldenAgePolicy, false);
				pPlayer:SetHasPolicy(iGoldenAgePolicy, true);
			end
		else
			if pPlayer:IsGoldenAge() == true then
				pPlayer:SetNumFreePolicies(1)
				pPlayer:SetNumFreePolicies(0)
				pPlayer:SetHasPolicy(iGoldenAgePolicy, true);
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(CheckGoldenAgeMate)
GameEvents.PlayerAdoptPolicy.Add(CheckGoldenAgeMate)
Events.SerialEventUnitDestroyed(CheckGoldenAgeMate)

--===================================================================================================================
--===================================================================================================================
-- Mate Heal on Plot
-----------------------

function MateHeals (iPlayer)
	local pPlayer = Players[iPlayer];
	for pUnit in pPlayer:Units() do
		local plot = pUnit:GetPlot();
		if ( plot:GetOwner() == pUnit:GetOwner() ) then
			if plot:GetResourceType() == iResource then
				pUnit:ChangeDamage(-5)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(MateHeals)