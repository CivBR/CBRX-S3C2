--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_DECOLONIZATION',			3),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_MERCENARY',					7),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_GOVERNMENT',			3),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_LEGAL',				4),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_CULTURE',			6),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_ECONOMIC',			6),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_FOREIGN',			7),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_INDUSTRY',			4),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_MILITARY',			5),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_SLAVERY',					4),
		('LEADER_GT_SUNGULUG',	'FLAVOR_JFD_STATE_RELIGION',			6);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support(FileName) VALUES ('Qocho_Decisions_Events.lua');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
			(Type, 						 		 						DefaultBuilding, 							Description, 									MaxGlobalInstances, MaxPlayerInstances)
VALUES		('BUILDINGCLASS_GT_DECISIONS_EVENTS', 		'BUILDING_GT_DECISIONS_IMPERIAL_WRITINGS', 		'TXT_KEY_GT_DECISIONS_IMPERIAL_WRITINGS',  			-1,					-1);
--------------------------------------------------------------------------------------------------------------------------	
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
			(Type, 						 							BuildingClass, 											Description,										Civilopedia,													Help,													Strategy,			Cost,	PrereqTech, 	ConquestProb,	IconAtlas, 				PortraitIndex)
VALUES		('BUILDING_GT_DECISIONS_IMPERIAL_WRITINGS', 			'BUILDINGCLASS_GT_DECISIONS_EVENTS',		'TXT_KEY_GT_DECISIONS_IMPERIAL_WRITINGS',		'TXT_KEY_GT_DECISIONS_IMPERIAL_WRITINGS_CIVILOPEDIA',		'TXT_KEY_GT_DECISIONS_IMPERIAL_WRITINGS_HELP',		null,				-1,  	null,			100,			'GT_QOCHO_ATLAS',	5);
--------------------------------------------------------------------------------------------------------------------------	
-- Buildings (Invisible)
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
			(Type, 						 				BuildingClass, 									Description,								GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_GT_DECISIONS_DEFENSE', 			'BUILDINGCLASS_GT_DECISIONS_EVENTS',	'TXT_KEY_BUILDING_GT_DECISIONS_DEFENSE',	-1, 			-1,   -1, 		 null,			1);

UPDATE Buildings
	SET Defense = 100
	WHERE Type = 'BUILDING_GT_DECISIONS_DEFENSE';
--------------------------------------------------------------------------------------------------------------------------	
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies	
		(Type,										Description)
VALUES	('POLICY_GT_DECISIONS_IMPERIAL_WRITINGS',	'TXT_KEY_DECISIONS_POLICY_GT_DECISIONS_IMPERIAL_WRITINGS'),
		('POLICY_GT_DECISIONS_WRITING_SYSTEM',		'TXT_KEY_DECISIONS_POLICY_GT_DECISIONS_WRITING_SYSTEM');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies	
		(Type,								Description)
VALUES	('POLICY_GT_EVENTS_STATUES_RUINED',	'TXT_KEY_DECISIONS_POLICY_GT_EVENTS_STATUES_RUINED');
--------------------------------------------------------------------------------------------------------------------------	
-- Buildings (Invisible)
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
			(Type, 						 						BuildingClass, 							Description,											GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_GT_STATUES_RUINED_SPECIALIST_ARTIST', 	'BUILDINGCLASS_GT_DECISIONS_EVENTS',	'TXT_KEY_BUILDING_GT_STATUES_RUINED_SPECIALIST_ARTIST',	-1, 			-1,   -1, 		 null,			1);

INSERT INTO Building_YieldChanges
		(BuildingType,										YieldType,			Yield)
VALUES	('BUILDING_GT_STATUES_RUINED_SPECIALIST_ARTIST',	'YIELD_CULTURE',	1);

INSERT INTO Building_Flavors
		(BuildingType,										FlavorType,			Flavor)
VALUES	('BUILDING_GT_STATUES_RUINED_SPECIALIST_ARTIST',	'FLAVOR_HAPPINESS',	20);
--=======================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--=======================================================================================================================
-- Historical Religions Complete
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_MANICHAEISM' )
		THEN 'RELIGION_MANICHAEISM'
		ELSE 'RELIGION_BUDDHISM' END
	) WHERE CivilizationType = 'CIVILIZATION_GT_QOCHO'

CREATE TRIGGER GT_HRTriggerQocho
AFTER INSERT ON Religions WHEN 'RELIGION_MANICHAEISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_MANICHAEISM'
	WHERE CivilizationType IN ('CIVILIZATION_GT_QOCHO')
END;
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				GovernmentType,				 Weight)
VALUES  ('CIVILIZATION_GT_QOCHO',		'GOVERNMENT_JFD_MONARCHY',	 80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix, 					X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES  ('CIVILIZATION_GT_QOCHO',	'Cordiform',				54,		34,		53,		35,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),	 	
		('CIVILIZATION_GT_QOCHO',	'EarthMk3',					67,		65,		68,		67,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),	 	
		('CIVILIZATION_GT_QOCHO',	'GreatestEarth',			78,		50,		79,		51,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),	 	
		('CIVILIZATION_GT_QOCHO',	'Yagem',					67,		65,		69,		67,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),	 	
		('CIVILIZATION_GT_QOCHO',	'Yahem',					93,		56,		94,		67,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO',	'Asia',						93,		56,		94,		67,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO',	'AsiaSmall',				1,		45,		3,		46,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO',	'EastAsia',					11,		69,		14,		71,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO',	'AfriAsiaAust',				87,		73,		89,		75,		'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO',	'AsiaSteppeGiant',			90,		21,		92,		34,		'TXT_KEY_CITY_NAME_GT_QOCHO_02');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_QOCHO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_Cultures
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_Cultures(ID INTEGER PRIMARY KEY AUTOINCREMENT, Type TEXT, 'Group' TEXT, Description TEXT, SuggestedCivs TEXT);
INSERT INTO ML_Cultures
			(Type,		'Group')
VALUES		('UYGHUR', 			'CULTURE_GROUP_ASIAN');

UPDATE ML_Cultures
SET Description = 'TXT_KEY_ML_CULTURE_' || Type,
	SuggestedCivs = 'TXT_KEY_ML_CULTURE_' || Type || '_SUGGESTEDCIVS'
WHERE Type = 'UYGHUR';
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Lakes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_Labels_Dynamic (ID INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT, MainType TEXT default "FEATURE", SubType TEXT, CultureType TEXT);
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_1'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_2'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_3'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_4'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_5'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_6'),
			('UYGHUR',			'FEATURE',	 	'LAKE',				'TXT_KEY_NAME_UYGHUR_LAKE_7');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Oceans
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_1'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_2'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_3'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_4'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_5'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_6'),
			('UYGHUR',			'REGION',	 	'OCEAN',			'TXT_KEY_NAME_UYGHUR_OCEAN_7');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Mountains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_1'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_2'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_3'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_4'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_5'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_6'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_7'),
			('UYGHUR',			'FEATURE',	 	'MOUNTAIN',			'TXT_KEY_NAME_UYGHUR_MOUNTAIN_8');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Regions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_1'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_2'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_3'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_4'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_5'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_6'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_7'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_8'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_9'),
			('UYGHUR',			'REGION',	 	'REGION',			'TXT_KEY_NAME_UYGHUR_REGION_10');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Deserts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_UYGHUR_DESERT_1'),
			('UYGHUR',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_UYGHUR_DESERT_2'),
			('UYGHUR',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_UYGHUR_DESERT_3'),
			('UYGHUR',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_UYGHUR_DESERT_4'),
			('UYGHUR',			'FEATURE',	 	'DESERT',			'TXT_KEY_NAME_UYGHUR_DESERT_5');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Forests
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_1'),
			('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_2'),
			('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_3'),
			('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_4'),
			('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_5'),
			('UYGHUR',			'FEATURE',	 	'FOREST',			'TXT_KEY_NAME_UYGHUR_FOREST_6');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Islands
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_UYGHUR_ISLAND_1'),
			('UYGHUR',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_UYGHUR_ISLAND_2'),
			('UYGHUR',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_UYGHUR_ISLAND_3'),
			('UYGHUR',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_UYGHUR_ISLAND_4'),
			('UYGHUR',			'REGION',	 	'ISLAND',			'TXT_KEY_NAME_UYGHUR_ISLAND_5');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_Cultures_Rivers
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ML_Labels_Dynamic
			(CultureType, 		MainType, 		SubType,			Name)
VALUES		('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_1'),
			('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_2'),
			('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_3'),
			('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_4'),
			('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_5'),
			('UYGHUR',			'FEATURE',	 	'RIVER',			'TXT_KEY_NAME_UYGHUR_RIVER_6');
--------------------------------------------------------------------------------------------------------------------------	
-- ML_CivCultures
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_GT_QOCHO',		'UYGHUR',		'ANY'),
			('CIVILIZATION_UYGHUR',			'UYGHUR',		'ANY');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType 					text														default null,
	SubCultureType 					text														default null,
	ArtDefineTag					text														default	null,
	DecisionsTag					text														default	null,
	DefeatScreenEarlyTag			text														default	null,
	DefeatScreenMidTag				text														default	null,
	DefeatScreenLateTag				text														default	null,
	IdealsTag						text														default	null,
	SplashScreenTag					text														default	null,
	SoundtrackTag					text														default	null,
	UnitDialogueTag					text														default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType,	DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag,			UnitDialogueTag)
SELECT	'CIVILIZATION_GT_QOCHO',	ArtDefineTag, CultureType, SubCultureType, 	DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, 'JFD_Steppe',	'AS2D_SOUND_JFD_MONGOL'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Steppe'
WHERE Type = 'CIVILIZATION_GT_QOCHO'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe');
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY							AUTOINCREMENT,
	Type					text												default	null,
	Header					text												default null,
	Description				text												default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,					Header,							Description)
VALUES	('TAB_AA_GT',			'TXT_KEY_TAB_AA_GT_HEADER',		'TXT_KEY_TAB_AA_GT_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	ModName					text							default null,
	ModID					text							default	null,	
	Authors					text							default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,					ModName,						ModID,							Authors)
VALUES	('MOD_GT_QOCHO',		'TXT_KEY_MOD_GT_QOCHO_NAME',	'TXT_KEY_MOD_GT_QOCHO_MODID',	'TXT_KEY_MOD_GT_QOCHO_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY							AUTOINCREMENT,
	Type					text												default	null,
	Achievopedia			text												default null,
	Header					text												default	null,	
	IconAtlas				text												default	null,	
	PortraitIndex			integer												default	0,
	ModType					text												default	null,	
	ModVersion				integer												default	0,
	Unlocked				boolean												default	0,
	LockedIconAtlas			text												default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer												default	23,
	UnlockSound				text												default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer												default	-1,
	Hidden					boolean												default	0,
	HiddenBorder			boolean												default	0,
	RequiredCivWin			text												default	null,
	RequiredCivLoss			text												default	null,
	RequiredCivKill			text												default	null);

INSERT INTO AdditionalAchievements
		(Type,						Header,									Achievopedia,							ModType,			ModVersion,		RequiredCivWin,				IconAtlas,			PortraitIndex)
VALUES	('AA_GT_QOCHO_SPECIAL',	'TXT_KEY_AA_GT_QOCHO_SPECIAL_HEADER',	'TXT_KEY_AA_GT_QOCHO_SPECIAL_TEXT',	'MOD_GT_QOCHO',	2,				null,						'GT_QOCHO_ATLAS',	0),
		('AA_GT_QOCHO_VICTORY',	'TXT_KEY_AA_GT_QOCHO_VICTORY_HEADER',	'TXT_KEY_AA_GT_QOCHO_VICTORY_TEXT',	'MOD_GT_QOCHO',	2,				'CIVILIZATION_GT_QOCHO',	'GT_QOCHO_ATLAS',	0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text												default	null,
	TabType					text												default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,			TabType)
VALUES	('AA_GT_QOCHO_SPECIAL',	'TAB_AA_GT'),
		('AA_GT_QOCHO_VICTORY',	'TAB_AA_GT');
--==========================================================================================================================
--==========================================================================================================================