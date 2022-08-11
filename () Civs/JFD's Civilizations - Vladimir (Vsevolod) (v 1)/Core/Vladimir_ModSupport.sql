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
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
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
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_DECOLONIZATION',		5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_MERCENARY',				5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	6),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_LEGAL',			7),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_CULTURE',		7),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_ECONOMIC',		5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_EDUCATION',		5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_FOREIGN',		8),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_MILITARY',		8),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_REFORM_RELIGION',		6),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_SLAVERY',				5),
		('LEADER_JFD_VLADIMIR',	'FLAVOR_JFD_STATE_RELIGION',		6);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				GovernmentType,				Weight)
VALUES  ('CIVILIZATION_JFD_VLADIMIR',	'GOVERNMENT_JFD_MONARCHY',	60);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,			X,		Y)
VALUES	('CIVILIZATION_JFD_VLADIMIR',	'Cordiform',		36,		46),
		('CIVILIZATION_JFD_VLADIMIR',	'EarthMk3',			42,		72),
		('CIVILIZATION_JFD_VLADIMIR',	'EuroEastern',		92,		51),
		('CIVILIZATION_JFD_VLADIMIR',	'EuroGiant',		144,	94),
		('CIVILIZATION_JFD_VLADIMIR',	'EuroLargeNew',		77,		61),
		('CIVILIZATION_JFD_VLADIMIR',	'EuroLarge',		69,		60),
		('CIVILIZATION_JFD_VLADIMIR',	'GreatestEarth',	67,		57),
		('CIVILIZATION_JFD_VLADIMIR',	'NorthSeaGiant',	162,	1),
		('CIVILIZATION_JFD_VLADIMIR',	'RussiaLarge',		15,		29),
		('CIVILIZATION_JFD_VLADIMIR',	'Yagem',			38,		73),
		('CIVILIZATION_JFD_VLADIMIR',	'Yahem',			77,		66);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_VLADIMIR',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
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
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_VLADIMIR',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Eastern'
WHERE Type = 'CIVILIZATION_JFD_VLADIMIR'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Eastern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================