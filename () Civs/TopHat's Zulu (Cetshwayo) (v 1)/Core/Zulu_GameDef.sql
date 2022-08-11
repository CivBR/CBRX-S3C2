-- Zulu (Cetshwayo)
-- ======================================================================================================
-- CIVILIZATIONS
-- ======================================================================================================
-- Civilizations
----------------
INSERT INTO Civilizations
       (Type,                         Description,                       ShortDescription,                          Adjective,                          Civilopedia,                         CivilopediaTag,      DefaultPlayerColor,       ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,                  IconAtlas,        PortraitIndex,  AlphaIconAtlas,               SoundtrackTag,   MapImage,                   DawnOfManQuote,                   DawnOfManImage)
SELECT 'CIVILIZATION_THP_ZULU', 'TXT_KEY_CIV_THP_ZULU_DESC',  'TXT_KEY_CIV_THP_ZULU_SHORT_DESC',   'TXT_KEY_CIV_THP_ZULU_ADJECTIVE',    'TXT_KEY_PEDIA_THP_ZULU_TEXT',  'TXT_KEY_PEDIA_THP_ZULU', 'PLAYERCOLOR_THP_ZULU',     ArtDefineTag,   ArtStyleType,  ArtStyleSuffix, ArtStylePrefix,    'THP_ZULU_ATLAS',   0,             'THP_ZULU_ALPHA_ATLAS',   SoundtrackTag,  'Map_Cetshwayo.dds',  'TXT_KEY_CIV5_DAWN_THP_ZULU_TEXT',   'Cetshwayo_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_CityNames
-------------------------
INSERT INTO Civilization_CityNames
        (CivilizationType,                     CityName)
VALUES  ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_1'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_2'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_3'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_4'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_5'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_6'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_7'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_8'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_9'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_10'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_11'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_12'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_13'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_14'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_15'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_16'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_17'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_18'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_19'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_20'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_21'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_22'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_23'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_24'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_25'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_26'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_27'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_28'),
        ('CIVILIZATION_THP_ZULU',     'TXT_KEY_CITY_NAME_THP_ZULU_29');

-- Changes to Shaka's city list
DELETE FROM Civilization_CityNames
WHERE CivilizationType = 'CIVILIZATION_ZULU' AND CityName = 'TXT_KEY_CITY_NAME_BULAWAYO';

DELETE FROM Civilization_CityNames
WHERE CivilizationType = 'CIVILIZATION_ZULU' AND CityName = 'TXT_KEY_CITY_NAME_KWADUKUZA';

UPDATE Civilization_CityNames
SET CityName = 'TXT_KEY_CITY_NAME_THP_BULAWAYO'
WHERE (CivilizationType = 'CIVILIZATION_ZULU') and (CityName = 'TXT_KEY_CITY_NAME_ULUNDI');

UPDATE Civilization_CityNames
SET CityName = 'TXT_KEY_CITY_NAME_KWADUKUZA'
WHERE (CivilizationType = 'CIVILIZATION_ZULU') and (CityName = 'TXT_KEY_CITY_NAME_UMGUNGUNDLOVU');
-----------------------------------
-- Civilization_FreeBuildingClasses
-----------------------------------
INSERT INTO Civilization_FreeBuildingClasses
          (CivilizationType,           BuildingClassType)
SELECT    'CIVILIZATION_THP_ZULU',     BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeTechs
-------------------------
INSERT INTO Civilization_FreeTechs
          (CivilizationType,           TechType)
SELECT    'CIVILIZATION_THP_ZULU',     TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';
-------------------------
-- Civilization_FreeUnits
-------------------------
INSERT INTO Civilization_FreeUnits
          (CivilizationType,           UnitClassType, Count, UnitAIType)
SELECT    'CIVILIZATION_THP_ZULU',     UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';
-----------------------
-- Civilization_Leaders
-----------------------
INSERT INTO Civilization_Leaders
       (CivilizationType,         LeaderheadType)
VALUES ('CIVILIZATION_THP_ZULU', 'LEADER_THP_CETSHWAYO');
--------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
       (CivilizationType,         BuildingClassType,      BuildingType)
VALUES ('CIVILIZATION_THP_ZULU', 'BUILDINGCLASS_STABLE', 'BUILDING_THP_KRAAL');
----------------------------------
-- Civilization_UnitClassOverrides
----------------------------------
INSERT INTO Civilization_UnitClassOverrides
       (CivilizationType,         UnitClassType,         UnitType)
VALUES ('CIVILIZATION_THP_ZULU', 'UNITCLASS_MUSKETMAN', 'UNIT_THP_IBUTHO');
-------------------------
-- Civilization_Religions
-------------------------
INSERT INTO Civilization_Religions
       (CivilizationType,         ReligionType)
