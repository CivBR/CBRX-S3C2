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
        (LeaderType,             TraitOne,					 TraitTwo)
SELECT  'LEADER_US_FREDERICK_WILLIAM',  'POLICY_IMPERIALISTIC_X',	 'POLICY_PHILOSOPHICAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Frederick William [ICON_CITY_STATE][ICON_GREAT_PEOPLE]'
WHERE Type = 'LEADER_US_FREDERICK_WILLIAM'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_GERMANY'
WHERE Type = 'CIVILIZATION_US_BRANDENBURG'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_GERMANY');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest) 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroGiantStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,							X,	Y)
SELECT	'CIVILIZATION_US_BRANDENBURG',	X,	Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeStartPosition (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthWestEuropeStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_US_BRANDENBURG',	48,	27);
------------------------------------------------------------	
-- Civilizations_NorthAtlanticStartPosition (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthAtlanticStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_US_BRANDENBURG',	94,	44);
------------------------------------------------------------	
-- Civilizations_NorthSeaEuropeStartPosition (North Sea)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthSeaEuropeStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_US_BRANDENBURG',	115,55);
------------------------------------------------------------	
-- Civilizations_EuroLargeNewStartPosition (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeNewStartPosition
		(Type,							X,	Y)
VALUES	('CIVILIZATION_US_BRANDENBURG',	49, 54);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Euro Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_EuroLargeNewRequestedResource (Europe (Greatest) Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeNewRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeNewRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------	
-- Civilizations_NorthSeaEuropeNewRequestedResource (North Sea)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthSeaEuropeNewRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthSeaEuropeNewRequestedResource
		(Type, 						Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_BRANDENBURG',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthSeaEuropeNewRequestedResource WHERE Type = 'CIVILIZATION_GERMANY';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,	CultureEra)
VALUES	('CIVILIZATION_US_BRANDENBURG',	'GERMANIC',		'ANY');
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
		(CivilizationType, 				ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_US_BRANDENBURG',	null,									'JFD_Germanic'),
		('CIVILIZATION_US_BRANDENBURG',	'TXT_KEY_COLONY_NAME_US_BRANDENBURG_01',	null),
		('CIVILIZATION_US_BRANDENBURG',	'TXT_KEY_COLONY_NAME_US_BRANDENBURG_02',	null);
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
		(LeaderType,				FlavorType,						Flavor)
VALUES	('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_DECOLONIZATION',	4);
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
		(CivilizationType,				DefaultTitle,		UniqueTitle)
SELECT	'CIVILIZATION_US_BRANDENBURG',		DefaultTitle,		UniqueTitle
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_GERMANY';
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
		(LeaderType,					FlavorType,				Flavor)
VALUES	('LEADER_US_FREDERICK_WILLIAM',		'FLAVOR_JFD_SLAVERY',	3);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag,	CultureType,	DefeatScreenEarlyTag,	DefeatScreenMidTag,	DefeatScreenLateTag,	IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_US_BRANDENBURG',	ArtDefineTag,	CultureType,	DefeatScreenEarlyTag,   DefeatScreenMidTag,	DefeatScreenLateTag,	IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Central'
WHERE Type = 'CIVILIZATION_US_BRANDENBURG'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Central')
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
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_MERCENARY',					4);
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
		(LeaderType,				FlavorType,								Flavor)
VALUES	('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_STATE_RELIGION',			6);
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
SELECT	'CIVILIZATION_US_BRANDENBURG',		CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_GERMANY';
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
		(CivilizationType,				LegislatureName,										 OfficeTitle,															GovernmentType,				Weight)
VALUES	('CIVILIZATION_US_BRANDENBURG',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_US_BRANDENBURG', 'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_US_BRANDENBURG',	'GOVERNMENT_JFD_MONARCHY',	100);
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
		(CivilizationType,					DefaultTitle,	UniqueTitle,	UseAdjective)
SELECT	'CIVILIZATION_US_BRANDENBURG',		DefaultTitle,	UniqueTitle,	UseAdjective
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_GERMANY';
--------------------------------------------------------------------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);

INSERT INTO JFD_PrivyCouncillor_UniqueNames
		(CivilizationType,					PrivyCouncillorType, UniqueName)
SELECT	'CIVILIZATION_US_BRANDENBURG',		PrivyCouncillorType, UniqueName
FROM JFD_PrivyCouncillor_UniqueNames WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 				default null,
	PoliticsType  						text 													default null,
	UniqueName							text													default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType,	UniqueName)
SELECT	'CIVILIZATION_US_BRANDENBURG',		PoliticsType,	UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_GERMANY';
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
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 4),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_LEGAL',			 5),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_CULTURE',		 7),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_ECONOMIC',		 8),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_FOREIGN',		 6),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_MILITARY',		 9),
		('LEADER_US_FREDERICK_WILLIAM',	'FLAVOR_JFD_REFORM_RELIGION',		 7);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  					text 	REFERENCES Leaders(Type) 	default	null,
	ReformType						text								default	null);
	
INSERT INTO Leader_JFD_Reforms
		(LeaderType,				ReformType)
VALUES	('LEADER_US_FREDERICK_WILLIAM',	'REFORM_JFD_EXECUTIVE_ABSOLUTE'),
		('LEADER_US_FREDERICK_WILLIAM',	'REFORM_JFD_HERALDRY_MILITARY'),
		('LEADER_US_FREDERICK_WILLIAM',	'REFORM_JFD_RECRUITMENT_PROFESSIONAL'),
		('LEADER_US_FREDERICK_WILLIAM',	'REFORM_JFD_TECHNOLOGY_TACTICS');
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Brandenburg_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
		(Type,											Description)
VALUES	('POLICY_DECISIONS_US_BRANDENBURG_LAWS',		'POLICY_DECISIONS_US_BRANDENBURG_LAWS'),
		('POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA',		'POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA');
------------------------------
-- Policy_BuildingClassHappiness
------------------------------	
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType, 										BuildingClassType, 						Happiness)
VALUES	('POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA', 		'BUILDINGCLASS_BARRACKS',				1),
		('POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA', 		'BUILDINGCLASS_ARMORY', 				1),
		('POLICY_DECISIONS_US_BRANDENBURG_PRUSSIA', 		'BUILDINGCLASS_MILITARY_ACADEMY',		1);
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------	
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType, 									BuildingClassType, 				ProductionModifier)
VALUES	('POLICY_DECISIONS_US_BRANDENBURG_LAWS', 		'BUILDINGCLASS_COURTHOUSE',		50);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_PROTESTANT_CALVINISM'
WHERE CivilizationType = 'CIVILIZATION_US_BRANDENBURG'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_PROTESTANT_CALVINISM');
--==========================================================================================================================
--==========================================================================================================================