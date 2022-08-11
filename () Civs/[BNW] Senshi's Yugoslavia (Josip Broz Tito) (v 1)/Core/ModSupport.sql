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
--------------------------------------------------------------------------------------------------------------------------
-- Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LAW'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
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
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_SENSHI_TITO',	'FLAVOR_JFD_DECOLONIZATION',		 2),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_MERCENARY',				 4),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 9),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_LAW',			 9),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_CULTURE',		 3),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_ECONOMY',		 8),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_EDUCATION',		 3),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_FOREIGN',		 5),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_INDUSTRY',		 4),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_MILITARY',		 7),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_REFORM_RELIGION',		 4),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_SLAVERY',				 0),
		('LEADER_SENSHI_TITO',	'FLAVOR_JFD_STATE_RELIGION',		 0);
--==========================================================================================================================
-- MINOR CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_BELGRADE';
INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,			MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('MINOR_CIV_BELGRADE',	'Adriatic',				73,		70,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'AfriAsiaAust',			36,		74,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'AfriSouthEuro',		43,		69,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Apennine',				59,		35,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'AtlanticGiant',		163,	34,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Caucasus',				14,		42,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Cordiform',			42,		22,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'EarthMk3',				29,		52,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'EuroGiant',			90,		27,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'EuroLarge',			47,		27,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'EuroLargeNew',			51,		17,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'GreatestEarth',		56,		43,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Mediterranean',		61,		34,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'MediterraneanHuge',	56,		31,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Yagem',				27,		55,		null,	null,	null),
		('MINOR_CIV_BELGRADE',	'Yahem',				66,		53,		null,	null,	null);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						GovernmentType,					Weight)
VALUES  ('CIVILIZATION_SENSHI_YUGOSLAVIA',		'GOVERNMENT_JFD_REPUBLIC',		60),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'GOVERNMENT_JFD_REVOLUTIONARY',	100),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'GOVERNMENT_JFD_TOTALITARIAN',	80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Adriatic',				17,		49,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'AfriAsiaAust',			34,		79,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'AfriSouthEuro',		43,		75,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Apennine',				59,		52,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'AtlanticGiant',		163,	46,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Caucasus',				7,		61,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Cordiform',			40,		25,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'EarthMk3',				27,		50,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'EuroEastern',			23,		5,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'EuroGiant',			83,		43,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'EuroLarge',			45,		35,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'EuroLargeNew',			49,		28,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'GreatestEarth',		48,		29,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Mediterranean',		57,		50,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'MediterraneanHuge',	47,		49,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Yagem',				26,		62,		null,	null,	null),
		('CIVILIZATION_SENSHI_YUGOSLAVIA',		'Yahem',				65,		55,		null,	null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_SENSHI_YUGOSLAVIA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLAND';
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
		(CivilizationType,					ArtDefineTag, CultureType,					SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SENSHI_YUGOSLAVIA',	ArtDefineTag, 'CULTURE_JFD_TOTALITARIAN',	null,			'JFD_Totalitarian', 'DefeatScreenEarlyTotalitarian.dds',  'DefeatScreenMidTotalitarian.dds',  'DefeatScreenLateTotalitarian.dds',	'JFD_Totalitarian', 'JFD_Totalitarian', 'JFD_Totalitarian',  UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLAND';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Totalitarian'
WHERE Type = 'CIVILIZATION_SENSHI_YUGOSLAVIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Totalitarian')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================