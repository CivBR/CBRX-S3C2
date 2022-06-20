--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations
SET Description = 'TXT_KEY_CIV_JFD_TANG_WU_ZETIAN_DESC', ShortDescription = 'TXT_KEY_CIV_JFD_TANG_WU_ZETIAN_SHORT_DESC', Adjective = 'TXT_KEY_CIV_JFD_TANG_WU_ZETIAN_ADJECTIVE', Civilopedia = 'TXT_KEY_CIVILOPEDIA_CIVS_JFD_TANG_WU_ZETIAN_TEXT_1', CivilopediaTag = 'TXT_KEY_CIVILOPEDIA_CIVS_JFD_TANG_WU_ZETIAN'
WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilization_CityNames
		(CivilizationType,		CityName)
VALUES	('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_1'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_2'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_3'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_4'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_5'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_6'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_7'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_8'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_9'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_10'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_11'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_12'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_13'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_14'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_15'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_16'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_17'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_18'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_19'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_20'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_21'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_22'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_23'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_24'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_25'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_26'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_27'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_28'),
		('CIVILIZATION_CHINA',  'TXT_KEY_CITY_NAME_JFD_TANG_WU_ZETIAN_29');
--==========================================================================================================================
--==========================================================================================================================