VALUES ('CIVILIZATION_THP_ZULU', 'RELIGION_PROTESTANTISM');
------------------------
-- Civilization_SpyNames
------------------------
INSERT INTO Civilization_SpyNames
          (CivilizationType,             SpyName)
VALUES    ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_0'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_1'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_2'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_3'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_4'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_5'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_6'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_7'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_8'),
          ('CIVILIZATION_THP_ZULU',     'TXT_KEY_SPY_NAME_THP_ZULU_9');
-- ======================================================================================================
-- LEADERS
-- ======================================================================================================
-- Leaders
----------
INSERT INTO Leaders
(Type,                                     Description,                                              Civilopedia,      CivilopediaTag,                     ArtDefineTag,               VictoryCompetitiveness,     WonderCompetitiveness,     MinorCivCompetitiveness,     Boldness,     DiploBalance,   WarmongerHate,     DenounceWillingness,     DoFWillingness, Loyalty,     Neediness,    Forgiveness,     Chattiness, Meanness,     IconAtlas,             PortraitIndex)
VALUES    ('LEADER_THP_CETSHWAYO',     'TXT_KEY_LEADER_THP_CETSHWAYO',    'TXT_KEY_LEADER_THP_CETSHWAYO_PEDIA_TEXT',  'TXT_KEY_LEADER_THP_CETSHWAYO_PEDIA', 'Leaderhead_Cetshwayo.xml',    8,                          5,                          3,                           6,            8,              9,                 7,                       5,                 4,           6,            4,               7,          5,           'THP_ZULU_ATLAS',   1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------
INSERT INTO Leader_MajorCivApproachBiases
          (LeaderType,                  MajorCivApproachType,              Bias)
VALUES    ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_WAR',           6),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_HOSTILE',       2),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_DECEPTIVE',     5),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_GUARDED',       8),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_AFRAID',        5),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_FRIENDLY',      6),
          ('LEADER_THP_CETSHWAYO',     'MAJOR_CIV_APPROACH_NEUTRAL',       2);
--------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------
INSERT INTO Leader_MinorCivApproachBiases
          (LeaderType,                  MinorCivApproachType,              Bias)
VALUES    ('LEADER_THP_CETSHWAYO',     'MINOR_CIV_APPROACH_IGNORE',        6),
          ('LEADER_THP_CETSHWAYO',     'MINOR_CIV_APPROACH_FRIENDLY',      5),
          ('LEADER_THP_CETSHWAYO',     'MINOR_CIV_APPROACH_PROTECTIVE',    8),
          ('LEADER_THP_CETSHWAYO',     'MINOR_CIV_APPROACH_CONQUEST',      3),
          ('LEADER_THP_CETSHWAYO',     'MINOR_CIV_APPROACH_BULLY',         2);
-----------------
-- Leader_Flavors
-----------------
INSERT INTO Leader_Flavors
          (LeaderType,                  FlavorType,                        Flavor)
VALUES    ('LEADER_THP_CETSHWAYO',     'FLAVOR_OFFENSE',                   5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_DEFENSE',                   9),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_CITY_DEFENSE',              6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_MILITARY_TRAINING',         9),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_RECON',                     5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_RANGED',                    5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_MOBILE',                    5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_NAVAL',                     4),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_NAVAL_RECON',               4),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_NAVAL_GROWTH',              4),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_NAVAL_TILE_IMPROVEMENT',    6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_AIR',                       6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_EXPANSION',                 5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_GROWTH',                    7),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_TILE_IMPROVEMENT',          8),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_INFRASTRUCTURE',            6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_PRODUCTION',                6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_GOLD',                      5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_SCIENCE',                   3),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_CULTURE',                   5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_HAPPINESS',                 6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_GREAT_PEOPLE',              2),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_WONDER',                    4),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_RELIGION',                  3),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_DIPLOMACY',                 8),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_SPACESHIP',                 3),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_WATER_CONNECTION',          2),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_NUKE',                      5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_USE_NUKE',                  2),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_ESPIONAGE',                 6),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_ANTIAIR',                   8),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_AIRLIFT',                   5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_I_TRADE_DESTINATION',       9),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_I_TRADE_ORIGIN',            10),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_I_SEA_TRADE_ROUTE',         5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_I_LAND_TRADE_ROUTE',        8),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_ARCHAEOLOGY',               5),
          ('LEADER_THP_CETSHWAYO',     'FLAVOR_AIR_CARRIER',               5);
----------------
-- Leader_Traits
----------------
INSERT INTO Leader_Traits
       (LeaderType,                TraitType)
