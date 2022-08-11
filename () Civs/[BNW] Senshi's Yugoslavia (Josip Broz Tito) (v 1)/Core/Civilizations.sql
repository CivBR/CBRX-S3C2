--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_YUGOSLAVIA'), 		('TXT_KEY_CIV_SENSHI_YUGOSLAVIA_DESC'), 		('TXT_KEY_CIV_SENSHI_YUGOSLAVIA_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_YUGOSLAVIA_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_YUGOSLAVIA_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_YUGOSLAVIA'), 		('PLAYERCOLOR_SENSHI_YUGOSLAVIA'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_YUGOSLAVIA_ATLAS'), 		0, 				('SENSHI_YUGOSLAVIA_ALPHA_ATLAS'), 	('GREECE'), 	('TitoMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_TITO_TEXT'), 	('TitoDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_TITO')
FROM Civilizations WHERE (Type = 'CIVILIZATION_GREECE');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLAND' )
	THEN '_POLAND'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SENSHI_YUGOSLAVIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_01'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_02'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_03'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_04'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_05'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_06'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_07'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_08'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_09'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_10'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_11'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_12'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_13'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_14'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_15'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_16'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_17'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_18'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_19'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_20'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_21'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_22'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_23'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_24'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_25'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_26'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_27'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_28'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_29'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_30'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_31'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_32'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_33'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_34'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_35'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_36'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_37'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_38'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_39'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_CITY_NAME_SENSHI_YUGOSLAVIA_40');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_YUGOSLAVIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_GREECE');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_YUGOSLAVIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_GREECE');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_YUGOSLAVIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_GREECE');
--==========================================================================================================================	
-- Civilization_Start_Along_River
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_River
			(CivilizationType, 					StartAlongRiver)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'LEADER_SENSHI_TITO');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'UNITCLASS_MACHINE_GUN',		'UNIT_SENSHI_PARTISAN');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'BUILDINGCLASS_THEATRE',	'BUILDING_SENSHI_SPOMENIK');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_YUGOSLAVIA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_0'),	
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_1'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_2'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_3'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_4'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_5'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_6'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_7'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_8'),
			('CIVILIZATION_SENSHI_YUGOSLAVIA', 	'TXT_KEY_SPY_NAME_SENSHI_YUGOSLAVIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

