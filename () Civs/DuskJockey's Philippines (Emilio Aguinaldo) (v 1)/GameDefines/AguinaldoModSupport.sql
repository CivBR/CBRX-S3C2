--==========================================================================================================================
-- MOD SUPPORT
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix, 			 X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'AfriAsiaAust',		108,	47,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'Asia',				79,		20,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'AsiaSmall',		32,		9,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'AustralasiaGiant',	43,		124,	null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'EastAsia',			44,		36,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'EarthMk3',			92,		45,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'GreatestEarth',	88,		35,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'IndianOcean',		89,		54,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'Indonesia',		60,		67,		null,	null),
		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'Pacific',			37,		39,		null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 							MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
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
		(CivilizationType,							ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	ArtDefineTag, CultureType, 'CULTURE_SUB_JFD_COLONIAL_LATIN', DecisionsTag, IdealsTag, 'JFD_ColonialLatin', 'JFD_ColonialLatin', 'AS2D_SOUND_JFD_AMERICAN'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_AMERICA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ColonialLatin'
WHERE Type = 'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin');
--==========================================================================================================================	
-- JFD's RISE TO POWER 
--==========================================================================================================================	
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
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--==========================================================================================================================	
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_DJ_PHILIPPINES_QUEZON'
WHERE Type = 'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO';
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  				integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text		default	null,
	ModName				text		default null,
	ModID				text		default	null,	
	Authors				text		default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,								ModName,										ModID,												Authors)
VALUES	('MOD_DJ_PHILIPPINES_AGUINALDO',	'TXT_KEY_MOD_DJ_PHILIPPINES_AGUINALDO_NAME',	'TXT_KEY_MOD_DJ_PHILIPPINES_AGUINALDO_ID_STEAM',	'TXT_KEY_MOD_DJ_PHILIPPINES_AGUINALDO_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID					integer 	PRIMARY KEY		AUTOINCREMENT,
	Type				text					default	null,
	Achievopedia		text					default null,
	Header				text					default	null,	
	IconAtlas			text					default	null,	
	PortraitIndex		integer					default	0,
	ModType				text					default	null,	
	ModVersion			integer					default	0,
	Unlocked			boolean					default	0,
	LockedIconAtlas		text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex	integer					default	23,
	UnlockSound			text					default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration		integer					default	-1,
	Hidden				boolean					default	0,
	HiddenBorder		boolean					default	0,
	RequiredCivWin		text					default	null,
	RequiredCivLoss		text					default	null,
	RequiredCivKill		text					default	null);

INSERT INTO AdditionalAchievements
		(Type,									Header,													Achievopedia,										ModType,						ModVersion,		RequiredCivWin,								IconAtlas,								PortraitIndex)
VALUES	('AA_DJ_PHILIPPINES_AGUINALDO_SPECIAL',	'TXT_KEY_AA_DJ_PHILIPPINES_AGUINALDO_SPECIAL_HEADER',	'TXT_KEY_AA_DJ_PHILIPPINES_AGUINALDO_SPECIAL_TEXT',	'MOD_DJ_PHILIPPINES_AGUINALDO',	1,				null,										'DJ_PHILIPPINES_AGUINALDO_CIV_ATLAS',	0),
		('AA_DJ_PHILIPPINES_AGUINALDO_VICTORY',	'TXT_KEY_AA_DJ_PHILIPPINES_AGUINALDO_VICTORY_HEADER',	'TXT_KEY_AA_DJ_PHILIPPINES_AGUINALDO_VICTORY_TEXT',	'MOD_DJ_PHILIPPINES_AGUINALDO',	1,				'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO',	'DJ_PHILIPPINES_AGUINALDO_CIV_ATLAS',	0);
--==========================================================================================================================
--==========================================================================================================================