VALUES ('LEADER_THP_CETSHWAYO',   'TRAIT_THP_ZULU');
-- ======================================================================================================
-- TRAITS
-- ======================================================================================================
-- Traits
---------
INSERT INTO Traits
       (Type,                 Description,                ShortDescription)
VALUES ('TRAIT_THP_ZULU',    'TXT_KEY_TRAIT_THP_ZULU',   'TXT_KEY_TRAIT_THP_ZULU_SHORT');
-- ======================================================================================================
-- BUILDINGS
-- ======================================================================================================
-- Buildings
------------
INSERT INTO Buildings
(Type,                              BuildingClass,    Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,   FreeStartEra,  TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus,    Description,                         Help,                               Civilopedia,                                                    Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  PortraitIndex, IconAtlas)
SELECT    'BUILDING_THP_KRAAL',    BuildingClass,   Cost, FaithCost, UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,  FreeStartEra,  TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus,   'TXT_KEY_BLDG_THP_KRAAL',    'TXT_KEY_BLDG_THP_KRAAL_HELP',    'TXT_KEY_BLDG_THP_KRAAL_TEXT',    'TXT_KEY_BLDG_THP_KRAAL_STRATEGY',  ArtDefineTag, MinAreaSize, NeverCapture, ConquestProb,   HurryCostModifier,  3,            'THP_ZULU_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STABLE';
-------------------------------
-- Building_ClassesNeededInCity
-------------------------------
INSERT INTO Building_ClassesNeededInCity
        (BuildingType,        BuildingClassType)
SELECT  'BUILDING_THP_KRAAL', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_STABLE';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,           FlavorType,    Flavor)
SELECT    'BUILDING_THP_KRAAL',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STABLE';

INSERT OR REPLACE INTO Building_Flavors
        (BuildingType,             FlavorType,                Flavor)
VALUES  ('BUILDING_THP_KRAAL',    'FLAVOR_TILE_IMPROVEMENT',  15);
--------------------------------
-- Building_ResourceYieldChanges
--------------------------------
INSERT INTO Building_ResourceYieldChanges
        (BuildingType,          ResourceType,   YieldType,  Yield)
SELECT  'BUILDING_THP_KRAAL',   ResourceType,   YieldType,  Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STABLE';
-----------------------------------------
-- Building_UnitCombatProductionModifiers
-----------------------------------------
INSERT INTO Building_UnitCombatProductionModifiers
        (BuildingType,          UnitCombatType, Modifier)
