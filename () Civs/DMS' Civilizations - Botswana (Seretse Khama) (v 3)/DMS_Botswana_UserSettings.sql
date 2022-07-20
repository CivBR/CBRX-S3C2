--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
DMS_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- TROUBLESHOOTING
--==========================================================================================================================	
-- Debugging
--------------------------------------------------------------------------
/*
Enable to allow for print statements to be activated throughout the code for the specific civilizations. 
  1 = Enabled
  0 = Disabled  (Default)
*/

INSERT INTO DMS_GlobalUserSettings
		(Type,											Value)
VALUES	('DMS_BOTSWANA_DEBUGGING_ON',					0);
--==========================================================================================================================	
--==========================================================================================================================	