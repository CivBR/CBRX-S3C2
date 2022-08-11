--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_CAMBODIA'), 		('TXT_KEY_CIV_SENSHI_CAMBODIA_DESC'), 		('TXT_KEY_CIV_SENSHI_CAMBODIA_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_CAMBODIA_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_CAMBODIA_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_CAMBODIA'), 		('PLAYERCOLOR_SENSHI_CAMBODIA'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_CAMBODIA_ATLAS'), 		0, 				('SENSHI_CAMBODIA_ALPHA_ATLAS'), 	('SIAM'), 	('CambodiaMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_CAMBODIA_TEXT'), 	('SihanoukDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_CAMBODIA')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SIAM');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SIAM' )
	THEN '_SIAM'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_CAMBODIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_01'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_02'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_03'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_04'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_05'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_06'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_07'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_08'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_09'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_10'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_11'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_12'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_13'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_14'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_15'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_16'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_17'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_18'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_19'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_20'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_21'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_22'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_23'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_24'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_25'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_26'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_27'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_28'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_CITY_NAME_SENSHI_CAMBODIA_29');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_CAMBODIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_CAMBODIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_CAMBODIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'REGION_JUNGLE');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'LEADER_SENSHI_SIHANOUK');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'UNITCLASS_MACHINE_GUN',	'UNIT_SENSHI_FUNK');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'BUILDINGCLASS_OPERA_HOUSE',	'BUILDING_SENSHI_PHEAPYON');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_CAMBODIA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_0'),	
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_1'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_2'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_3'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_4'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_5'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_6'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_7'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_8'),
			('CIVILIZATION_SENSHI_CAMBODIA', 	'TXT_KEY_SPY_NAME_SENSHI_CAMBODIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

