--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx  < ChangePlayerResearchProgress >  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
--uses and needs JFD_GetRandom
-- you call and pass values to ChangePlayerResearchProgress(iPlayer, iValue, bOnlyCurrentTech)
-- iPlayer is the player ID#
-- iValue is the amount of science to add
-- bOnlyCurrentTech is a boolean flag for whether or not to add the overflow if any to another available tech
-- if you omit the boolean for "bOnlyCurrentTech" entirely the code will attempt to apply any excess amounts to another available tech the player has NOT reseearched



-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
function ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
	if iValue <= pTeamTechs:GetResearchLeft(iTechnology) then
		pTeamTechs:ChangeResearchProgress(iTechnology, iValue, iPlayer)
		return 0
	else
		local iChange = iValue - pTeamTechs:GetResearchLeft(iTechnology)
		pTeam:SetHasTech(iTechnology, true)
		return iChange
	end
	return -1
end

function ChangePlayerResearchProgress(iPlayer, iValue, bOnlyCurrentTech)
	local CurrentTechOnly = ((bOnlyCurrentTech ~= nil) and bOnlyCurrentTech or false)
	local pPlayer = Players[iPlayer]
	local iCurrentResearchItem = pPlayer:GetCurrentResearch()
	local pTeam = Teams[pPlayer:GetTeam()]
	local pTeamTechs = pTeam:GetTeamTechs()
	local iChange = iValue
	if (iCurrentResearchItem ~= -1) and (iCurrentResearchItem ~= nil) then
		iChange = ChangeTechProgressAndReturnOverflow(iValue, iTechnology, pTeamTechs, pTeam, iPlayer)
		if CurrentTechOnly or (iChange <= 0) then
			return
		end
	end
	local tTechsNotResearched = {}
	local iLowestGridWithUnResearchedTech = 1000
	local iLargestTechGridX = 0
	local bUnresearchedTechExists = false
	for Tech in GameInfo.Technologies() do
		if not Tech.Disable and not pTeamTechs:HasTech(Tech.ID) then
			bUnresearchedTechExists = true
			if Tech.GridX < iLowestGridWithUnResearchedTech then
				iLowestGridWithUnResearchedTech = Tech.GridX
			end
			if not tTechsNotResearched[Tech.GridX] then
				tTechsNotResearched[Tech.GridX] = {}
			end
			table.insert(tTechsNotResearched[Tech.GridX], {TechID=Tech.ID, Progress=pTeamTechs:GetResearchProgress(Tech.ID)})
		end
		if Tech.GridX > iLargestTechGridX then
			iLargestTechGridX = Tech.GridX
		end
	end
	if bUnresearchedTechExists then
		local iSelection = JFD_GetRandom(1, #tTechsNotResearched[iLowestGridWithUnResearchedTech])
		local iSelectedTech = tTechsNotResearched[iLowestGridWithUnResearchedTech][iSelection].TechID
		ChangeTechProgressAndReturnOverflow(iChange, iSelectedTech, pTeamTechs, pTeam, iPlayer)
	end
end
