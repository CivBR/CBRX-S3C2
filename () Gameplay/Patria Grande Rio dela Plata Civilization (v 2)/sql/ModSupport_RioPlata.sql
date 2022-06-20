--=======================================================================================================================
-- SUKRITACT'S EVENTS AND DECISIONS
--=======================================================================================================================
--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Decisions_RioPlata.lua');

--Events
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('Events_RioPlata.lua');

------------------------------------------------------------
-- Policy_JFD_CivilizationNames (Because Decisions)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType								text 	REFERENCES Policies(Type) 				default null,
	CivilizationType						text 	REFERENCES Civilizations(Type) 			default null,
	Description								text 											default null,
	ShortDescription						text 											default null,
	Adjective								text 											default null);
	
INSERT INTO Policy_JFD_CivilizationNames 	
		(PolicyType, 						CivilizationType,					Adjective,											Description,									ShortDescription)
VALUES	('POLICY_PG_CONGRESOTUCUMAN',		'CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_CIV_PG_RIODELAPLATA_ADJECTIVE_ENACTED',	'TXT_KEY_CIV_PG_RIODELAPLATA_DESC_ENACTED',		'TXT_KEY_CIV_PG_RIODELAPLATA_SHORT_DESC_ENACTED');

--=======================================================================================================================
-- Enlightenment Era
--=======================================================================================================================


UPDATE Civilization_UnitClassOverrides 
SET UnitClassType = 'UNITCLASS_EE_CUIRASSIER'
WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK'); 

DELETE FROM Units WHERE Type = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Units
			(Type, 					PrereqTech, Class, Combat,	RangedCombat,	CombatClass, Cost,   FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,							PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		'UNIT_PG_GRANADEROS',	PrereqTech, Class, Combat,	Combat-2,		CombatClass, Cost+5, FaithCost, RequiresFaithPurchaseEnabled, Moves, 1,		Domain, DefaultUnitAI, 'TXT_KEY_UNIT_PG_GRANADEROS',	'TXT_KEY_CIV5_PG_GRANADEROS_TEXT', 	'TXT_KEY_UNIT_PG_GRANADEROS_STRATEGY',	'TXT_KEY_UNIT_PG_GRANADEROS_HELP_EE',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_PG_GRANADEROS',	0,					'PG_RIODELAPLATA_GRANADEROS_FLAG_ATLAS',	2, 				'PG_RIODELAPLATA_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_EE_CUIRASSIER') 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
--

DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_PG_GRANADEROS', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_EE_CUIRASSIER' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType,	Cost)
SELECT	'UNIT_PG_GRANADEROS', 		ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_EE_CUIRASSIER' 
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');

DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_PG_GRANADEROS', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_EE_CUIRASSIER' 
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_PG_GRANADEROS', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_EE_CUIRASSIER' 
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');


DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PG_GRANADEROS'
AND EXISTS (SELECT * FROM Technologies WHERE Type = 'TECH_EE_FLINTLOCK');
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_PG_GRANADEROS', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_EE_CUIRASSIER' 
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_EE_CUIRASSIER');

INSERT OR REPLACE INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_PG_GRANADEROS', 		'PROMOTION_PG_GRANADEROS_ON');


--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,			TraitOne,				TraitTwo)
VALUES  ('LEADER_PG_SANMARTIN',	'POLICY_EXPANSIVE_X',	'POLICY_CREATIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'José de San Martín [ICON_FOOD][ICON_CULTURE]'
WHERE Type = 'LEADER_PG_SANMARTIN'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_INCA'
WHERE Type = 'CIVILIZATION_PG_RIODELAPLATA'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_INCA');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,	 Y)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	161, 16);

CREATE TABLE IF NOT EXISTS MinorCiv_YagemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YagemStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES');
INSERT INTO MinorCiv_YagemStartPosition
		(Type,				 X,	  Y)
VALUES	('MINOR_CIV_ZURICH', 162, 38); -- Paramaribo

------------------------------------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,	 Y)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	37,  15);

CREATE TABLE IF NOT EXISTS MinorCiv_YahemStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_YahemStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES');
INSERT INTO MinorCiv_YahemStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_BUENOS_AIRES', 38, 35); -- Paramaribo

------------------------------------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								 X,	 Y)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	 19, 8);

CREATE TABLE IF NOT EXISTS MinorCiv_CordiformStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_CordiformStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES');
INSERT INTO MinorCiv_CordiformStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_BUENOS_AIRES', 15, 18); -- Paramaribo

