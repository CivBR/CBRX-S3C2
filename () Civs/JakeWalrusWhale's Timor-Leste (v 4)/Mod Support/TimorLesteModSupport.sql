--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--=========================================================================================================================
-- BINGLES CIV IV TRAITS
--=========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,				TraitOne,				TraitTwo)
SELECT  'LEADER_JWW_XANANA_GUSMAO',	'POLICY_DIPLOMATIC_X',	'POLICY_SPIRITUAL_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Xanana Gusmão [ICON_INFLUENCE][ICON_PEACE]'
WHERE Type = 'LEADER_JWW_XANANA_GUSMAO'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------
--_AMERICA
--_ANTWERP
--_ARABIA
--_ASSYRIA
--_AUSTRIA
--_AZTEC
--_BABYLON
--_BRAZIL
--_BYZANTIUM
--_CARTHAGE
--_CELTS
--_CHINA
--_DENMARK
--_EGYPT
--_ENGLAND
--_ETHIOPIA
--_FRANCE
--_GARAMANTES
--_GERMANY
--_GREECE
--_HUNS
--_INCA
--_INDIA
--_INDONESIA
--_IROQUOIS
--_JAPAN
--_KOREA
--_LISBON
--_MAYA
--_MONGOL
--_MOROCCO
--_NETHERLANDS
--_OTTOMAN
--_PERSIA
--_POLAND
--_PORTUGAL
--_POLYNESIA
--_ROME
--_RUSSIA
--_SHOSHONE
--_SIAM
--_SONGHAI
--_SPAIN
--_SWEDEN
--_ZULU
--_VENICE

UPDATE Civilizations 
SET ArtStyleSuffix = '_INDONESIA'
WHERE Type = 'CIVILIZATION_JWW_TIMOR-LESTE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_INDONESIA');
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y)
VALUES	('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Yagem',				87,		24),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Yahem',				110,	26),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Cordiform',			74,		22),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'GreatestEarth',		92,		24),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'EarthMk3',				96,		28),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'AfriAsiaAust',			108,	30),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Australasia',			47,		74),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Australia',			22,		73),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'EastAsia',				48,		9),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'IndianOcean',			94,		28),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Indonesia',			74,		9),
		('CIVILIZATION_JWW_AMERICO-LIBERIANS',	'Pacific',				37,		24);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JWW_AMERICO-LIBERIANS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
--------------------------------------------------------------------------------------------------------------------------
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

--CULTURE_JFD_ABORIGINAL,	_JFD_ABORIGINAL,	JFD_Aboriginal
--CULTURE_JFD_ANDEAN,	_JFD_ANDEAN,	JFD_Andean
--CULTURE_JFD_BANTU,	_JFD_BANTU,	JFD_Bantu
--CULTURE_JFD_BHARATA,	_JFD_BHARATA,	JFD_Bharata
--CULTURE_JFD_CENTRAL,	_JFD_CENTRAL,	JFD_Central
--CULTURE_JFD_CLASSICAL,	_JFD_CLASSICAL,	JFD_Classical (Roman)
--CULTURE_JFD_COLONIAL,	_JFD_WESTERN,	JFD_Colonial (Latin)
--CULTURE_JFD_EASTERN,	_JFD_EASTERN,	JFD_Eastern (Byzantine)
--CULTURE_JFD_EAST_INDIES,	_JFD_EAST_INDIES,	JFD_EastIndies
--CULTURE_JFD_GREAT_PLAINS,	_JFD_GREAT_PLAINS,	JFD_GreatPlains
--CULTURE_JFD_HIMALAYAN,	_JFD_HIMALAYAN,	JFD_Himalayan
--CULTURE_JFD_IRANIAN,	_JFD_IRANIAN,	JFD_Iranian
--CULTURE_JFD_ISLAMIC,	_JFD_ISLAMIC,	JFD_Islamic (Turkic)
--CULTURE_JFD_KATUJE,	_JFD_KATUJE,	JFD_Katuje
--CULTURE_JFD_MANDALA,	_JFD_MANDALA,	JFD_Mandala
--CULTURE_JFD_MESOAMERICAN,	_JFD_MESOAMERICAN,	JFD_Mesoamerican
--CULTURE_JFD_MESOPOTAMIC,	_JFD_MESOPOTAMIC,	JFD_Mesopotamic (Egyptian)
--CULTURE_JFD_NORTHERN,	_JFD_NORTHERN,	JFD_Northern (Celtic)
--CULTURE_JFD_OCEANIC,	_JFD_OCEANIC,	JFD_Oceanic
--CULTURE_JFD_ORIENTAL,	_JFD_ORIENTAL,	JFD_Oriental
--CULTURE_JFD_PACIFIC,	_JFD_PACIFIC,	JFD_Pacific
--CULTURE_JFD_POLAR,	_JFD_POLAR,	JFD_Polar
--CULTURE_JFD_SAHARAN,	_JFD_SAHARAN,	JFD_Saharan
--CULTURE_JFD_SEMITIC,	_JFD_SEMITIC,	JFD_Semitic (Ethiopic)
--CULTURE_JFD_SOUTHERN,	_JFD_SOUTHERN,	JFD_Southern (Papal)
--CULTURE_JFD_STEPPE,	_JFD_STEPPE,	JFD_Steppe
--CULTURE_JFD_TOTALITARIAN,	_JFD_WESTERN,	JFD_Totalitarian
--CULTURE_JFD_WEST_AFRICAN,	_JFD_WEST_AFRICAN,	JFD_WestAfrican
--CULTURE_JFD_WESTERN,	_JFD_WESTERN,	JFD_Western (British)
--CULTURE_JFD_WOODLANDS,	_JFD_WOODLANDS,	JFD_Woodlands

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag,					CultureType,				IdealsTag,			SplashScreenTag,	SoundtrackTag)
VALUES	('CIVILIZATION_JWW_TIMOR-LESTE',	'CULTURE_JFD_EAST_INDIES',		'_JFD_EAST_INDIES',		'JFD_EastIndies',		'JFD_EastIndies',		'JFD_EastIndies');
------------------------------------------------------------
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

