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
-- BUILDINGS
--==========================================================================================================================		
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Units 																																		 																																							 
		(Type, 						Class,	Combat,	Cost, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, PrereqTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass, XPValueAttack,	Description,						Help,									Strategy,									Civilopedia,							 AdvancedStartCost,      UnitArtInfo,						UnitFlagAtlas,							UnitFlagIconOffset, IconAtlas,			PortraitIndex)
SELECT	'UNIT_UC_EAP', 	Class,	Combat, Cost, Moves, CombatClass, Domain,  DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, PrereqTech,	IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, XPValueAttack,	'TXT_KEY_UNIT_UC_EAP',	'TXT_KEY_UNIT_UC_EAP_HELP',	'TXT_KEY_UNIT_UC_EAP_STRATEGY',	'TXT_KEY_UNIT_UC_EAP_TEXT', AdvancedStartCost,     'ART_DEF_UNIT_UC_EAP',	'UC_UNIT_FLAG_EAP_FLAG_ATLAS',	0,					'UC_CENTRAL_AMERICA_ATLAS',	2
FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY'
AND EXISTS (SELECT Type FROM Units WHERE Type = 'UNIT_EE_LINE_INFANTRY');
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
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMY'),
		('FLAVOR_JFD_REFORM_EDUCATION'),
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
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_UC_MORAZAN',	'FLAVOR_JFD_DECOLONIZATION',		 10),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_MERCENARY',				 0),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 3),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_LAW',			 5),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_ECONOMY',		 4),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_EDUCATION',		 1),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_FOREIGN',		 2),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_INDUSTRY',		 3),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_MILITARY',		 4),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_REFORM_RELIGION',		 1),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_SLAVERY',				 0),
		('LEADER_UC_MORAZAN',	'FLAVOR_JFD_STATE_RELIGION',		 0);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,			GovernmentType,				Weight)
VALUES  ('CIVILIZATION_UC_CENTRAL_AMERICA',	'GOVERNMENT_JFD_REPUBLIC',	90);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA',	'Americas',		40,		41,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'AmericasGiant',				56,		88,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'AtlanticGiant',		42,		54,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'Caribbean',	24,		23,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'Cordiform',			6,		23,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'EartMk3',			140,		49,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'GreatestEarth',		16,		31,	null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'NorthAmericaGiant',		80,		13,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'NorthAmericaHuge',			73,		1,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'SouthAmericaCentralGiant',			32,		123,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'SouthAmericaCentralHuge',	25,		93,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'Yagem',			145,		44,		null,	null,	null),
		('CIVILIZATION_UC_CENTRAL_AMERICA',	'Yahem',			24,		41,		null,	null,	null);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
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
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BRAZIL';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Colonial'
WHERE Type = 'CIVILIZATION_UC_CENTRAL_AMERICA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Colonial')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================

