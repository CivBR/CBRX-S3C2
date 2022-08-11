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
       (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_SAS_ETHANALLEN',	'POLICY_PHILOSOPHICAL_X',	'POLICY_AGGRESSIVE_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Ethan Allen [ICON_GREAT_PEOPLE][ICON_WAR]'
WHERE Type = 'LEADER_SAS_ETHANALLEN'
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
SET ArtStyleSuffix = '_AMERICA'
WHERE Type = 'CIVILIZATION_SAS_VERMONT'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND');
--==========================================================================================================================
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType, 					CultureType, CultureEra)
SELECT	'CIVILIZATION_SAS_VERMONT',	CultureType, 	 CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_AMERICA';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 							text 		default null,
	Value 							integer 	default 1);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
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
		(CivilizationType,			LinguisticType, ColonyName)
SELECT	'CIVILIZATION_SAS_VERMONT',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_FRANCE';
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
		(LeaderType,					FlavorType,						Flavor)
VALUES	('LEADER_SAS_ETHANALLEN',		'FLAVOR_JFD_DECOLONIZATION',	7);
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 				default null,
	ReligionType  					text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle					text 		 											default null,
	UniqueTitle						text 		 											default null,
	UseAdjective					boolean													default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,			DefaultTitle, UniqueTitle)
SELECT	'CIVILIZATION_SAS_VERMONT',	DefaultTitle, UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_AMERICA';
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
		(LeaderType,		FlavorType,				Flavor)
VALUES	('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_SLAVERY',	0);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 				text 	REFERENCES Civilizations(Type) 					default null,
	CultureType 					text													default null,
	ArtDefineTag					text													default	null,
	DefeatScreenEarlyTag			text													default	null,
	DefeatScreenMidTag				text													default	null,
	DefeatScreenLateTag				text													default	null,
	IdealsTag						text													default	null,
	SplashScreenTag					text													default	null,
	SoundtrackTag					text													default	null,
	UnitDialogueTag					text													default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_VERMONT',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_SAS_VERMONT'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
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
		(LeaderType,		 FlavorType,			Flavor)
VALUES	('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_MERCENARY',	6);
--====================================	
-- JFD PIETY
--====================================	
------------------------------------------------------------
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
		(LeaderType,		FlavorType,								Flavor)
VALUES	('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_STATE_RELIGION',			2);
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
		(CivilizationType,			CurrencyType)
SELECT	'CIVILIZATION_SAS_VERMONT',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--====================================	
-- JFD SOVEREIGNTY
--====================================	
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 			default null,
	CultureType	  					text 		 										default null,
	LegislatureName					text												default	null,
	OfficeTitle						text												default	null,
	GovernmentType					text												default	null,
	Weight							integer												default	0);

INSERT INTO Civilization_JFD_Governments	
		(CivilizationType,			GovernmentType, 			Weight)
SELECT	'CIVILIZATION_SAS_VERMONT',	'GOVERNMENT_JFD_REPUBLIC',  80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_FRANCE';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
-- CREATE TABLE IF NOT EXISTS 	
	-- Civilization_JFD_HeadsOfGovernment (	
	-- CivilizationType  				text 		REFERENCES Civilizations(Type) 			default null,
	-- CultureType						text 		 										default null,
	-- HeadOfGovernmentName			text 		 										default null);

-- INSERT INTO Civilization_JFD_HeadsOfGovernment
        -- (CivilizationType,      	HeadOfGovernmentName)
-- VALUES  ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_1'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_2'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_3'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_4'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_5'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_6'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_7'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_8'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_9'),
        -- ('CIVILIZATION_SAS_VERMONT',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_SAS_VERMONT_10');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 			default null,
	CultureType						text 		 										default null,
	ReligionType					text 		REFERENCES Religions(Type) 				default null,
	DefaultTitle					text 		 										default null,
	UniqueTitle						text 		 										default null,
	UseAdjective					boolean												default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,			DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_SAS_VERMONT',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_AMERICA';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (	
	CivilizationType  				text 	REFERENCES Civilizations(Type) 				default null,
	PoliticsType  					text 												default null,
	UniqueName						text												default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,			PoliticsType, UniqueName)
SELECT	'CIVILIZATION_SAS_VERMONT',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  			text 										 		default null,
	PolicyType  					text 	REFERENCES Policies(Type) 					default null,
	CivilizationType				text	REFERENCES Civilizations(Type) 				default	null,
	CultureType						text												default	null,
	GovernmentType  				text 	 											default null,
	ReligionType					text	REFERENCES Religions(Type) 					default	null,
	UniqueName						text												default	null);
		
INSERT INTO JFD_PrivyCouncillor_UniqueNames
		(CivilizationType,			PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_SAS_VERMONT',	PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_AMERICA';
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
		(LeaderType,		FlavorType,							 Flavor)
VALUES	('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 7),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_LEGAL',			 6),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_CULTURE',		 6),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_ECONOMIC',		 7),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_INDUSTRY',		 6),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_MILITARY',		 7),
		('LEADER_SAS_ETHANALLEN',	'FLAVOR_JFD_REFORM_RELIGION',		 6);
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	156,	69);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	31,	57);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	16,	35);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	21,	52);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	40,	50);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas Standard) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericaStandardStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericaStandardStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	40,	50);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Americas Giant) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AmericasGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AmericasGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	69,	122);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (North America Giant) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaGiantStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	100,	61);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (North America Huge) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAmericaHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAmericaHugeStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	98,	48);
------------------------------------------------------------	
-- Civilizations_AmericasStartPosition (Caribbean) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_SAS_VERMONT',	19,	42);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);