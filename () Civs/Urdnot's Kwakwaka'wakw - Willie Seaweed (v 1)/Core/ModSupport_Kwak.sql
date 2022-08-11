--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23-25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
	(CivilizationType,		MapPrefix,		X,	Y)
VALUES	('CIVILIZATION_URD_KWAK',	'Yagem',		127, 76),
	('CIVILIZATION_URD_KWAK',		'Yahem',		13, 62),
	('CIVILIZATION_URD_KWAK',	'GreatestEarth',	1, 55),
	('CIVILIZATION_URD_KWAK',	'Cordiform',		12, 42),
	('CIVILIZATION_URD_KWAK',	'Americas',		26, 61),
	('CIVILIZATION_URD_KWAK',	'AmericasGiant',		22, 134),
	('CIVILIZATION_URD_KWAK',	'NorthAmericaGiant',	35, 73),
	('CIVILIZATION_URD_KWAK',	'NorthAmericaHuge',	29, 58),
	('CIVILIZATION_URD_KWAK',	'Pacific',		97, 70),
	('CIVILIZATION_URD_KWAK',	'EarthMk3',			124, 78);
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--Below are the tables required for standard mod support.

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				Weight)
VALUES	('CIVILIZATION_URD_KWAK', 	'GOVERNMENT_JFD_TRIBAL',	25),
		('CIVILIZATION_URD_KWAK', 	'GOVERNMENT_JFD_MERCHANT',	75);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						DecisionsTag, UnitDialogueTag)
SELECT	'CIVILIZATION_URD_KWAK',	DecisionsTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilization_JFD_CultureTypes
SET ArtDefineTag = 'JFD_Pacific', CultureType = 'JFD_Pacific', IdealsTag = 'JFD_Pacific', SplashScreenTag = 'JFD_Pacific', SoundtrackTag = 'JFD_Pacific'
WHERE CivilizationType = 'CIVILIZATION_URD_KWAK' AND EXISTS (SELECT * FROM JFD_CultureTypes WHERE Type = 'JFD_Pacific');

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Pacific'
WHERE Type = 'CIVILIZATION_URD_KWAK'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Pacific');
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
 
INSERT INTO Civilization_Religions
        (CivilizationType,                      ReligionType)
VALUES  ('CIVILIZATION_URD_KWAK',              'RELIGION_SGAANAANG');
 
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SGAANAANG' )
		THEN 'RELIGION_SGAANAANG'
		ELSE 'RELIGION_CHRISTIANITY' END ) END
	) WHERE CivilizationType = 'CIVILIZATION_URD_KWAK';