--GOVERNMENT_JFD_MONARCHY
--GOVERNMENT_JFD_PRINCIPALITY
--GOVERNMENT_JFD_REPUBLIC
--GOVERNMENT_JFD_THEOCRACY
--GOVERNMENT_JFD_DICTATORSHIP
--GOVERNMENT_JFD_SHOGUNATE
--GOVERNMENT_JFD_HOLY_ROMAN_EMPIRE
--GOVERNMENT_JFD_PAPACY
--GOVERNMENT_JFD_MANDATE_OF_HEAVEN
--GOVERNMENT_JFD_CALIPHATE

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					LegislatureName, 												OfficeTitle, 															GovernmentType, 			Weight)
VALUES	('CIVILIZATION_JWW_TIMOR-LESTE',	'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_JWW_TIMOR-LESTE', 	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE', 	'GOVERNMENT_JFD_REPUBLIC', 	100);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  											text 	REFERENCES Civilizations(Type) 				default null,
	HeadOfGovernmentName										text 	 											default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      			HeadOfGovernmentName)
VALUES  ('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_1'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_2'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_3'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_4'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_5'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_6'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_7'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_8'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_9'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_10'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_11'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_12'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_13'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_14'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_15'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_16'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_17'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_18'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_19'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_20'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_21'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_22'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_23'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_24'),
		('CIVILIZATION_JWW_TIMOR-LESTE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_JWW_TIMOR-LESTE_25');
--==========================================================	
-- SOVEREIGNTY
--==========================================================
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JWW_TIMOR-LESTE',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_INDONESIA';
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
VALUES	('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_DECOLONIZATION',		4),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_MERCENARY',				8),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	2),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_GOVERNMENT',		6),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_LAW',			4),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_DIPLOMACY',		10),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_ECONOMY',		3),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_EDUCATION',		0),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_INDUSTRY',		1),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_MILITARY',		4),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_RELIGION',		6),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_SOCIETY',		6),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_REFORM_WELFARE',		6),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_SLAVERY',				2),
		('LEADER_JWW_XANANA_GUSMAO',	'FLAVOR_JFD_STATE_RELIGION',		5);
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,						CultureType,			CultureEra)
SELECT	'CIVILIZATION_JWW_TIMOR-LESTE',	CultureType,			CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_INDONESIA';
--==========================================================================================================================
-- ADDITIONAL ACIEVEMENTS
--==========================================================================================================================
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  					integer 		PRIMARY KEY							AUTOINCREMENT,
	Type					text												default	null,
	ModName					text												default null,
	ModID					text												default	null,	
	Authors					text												default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,						ModName,								ModID,									Authors)
VALUES	('MOD_JWW_TIMOR-LESTE',		'TXT_KEY_MOD_JWW_TIMOR-LESTE_NAME',		'TXT_KEY_MOD_JWW_TIMOR-LESTE_MODID',	'TXT_KEY_MOD_JWW_TIMOR-LESTE_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY							AUTOINCREMENT,
	Type					text												default	null,
	Header					text												default null,
	Description				text												default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,						Header,								Description)
