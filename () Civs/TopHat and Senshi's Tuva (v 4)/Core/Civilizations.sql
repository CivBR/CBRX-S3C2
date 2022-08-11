--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 									Description, 								ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 						DefaultPlayerColor, 					ArtDefineTag, ArtStyleType,		ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_THP_SEN_TUVA'), 		('TXT_KEY_CIV_THP_SEN_TUVA_DESC'), 		('TXT_KEY_CIV_THP_SEN_TUVA_SHORT_DESC'),		('TXT_KEY_CIV_THP_SEN_TUVA_ADJECTIVE'), 		('TXT_KEY_CIV5_THP_SEN_TUVA_TEXT_1'), 		('TXT_KEY_CIV5_THP_SEN_TUVA'), 		('PLAYERCOLOR_THP_SEN_TUVA'), 		ArtDefineTag, ArtStyleType,		ArtStyleSuffix,	ArtStylePrefix,	('THP_SEN_TUVA_ATLAS'), 		0, 				('THP_SEN_TUVA_ALPHA_ATLAS'), 	('MONGOL'), 	('TuvaMap412.dds'), 	('TXT_KEY_CIV5_DOM_THP_SEN_DONDUK_TEXT'), 	('DawnPNG_Tuva.dds'),	('AS2D_DOM_SPEECH_THP_SEN_DONDUK')
FROM Civilizations WHERE (Type = 'CIVILIZATION_MONGOL');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_MONGOL' )
	THEN '_MONGOL'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_THP_SEN_TUVA';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_01'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_02'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_03'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_04'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_05'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_06'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_07'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_08'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_09'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_10'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_11'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_12'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_13'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_14'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_15'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_16'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_17'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_18'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_19'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_20'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_21'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_22'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_23'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_24'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_25'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_26'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_27'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_28'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_29'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_30'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_31'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_CITY_NAME_THP_SEN_TUVA_32');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_THP_SEN_TUVA'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_THP_SEN_TUVA'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_THP_SEN_TUVA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_THP_SEN_TUVA', 	'REGION_HILLS');	
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_THP_SEN_TUVA', 	'LEADER_THP_SEN_DONDUK');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 					UnitType)
VALUES		('CIVILIZATION_THP_SEN_TUVA', 	'UNITCLASS_MUSICIAN',	'UNIT_THP_SEN_THROAT_SINGER');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		'CIVILIZATION_THP_SEN_TUVA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_0'),	
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_1'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_2'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_3'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_4'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_5'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_6'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_7'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_8'),
			('CIVILIZATION_THP_SEN_TUVA', 	'TXT_KEY_SPY_NAME_THP_SEN_TUVA_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			

