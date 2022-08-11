-- Merovingian
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_URD_KWAK', 'TXT_KEY_CIV_URD_KWAK_DESC',  'TXT_KEY_CIV_URD_KWAK_SHORT_DESC',   'TXT_KEY_CIV_URD_KWAK_ADJECTIVE',    'TXT_KEY_PEDIA_URD_KWAK_TEXT',  'TXT_KEY_PEDIA_URD_KWAK', 'PLAYERCOLOR_URD_KWAK',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'URD_KWAK_ATLAS',   0,             'URD_KWAK_ALPHA_ATLAS',   SoundtrackTag,  'Map_Kwak.dds',  'TXT_KEY_CIV5_DAWN_URD_KWAK_TEXT',   'Seaweed_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_IROQUOIS';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,             CityName)
VALUES  ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_1'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_2'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_3'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_4'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_5'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_6'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_7'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_8'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_9'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_10'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_11'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_12'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_13'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_14'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_15'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_16'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_17'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_18'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_19'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_20'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_21'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_22'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_23'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_24'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_25'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_26'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_27'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_28'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_29'),
        ('CIVILIZATION_URD_KWAK',     'TXT_KEY_CITY_NAME_URD_KWAK_30');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,                  BuildingClassType)
SELECT    'CIVILIZATION_URD_KWAK',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,                  TechType)
SELECT    'CIVILIZATION_URD_KWAK',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,                  UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_URD_KWAK',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_IROQUOIS';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,                LeaderheadType)
VALUES ('CIVILIZATION_URD_KWAK', 'LEADER_URD_SEAWEED');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,                BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_URD_KWAK', 'BUILDINGCLASS_AMPHITHEATER', 'BUILDING_URD_COPPERHOUSE');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,                UnitClassType,         UnitType)
VALUES ('CIVILIZATION_URD_KWAK', 'UNITCLASS_SCOUT', 'UNIT_URD_HAMATSA');
-------------------------
-- Civilization_Religions
-------------------------
--INSERT INTO Civilization_Religions
--       (CivilizationType,                ReligionType)
--VALUES ('CIVILIZATION_URD_KWAK', 'RELIGION_CHRISTIANITY');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,                    SpyName)
VALUES    ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_0'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_1'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_2'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_3'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_4'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_5'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_6'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_7'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_8'),
          ('CIVILIZATION_URD_KWAK',     'TXT_KEY_SPY_NAME_URD_KWAK_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,              Description,                    Civilopedia,                               CivilopediaTag,     ArtDefineTag,              VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_URD_SEAWEED',     'TXT_KEY_LEADER_URD_SEAWEED',    'TXT_KEY_LEADER_URD_SEAWEED_PEDIA_TEXT',  'TXT_KEY_LEADER_URD_SEAWEED_PEDIA', 'Leaderhead_Seaweed.xml',    6,                       5,                         5,     6,                 8,             9,                 5,                       6,              7,           4,            3,               4,          1,           'URD_KWAK_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,               MajorCivApproachType,              Bias)
VALUES    ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_WAR',           3),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_HOSTILE',       4),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_DECEPTIVE',     1),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_GUARDED',       7),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_AFRAID',        4),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_FRIENDLY',      5),
          ('LEADER_URD_SEAWEED',     'MAJOR_CIV_APPROACH_NEUTRAL',       5);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,               MinorCivApproachType,              Bias)
VALUES    ('LEADER_URD_SEAWEED',     'MINOR_CIV_APPROACH_IGNORE',        2),
          ('LEADER_URD_SEAWEED',     'MINOR_CIV_APPROACH_FRIENDLY',      7),
          ('LEADER_URD_SEAWEED',     'MINOR_CIV_APPROACH_PROTECTIVE',    5),
          ('LEADER_URD_SEAWEED',     'MINOR_CIV_APPROACH_CONQUEST',      2),
          ('LEADER_URD_SEAWEED',     'MINOR_CIV_APPROACH_BULLY',         2);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,               FlavorType,                        Flavor)