VALUES	('TAB_JWW_CIVS',			'TXT_KEY_TAB_JWW_CIVS_HEADER',		'TXT_KEY_TAB_JWW_CIVS_DESCRIPTION');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY							AUTOINCREMENT,
	Type					text												default	null,
	Achievopedia			text												default null,
	Header					text												default	null,	
	IconAtlas				text												default	null,	
	PortraitIndex			integer												default	0,
	ModType					text												default	null,	
	ModVersion				integer												default	0,
	Unlocked				boolean												default	0,
	LockedIconAtlas			text												default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer												default	23,
	UnlockSound				text												default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer												default	-1,
	Hidden					boolean												default	0,
	HiddenBorder			boolean												default	0,
	RequiredCivWin			text												default	null,
	RequiredCivLoss			text												default	null,
	RequiredCivKill			text												default	null);

INSERT INTO AdditionalAchievements
		(Type,							Header,											Achievopedia,								ModType,				ModVersion,		RequiredCivWin,						IconAtlas,					PortraitIndex)
VALUES	('AA_JWW_TIMOR-LESTE_SPECIAL',	'TXT_KEY_AA_JWW_TIMOR-LESTE_SPECIAL_HEADER',	'TXT_KEY_AA_JWW_TIMOR-LESTE_SPECIAL_TEXT',	'MOD_JWW_TIMOR-LESTE',	1,				null,								'JWW_TIMORLESTE_COLOR_ATLAS',	1),
		('AA_JWW_TIMOR-LESTE_VICTORY',	'TXT_KEY_AA_JWW_TIMOR-LESTE_VICTORY_HEADER',	'TXT_KEY_AA_JWW_TIMOR-LESTE_VICTORY_TEXT',	'MOD_JWW_TIMOR-LESTE',	1,				'CIVILIZATION_JWW_TIMOR-LESTE',		'JWW_TIMORLESTE_COLOR_ATLAS',	2);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text												default	null,
	TabType					text												default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,				TabType)
VALUES	('AA_JWW_TIMOR-LESTE_SPECIAL',	'TAB_JWW_CIVS'),
		('AA_JWW_TIMOR-LESTE_VICTORY',	'TAB_JWW_CIVS');

--==========================================================================================================================
-- HISTORICAL RELIGIONS
--==========================================================================================================================
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_CATHOLICISM'
WHERE CivilizationType = 'CIVILIZATION_JWW_TIMOR-LESTE'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_CATHOLICISM');
--==========================================================================================================================
-- EVENTS AND DECISIONS
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TimorLeste_Decisions.lua');

INSERT INTO BuildingClasses
		(Type, 									 DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JWW_TL_SUPPORT_DUMMY',	 'BUILDING_JWW_TL_SUPPORT_DUMMY', 	'TXT_KEY_BUILDING_JWW_TL_SUPPORT_DUMMY'),
		('BUILDINGCLASS_JWW_TL_PETROLEUM_DUMMY', 'BUILDING_JWW_TL_PETROLEUM_DUMMY', 'TXT_KEY_BUILDING_JWW_TL_PETROLEUM_DUMMY');

INSERT INTO Buildings      
        (TYPE,                              BuildingClass,                          Cost,  FaithCost, GreatWorkCount,   NeverCapture,  Description)
VALUES  ('BUILDING_JWW_TL_SUPPORT_DUMMY',	'BUILDINGCLASS_JWW_TL_SUPPORT_DUMMY',   -1,    -1,        -1,               1,             'TXT_KEY_BUILDING_JWW_TL_SUPPORT_DUMMY'),
		('BUILDING_JWW_TL_PETROLEUM_DUMMY',	'BUILDINGCLASS_JWW_TL_PETROLEUM_DUMMY', -1,    -1,        -1,               1,             'TXT_KEY_BUILDING_JWW_TL_PETROLEUM_DUMMY');
--==========================================================================================================================
-- CULTURAL INFLUENCE
--==========================================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,						Response,													Bias)
VALUES	('LEADER_JWW_XANANA_GUSMAO',	'RESPONSE_INFLUENTIAL_ON_AI',		'TXT_KEY_LEADER_JWW_XANANA_GUSMAO_INFLUENTIAL_ON_AI%',		500),
		('LEADER_JWW_XANANA_GUSMAO',	'RESPONSE_INFLUENTIAL_ON_HUMAN',	'TXT_KEY_LEADER_JWW_XANANA_GUSMAO_INFLUENTIAL_ON_HUMAN%',	500);
