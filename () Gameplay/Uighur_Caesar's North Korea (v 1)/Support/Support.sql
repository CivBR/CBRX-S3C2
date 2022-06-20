--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,               TraitTwo)
SELECT  'LEADER_UC_KIM',		'POLICY_AGGRESSIVE_X',	 'POLICY_PROTECTIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Kim il-sung [ICON_WAR][ICON_STRENGTH]'
WHERE Type = 'LEADER_UC_KIM'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_BEST_KOREA'
WHERE Type = 'CIVILIZATION_UC_BEST_KOREA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_BEST_KOREA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	89,	64);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	109,	52);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	60,	40);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	90,	55);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_UC_BEST_KOREA',					21,		39,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaSmallStartPosition (East Asia Standard)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaSmallStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaSmallStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_UC_BEST_KOREA',					38,		38,		null,	null);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_AsiaStartPosition (Asia)
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_UC_BEST_KOREA',					78,		56,		null,	null);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
SELECT	'CIVILIZATION_UC_BEST_KOREA',	CultureType,	CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_KOREA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================
-- JFD CLAIMS
--====================================
------------------------------------------------------------
-- Traits
------------------------------------------------------------	
UPDATE Buildings
SET Happiness = 0
WHERE Type = 'BUILDING_UC_NK_FORT_HAPPY'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);

INSERT INTO Building_YieldModifiers 
		(BuildingType, 						YieldType,				Yield)
SELECT	Type, 								'YIELD_JFD_LOYALTY',	5
FROM Buildings WHERE BuildingClass IN ('BUILDINGCLASS_UC_NK_FORT_HAPPY')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);

UPDATE Language_en_US
SET Text = 'Constructing Citadels triggers We Love the King Days, while worked Forts extend them, and both yield +2 [ICON_CULTURE] Culture and +5% [ICON_JFD_BLUE_FIST] Loyalty. Military Buildings receive free [ICON_GREAT_WORK] Great Work slots.'
WHERE Tag = 'TXT_KEY_TRAIT_UC_HERMIT' 
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1)
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CITIES' AND Value > 1);
--====================================	
-- JFD COLONIES
--====================================	
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,				LinguisticType)
SELECT	'CIVILIZATION_UC_BEST_KOREA',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_KOREA';
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,						Flavor)
VALUES	('LEADER_UC_KIM',		'FLAVOR_JFD_DECOLONIZATION',	8);
--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,				Flavor)
VALUES	('LEADER_UC_KIM',		'FLAVOR_JFD_SLAVERY',	9);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,					DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_UC_BEST_KOREA',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_KOREA';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------
CREATE TABLE IF NOT EXISTS
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(TYPE)          DEFAULT NULL,
    CultureType                                 text                                            DEFAULT NULL,
    ArtDefineTag                                text                                            DEFAULT NULL,
    DefeatScreenEarlyTag                        text                                            DEFAULT NULL,
    DefeatScreenMidTag                          text                                            DEFAULT NULL,
    DefeatScreenLateTag                         text                                            DEFAULT NULL,
    IdealsTag                                   text                                            DEFAULT NULL,
    SplashScreenTag                             text                                            DEFAULT NULL,
    SoundtrackTag                               text                                            DEFAULT NULL,
    UnitDialogueTag                             text                                            DEFAULT NULL);
 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,              ArtDefineTag,       CultureType,                DefeatScreenEarlyTag, DefeatScreenMidTag,   DefeatScreenLateTag,    IdealsTag,          SplashScreenTag,    SoundtrackTag,      UnitDialogueTag)
