--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,					Response,												Bias)
VALUES	('LEADER_ERJAR_BENGAL',		'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_GENERIC_ERJAR_BENGAL_INFLUENTIAL_ON_AI_1%',		1),
		('LEADER_ERJAR_BENGAL',		'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_GENERIC_ERJAR_BENGAL_INFLUENTIAL_ON_AI_1%',		1);
--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 				LinguisticType)
SELECT	'CIVILIZATION_ERJAR_BENGAL',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_INDIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_ERJAR_BENGAL',		'AfriAsiaAust',			84,		56,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'Asia',					37,		33,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'Cordiform',			59,		23,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'EarthMk3',				71,		49,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'EastAsia',				10,		47,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'GreatestEarth',		79,		38,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'IndianOcean',			56,		65,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'India',				62,		57,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'Orient',				125,	40,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'SouthAsiaHuge',		62,		57,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'Yagem',				65,		49,		null,	null,	null),
		('CIVILIZATION_ERJAR_BENGAL',		'Yahem',				93,		43,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_ERJAR_BENGAL',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INDIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,    SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,              ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_ERJAR_BENGAL',    ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
    
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ERJAR_BENGAL')
WHERE Type = 'CIVILIZATION_ERJAR_BENGAL';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--GOVERNMENT_JFD_THEOCRACY
--GOVERNMENT_JFD_DICTATORSHIP
--GOVERNMENT_JFD_SHOGUNATE
--GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_MANDATE_OF_HEAVEN
--GOVERNMENT_JFD_CALIPHATE

CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				 Weight)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'GOVERNMENT_JFD_MONARCHY',		60),
		('CIVILIZATION_ERJAR_BENGAL',	'GOVERNMENT_JFD_PRINCIPALITY',	30);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_ERJAR_BENGAL',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_INDIA';
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
--POLICY_AGGRESSIVE_X [ICON_WAR] (Military)
--POLICY_CHARISMATIC_X [ICON_HAPPINESS_1] (Happiness)
--POLICY_CREATIVE_X [ICON_CULTURE] (Culture)
--POLICY_DIPLOMATIC_X [ICON_INFLUENCE] (City States)
--POLICY_EXPANSIVE_X [ICON_FOOD] (Food)
--POLICY_FINANCIAL_X [ICON_GOLD] (City Connections, Domestic Trade Routes)
--POLICY_IMPERIALISTIC_X [ICON_CITY_STATE] (Admirals, Generals)
--POLICY_INDUSTRIOUS_X [ICON_PRODUCTION] (Production)
--POLICY_INVENTIVE_X [ICON_RESEARCH] (Science)
--POLICY_MERCANTILE_X [ICON_TRADE] (Gold)
--POLICY_PHILOSOPHICAL_X [ICON_GREAT_PEOPLE] (Great People)
--POLICY_PROTECTIVE_X [ICON_STRENGTH] (Defense)
--POLICY_SEAFARING_X [ICON_MOVES] (Navy)
--POLICY_SPIRITUAL_X [ICON_PEACE] (Faith)

CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);

INSERT INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
VALUES  ('LEADER_ERJAR_BENGAL',	'POLICY_MERCANTILE_X',	'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Shuja-ud-Din Muhammad Khan [ICON_TRADE][ICON_PRODUCTION]'
WHERE Type = 'LEADER_ERJAR_BENGAL'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_INDIA'
WHERE Type = 'CIVILIZATION_ERJAR_BENGAL'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_INDIA');
--==========================================================================================================================
-- Tomatekh's Historical Religions and Hindu Denominations
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType =
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type=' RELIGION_ISLAM_SHIA')
THEN ' RELIGION_ISLAM_SHIA'
ELSE 'RELIGION_ISLAM' END
) WHERE CivilizationType = 'CIVILIZATION_ERJAR_BENGAL';
--==========================================================================================================================
-- TROLLER0001's ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Header					text							default null,
	Description				text							default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,				Header,								Description)