VALUES    ('LEADER_URD_SEAWEED',     'FLAVOR_OFFENSE',                   3),
          ('LEADER_URD_SEAWEED',     'FLAVOR_DEFENSE',                   5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_CITY_DEFENSE',              7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_MILITARY_TRAINING',         5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_RECON',                     6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_RANGED',                    6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_MOBILE',                    4),
          ('LEADER_URD_SEAWEED',     'FLAVOR_NAVAL',                     6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_NAVAL_RECON',               4),
          ('LEADER_URD_SEAWEED',     'FLAVOR_NAVAL_GROWTH',              7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_AIR',                       5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_EXPANSION',                 5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_GROWTH',                    5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_TILE_IMPROVEMENT',          5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_INFRASTRUCTURE',            7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_PRODUCTION',                8),
          ('LEADER_URD_SEAWEED',     'FLAVOR_GOLD',                      9),
          ('LEADER_URD_SEAWEED',     'FLAVOR_SCIENCE',                   4),
          ('LEADER_URD_SEAWEED',     'FLAVOR_CULTURE',                   9),
          ('LEADER_URD_SEAWEED',     'FLAVOR_HAPPINESS',                 5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_GREAT_PEOPLE',              7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_WONDER',                    6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_RELIGION',                  7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_DIPLOMACY',                 6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_SPACESHIP',                 3),
          ('LEADER_URD_SEAWEED',     'FLAVOR_WATER_CONNECTION',          7),
          ('LEADER_URD_SEAWEED',     'FLAVOR_NUKE',                      2),
          ('LEADER_URD_SEAWEED',     'FLAVOR_USE_NUKE',                  1),
          ('LEADER_URD_SEAWEED',     'FLAVOR_ESPIONAGE',                 3),
          ('LEADER_URD_SEAWEED',     'FLAVOR_ANTIAIR',                   6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_I_TRADE_DESTINATION',       6),
          ('LEADER_URD_SEAWEED',     'FLAVOR_I_TRADE_ORIGIN',            4),
          ('LEADER_URD_SEAWEED',     'FLAVOR_I_SEA_TRADE_ROUTE',         4),
          ('LEADER_URD_SEAWEED',     'FLAVOR_I_LAND_TRADE_ROUTE',        5),
          ('LEADER_URD_SEAWEED',     'FLAVOR_ARCHAEOLOGY',               8),
          ('LEADER_URD_SEAWEED',     'FLAVOR_AIR_CARRIER',               5);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,             TraitType)
VALUES ('LEADER_URD_SEAWEED',   'TRAIT_URD_KWAK');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                        Description,                       ShortDescription)
VALUES ('TRAIT_URD_KWAK',    'TXT_KEY_TRAIT_URD_KWAK',   'TXT_KEY_TRAIT_URD_KWAK_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  EspionageModifier, Espionage, AllowsRangeStrike, Defense, ExtraCityHitPoints,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_URD_COPPERHOUSE',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,  EspionageModifier, Espionage, AllowsRangeStrike, Defense, ExtraCityHitPoints,  'TXT_KEY_BLDG_URD_COPPERHOUSE',    'TXT_KEY_BLDG_URD_COPPERHOUSE_HELP',    'TXT_KEY_BLDG_URD_COPPERHOUSE_TEXT',    'TXT_KEY_BLDG_URD_COPPERHOUSE_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'URD_KWAK_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,            BuildingClassType)
SELECT  'BUILDING_URD_COPPERHOUSE', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AMPHITHEATER';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,               FlavorType,    Flavor)
SELECT    'BUILDING_URD_COPPERHOUSE',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_AMPHITHEATER';

INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,                 FlavorType,               Flavor)
VALUES  ('BUILDING_URD_COPPERHOUSE',    'FLAVOR_GROWTH',       10);
------------------------
-- Building_YieldChanges
------------------------
INSERT INTO Building_YieldChanges
        (BuildingType,              YieldType,  Yield)
SELECT  'BUILDING_URD_COPPERHOUSE',   YieldType,  Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_AMPHITHEATER';

------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				NoLimit,		Description)
VALUES	('BUILDINGCLASS_URD_KWAKREDUCE',	'BUILDING_URD_KWAKREDUCE',	1,	'TXT_KEY_BUILDING_URD_KWAKREDUCE'),
		('BUILDINGCLASS_URD_KWAKFOOD',	'BUILDING_URD_KWAKFOOD',	1,	'TXT_KEY_BUILDING_URD_KWAKFOOD');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Happiness,	Description, 						Help)
VALUES	('BUILDING_URD_KWAKREDUCE',	 'BUILDINGCLASS_URD_KWAKREDUCE',		-1, 			-1,		-1,	0,	1, 		null,		1,	0,				'TXT_KEY_BUILDING_URD_KWAKREDUCE',	'TXT_KEY_BUILDING_URD_KWAKREDUCE'),
		('BUILDING_URD_KWAKFOOD',	 'BUILDINGCLASS_URD_KWAKFOOD',		-1, 			-1,		-1,	0,	1, 		null,		1,	0,				'TXT_KEY_BUILDING_URD_KWAKFOOD',	'TXT_KEY_BUILDING_URD_KWAKFOOD');

INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,			Yield)
VALUES		('BUILDING_URD_KWAKFOOD', 	'YIELD_FOOD',	1);

