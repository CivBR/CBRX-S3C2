--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------	


	
INSERT INTO Civilizations 	
		(Type, 							Description,						ShortDescription,							Adjective,									Civilopedia, CivilopediaTag,						DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,				ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 					DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_CIV_PG_RIODELAPLATA_DESC',	'TXT_KEY_CIV_PG_RIODELAPLATA_SHORT_DESC',	'TXT_KEY_CIV_PG_RIODELAPLATA_ADJECTIVE',	'TXT_KEY_CIV_PG_RIODELAPLATA_TEXT', CivilopediaTag, 'PLAYERCOLOR_PG_RIODELAPLATA',	ArtDefineTag, 'ARTSTYLE_GRECO_ROMAN',	ArtStyleSuffix, ArtStylePrefix, 'PG_RIODELAPLATA_ATLAS',	1,				'PG_RIODELAPLATA_ALPHA_ATLAS',	'Brazil', 		'Map_RiodelaPlata_00.dds',	'TXT_KEY_CIV5_DOM_PG_SANMARTIN_TEXT',	'DOM_SanMartin_00.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_BRAZIL';

-- Fancy map changer by JFD

UPDATE Civilizations 
SET MapImage = 'Map_RiodelaPlata_01.dds'
WHERE Type = 'CIVILIZATION_PG_RIODELAPLATA'
AND EXISTS (SELECT * FROM Leugi_GlobalUserSettings WHERE Type = 'LEUGI_CIVILIZATIONS_RIO_DELA_PLATA_ALT_MAP' AND Value = 1);

UPDATE Civilizations 
SET DawnOfManImage = 'DOM_SanMartin_01.dds'
WHERE Type = 'CIVILIZATION_PG_RIODELAPLATA'
AND EXISTS (SELECT * FROM Leugi_GlobalUserSettings WHERE Type = 'LEUGI_CIVILIZATIONS_RIO_DELA_PLATA_ALT_MAP' AND Value = 1);

 
--------------------------------	
-- Civilization_Start_Along_River
--------------------------------
INSERT INTO Civilization_Start_Along_River
		(CivilizationType,					StartAlongRiver)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	1);

--------------------------------
-- Civilization_Start_Region_Priority
--------------------------------
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,					RegionType)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	'REGION_PLAINS');


--------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType,					RegionType)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	'REGION_DESERT'),
		('CIVILIZATION_PG_RIODELAPLATA',	'REGION_TUNDRA'),
		('CIVILIZATION_PG_RIODELAPLATA',	'REGION_HILLS');

--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions
		(CivilizationType, 					ReligionType)
SELECT	'CIVILIZATION_PG_RIODELAPLATA', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_BRAZIL';



--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_0'),	
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_1'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_2'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_3'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_4'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_5'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_6'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_7'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_8'),
			('CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_PG_RIODELAPLATA_SPY_NAME_9');


--------------------------------	
-- DEFAULTS
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_PG_RIODELAPLATA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GREECE';
		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_PG_RIODELAPLATA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GREECE';
	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_PG_RIODELAPLATA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GREECE';

--==========================================================================================================================
--==========================================================================================================================