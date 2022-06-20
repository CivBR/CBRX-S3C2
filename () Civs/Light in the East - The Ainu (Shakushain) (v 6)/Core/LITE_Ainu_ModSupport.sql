--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
----------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_SAMAN" )
		THEN "RELIGION_SAMAN"
		ELSE "RELIGION_SHINTO" END
	) WHERE CivilizationType = "CIVILIZATION_LITE_AINU";
--==========================================================================================================================
-- HAZEL'S MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,	CultureEra)
VALUES	('CIVILIZATION_LITE_AINU',	'PACIFIC',		'ANY');
--==========================================================================================================================
-- BRUTALSAMURAI'S ETHNIC UNITS / GEDEMON'S R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_JAPAN' )
	THEN '_JAPAN'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_LITE_AINU';
--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
-- DMS_Civilopedia_HideFromPedia
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('BUILDING_LITE_AINU_DUMMY');

UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_LITE_AINU'
WHERE Type = 'CIVILIZATION_JAPAN';
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
----------------------------------------------------------------------------------------------------------------------------	
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
----------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_DECOLONIZATION',		 3),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_MERCENARY',				 5),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_RELIGIOUS_INTOLERANCE',	 3),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_GOVERNMENT',		 6),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_LEGAL',			 7),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_CULTURE',		 6),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_ECONOMIC',		 3),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_EDUCATION',		 4),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_FOREIGN',		 7),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_INDUSTRY',		 8),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_MILITARY',		 8),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_REFORM_RELIGION',		 5),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_SLAVERY',				 5),
		('LEADER_LITE_SHAKUSHAIN',	'FLAVOR_DMS_STATE_RELIGION',		 2);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
-- Civilizations_YnAEMP
----------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y)
values	('CIVILIZATION_LITE_AINU',		'Yagem',				96,		67),
		('CIVILIZATION_LITE_AINU',		'Yahem',				114,	57),
		('CIVILIZATION_LITE_AINU',		'GreatestEarth',		99,		56),
		('CIVILIZATION_LITE_AINU',		'Cordiform',			55,		49),
		('CIVILIZATION_LITE_AINU',		'Pacific',				46,		63),
		('CIVILIZATION_LITE_AINU',		'AsiaSmall',			50,		42),
		('CIVILIZATION_LITE_AINU',		'Asia',					93,		58),
		('CIVILIZATION_LITE_AINU',		'EastAsia',				65,		72),
		('CIVILIZATION_LITE_AINU',		'NorthEastAsia',		48,		47);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_LITE_AINU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_JAPAN';
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
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType,	DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag,		SplashScreenTag,	SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_LITE_AINU',		ArtDefineTag, CultureType, SubCultureType,	DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag,		SplashScreenTag,	SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JAPAN';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Polar'
WHERE Type = 'CIVILIZATION_LITE_AINU'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Polar')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================