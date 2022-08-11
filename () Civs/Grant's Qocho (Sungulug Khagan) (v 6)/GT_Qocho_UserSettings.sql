--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
GT_Qocho_UserSettings (
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

INSERT INTO GT_Qocho_UserSettings
		(Type,											Value)
VALUES	('GT_QOCHO_DEBUGGING_ON',						1),
		('GT_QOCHO_DECISIONS_DEBUGGING_ON',            0),
		('GT_QOCHO_EVENTS_DEBUGGING_ON',            0);
--==========================================================================================================================	
--==========================================================================================================================	