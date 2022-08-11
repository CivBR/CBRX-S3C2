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
VALUES	('CIVILIZATION_SAS_MODOC', 	'GOVERNMENT_JFD_TRIBAL',	75),
		('CIVILIZATION_SAS_MODOC', 	'GOVERNMENT_JFD_NOMADIC',	25);
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
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_SAS_MODOC',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SHOSHONE')
WHERE Type = 'CIVILIZATION_SAS_MODOC';
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,			X,	Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_SAS_MODOC',	'NorthAmericaHuge',	34,	45,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'Yagem',	131,	66,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'Yahem',	14,	56,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'GreatestEarth',	3,	50,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'EarthMk3',	125,	68,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'Americas',	30,	58,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'AmericasGiant',	23,	122,		null,	null,	null),
		('CIVILIZATION_SAS_MODOC',	'NorthAmericaGiant',	35,	59,		null,	null,	null);

--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
 
INSERT INTO Civilization_Religions
        (CivilizationType,                      ReligionType)
VALUES  ('CIVILIZATION_SAS_MODOC',              CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SGAANAANG' )
												THEN 'RELIGION_SGAANAANG'
												ELSE 'RELIGION_CHRISTIANITY' END);
												
CREATE TRIGGER IF NOT EXISTS C15_Sas_Modoc_Religion_Insert
AFTER INSERT ON Religions
WHEN NEW.Type = 'RELIGION_SGAANAANG'
BEGIN
	UPDATE Civilization_Religions
	SET ReligionType = NEW.Type
	WHERE CivilizationType = 'CIVILIZATION_SAS_MODOC';
END;