------------------------------------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,	Y)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	27, 7);

CREATE TABLE IF NOT EXISTS MinorCiv_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
DELETE FROM MinorCiv_GreatestEarthStartPosition WHERE Type IN ('MINOR_CIV_BUENOS_AIRES');
INSERT INTO MinorCiv_GreatestEarthStartPosition
		(Type,				 X,	 Y)
VALUES	('MINOR_CIV_BUENOS_AIRES', 26, 23); -- Paramaribo


------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Euro Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_NorthWestEuropeRequestedResource (North-West Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthWestEuropeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthWestEuropeRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthWestEuropeRequestedResource WHERE Type = 'CIVILIZATION_INCA';
------------------------------------------------------------	
-- Civilizations_NorthAtlanticRequestedResource (North Atlantic)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_NorthAtlanticRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthAtlanticRequestedResource
		(Type, 							Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthAtlanticRequestedResource WHERE Type = 'CIVILIZATION_INCA';

--==========================================================================================================================
-- JFD CITIES IN DEVELOPMENT
--==========================================================================================================================
--====================================	
-- JFD COLONIES
--====================================	
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_DECOLONIZATION',	8);
--====================================	
-- JFD DEVELOPMENT
--====================================	
--====================================
-- JFD PROVINCES 
--====================================
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);
		
INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,						DefaultTitle,									UniqueTitle,													UseAdjective)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_BARONY_DESC',				'TXT_KEY_PROVINCE_JFD_BARONY_DESC_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER',		'TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_COUNTY_DESC',				'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER',		'TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_DUCHY_DESC',				'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_PG_RIODELAPLATA',				1),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER',		'TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_COLONY_DESC',				'TXT_KEY_PROVINCE_JFD_COLONY_DESC_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER',		'TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_PG_RIODELAPLATA',		0);

--====================================	
-- JFD SLAVERY
--====================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,				Flavor)
VALUES	('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_SLAVERY',	0);

--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,				 Flavor)
VALUES	('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_MERCENARY',	 9);

--==========================================================================================================================	
-- JFD's RISE TO POWER (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- PIETY
--==========================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--Religous Intolerance: A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--State Religion: A value of 0-12 may be set. This value determines the chance to adopt a State Religion. A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,								Flavor)
VALUES	('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		4),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_STATE_RELIGION',			7);
--==========================================================	
-- PROSPERITY
--==========================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,				CurrencyType)
SELECT	'CIVILIZATION_PG_RIODELAPLATA',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_BRAZIL';	
--==========================================================	
-- SOVEREIGNTY
--==========================================================
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

