--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,           	TraitOne,	TraitTwo)
SELECT  'LEADER_JFD_CANUTE',  	'POLICY_IMPERIALISTIC_X',	'POLICY_SEAFARING_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--------------------------------------------------------------------------------------------------------------------------	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Leaders 
SET Description = 'Canute [ICON_CITYSTATE][ICON_MOVES]'
WHERE Type = 'LEADER_JFD_CANUTE'
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
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_DENMARK'
WHERE Type = 'CIVILIZATION_JFD_ANGLO_NORSE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_DENMARK');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		CapitalName)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE',	'AtlanticGiant',		163,	66,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'BritishIsles',			59,		43,		'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_03'),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'Cordiform',			39,		36,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'Denmark',				43,		25,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'EarthMk3',				21,		72,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'EuroGiant',			70,		81,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'EuroLargeNew',			38,		54,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'EuroLarge',			36,		55,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'GermanyHuge',			69,		63,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'GreatestEarth',		48,		57,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'NorthAtlantic',		86,		44,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'NorthSeaEurope',		84,		40,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'NorthSeaGiant',		104,	11,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'NorthWestEurope',		36,		28,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'Yagem',				22,		74,		null),
		('CIVILIZATION_JFD_ANGLO_NORSE',	'Yahem',				62,		64,		null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM CCivilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType, 					  	CultureType, CultureEra)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	CultureType, CultureEra
FROM ML_CivCultures WHERE CivType = 'CIVILIZATION_DENMARK';
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 	text 	  default null,
	Value 	integer   default 1);
--==========================================================================================================================
-- JFDLC
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
		(LeaderType,			FlavorType,Flavor)
VALUES	('LEADER_JFD_CANUTE',	'FLAVOR_JFD_DECOLONIZATION',			4),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_MERCENARY',					7),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		2),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_GOVERNMENT',			5),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_LEGAL',				3),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_CULTURE',			3),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_ECONOMIC',			5),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_FOREIGN',			8),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_INDUSTRY',			5),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_MILITARY',			8),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_REFORM_RELIGION',			2),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_SLAVERY',					6),
		('LEADER_JFD_CANUTE',	'FLAVOR_JFD_STATE_RELIGION',			6);
--==========================================================
-- JFD CIVILOPEDIA
--==========================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);

INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('PROMOTION_JFD_TINGLID_ACTIVE');
--====================================	
-- INVENTIONS 
--====================================	
-- Civilization_JFD_Inventions
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Inventions (
	CivilizationType  					text 	REFERENCES Civilizations(Type) 			default null,
	InventionType  						text 		 									default null,
	InventionPreference					text 		 									default null);
	
INSERT INTO Civilization_JFD_Inventions
		(CivilizationType, 					InventionType, 	InventionPreference)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE', 	InventionType,	InventionPreference
FROM Civilization_JFD_Inventions WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
--====================================	
-- JFD COLONIES
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ColonialCityNames (
	CivilizationType 					text 	REFERENCES Civilizations(Type) 			default null,
	ColonyName 							text											default null,
	LinguisticType						text											default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,				LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--====================================	
-- JFD DEVELOPMENT
--====================================	
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	ReligionType  						text 		REFERENCES Religions(Type) 			default null,
	DefaultTitle						text 		 									default null,
	UniqueTitle							text 		 									default null,
	UseAdjective						boolean											default 0);	

INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
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
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_JFD_ANGLO_NORSE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- JFD RISE TO POWER
--==========================================================================================================================
--====================================	
-- JFD SOVEREIGNTY
--====================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType	  						text 		 									default null,
	LegislatureName						text											default	null,
	OfficeTitle							text											default	null,
	GovernmentType						text											default	null,
	Weight								integer											default	0);

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				LegislatureName, OfficeTitle, GovernmentType,			 Weight)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	LegislatureName, OfficeTitle, 'GOVERNMENT_JFD_MONARCHY', 80
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType							text 		 									default null,
	HeadOfGovernmentName				text 		 									default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      		HeadOfGovernmentName)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType							text 		 									default null,
	ReligionType						text 		REFERENCES Religions(Type) 			default null,
	DefaultTitle						text 		 									default null,
	UniqueTitle							text 		 									default null,
	UseAdjective						boolean											default 0);	
	
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 		default null,
	PoliticsType  						text 											default null,
	UniqueName							text											default	null);
	
