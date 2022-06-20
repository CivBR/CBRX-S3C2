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
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_DECOLONIZATION',		8),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_MERCENARY',				5),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	3),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_GOVERNMENT',		8),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_LAW',			9),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_DIPLOMACY',		3),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_ECONOMY',		2),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_EDUCATION',		3),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_MILITARY',		9),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_RELIGION',		4),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_SOCIETY',		7),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_REFORM_WELFARE',		7),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_SLAVERY',				1),
		('LEADER_SENSHI_SUHARTO',	'FLAVOR_JFD_STATE_RELIGION',		3);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_SENSHI_INDONESIA',	'AfriAsiaAust',			97,		31),
		('CIVILIZATION_SENSHI_INDONESIA',	'Asia',					55,		0),
		('CIVILIZATION_SENSHI_INDONESIA',	'Australasia',			19,		77),
		('CIVILIZATION_SENSHI_INDONESIA',	'EarthMk3',				84,		25),
		('CIVILIZATION_SENSHI_INDONESIA',	'EastAsia',				30,		12),
		('CIVILIZATION_SENSHI_INDONESIA',	'IndianOcean',			76,		31),
		('CIVILIZATION_SENSHI_INDONESIA',	'Indonesia',			35,		12),
		('CIVILIZATION_SENSHI_INDONESIA',	'Pacific',				27,		24),
		('CIVILIZATION_SENSHI_INDONESIA',	'Cordiform',			69,		18),
		('CIVILIZATION_SENSHI_INDONESIA',	'GreatestEarth',		85,		24),
		('CIVILIZATION_SENSHI_INDONESIA',	'Yagem',				80,		26),
		('CIVILIZATION_SENSHI_INDONESIA',	'Yahem',				103,	27);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_SENSHI_INDONESIA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
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
		(CivilizationType,					ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SENSHI_INDONESIA',	ArtDefineTag, 'CULTURE_JFD_TOTALITARIAN',	SubCultureType, 'JFD_Totalitarian', DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, 'JFD_Totalitarian', 'JFD_Totalitarian',	SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_EastIndies'
WHERE Type = 'CIVILIZATION_SENSHI_INDONESIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_EastIndies')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 					GovernmentType,					Weight)
VALUES	('CIVILIZATION_SENSHI_INDONESIA', 	'GOVERNMENT_JFD_REPUBLIC',		40),
		('CIVILIZATION_SENSHI_INDONESIA', 	'GOVERNMENT_JFD_DICTATORSHIP',	90);
--==========================================================================================================================
--==========================================================================================================================