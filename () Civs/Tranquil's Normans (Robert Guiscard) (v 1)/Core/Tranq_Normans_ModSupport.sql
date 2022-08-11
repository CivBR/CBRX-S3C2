--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_DMS_DECOLONIZATION'),
		('FLAVOR_DMS_MERCENARY'),
		('FLAVOR_DMS_REFORM_GOVERNMENT'),
		('FLAVOR_DMS_REFORM_LEGAL'),
		('FLAVOR_DMS_REFORM_CULTURE'),
		('FLAVOR_DMS_REFORM_ECONOMIC'),
		('FLAVOR_DMS_REFORM_EDUCATION'),
		('FLAVOR_DMS_REFORM_FOREIGN'),
		('FLAVOR_DMS_REFORM_INDUSTRY'),
		('FLAVOR_DMS_REFORM_MILITARY'),
		('FLAVOR_DMS_REFORM_RELIGION'),
		('FLAVOR_DMS_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_DMS_SLAVERY'),
		('FLAVOR_DMS_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							 Flavor)
VALUES	('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_DECOLONIZATION',		 6),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_MERCENARY',				 8),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_RELIGIOUS_INTOLERANCE',	 4),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_GOVERNMENT',		 7),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_LEGAL',			 6),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_CULTURE',		 5),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_ECONOMIC',		 4),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_EDUCATION',		 5),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_FOREIGN',		 8),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_INDUSTRY',		 6),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_MILITARY',		 7),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_REFORM_RELIGION',		 4),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_SLAVERY',				 8),
		('LEADER_TRANQ_NORMANS',	'FLAVOR_DMS_STATE_RELIGION',		 4);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_TRANQ_NORMANS',	'Yahem',				65,		54,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Adriatic',				64,		47,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'AfriAsiaAust',			34,		76,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'AfriSouthEuro',		42,		72,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Apennine',				55,		36,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'AtlanticGiant',		162,	40,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Caucasus',				1,		46,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Cordiform',			40,		25,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'EarthMk3',				27,		56,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'EuroGiant',			82,		34,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'EuroLarge',			43,		33,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'EuroLargeNew',			47,		23,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'GreatestEarth',		54,		44,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Mediterranean',		54,		44,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'MediterraneanHuge',	52,		38,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'NorthAtlantic',		102,	27,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Orient',				20,		71,		null,	null,	null),
		('CIVILIZATION_TRANQ_NORMANS',	'Yagem',				25,		59,		null,	null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_TRANQ_NORMANS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_FRANCE';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TRANQ_NORMANS',		ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_FRANCE';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_TRANQ_NORMANS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- Gazebo's Community Patch        
--==========================================================================================================================
-- Missions
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS CustomModOptions(Name TEXT, Value INTEGER);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_CUSTOM_MISSIONS', 1);
INSERT INTO Missions
		(Type,					Description, 							Help,										DisabledHelp,									Time,	Build,	Target, Sound,	HotKey,	HotKeyPriority, OrderPriority,	Visible, IconIndex, IconAtlas)
SELECT	'MISSION_TS_CONQUEROR',	'TXT_KEY_MISSION_TS_CONQUEROR_DOMTM',	'TXT_KEY_MISSION_TS_CONQUEROR_DOMTM_HELP',	'TXT_KEY_MISSION_TS_CONQUEROR_DOMTM_DISABLED',	20,		0,		0,		0,		'KB_U',	2,				150,			1,		 0,		    'TS_CONQUEROR_ACTION_ATLAS'
WHERE EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'EVENTS_CUSTOM_MISSIONS' AND Value = 1);
--=============================================================
--=============================================================
--==========================================================================================================================
--==========================================================================================================================