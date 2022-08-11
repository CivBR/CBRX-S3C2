--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- GT_Chagatai_UserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
GT_Perm_UserSettings (
	Type 											text 										default null,
	Value 											integer 									default 0);
--==========================================================================================================================	
-- TROUBLESHOOTING
--==========================================================================================================================	
-- Debugging
--------------------------------------------------------------------------
/*
Enable to allow for print statements to be activated throughout the code. 
  1 = Enabled
  0 = Disabled  (Default)
*/

INSERT INTO GT_Perm_UserSettings
		(Type,										Value)
VALUES	('GT_PERM_DEBUGGING_ON',					0);


