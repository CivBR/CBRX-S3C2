--==========================================================================================================================		
-- TEXT
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Language_en_US
--------------------------------------------------------------------------------------------------------------------------
UPDATE Language_en_US
SET Text = '{1_PlayerName:textkey} of {2_CivName:textkey}'
WHERE Tag IN ('TXT_KEY_JFD_CONSERVATION_TITLE', 'TXT_KEY_JFD_INTRIGUE_TITLE', 'TXT_KEY_JFD_INDUSTRY_TITLE', 'TXT_KEY_JFD_SPIRIT_TITLE', 'TXT_KEY_JFD_NEUTRALITY_TITLE');
--==========================================================================================================================
--==========================================================================================================================