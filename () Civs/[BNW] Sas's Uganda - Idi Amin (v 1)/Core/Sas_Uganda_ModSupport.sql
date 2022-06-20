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
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_SAS_UGANDA',		'AfriAsiaAust',			41,		37,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'AfriGiant',			98,		69,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'AfricaLarge',			45,		36,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'AfriSouthEuro',		49,		31,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'CentralAfricaLarge',	88,		27,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'IndianOcean',			5,		39,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'SouthernAfrica',		93,		111,	null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'Cordiform',			42,		12,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'EarthMk3',				36,		27,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'GreatestEarth',		59,		19,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'Yagem',				32,		29,		null,	null,	null),
		('CIVILIZATION_SAS_UGANDA',		'Yahem',				72,		32,		null,	null,	null);

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
VALUES	('CIVILIZATION_SAS_UGANDA', 	'GOVERNMENT_JFD_DICTATORSHIP',  75),
		('CIVILIZATION_SAS_UGANDA', 	'GOVERNMENT_JFD_MONARCHY',		25);
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
SELECT	'CIVILIZATION_SAS_UGANDA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU')
WHERE Type = 'CIVILIZATION_SAS_UGANDA';