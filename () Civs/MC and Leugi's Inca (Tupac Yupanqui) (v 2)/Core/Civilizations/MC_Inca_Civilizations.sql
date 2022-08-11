--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 						Description, 				ShortDescription, 			Adjective, 						CivilopediaTag, 				DefaultPlayerColor, 		DerivativeCiv,			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 		SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage,			DawnOfManAudio)
SELECT		('CIVILIZATION_MC_INCA'), 	('TXT_KEY_MC_INCA_DESC'), 	('TXT_KEY_MC_INCA'),		('TXT_KEY_MC_INCA_ADJECTIVE'), 	('TXT_KEY_CIVLOPEDIA_MC_INCA'),	('PLAYERCOLOR_MC_INCA'), 	('CIVILIZATION_INCA'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	('MC_INCA_ATLAS'), 	0, 				('MC_INCA_ALPHA_ATLAS'), ('Inca'), 		('MC_INCA_Map.dds'), 	('TXT_KEY_DAWN_OF_MAN_MC_INCA_TEXT'), 	('MC_INCA_DoM.dds'),	('AS2D_DOM_SPEECH_MC_INCA')
FROM Civilizations WHERE (Type = 'CIVILIZATION_INCA');

--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_MC_INCA', 	'LEADER_MC_TUPAC_YUPANQUI');

--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
VALUES		('CIVILIZATION_MC_INCA', 	'BUILDINGCLASS_PALACE');
			
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
VALUES		('CIVILIZATION_MC_INCA', 	'TECH_AGRICULTURE');
			
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType,			Count,		UnitAIType)
VALUES		('CIVILIZATION_MC_INCA', 	'UNITCLASS_SETTLER',	1,			'UNITAI_SETTLE');
	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType,				UnitType)
VALUES		('CIVILIZATION_MC_INCA', 	'UNITCLASS_LONGSWORDSMAN',	'UNIT_MC_INCAN_CHASKA_CHUQUI'),
			('CIVILIZATION_MC_INCA', 	'UNITCLASS_GREAT_ADMIRAL',	'UNIT_MC_INCAN_YAMPU_RUNANCHA');
			
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_MC_INCA', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_INCA');

--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 		Green, 		Blue, 		Alpha)
VALUES		('COLOR_PLAYER_MC_INCA_ICON', 				0.855,		0.639,		0.125,		1),
			('COLOR_PLAYER_MC_INCA_BACKGROUND',			0.008,		0.247,		0.247,		1);

--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES		('PLAYERCOLOR_MC_INCA',	'COLOR_PLAYER_MC_INCA_ICON', 'COLOR_PLAYER_MC_INCA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 						
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CUSCO'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_QUITO'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CHAN_CHAN'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_MACHU'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_OLLANTAYTAMBO'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_VILCASHUAMAN'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_TIWANAKU'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CHOQUEQUIRAO'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CORIHUAYRACHINA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_TUMEBAMBA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_VILCABAMBA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_VITCOS'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_HUANUCO_PAMPA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_INGAPIRCA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_PUKA_TAMPU'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_USNU'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_KASHAMARKA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_PISAC'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CHUPACHOS'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_SHAUSHA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_HUARI'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_HUANCABAMBA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_ANDAHUAYLAS'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_PACHACAMAC'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_LLAQTAPATA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_HATUN_CANAR'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_INTI_WATANA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_PILLUCHU'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_CHUCUITO'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_PUKARA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_QALLA_QASA'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_AUACHUMBI'),
		('CIVILIZATION_MC_INCA', 	'TXT_KEY_CITY_NAME_MC_INCA_NINACHUMBI');			

--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_0'),	
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_1'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_2'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_3'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_4'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_5'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_6'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_7'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_8'),
			('CIVILIZATION_MC_INCA', 	'TXT_KEY_SPY_NAME_MC_INCA_9');
--==========================================================================================================================	
--==========================================================================================================================	
