
local pKokang = GameInfoTypes["CIVILIZATION_ERW_KOKANG"]
local pHarvested = GameInfoTypes["PROMOTION_ERW_KOKANG"]

local iPracticalNumCivs = (GameDefines.MAX_MAJOR_CIVS - 1)

function JFD_IsCivilisationActive(civilizationID)
	for iSlot = 0, iPracticalNumCivs, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

if JFD_IsCivilisationActive(pKokang) then
	print("Kokang active!")
end

-----

local pKakweye = GameInfoTypes["UNIT_ERW_KAKWEYE"]
local pPromotion = GameInfoTypes["PROMOTION_ERW_KAKWEYE"]
local pPoppy = GameInfoTypes["IMPROVEMENT_ERW_POPPY_FIELD"]

--[[
UA: Put trade partners into Anarchy once a trade deal ends.
UA: Generate influence with City-States for Trade Routes sent to Cities in Anarchy.
UU: +20% Combat Strength when starting in Civilizations with less happiness
UTI: +1 of the relevant yield for every City-State ally.
]]--
local tResources = {}
for row in DB.Query("SELECT * FROM Resources") do
	tResources[row.ID] = true
end

local tTraits = {}
for row in DB.Query("SELECT * FROM MinorCivTraits") do
	local pType = GameInfoTypes[row.Type] or false
	if pType then
		if pType == GameInfoTypes["MINOR_TRAIT_CULTURED"] then
			tTraits[row.ID] = GameInfoTypes["YIELD_CULTURE"]
		elseif pType == GameInfoTypes["MINOR_TRAIT_MILITARISTIC"] then
			tTraits[row.ID] = GameInfoTypes["YIELD_PRODUCTION"]
		elseif pType == GameInfoTypes["MINOR_TRAIT_MARITIME"] then
			tTraits[row.ID] = GameInfoTypes["YIELD_FOOD"]
		elseif pType == GameInfoTypes["MINOR_TRAIT_MERCANTILE"] then
			tTraits[row.ID] = GameInfoTypes["YIELD_GOLD"]
		elseif pType == GameInfoTypes["MINOR_TRAIT_RELIGIOUS"] then
			tTraits[row.ID] = GameInfoTypes["YIELD_FAITH"]
		end
	end
end

local bNoYield = true

local tMajors = {}
local tMinors = {}
local tRes_Var = {}
function EW_Kokang_OnLoad()
	
	for playerID = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[playerID]
		if pPlayer:IsMinorCiv() then 
			tMinors[playerID] = pPlayer 
			bNoYield = false
		end
		if (not pPlayer:IsMinorCiv()) and (not pPlayer:IsBarbarian()) then
			tMajors[playerID] = pPlayer
		end
		if pPlayer:GetCivilizationType() == pKokang then
			tRes_Var[playerID] = tRes_Var[playerID] or {}
			local iNumDeals = UI.GetNumCurrentDeals( playerID ) or 0
			for i = 0, iNumDeals - 1 do
				UI.LoadCurrentDeal( playerID, i )
				local pDeal = UI.GetScratchDeal()
				if pDeal then
					local iOtherPlayer = pDeal:GetOtherPlayer(playerID)
					pDeal:ResetIterator()
					local itemType, duration, finalTurn, data1, data2, data3, flag1, fromPlayer = pDeal:GetNextItem();
					while (itemType ~= nil) do
						local bFromUs = (fromPlayer == playerID)
						
						if ( TradeableItems.TRADE_ITEM_RESOURCES == itemType ) and bFromUs then
							tRes_Var[playerID][iOtherPlayer] = (tRes_Var[playerID][iOtherPlayer] + 1) or 1
						end
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(pKokang) then
	Events.SequenceGameInitComplete.Add(EW_Kokang_OnLoad)
end

