print("EW's Eye Spy Loaded!")

include("InstanceManager")

--Creates Spy Instance
local g_SpyInstance = InstanceManager:new("Instance_EW_Spies", "Grid_EW_Spies", Controls.Stack_EW_Spies)

--Sets the panel to be closed by default

Controls.Grid_EW_Full:SetHide(true)

--Loops through Players to create a table of valid Civilizations

local tMajors = {}
function EW_EyeSpy_CheckMajors()
	for iPlayer = 0, GameDefines.MAX_PLAYERS - 1, 1 do
		local pPlayer = Players[iPlayer]
		if (not pPlayer:IsMinorCiv()) and (not pPlayer:IsBarbarian()) then
			
			tMajors[iPlayer] = pPlayer
		end
	end
end

Events.SequenceGameInitComplete.Add(EW_EyeSpy_CheckMajors)

--Updates List of Civilizations

function EW_EyeSpy_UpdateCivList()
	--Deletes List
	
	Controls.PullDown_EW_Civilizations:ClearEntries()
	Controls.PullDown_EW_Civilizations:GetButton():SetText("-- ALL --")

	--Creates List

	local tList = {}
	local iActive = Game.GetActivePlayer()

	tList[0] = -1

	local iList = 1
	for k, v in pairs(tMajors) do
		local bSpies = v:GetEspionageSpies() or false
		if v:IsAlive() and bSpies and (k ~= iActive) then
			tList[iList] = k
			iList = iList + 1
		end
	end

	for k, v in pairs(tList) do
		local tEntry = {}
		Controls.PullDown_EW_Civilizations:BuildEntry("InstanceOne", tEntry)

		tEntry.Button:SetVoid1(v)
		tEntry.Button:SetText("-- ALL --")
		if Players[v] then
			local pPlayer = Players[v]
			tEntry.Button:SetText(pPlayer:GetCivilizationDescription())
		end
	end

	Controls.PullDown_EW_Civilizations:CalculateInternals()
	Controls.PullDown_EW_Civilizations:RegisterSelectionCallback(EW_EyeSpy_OnCivilizationSelect)
end

--When a Civilization is Selected from Dropdown

function EW_EyeSpy_OnCivilizationSelect(playerID)
	--Adjusts the Menu
	--print("Select Civ!")
	Controls.PullDown_EW_Civilizations:GetButton():SetText("-- ALL --")
	if Players[playerID] then
		Controls.PullDown_EW_Civilizations:GetButton():SetText(Players[playerID]:GetCivilizationDescription())
	end
	--Creates the Spy List

	g_SpyInstance:ResetInstances()

	local pPlayer = Players[playerID] or false
	if pPlayer then
		local tAgents = pPlayer:GetEspionageSpies()
		for k, v in pairs(tAgents) do
			if k then
				--Creates the Spy's Info
				local sSpyInfo = (Locale.ConvertTextKey(v.Name) .. "[NEWLINE] Rank: " .. Locale.ConvertTextKey(v.Rank) .. "[NEWLINE] Owner: " .. pPlayer:GetCivilizationShortDescription()) or ("ERROR ON UPDATE")
				--Creates the City's Info
				local sCityInfo = "N/A"

				local pPlot = Map.GetPlot(v.CityX, v.CityY) or false
				if pPlot then
					sCityInfo = "Error 1"
					local pCity = pPlot:GetPlotCity() or false
					if pCity then
						local pOwner = Players[pCity:GetOwner()]
						sCityInfo = (pCity:GetName() .. "[NEWLINE]" .. pOwner:GetCivilizationShortDescription())
						if v.IsDiplomat then
							sCityInfo = (sCityInfo .. "[NEWLINE]Diplomat")
						else
							sCityInfo = (sCityInfo .. "[NEWLINE]Spying[NEWLINE]")
						end
					end
				end
				--Sets Info
				local pInstance = g_SpyInstance:GetInstance()

				pInstance.Label_EW_Spies:SetText(sSpyInfo)
				pInstance.Label_EW_City:SetText(sCityInfo)
			end
		end
	else
		--Again, calculates relevant civs
		local tList = {}
		for k, v in pairs(tMajors) do
			local bSpies = v:GetEspionageSpies() or false
			if v:IsAlive() and bSpies and (k ~= iActive) then
				tList[k] = v
			end
		end
		--Creates list of ALL VALID CIVS, ALL SPIES
		for _, pBoss in pairs(tList) do
			local tAgents = pBoss:GetEspionageSpies()
			for k, v in pairs(tAgents) do
				if k then
					--Creates the Spy's Info
					local sSpyInfo = (Locale.ConvertTextKey(v.Name) .. "[NEWLINE] Rank: " .. Locale.ConvertTextKey(v.Rank) .. "[NEWLINE] Owner: " .. pBoss:GetCivilizationShortDescription()) or ("ERROR ON UPDATE")
					--Creates the City's Info
					local sCityInfo = "N/A"

					local pPlot = Map.GetPlot(v.CityX, v.CityY) or false
					if pPlot then
						local pCity = pPlot:GetPlotCity() or false
						sCityInfo = "Error 1"
						if pCity then
							local pOwner = Players[pCity:GetOwner()]
							sCityInfo = (pCity:GetName() .. "[NEWLINE]" .. pOwner:GetCivilizationShortDescription())
							if v.IsDiplomat then
								sCityInfo = (sCityInfo .. "[NEWLINE]Diplomat")
							else
								sCityInfo = (sCityInfo .. "[NEWLINE]Spying")
							end
						end
					end
					--Sets Info
					local pInstance = g_SpyInstance:GetInstance()

					pInstance.Label_EW_Spies:SetText(sSpyInfo)
					pInstance.Label_EW_City:SetText(sCityInfo)
				end
			end
		end
	end
	--Creates the Spy List!
	Controls.Stack_EW_Spies:CalculateSize()
	Controls.Stack_EW_Spies:ReprocessAnchoring()
	Controls.Scroll_EW_Spies:CalculateInternalSize()
end

-- Opens/Closes the Menu

local bShow = false

function EW_EyeSpy_OnOpenClose()
	if bShow then
		Controls.Grid_EW_Full:SetHide(true)
		g_SpyInstance:ResetInstances()
		Controls.TextButton_EW_OpenClose:SetText("Open")
		bShow = false
	else
		EW_EyeSpy_OnCivilizationSelect(-1)
		Controls.Grid_EW_Full:SetHide(false)
		Controls.TextButton_EW_OpenClose:SetText("Close")
		bShow = true
	end
	EW_EyeSpy_UpdateCivList()
	--print("Open Sesame!")
end

Controls.TextButton_EW_OpenClose:RegisterCallback(Mouse.eLClick, EW_EyeSpy_OnOpenClose)

--Closes on Do Turn

function EW_EyeSpy_DoTurn(playerID)
	if bShow then
		EW_EyeSpy_OnOpenClose()
	end
end

GameEvents.PlayerDoTurn.Add(EW_EyeSpy_DoTurn)