INSERT INTO Building_HurryModifiers
			(BuildingType, 							HurryType,			HurryCostModifier)
VALUES		('BUILDING_URD_KWAKREDUCE', 	'HURRY_GOLD',	-3);
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                         Description,                                              Help,                                        Sound,                CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_URD_HAMATSA',         'TXT_KEY_PROMOTION_URD_HAMATSA',     'TXT_KEY_PROMOTION_URD_HAMATSA_HELP',     'AS2D_IF_LEVELUP',     1,              59,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_URD_HAMATSA');
--------
-- Units
--------

INSERT INTO Units
(Type,                           Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_URD_HAMATSA',   Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_URD_HAMATSA',    'TXT_KEY_UNIT_URD_HAMATSA_HELP',    'TXT_KEY_UNIT_URD_HAMATSA_STRATEGY',      'TXT_KEY_UNIT_URD_HAMATSA_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_URD_HAMATSA', 'HAMATSA_FLAG_ATLAS',    0,                    'URD_KWAK_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_SCOUT';
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds 	
			(UnitType, 						BuildType)
VALUES		('UNIT_URD_HAMATSA', 		'BUILD_URD_KWAK');
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,              SelectionSound, FirstSelectionSound)
SELECT 'UNIT_URD_HAMATSA',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SCOUT';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,                UnitAIType)
SELECT    'UNIT_URD_HAMATSA',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SCOUT';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,              FlavorType, Flavor)
SELECT 'UNIT_URD_HAMATSA',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_Flavors
        (UnitType,               FlavorType,        Flavor)
VALUES  ('UNIT_URD_HAMATSA', 'FLAVOR_GOLD',      4),
        ('UNIT_URD_HAMATSA', 'FLAVOR_CULTURE',  4);
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,              PromotionType)
SELECT  'UNIT_URD_HAMATSA',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SCOUT';

INSERT INTO Unit_FreePromotions
        (UnitType,               PromotionType)
VALUES  ('UNIT_URD_HAMATSA', 'PROMOTION_URD_HAMATSA');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,              UnitClassType)
SELECT  'UNIT_URD_HAMATSA',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SCOUT';
------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
        (UnitType,              ResourceType)
SELECT  'UNIT_URD_HAMATSA',  ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SCOUT';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_URD_SEAWEED',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_URD_SEAWEED_DEFEATED%',                             500),
('LEADER_URD_SEAWEED',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_URD_SEAWEED_FIRSTGREETING%',                         500);
-- ======================================================================================================
-- ======================================================================================================
--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,						OutsideBorders, Description,							Civilopedia,									ArtDefineTag,					PillageGold,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_URD_KWAK',	1,				'TXT_KEY_URD_KWAK',					'TXT_KEY_CIVILOPEDIA_URD_KWAK_TEXT',		'ART_DEF_IMPROVEMENT_PASTURE', 	0,				6,				'SAMI_ATLAS');
--==========================================================================================================================
-- Improvement_ResourceTypes: Sami Herd Ability
--==========================================================================================================================
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_URD_KWAK'), 					ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_CAMP');
INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
SELECT		('IMPROVEMENT_URD_KWAK'), 					ResourceType
FROM Improvement_ResourceTypes WHERE (ImprovementType = 'IMPROVEMENT_PASTURE');

CREATE TRIGGER HerdResourceCamp
AFTER INSERT ON Improvement_ResourceTypes WHEN NEW.ImprovementType = 'IMPROVEMENT_CAMP'
BEGIN
	INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
	VALUES	('IMPROVEMENT_URD_KWAK', 					NEW.ResourceType);
END;
CREATE TRIGGER HerdResourcePasture
AFTER INSERT ON Improvement_ResourceTypes WHEN NEW.ImprovementType = 'IMPROVEMENT_PASTURE'
BEGIN
	INSERT INTO Improvement_ResourceTypes
			(ImprovementType,							ResourceType)
	VALUES	('IMPROVEMENT_URD_KWAK', 					NEW.ResourceType);	
END;==============
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,				ImprovementType, 			Time, 	Recommendation, 					Description, 			Help, 								CtrlDown, 	OrderPriority, 	IconIndex, 	IconAtlas, 		EntityEvent)
VALUES		('BUILD_URD_KWAK',	'IMPROVEMENT_URD_KWAK',	0,		'TXT_KEY_BUILD_URD_KWAK_REC',	'TXT_KEY_URD_KWAK',	'TXT_KEY_BUILD_URD_KWAK_HELP',	1,			98,				36,			'TERRAIN_ATLAS',	'ENTITY_EVENT_BUILD');
--==========================================================================================================================
--==========================================================================================================================