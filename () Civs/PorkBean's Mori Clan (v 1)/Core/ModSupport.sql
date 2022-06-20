--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
--List of traits: https://forums.civfanatics.com/threads/civ-iv-traits-in-civ-v.530701/
------------------------------
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,            TraitOne,                TraitTwo)
SELECT  'LEADER_PB_MORI_MOTONARI',		'POLICY_SEAFARING_X',	 'POLICY_MILITARISTIC_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Mori Motonari [ICON_GREAT_EXPLORER][ICON_WAR]'
WHERE Type = 'LEADER_PB_MORI_MOTONARI'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_PB_MORI',	'AfriAsiaAust',		120,	73,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'Asia',				89,		50,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'AsiaSmall',		46,		30,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'Cordiform',		62,		44,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'EarthMk3',			98,		64,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'EastAsia',			57,		60,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'GreatestEarth',	95,		46,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'JapanHuge',		45,		46,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'NorthEastAsia',	38,		27,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'Pacific',			42,		57,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'SeaOfJapan',		66,		21,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'Yagem',			92,		57,		null,	null,	null),
		('CIVILIZATION_PB_MORI',	'Yahem',			113,	49,		null,	null,	null);

--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,		GovernmentType,				Weight)
VALUES	('CIVILIZATION_PB_MORI',	'GOVERNMENT_JFD_SHOGUNATE',	100),
		('CIVILIZATION_PB_MORI',	'GOVERNMENT_JFD_MONARCHY',	80);

--Note that multiple entries are valid.
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

--This is an example of support which copies all attributes from an existing civ. 
--For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_BYZANTIUM_ALEXIOS_I' to the tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_PB_MORI',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JAPAN';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_PB_MORI')
WHERE Type = 'CIVILIZATION_PB_MORI';
--------------------------------------------------------------------------------------------------------------------------
-- HOMUSUBI'S JAPANESE RELIGIONS (1423200e-b8ce-4eb6-9814-9ed92fb81336)
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_ZEN_SM'
WHERE CivilizationType = 'CIVILIZATION_PB_MORI'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_ZEN_SM');