--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC or GOVERNMENT_JFD_THEOCRACY or GOVERNMENT_JFD_DICTATORSHIP) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,				LegislatureName, 												OfficeTitle, 															GovernmentType, 			Weight)
VALUES	('CIVILIZATION_PG_RIODELAPLATA','TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_PG_RIODELAPLATA', 	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA', 	'GOVERNMENT_JFD_REPUBLIC', 	100);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      			HeadOfGovernmentName)
VALUES  ('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_1'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_2'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_3'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_4'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_5'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_6'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_7'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_8'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_9'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_10'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_11'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_12'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_13'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_14'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_15'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_16'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_17'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_18'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_19'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_20'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_21'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_22'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_23'),
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_24'), 
		('CIVILIZATION_PG_RIODELAPLATA',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_PG_RIODELAPLATA_25');

------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

--This lists all the unique titles that a civilization should use instead of a standard one. If left blank, a culture-specific title will be used instead (if CulDiv support).
--The default titles are as follows:
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT (Tribe)
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER (Chief/Chieftess)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER (Grand Prince)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT (Grand Principality)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER (King/Queen)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT (Kingdom)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER (Emperor/Empress)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT (Empire)
----TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT (Commonwealth)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER (Consul)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE (President)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT (Republic)
----TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER (Dictator)
----TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT (Federation)

--For 'LEADER' titles, just include the title in the text, e.g. "Pharoah."  You MUST affix _FEMININE to the end of all text strings. e.g. in the example below, you must have TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_EGYPT but also TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_EGYPT_FEMININE in your text file.
--For 'GOVERNMENT' titles, include a placeholder for your civ's short description, e.g. "Kingdom of {1_CivName}"
--Use 'UseAdjective' when you want the 'GOVERNMENT' title to read (e.g.): "{1_CivAdj} Kingdom" instead of "Kingdom of {1_CivName}"
INSERT INTO Civilization_JFD_Titles
		(CivilizationType,					DefaultTitle,											UniqueTitle,																UseAdjective)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT_PG_RIODELAPLATA',			1),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_PG_RIODELAPLATA',			0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_PG_RIODELAPLATA',			0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT_PG_RIODELAPLATA',			0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT_PG_RIODELAPLATA',			0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_PG_RIODELAPLATA',				0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE_PG_RIODELAPLATA',		0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_PG_RIODELAPLATA',			0),
		('CIVILIZATION_PG_RIODELAPLATA',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT_PG_RIODELAPLATA',		0);	
		
		
------------------------------------------------------------
-- MinorCivilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	MinorCivilization_JFD_Titles (
	MinorCivilizationType  				text 		REFERENCES MinorCivilizations(Type)			default null,
	ReligionType						text 		REFERENCES Religions(Type) 					default null,
	UniqueGovernmentTitle				text 		 											default null,
	UniqueLeaderTitle					text 		 											default null);	
	
--This handles unique City-State titles, acquired by major civilizations when conquering them. Unique Titles also need a _FEMININE version when writing its string (see above).

--INSERT INTO Civilization_JFD_Titles
--		(CivilizationType,					UniqueGovernmentTitle,							UniqueLeaderTitle)
--VALUES	('CIVILIZATION_JFD_SCOTLAND',		'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_JFD_SCOTLAND');
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

--This table handles all unique Privy Councillor titles. Note that Chaplain titles will override religion-specific ones.	
--INSERT INTO JFD_PrivyCouncillor_UniqueNames	
--		(PrivyCouncillorType,				CivilizationType,							UniqueName)
--VALUES	('COUNCILLOR_JFD_CHANCELLOR',		'CIVILIZATION_JFD_SCOTLAND',				'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_JFD_SCOTLAND'),
--		('COUNCILLOR_JFD_CHAPLAIN',			'CIVILIZATION_JFD_SCOTLAND',				'TXT_KEY_COUNCILLOR_JFD_CHAPLAIN_DESC_JFD_SCOTLAND'),
--		('COUNCILLOR_JFD_MARSHAL',			'CIVILIZATION_JFD_SCOTLAND',				'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_JFD_SCOTLAND'),
--		('COUNCILLOR_JFD_HERALD',			'CIVILIZATION_JFD_SCOTLAND',				'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_JFD_SCOTLAND'),
--		('COUNCILLOR_JFD_STEWARD',			'CIVILIZATION_JFD_SCOTLAND',				'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_JFD_SCOTLAND');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----FACTION_JFD_NATIONALIST
----FACTION_JFD_POPULARIST
----PARTY_JFD_BURGHERS
----PARTY_JFD_CLERGY
----PARTY_JFD_NOBILITY
----PARTY_JFD_REVOLUTIONARY
----PARTY_JFD_CONSERVATIVE
----PARTY_JFD_LIBERAL
----PARTY_JFD_REACTIONARY
----PARTY_JFD_SOCIALIST
----PARTY_JFD_COMMUNIST
----PARTY_JFD_FASCIST
----PARTY_JFD_LIBERTARIAN
--INSERT INTO Civilization_JFD_Politics
--		(CivilizationType,					PoliticsType, 				UniqueName)
--VALUES	('CIVILIZATION_JFD_SCOTLAND',		'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_SCOTLAND');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-4 will favour Left Reforms. A value of 5-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_GOVERNMENT',		9),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_LEGAL',			9),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_CULTURE',		9),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_ECONOMIC',		2),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_FOREIGN',		7),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_INDUSTRY',		3),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_MILITARY',		9),
		('LEADER_PG_SANMARTIN',	'FLAVOR_JFD_REFORM_RELIGION',		1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  												text 	REFERENCES Leaders(Type) 				default	null,
	ReformType													text											default	null);
	
--Although Leader_Flavors will support, the following table will allow you to assign Reforms to leaders that they will be more likely to take. 
--For specific Reforms, see My Games\Sid Meier's Civilization 5\MODS\JFD's Rise to Power\Components\Sovereignty\Core\Sovereignty_Reforms.sql
--INSERT INTO Leader_Flavors
--		(LeaderType,			ReformType)
--VALUES	('LEADER_JFD_JAMES',	'REFORM_JFD_WORSHIP_SACRIFICE');
--==========================================================================================================================		
--==========================================================================================================================		
