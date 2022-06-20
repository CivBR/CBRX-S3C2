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
		(LeaderType,						FlavorType,							 Flavor)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_DECOLONIZATION',		 2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_MERCENARY',				 8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 9),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_LAW',			 7),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_DIPLOMACY',		 7),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_ECONOMY',		 5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_EDUCATION',		 5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_MILITARY',		 8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_RELIGION',		 2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_SOCIETY',		 9),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_REFORM_WELFARE',		 5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_SLAVERY',				 8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'FLAVOR_JFD_STATE_RELIGION',		 0);
--==========================================================================================================================
-- MINOR CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- MinorCivilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM MinorCivilizations_YnAEMP WHERE MinorCivType = 'MINOR_CIV_VILNIUS';
INSERT INTO MinorCivilizations_YnAEMP
		(MinorCivType,			MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('MINOR_CIV_VILNIUS',	'AtlanticGiant',		179,	64,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'Cordiform',			42,		36,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'EarthMk3',				30,		73,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'EuroEastern',			58,		70,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'EuroGiant',			102,	89,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'EuroLargeNew',			58,		63,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'EuroLarge',			49,		58,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'GreatestEarth',		58,		58,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'NorthAtlantic',		94,		55,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'NorthSeaGiant',		130,	13,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'NorthWestEurope',		54,		42,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'RussiaLarge',			11,		43,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'Yagem',				31,		75,		null,	null,	null),
		('MINOR_CIV_VILNIUS',	'Yahem',				69,		65,		null,	null,	null);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'AtlanticGiant',		176,	55,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'Cordiform',			43,		34,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'EarthMk3',				31,		68,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'EuroEastern',			38,		45,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'EuroGiant',			77,		67,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'EuroLargeNew',			52,		52,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'EuroLarge',			48,		51,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'GermanyHuge',			124,	52,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'GreatestEarth',		58,		56,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'MediterraneanHuge',	47,		69,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'NorthAtlantic',		97,		43,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'NorthSeaGiant',		136,	8,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'NorthWestEurope',		53,		30,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'RussiaLarge',			6,		39,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'Yagem',				31,		72,		null,	null,	null),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'Yahem',				69,		63,		null,	null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
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
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_POLISH'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				Weight)
VALUES	('CIVILIZATION_JFD_VANDALS_GENSERIC', 	'GOVERNMENT_JFD_MONARCHY',	70);
--==========================================================================================================================
--==========================================================================================================================