function EW_Kokang_DoTurn(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pKokang then
		local bHuman = pPlayer:IsHuman()
		--UA1
		tRes_Var[playerID] = tRes_Var[playerID] or {}

		local iNumDeals = UI.GetNumCurrentDeals( playerID ) or 0
		
		local iVar = {}
		for i = 0, iNumDeals - 1 do
			UI.LoadCurrentDeal( playerID, i )
			local pDeal = UI.GetScratchDeal()
			local iOtherPlayer = pDeal:GetOtherPlayer(playerID)
			iVar[iOtherPlayer] = iVar[iOtherPlayer] or 0
			if pDeal and iOtherPlayer then
				pDeal:ResetIterator()
				local itemType, duration, finalTurn, data1, data2, data3, flag1, fromPlayer = pDeal:GetNextItem();
				while (itemType ~= nil) do
					
					local bFromUs = (fromPlayer == playerID)
					
					if ( TradeableItems.TRADE_ITEM_RESOURCES == itemType ) and bFromUs then
						iVar[iOtherPlayer] = iVar[iOtherPlayer] + 1
					end
					itemType, duration, finalTurn, data1, data2, data3, flag1, fromPlayer = pDeal:GetNextItem();
				end
				
			end
		end

		for k, v in pairs(tMajors) do
			iVar[k] = iVar[k] or 0
			tRes_Var[playerID][k] = tRes_Var[playerID][k] or 0
			if tRes_Var[playerID][k] > iVar[k] then
				local iAnarchy = tRes_Var[playerID][k] - iVar[k]
				for pCity in v:Cities() do
					pCity:ChangeResistanceTurns(iAnarchy * 2)
				end
			end
			tRes_Var[playerID][k] = iVar[k]
		end

		--UA2
		local iTrade = 0
		for k, v in pairs(pPlayer:GetTradeRoutes()) do
			if v.FromID == playerID then
				if v.ToCity:IsResistance() then
					iTrade = iTrade + 1
				end
			end
		end
		iTrade = iTrade * 5
		for k, v in pairs(tMinors) do
			local pTeam = Teams[pPlayer:GetTeam()]
			local pMinor_Team = Teams[v:GetTeam()]
			if v:IsAlive() and (not pTeam:IsAtWar(pMinor_Team)) then
				local iFriendship = v:GetMinorCivFriendshipWithMajor(playerID)
				if iFriendship < iTrade then
					local iHelp = iTrade - iFriendship
					v:ChangeMinorCivFriendshipWithMajor(playerID, iHelp)
				end
				
			end
		end

		--UTI
		local tYields = {}
		for k, v in pairs(tMinors) do
			bNoYield = false
			local iYield = tTraits[v:GetMinorCivTrait()] or false
			if iYield then
				tYields[iYield] = tYields[iYield] or 0
				if v:IsAllies(playerID) then
					tYields[iYield] = tYields[iYield] + 1
				end
			end
		end

		for pCity in pPlayer:Cities() do
			print("AI 1")
			for i = 0, pCity:GetNumCityPlots() - 1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if pPlot and (pPlot:GetImprovementType() == pPoppy) then
					print("AI 2")
					for k, v in pairs(tYields) do
						local iRepair = (0 - pPlot:GetYield(k))
						if (k == GameInfoTypes["YIELD_FOOD"]) or (k == GameInfoTypes["YIELD_GOLD"]) then v = v + 1 end
						Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), k, iRepair)
						Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), k, v)
						
					end
					--No Minors? No yields!
					if bNoYield then
						print("AI 3")
						for k, v in pairs(tTraits) do
							local iRepair = (0 - pPlot:GetYield(v))
							local iVar = 0
							if (v == GameInfoTypes["YIELD_FOOD"]) or (v == GameInfoTypes["YIELD_GOLD"]) then iVar = 1 end
							Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), v, iRepair)
							Game.SetPlotExtraYield(pPlot:GetX(), pPlot:GetY(), v, iVar)
						end
					end
				end
			end
		end

		--UU

		for pUnit in pPlayer:Units() do
			if pUnit:GetUnitType() == pKakweye then
				local iHappiness = pPlayer:GetHappiness()
				local pPlot = pUnit:GetPlot()
				if pPlot and pPlot:IsOwned() then
					
					local pOwner = Players[pPlot:GetOwner()]
					local iOwner_Happiness = pOwner:GetHappiness()
					if iHappiness > iOwner_Happiness then
						
						pUnit:SetHasPromotion(pPromotion, true)
					end
				end
				--AI utility
				if not bHuman then
					if pPlot and (pPlot:GetImprovementType() == pPoppy) and (pRes == pRes_Poppy) and not pUnit:IsHasPromotion(pHarvested) then
						EW_Kokang_ClearPlot(pPlayer, pUnit)
					end
				end
			end
		end
	end
end

if JFD_IsCivilisationActive(pKokang) then
	GameEvents.PlayerDoTurn.Add(EW_Kokang_DoTurn)
end

--[[
UU: Can harvest Opium
UU: Can Culture bomb after harvesting Opium
]]--
local pMission = GameInfoTypes["MISSION_CULTURE_BOMB"]
local pRes_Poppy = GameInfoTypes["RESOURCE_ERW_POPPY"]

function EW_Kokang_SpawnOpium(playerID, x, y, improvement)
	local pPlayer = Players[playerID]
	local pPlot = Map.GetPlot(x, y)
	if pPlot and improvement == pPoppy then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(-1)
		pPlot:SetResourceType(pRes_Poppy)
		pPlot:SetNumResource(1)
		pPlot:SetImprovementType(pPoppy, pPlayer)
	end
