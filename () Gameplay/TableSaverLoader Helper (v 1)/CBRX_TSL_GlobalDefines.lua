--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
MapModData.CBRX					= MapModData.CBRX or {}
CBRX							= MapModData.CBRX

CBRX.JFD_RTP					= CBRX.JFD_RTP or {}
JFD_RTP							= CBRX.JFD_RTP

CBRX.JFD_RTP_CyclesOfPower		= CBRX.JFD_RTP_CyclesOfPower or {}
JFD_RTP_CyclesOfPower			= CBRX.JFD_RTP_CyclesOfPower

CBRX.JFD_RTP_Epithets			= CBRX.JFD_RTP_Epithets or {}
JFD_RTP_Epithets				= CBRX.JFD_RTP_Epithets

CBRX.JFD_RTP_Sovereignty		= CBRX.JFD_RTP_Sovereignty or {}
JFD_RTP_Sovereignty				= CBRX.JFD_RTP_Sovereignty

CBRX.ASQ_Civs_SangamPandya		= CBRX.ASQ_Civs_SangamPandya or {}
ASQ_Civs_SangamPandya			= CBRX.ASQ_Civs_SangamPandya
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- CACHING
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
include("TableSaverLoader016.lua");

tableRoot = CBRX
tableName = "CBRX"

include("CBRX_TSL_TSLSerializerV3.lua");

TableLoad(tableRoot, tableName)

print("LIME TESTING - Running OnModLoaded")

function OnModLoaded()
	local bNewGame = not TableLoad(tableRoot, tableName)
	TableSave(tableRoot, tableName)
end
OnModLoaded()

print("LIME TESTING - OnModLoaded has been run")
--==========================================================================================================================
--==========================================================================================================================