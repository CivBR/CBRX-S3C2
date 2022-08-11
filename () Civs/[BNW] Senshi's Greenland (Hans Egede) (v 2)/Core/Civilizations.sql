--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_SENSHI_GREENLAND'), 		('TXT_KEY_CIV_SENSHI_GREENLAND_DESC'), 		('TXT_KEY_CIV_SENSHI_GREENLAND_SHORT_DESC'),		('TXT_KEY_CIV_SENSHI_GREENLAND_ADJECTIVE'), 		('TXT_KEY_CIV5_SENSHI_GREENLAND_TEXT_1'), 		('TXT_KEY_CIV5_SENSHI_GREENLAND'), 		('PLAYERCOLOR_SENSHI_GREENLAND'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('SENSHI_GREENLAND_ATLAS'), 		0, 				('SENSHI_GREENLAND_ALPHA_ATLAS'), 	SoundtrackTag, 	('GreenlandMap412.dds'), 	('TXT_KEY_CIV5_DOM_SENSHI_GREENLAND_TEXT'), 	('EgedeDoM.dds'),	('AS2D_DOM_SPEECH_SENSHI_GREENLAND')
FROM Civilizations WHERE (Type = 'CIVILIZATION_DENMARK');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK' )
	THEN '_DENMARK'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_SENSHI_GREENLAND';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_01'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_02'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_03'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_04'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_05'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_06'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_07'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_08'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_09'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_10'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_11'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_12'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_13'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_14'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_15'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_16'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_17'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_18'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_19'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_20'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_21'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_22'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_23'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_24'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_25'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_26'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_27'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_28'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_29'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_CITY_NAME_SENSHI_GREENLAND_30');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_SENSHI_GREENLAND'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_SENSHI_GREENLAND'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_SENSHI_GREENLAND'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_DENMARK');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================			
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	1);	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	'LEADER_SENSHI_EGEDE');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	'UNITCLASS_PROPHET',	'UNIT_SENSHI_APOSTLE');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	'BUILDINGCLASS_TEMPLE',		'BUILDING_SENSHI_MISSIONSHUS');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_SENSHI_GREENLAND', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_GERMANY');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_0'),	
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_1'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_2'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_3'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_4'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_5'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_6'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_7'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_8'),
			('CIVILIZATION_SENSHI_GREENLAND', 	'TXT_KEY_SPY_NAME_SENSHI_GREENLAND_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

