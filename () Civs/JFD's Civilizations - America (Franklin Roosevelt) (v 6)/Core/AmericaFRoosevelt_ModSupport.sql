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
-- CIVILOPEDIA
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
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
		('FLAVOR_JFD_REFORM_DIPLOMACY'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_REFORM_SOCIETY'),
		('FLAVOR_JFD_REFORM_WELFARE'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,						FlavorType,							Flavor)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_DECOLONIZATION',		0),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_MERCENARY',				0),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_GOVERNMENT',		3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_LAW',			3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_DIPLOMACY',		2),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_ECONOMY',		3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_EDUCATION',		6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_MILITARY',		6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_RELIGION',		5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_SOCIETY',		3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_REFORM_WELFARE',		8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_SLAVERY',				0),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',	'FLAVOR_JFD_STATE_RELIGION',		0);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,	 Y)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'Americas',				46,  54),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'AmericasGiant',		68,	 117),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'AtlanticGiant',		68,	 72),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'Cordiform',			13,	 32),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'EarthMk3',				151, 67),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'GreatestEarth',		19,	 47),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'NorthAmericaGiant',	95,	 51),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'NorthAmericaHuge',		91,	 39),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'NorthAtlantic',		11,	 34),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'Yagem',				155, 63),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'Yahem',				30,	 54);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_AMERICA';
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
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';
	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 							ColonyName)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',		ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 							GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'GOVERNMENT_JFD_REPUBLIC',	90);
--==========================================================================================================================
--==========================================================================================================================