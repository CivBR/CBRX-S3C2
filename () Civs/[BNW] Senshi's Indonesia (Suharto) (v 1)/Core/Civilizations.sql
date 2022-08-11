--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 			ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_INDONESIA'), 		('TXT_KEY_CIV_SENSHI_INDONESIA_DESC'), 		('TXT_KEY_CIV_SENSHI_INDONESIA_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_INDONESIA_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_INDONESIA_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_INDONESIA'), 		('PLAYERCOLOR_SENSHI_INDONESIA'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_INDONESIA_ATLAS'), 		0, 				('SENSHI_INDONESIA_ALPHA_ATLAS'), 	('INDONESIA'), 	('SuhartoMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_SUHARTO_TEXT'), 	('SuhartoDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_SUHARTO')
FROM Civilizations WHERE (Type = 'CIVILIZATION_INDONESIA');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_INDONESIA' )
	THEN '_INDONESIA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_SENSHI_INDONESIA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_01'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_02'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_03'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_04'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_05'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_06'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_07'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_08'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_09'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_10'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_11'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_12'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_13'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_14'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_15'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_16'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_17'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_18'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_19'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_20'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_21'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_22'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_23'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_24'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_25'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_26'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_27'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_28'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_29'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_30'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_31'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_32'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_33'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_34'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_35'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_36'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_CITY_NAME_SENSHI_INDONESIA_37');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_INDONESIA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_INDONESIA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_INDONESIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_INDONESIA');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	'LEADER_SENSHI_SUHARTO');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 		UnitType)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	'UNITCLASS_PARATROOPER',	'UNIT_SENSHI_KOPASSUS');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType,			BuildingType)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	'BUILDINGCLASS_CONSTABLE',	'BUILDING_SENSHI_PANCASILA_MONUMENT');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_INDONESIA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_0'),	
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_1'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_2'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_3'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_4'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_5'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_6'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_7'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_8'),
			('CIVILIZATION_SENSHI_INDONESIA', 	'TXT_KEY_SPY_NAME_SENSHI_INDONESIA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