VALUES	('TAB_JAR_CIVS',	'TXT_KEY_TAB_JAR_CIVS_HEADER',		'TXT_KEY_TAB_JAR_CIVS_DESC');
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
		(Type,					ModName,							ModID,								Authors)
VALUES	('MOD_ERJAR_BENGAL',	'TXT_KEY_MOD_ERJAR_BENGAL_NAME',	'TXT_KEY_MOD_ERJAR_BENGAL_MODID',	'TXT_KEY_MOD_ERJAR_BENGAL_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Achievopedia			text							default null,
	Header					text							default	null,	
	IconAtlas				text							default	null,	
	PortraitIndex			integer							default	0,
	ModType					text							default	null,	
	ModVersion				integer							default	0,
	Unlocked				boolean							default	0,
	LockedIconAtlas			text							default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer							default	23,
	UnlockSound				text							default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer							default	-1,
	Hidden					boolean							default	0,
	HiddenBorder			boolean							default	0,
	RequiredCivWin			text							default	null,
	RequiredCivLoss			text							default	null,
	RequiredCivKill			text							default	null);

INSERT INTO AdditionalAchievements
		(Type,							Header,										Achievopedia,						ModType,		ModVersion,		RequiredCivWin,				IconAtlas,		 PortraitIndex)
VALUES	('AA_ERJAR_BENGAL_SPECIAL',	'TXT_KEY_AA_ERJAR_BENGAL_SPECIAL_HEADER',	'TXT_KEY_AA_ERJAR_BENGAL_SPECIAL_TEXT',	'MOD_ERJAR_BENGAL',	1,		null,							'ERJAR_BENGAL_ICON_ATLAS',	 6),
		('AA_ERJAR_BENGAL_VICTORY',	'TXT_KEY_AA_ERJAR_BENGAL_VICTORY_HEADER',	'TXT_KEY_AA_ERJAR_BENGAL_VICTORY_TEXT',	'MOD_ERJAR_BENGAL',	1,		'CIVILIZATION_ERJAR_BENGAL',	'ERJAR_BENGAL_ICON_ATLAS',	 5);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,			TabType)
VALUES	('AA_ERJAR_BENGAL_SPECIAL',	'TAB_JAR_CIVS'),
		('AA_ERJAR_BENGAL_VICTORY',	'TAB_JAR_CIVS');
--==========================================================================================================================	
-- Gazebo's Community Balance Patch
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);

UPDATE CustomModOptions SET Value=1 WHERE Name='EVENTS_CITY_CONNECTIONS';
UPDATE CustomModOptions SET Value=1 WHERE Name='EVENTS_TERRAFORMING';

UPDATE Traits SET RiverTradeRoad = '1'
WHERE Type = 'TRAIT_ERJAR_BENGAL' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_LEADERS' AND Value= 1 );

UPDATE Buildings SET FinishLandTRTourism = '10'
WHERE Type = 'BUILDING_ERJAR_KATRA' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

INSERT INTO Building_SpecialistYieldChangesLocal
		(BuildingType, 			SpecialistType, 		YieldType, 			Yield)
SELECT	'BUILDING_ERJAR_KATRA', 'SPECIALIST_MERCHANT', 'YIELD_PRODUCTION', 	1	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 ) UNION ALL
SELECT	'BUILDING_ERJAR_KATRA', 'SPECIALIST_ENGINEER', 'YIELD_GOLD', 		1	WHERE EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );

INSERT INTO Building_YieldPerXTerrainTimes100
		(BuildingType, 			TerrainType, YieldType, Yield)
SELECT	'BUILDING_ERJAR_KATRA', TerrainType, YieldType, Yield
WHERE Type = 'BUILDING_CARAVANSARY' AND EXISTS (SELECT * FROM COMMUNITY WHERE Type='COMMUNITY_CORE_BALANCE_BUILDINGS' AND Value= 1 );
--==========================================================================================================================		
--==========================================================================================================================	