end

GameEvents.BuildFinished.Add(EW_Kokang_SpawnOpium)

function EW_Kokang_CultureBomb(playerID, unitID, missionType)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() ~= pKokang then return true end
	local pUnit = pPlayer:GetUnitByID(unitID)
	if pUnit:GetUnitType() == pKakweye then
		if missionType == pMission then
			if pUnit:IsHasPromotion(pHarvested) then return true end
			return false
		end
	end
	return true
end

GameEvents.CanStartMission.Add(EW_Kokang_CultureBomb)

-----

local activePlayerID = Game.GetActivePlayer()
local pActivePlayer = Players[activePlayerID]

function EW_Kokang_UI_UnitActionButton()
	local unit = UI.GetHeadSelectedUnit();
	EW_Kokang_ClearPlot(pActivePlayer, unit)
end

if JFD_IsCivilisationActive(pKokang) then
	Controls.UnitActionButton:RegisterCallback(Mouse.eLClick, EW_Kokang_UI_UnitActionButton)
end

function EW_Kokang_UI_UnitInfoDirty()
	local pUnit = UI.GetHeadSelectedUnit()
	Controls.UnitActionButton:SetHide(true)
	if pUnit and (pUnit:GetUnitType() == pKakweye) then
		local pPlayer = Players[pUnit:GetOwner()]
		
		local pPlot = pUnit:GetPlot()
		local pImprovement = pPlot:GetImprovementType()
		local pRes = pPlot:GetResourceType()
		print("Check Action1")
		if pPlayer and pPlot and (pImprovement == pPoppy) and (pRes == pRes_Poppy) and not pUnit:IsHasPromotion(pHarvested) then --Add Resource Check
			print("Check Action2")
			local sTooltip = "[COLOR_POSITIVE_TEXT]Harvest Opium[ENDCOLOR][NEWLINE]"

			sTooltip = sTooltip .. "[NEWLINE]----------------[NEWLINE]"
			sTooltip = sTooltip .. Locale.ConvertTextKey("TXT_KEY_MISSION_EW_KAKWEYE_DESC")

			if pUnit:GetUnitType() == pKakweye then
				Controls.UnitActionIcon:LocalizeAndSetToolTip(sTooltip)
				Controls.UnitActionButton:SetHide(false)
			else
				Controls.UnitActionButton:SetHide(true)
			end

			local buildCityButtonActive = pUnit:IsFound();
			local buildCityButtonSize = 0

			local primaryStack = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack")
			local primaryStretchy = ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStretchy")
			primaryStack:CalculateSize();
			primaryStack:ReprocessAnchoring();

			local stackSize = primaryStack:GetSize();
			local stretchySize = primaryStretchy:GetSize();

			if buildCityButtonActive then
				if OptionsManager.GetSmallUIAssets() and not UI.IsTouchScreenEnabled() then
					buildCityButtonSize = 36;
				else
					buildCityButtonSize = 60;
				end
			end
			primaryStretchy:SetSizeVal( stretchySize.x, stackSize.y + buildCityButtonSize + 348 );
		end
	end
end

if JFD_IsCivilisationActive(pKokang) then
	Events.SerialEventUnitInfoDirty.Add(EW_Kokang_UI_UnitInfoDirty)
end

function EW_Kokang_UI_UpdateUnitInfoPanel()
	if (not OptionsManager.GetSmallUIAssets()) then
		Controls.UnitActionButton:SetSizeVal(50,50)
		Controls.UnitActionIcon:SetSizeVal(64,64)
		Controls.UnitActionIcon:SetTexture("KokangAction64.dds")
	else
		Controls.UnitActionButton:SetSizeVal(36,36)
		Controls.UnitActionIcon:SetSizeVal(45,45)
		Controls.UnitActionIcon:SetTexture("KokangAction.dds")
	end
	Controls.UnitActionIcon:LocalizeAndSetToolTip("TXT_KEY_MISSION_EW_KAKWEYE")
	Controls.UnitActionButton:ChangeParent(ContextPtr:LookUpControl("/InGame/WorldView/UnitPanel/PrimaryStack"))
end

if JFD_IsCivilisationActive(pKokang) then
	Events.LoadScreenClose.Add(EW_Kokang_UI_UpdateUnitInfoPanel)
end

function EW_Kokang_ClearPlot(player, unit)
	local pPlot = unit:GetPlot()
	if pPlot then
		pPlot:SetImprovementType(-1)
		pPlot:SetResourceType(-1, 0)
		unit:SetHasPromotion(pHarvested, true)
		if pPlayer:IsHuman() then Events.GameplayAlertMessage("Your Kakweye has harvested a source of Opium!") end
	end
end