SELECT  'BUILDING_THP_KRAAL',   UnitCombatType, Modifier
FROM Building_UnitCombatProductionModifiers WHERE BuildingType = 'BUILDING_STABLE';
-- ======================================================================================================
-- UNITS
-- ======================================================================================================
-- UnitPromotions
-----------------
INSERT INTO UnitPromotions
(Type,                                       Description,                                              Help,                     Sound,  CannotBeChosen, PortraitIndex,     IconAtlas,            PediaType,          PediaEntry)
VALUES    ('PROMOTION_THP_IBUTHO_BASE',         'TXT_KEY_PROMOTION_THP_IBUTHO_BASE',     'TXT_KEY_PROMOTION_THP_IBUTHO_BASE_HELP',     'AS2D_IF_LEVELUP',  1,              57,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_IBUTHO_BASE'),
('PROMOTION_THP_IBUTHO_STRENGTH',         'TXT_KEY_PROMOTION_THP_IBUTHO_STRENGTH',     'TXT_KEY_PROMOTION_THP_IBUTHO_STRENGTH_HELP',     'AS2D_IF_LEVELUP',  1,              59,             'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_THP_IBUTHO_STRENGTH');

UPDATE UnitPromotions
SET DefenseMod = 5
WHERE (Type = 'PROMOTION_THP_IBUTHO_BASE');

UPDATE UnitPromotions
SET AttackMod = -5
WHERE (Type = 'PROMOTION_THP_IBUTHO_BASE');

UPDATE UnitPromotions
SET CombatPercent = 33
WHERE (Type = 'PROMOTION_THP_IBUTHO_STRENGTH');
--------
-- Units
--------
INSERT INTO Units
(Type,                        Class,    CombatClass,       WorkRate,  PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special,  Description,                                                         Help,                                       Strategy,                                    Civilopedia,                      MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,             UnitArtInfo,               UnitFlagAtlas,                 UnitFlagIconOffset,    IconAtlas,          PortraitIndex,  MoveRate)
SELECT    'UNIT_THP_IBUTHO',   Class,  'UNITCOMBAT_MELEE', WorkRate, 'TECH_CHIVALRY', (Combat-3), RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_THP_IBUTHO',    'TXT_KEY_UNIT_THP_IBUTHO_HELP',    'TXT_KEY_UNIT_THP_IBUTHO_STRATEGY',      'TXT_KEY_UNIT_THP_IBUTHO_TEXT',    MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, AdvancedStartCost, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_THP_IBUTHO', 'THP_UNIT_IBUTHO_FLAG_ATLAS',    0,                    'THP_ZULU_ATLAS',   2,              MoveRate
FROM Units WHERE Type = 'UNIT_MUSKETMAN';
------------------------
-- UnitGameplay2DScripts
------------------------
INSERT INTO UnitGameplay2DScripts
       (UnitType,          SelectionSound, FirstSelectionSound)
SELECT 'UNIT_THP_IBUTHO',  SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';
---------------
-- Unit_AITypes
---------------
INSERT INTO Unit_AITypes
          (UnitType,            UnitAIType)
SELECT    'UNIT_THP_IBUTHO',    UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSKETMAN';
---------------
-- Unit_Flavors
---------------
INSERT INTO Unit_Flavors
       (UnitType,          FlavorType, Flavor)
SELECT 'UNIT_THP_IBUTHO',  FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSKETMAN';
----------------------
-- Unit_FreePromotions
----------------------
INSERT INTO Unit_FreePromotions
        (UnitType,          PromotionType)
SELECT  'UNIT_THP_IBUTHO',  PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_FreePromotions
        (UnitType,           PromotionType)
VALUES  ('UNIT_THP_IBUTHO', 'PROMOTION_THP_IBUTHO_BASE');
---------------------
-- Unit_ClassUpgrades
---------------------
INSERT INTO Unit_ClassUpgrades
        (UnitType,          UnitClassType)
SELECT  'UNIT_THP_IBUTHO',  UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
-- ======================================================================================================
-- DIPLOMACY
-- ======================================================================================================
INSERT INTO Diplomacy_Responses
(LeaderType,             ResponseType,                                     Response,                                                             Bias)
VALUES     ('LEADER_THP_CETSHWAYO',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_THP_CETSHWAYO_ATTACKED_GENERIC%',                     500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_THP_CETSHWAYO_DEFEATED%',                             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_DOW_GENERIC',                         'TXT_KEY_LEADER_THP_CETSHWAYO_DOW_GENERIC%',                             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_EXPANSION_SERIOUS_WARNING',             'TXT_KEY_LEADER_THP_CETSHWAYO_EXPANSION_SERIOUS_WARNING%',             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_FIRST_GREETING',                         'TXT_KEY_LEADER_THP_CETSHWAYO_FIRSTGREETING%',                         500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_GREETING_AT_WAR_HOSTILE',             'TXT_KEY_LEADER_THP_CETSHWAYO_GREETING_AT_WAR_HOSTILE%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_GREETING_POLITE_HELLO',                 'TXT_KEY_LEADER_THP_CETSHWAYO_GREETING_POLITE_HELLO%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_GREETING_NEUTRAL_HELLO',                 'TXT_KEY_LEADER_THP_CETSHWAYO_GREETING_NEUTRAL_HELLO%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_GREETING_HOSTILE_HELLO',                 'TXT_KEY_LEADER_THP_CETSHWAYO_GREETING_HOSTILE_HELLO%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_THP_CETSHWAYO_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',     500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_INFLUENTIAL_ON_AI',                     'TXT_KEY_LEADER_THP_CETSHWAYO_INFLUENTIAL_ON_AI%',                     500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_THP_CETSHWAYO_INFLUENTIAL_ON_HUMAN%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_THP_CETSHWAYO_LETS_HEAR_IT%',                         500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_THP_CETSHWAYO_LUXURY_TRADE%',                         500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_THP_CETSHWAYO_NO_PEACE%',                             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                 'TXT_KEY_LEADER_THP_CETSHWAYO_OPEN_BORDERS_EXCHANGE%',                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_THP_CETSHWAYO_LOSEWAR%',                                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_REPEAT_NO',                             'TXT_KEY_LEADER_THP_CETSHWAYO_REPEAT_NO%',                             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_THP_CETSHWAYO_RESPONSE_REQUEST%',                     500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',         'TXT_KEY_LEADER_THP_CETSHWAYO_RESPONSE_TO_BEING_DENOUNCED%',             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_TOO_SOON_NO_PEACE',                     'TXT_KEY_LEADER_THP_CETSHWAYO_TOO_SOON_NO_PEACE_1%',                     500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_WINNER_PEACE_OFFER',                     'TXT_KEY_LEADER_THP_CETSHWAYO_WINWAR%',                                 500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_THP_CETSHWAYO_DENOUNCE%',                             500),
('LEADER_THP_CETSHWAYO',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_THP_CETSHWAYO_DEC_FRIENDSHIP%',                         500);
-- ======================================================================================================
-- ======================================================================================================