INSERT INTO Civilization_JFD_Politics
		(CivilizationType,				PoliticsType, UniqueName)                                    
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  						text 	REFERENCES Leaders(Type) 				default	null,
	ReformType							text											default	null);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_Civs_AngloNorse_Decisions.lua');
--------------------------------------------------------------------------------------------------------------------------	
-- Policies
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policies	
		(Type,											Description)
VALUES	('POLICY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA',	'TXT_KEY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_CivilizationNames
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
Policy_JFD_CivilizationNames (
	PolicyType							text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text 	REFERENCES Civilizations(Type) 			default null,
	Description							text 											default null,
	ShortDescription					text 											default null,
	Adjective							text 											default null);
	
INSERT INTO Policy_JFD_CivilizationNames 	
		(PolicyType, 									CivilizationType,					Adjective,								Description,						ShortDescription)
VALUES	('POLICY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA',	'CIVILIZATION_JFD_ANGLO_NORSE',		'TXT_KEY_CIV_JFD_NORTH_SEA_ADJECTIVE',	'TXT_KEY_CIV_JFD_NORTH_SEA_DESC',	'TXT_KEY_CIV_JFD_NORTH_SEA_SHORT_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassHappiness
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassHappiness
		(PolicyType,									BuildingClassType,				Happiness)
SELECT	'POLICY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA',	'BUILDINGCLASS_COURTHOUSE',		1
WHERE NOT EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Policy_BuildingClassYieldChanges
		(PolicyType, 									BuildingClassType,				YieldType, 		  		YieldChange)
SELECT	'POLICY_DECISIONS_JFD_ANGLO_NORSE_NORTH_SEA', 	'BUILDINGCLASS_COURTHOUSE',		'YIELD_JFD_LOYALTY',  	2
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CID_LOYALTY_CORE' AND Value = 1);
--==========================================================================================================================
-- TROLLER ADDITIONAL ACHIEVEMENTS
--==========================================================================================================================
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Header					text							default null,
	Description				text							default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,Header,Description)
VALUES	('TAB_JFD_JFDLC',	'TXT_KEY_TAB_JFD_JFDLC_HEADER',		'TXT_KEY_TAB_JFD_JFDLC_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	ModName					text							default null,
	ModID					text							default	null,	
	Authors					text							default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,					ModName,							 ModID,  								Authors)
VALUES	('MOD_JFD_ANGLO_NORSE',	'TXT_KEY_MOD_JFD_ANGLO_NORSE_NAME',	 'TXT_KEY_MOD_JFD_ANGLO_NORSE_MODID',  	'TXT_KEY_MOD_JFD_ANGLO_NORSE_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Achievopedia			text							default null,
	Header					text							default	null,	
	IconAtlas				text							default	null,	
	PortraitIndex			integer							default	0,
	ModType					text							default	null,	
	ModVersion				integer							default	0,
	Unlocked				boolean							default	0,
	LockedIconAtlas			text							default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer							default	23,
	UnlockSound				text							default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer							default	-1,
	Hidden					boolean							default	0,
	HiddenBorder			boolean							default	0,
	RequiredCivWin			text							default	null,
	RequiredCivLoss			text							default	null,
	RequiredCivKill			text							default	null);

INSERT INTO AdditionalAchievements
		(Type,							Header,											Achievopedia,								ModType,				ModVersion,		RequiredCivWin,					IconAtlas,			 					PortraitIndex)
VALUES	('AA_JFD_ANGLO_NORSE_SPECIAL',	'TXT_KEY_AA_JFD_ANGLO_NORSE_SPECIAL_HEADER',	'TXT_KEY_AA_JFD_ANGLO_NORSE_SPECIAL_TEXT',	'MOD_JFD_ANGLO_NORSE',	1,				null,							'JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS',	0),
		('AA_JFD_ANGLO_NORSE_VICTORY',	'TXT_KEY_AA_JFD_ANGLO_NORSE_VICTORY_HEADER',	'TXT_KEY_AA_JFD_ANGLO_NORSE_VICTORY_TEXT',	'MOD_JFD_ANGLO_NORSE',	1,				'CIVILIZATION_JFD_ANGLO_NORSE',	'JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS',	0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,				TabType)
VALUES	('AA_JFD_ANGLO_NORSE_SPECIAL',	'TAB_JFD_JFDLC'),
		('AA_JFD_ANGLO_NORSE_VICTORY',	'TAB_JFD_JFDLC');
--==========================================================================================================================
--==========================================================================================================================