SELECT  'CIVILIZATION_UC_BEST_KOREA',   'JFD_TOTALITARIAN', 'CULTURE_JFD_TOTALITARIAN', DefeatScreenEarlyTag, DefeatScreenMidTag,   DefeatScreenLateTag,    'JFD_Totalitarian', 'JFD_Totalitarian', 'JFD_Totalitarian', 'AS2D_SOUND_JFD_KOREAN'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_KOREA';
------------------------------
-- Civilizations
------------------------------
UPDATE Civilizations
SET SoundtrackTag = 'JFD_Totalitarian'
WHERE TYPE = 'CIVILIZATION_UC_BEST_KOREA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE TYPE = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND VALUE = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD AND POUAKAI MERCENARIES
--====================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_UC_KIM',		'FLAVOR_JFD_MERCENARY',					4);
--====================================	
-- JFD PIETY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_UC_KIM',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		8),
		('LEADER_UC_KIM',		'FLAVOR_JFD_STATE_RELIGION',			7);
--====================================
-- JFD PROSPERITY
--====================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_UC_BEST_KOREA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_KOREA';
--====================================	
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				LegislatureName,											OfficeTitle,														GovernmentType,				Weight)
SELECT	'CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA',	'GOVERNMENT_JFD_DICTATORSHIP',	100
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_KOREA';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
VALUES  ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_1'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_2'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_3'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_4'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_5'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_6'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_7'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_8'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_9'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_10'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_11'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_12'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_13'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_14'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_15'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_16'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_17'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_18'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_19'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_20'),
        ('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_UC_BEST_KOREA_21');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	CultureType							text 		 											default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle						text 		 											default null,
	UniqueTitle							text 		 											default null,
	UseAdjective						boolean													default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle,											UniqueTitle,															UseAdjective)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_GOVERNMENT_UC_BEST_KOREA',	0),	
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_UC_BEST_KOREA',		0);
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				UniqueName,												PoliticsType)
VALUES	('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_ASSEMBLY_JFD_MILITARY_UC_BEST_KOREA',		'ASSEMBLY_JFD_MILITARY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_UC_BEST_KOREA',	'FACTION_JFD_NATIONALIST'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_FACTION_JFD_POPULARIST_UC_BEST_KOREA',		'FACTION_JFD_POPULARIST'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_UC_BEST_KOREA',	'FACTION_JFD_REVOLUTIONARY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_BURGHERS_UC_BEST_KOREA',			'PARTY_JFD_BURGHERS'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_CLERGY_UC_BEST_KOREA',			'PARTY_JFD_CLERGY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_UC_BEST_KOREA',		'PARTY_JFD_COMMUNIST'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_UC_BEST_KOREA',		'PARTY_JFD_CONSERVATIVE'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_UC_BEST_KOREA',			'PARTY_JFD_FASCIST'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_LIBERAL_UC_BEST_KOREA',			'PARTY_JFD_LIBERAL'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_UC_BEST_KOREA',		'PARTY_JFD_LIBERTARIAN'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_NOBILITY_UC_BEST_KOREA',			'PARTY_JFD_NOBILITY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_REACTIONARY_UC_BEST_KOREA',		'PARTY_JFD_REACTIONARY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_UC_BEST_KOREA',	'PARTY_JFD_REVOLUTIONARY'),
		('CIVILIZATION_UC_BEST_KOREA',	'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_UC_BEST_KOREA',		'PARTY_JFD_SOCIALIST');
------------------------------------------------------------			
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_GOVERNMENT',		8),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_LEGAL',			7),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_CULTURE',		9),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_ECONOMIC',		3),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_FOREIGN',		7),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_INDUSTRY',		4),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_MILITARY',		10),
		('LEADER_UC_KIM',		'FLAVOR_JFD_REFORM_RELIGION',		8);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,			ReformType)
VALUES	('LEADER_UC_KIM',		'REFORM_JFD_LEGISLATURE_D_PERSONAL'),
		('LEADER_UC_KIM',		'REFORM_JFD_MARKET_PLANNED'),
		('LEADER_UC_KIM',		'REFORM_JFD_SPEECH_CENSORED');
		--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_MUISM'
WHERE CivilizationType = 'CIVILIZATION_UC_BEST_KOREA'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_MUISM');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('NKDecisions.lua');
--==========================================================================================================================
--==========================================================================================================================