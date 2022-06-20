-- Lua Script1
-- Author: ViceVirtuoso
-- DateCreated: 7/22/2016 5:58:24 PM
--------------------------------------------------------------

--------------------------------------------------------------
-- +1 Happiness from Great Works of Music. 
-- Author: Divine Yuri, based on Vicevirtuoso
-- This requires: http://pastebin.com/2m4PG7iH
-- DateCreated: 7/22/2016 3:13:06 PM
--------------------------------------------------------------

--set to true to enable print statements
local d = {}
d.Active = false;
d.ActiveMore = true;
d.CurrentLocation = "";
function d:print(str) 
	if ( d.ActiveMore and d.Active ) then
		print(d.CurrentLocation..": "..str)

	elseif d.Active then 
		print(str)	

	end
end

--Variable to detect if CultureOverview popup is up; this is the only time that the UpdateVocaloidBuildingsUI() function should run
local bPopup;

local gwHappiness 			= {}
local gwUnmoddedHappiness 	= {}
local tGreatMusicBuildings 	= {};

function gwHappinessOnLoad()
	d.CurrentLocation = "gwHappinessOnLoad()"
	for work in GameInfo.GreatWorks() do
		if work.HT_UnmoddedHappinessFromGreatWork > 0 then
			gwUnmoddedHappiness[work.ID] = work.HT_UnmoddedHappinessFromGreatWork
			d:print("The Great Work : "..work.Type.."; Gives "..work.HT_UnmoddedHappinessFromGreatWork.." unmodded happiness.")
		end
		if work.HT_HappinessFromGreatWork > 0 then
			gwHappiness[work.ID] = work.HT_HappinessFromGreatWork
			d:print("The Great Work : "..work.Type.."; Gives "..work.HT_HappinessFromGreatWork.." happiness.")
		end
	end
	for row in DB.Query("SELECT ID, GreatWorkCount, BuildingClass FROM Buildings WHERE GreatWorkCount > 0 AND GreatWorkSlotType = 'GREAT_WORK_SLOT_MUSIC'") do	
		tGreatMusicBuildings[row.ID] = {BuildingClassID = GameInfoTypes[row.BuildingClass], NumGreatWorksSlots = row.GreatWorkCount}
	end
end
Events.LoadScreenClose.Add(gwHappinessOnLoad)

function gwGetHappinessFromBuildings(pCity, gwTable)
	local gwRet = 0
	for iBuilding, BuildingData in pairs(tGreatMusicBuildings) do
		if pCity:IsHasBuilding(iBuilding) then
			for i = 0, BuildingData.NumGreatWorksSlots - 1, 1 do
				local iWorkType = pCity:GetBuildingGreatWork(BuildingData.BuildingClassID, i)
				if gwTable[Game.GetGreatWorkType(iWorkType)] then
					gwRet = gwRet + gwTable[Game.GetGreatWorkType(iWorkType)]
				end
			end
		end
	end
	return gwRet;
end
function HT_gwHappinessBuildings(iPlayer)
	d.CurrentLocation = "gwHappinessBuildings(iPlayer)"
	if iPlayer >= GameDefines.MAX_MAJOR_CIVS then return end
	local pPlayer = Players[iPlayer]
	if pPlayer:IsEverAlive() then
		for pCity in pPlayer:Cities() do
		
			local iNumHappinessWorksThisCity 		= gwGetHappinessFromBuildings(pCity, gwHappiness);
			local iNumUnmodHappinessWorksThisCity 	= gwGetHappinessFromBuildings(pCity, gwUnmoddedHappiness);			
			
			d:print("iNumUnmodHappinessWorksThisCity: "	..iNumUnmodHappinessWorksThisCity	)
			d:print("iNumHappinessWorksThisCity	: "		..iNumHappinessWorksThisCity		)
			
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_HT_GREAT_WORK_UNMODDED_HAPPINESS"], iNumUnmodHappinessWorksThisCity)
			pCity:SetNumRealBuilding(GameInfoTypes["BUILDING_HT_GREAT_WORK_HAPPINESS"],			 iNumHappinessWorksThisCity		)
			
		end
	end
end
GameEvents.PlayerDoTurn.Add(HT_gwHappinessBuildings)

--Check all of a player's buildings when CultureOverview is updated (swapping Great Works around), and update the Logia bonus buildings accordingly
function HT_gwHappinessBuildingsUI()
	d.CurrentLocation = " HT_gwHappinessBuildingsUI()"
	if not bPopup then
		return
	end
	local iPlayer = Game:GetActivePlayer()
	HT_gwHappinessBuildings(iPlayer)
end
Events.SerialEventCityInfoDirty.Add(HT_gwHappinessBuildingsUI)


--When a popup screen appears, check if it is CultureOverview. If so, set bPopup to true, which lets UpdateLostLogiaBuildingsUI() fire
function HT_gwHappinessSetCurrentPopup(popupInfo)
	local popupType = popupInfo.Type
	if popupType == ButtonPopupTypes.BUTTONPOPUP_CULTURE_OVERVIEW then
		bPopup = true
	end
end
Events.SerialEventGameMessagePopup.Add(HT_gwHappinessSetCurrentPopup)

function HT_gwHappinessPopup( popupInfo )
	if( popupInfo.Type ~= ButtonPopupTypes.BUTTONPOPUP_GREAT_WORK_COMPLETED_ACTIVE_PLAYER ) then
		return;
	end
	local iPlayer = Game:GetActivePlayer()
	HT_gwHappinessBuildings(iPlayer)
end
Events.SerialEventGameMessagePopup.Add(HT_gwHappinessPopup);

--When a popup is closed, delete bPopup so it doesn't keep refreshing Logia buildings when CultureOverview isn't open
function HT_gwHappinessClearCurrentPopup()
	bPopup = nil;
end
Events.SerialEventGameMessagePopupProcessed.Add(HT_gwHappinessClearCurrentPopup)