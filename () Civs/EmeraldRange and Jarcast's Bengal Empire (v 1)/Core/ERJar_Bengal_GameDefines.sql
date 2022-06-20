--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_ERJAR_TIMER',		'BUILDING_ERJAR_TIMER',			'TXT_KEY_TRAIT_ERJAR_BENGAL_SHORT'),
		('BUILDINGCLASS_ERJAR_KATRA_DUMMY',	'BUILDING_ERJAR_KATRA_DUMMY',	 'TXT_KEY_BUILDING_ERJAR_KATRA_DUMMY');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 							BuildingClass,						Cost, 	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	Description)
VALUES	('BUILDING_ERJAR_KATRA_DUMMY', 	'BUILDINGCLASS_ERJAR_KATRA_DUMMY',	-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_BUILDING_ERJAR_KATRA_DUMMY'),
		('BUILDING_ERJAR_TIMER', 		'BUILDINGCLASS_ERJAR_TIMER',		-1, 	-1,			NULL,				-1,				0,					NULL,		1,				'TXT_KEY_TRAIT_ERJAR_BENGAL_SHORT');

INSERT INTO Building_YieldModifiers     
        (BuildingType,                     YieldType,        Yield)
SELECT    'BUILDING_ERJAR_KATRA_DUMMY',    'YIELD_FOOD',    1;

INSERT INTO Buildings 	
		(Type, 					SpecialistType,			SpecialistCount,	BuildingClass, Cost, 			GoldMaintenance, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, 	PrereqTech, Description, 					Civilopedia, 							Help, 								Strategy,								 	ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT	'BUILDING_ERJAR_KATRA',	'SPECIALIST_ENGINEER',				  1,	BuildingClass, round(Cost*1.2), GoldMaintenance, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus,	PrereqTech, 'TXT_KEY_BUILDING_ERJAR_KATRA',	'TXT_KEY_BUILDING_ERJAR_KATRA_TEXT',  'TXT_KEY_BUILDING_ERJAR_KATRA_HELP', 	'TXT_KEY_BUILDING_ERJAR_KATRA_STRATEGY',	ArtDefineTag, MinAreaSize, 			1, 	 Espionage, EspionageModifier, HurryCostModifier, 2, 			 'ERJAR_BENGAL_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_ERJAR_KATRA'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CARAVANSARY');

INSERT OR REPLACE INTO Building_Flavors	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_ERJAR_KATRA', 	'FLAVOR_PRODUCTION', 10),
		('BUILDING_ERJAR_KATRA', 	'FLAVOR_GREAT_PEOPLE', 2);
------------------------------	
-- Building_ResourceYieldChanges
------------------------------		
INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 			ResourceType,	YieldType,		Yield)
SELECT	'BUILDING_ERJAR_KATRA',	ResourceType,	YieldType,		Yield
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_CARAVANSARY');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 			YieldType,		Yield)
SELECT	'BUILDING_ERJAR_KATRA',	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_CARAVANSARY');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,		Yield)
SELECT	'BUILDING_ERJAR_KATRA',	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_CARAVANSARY');
------------------------------	
-- Building_RiverPlotYieldChanges
------------------------------		
INSERT INTO Building_RiverPlotYieldChanges 	
		(BuildingType, 				YieldType,		Yield)
VALUES	('BUILDING_ERJAR_KATRA',	'YIELD_GOLD',		1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
        (Type,                               Description,                              Help,                                         Sound,             LostWithUpgrade, OrderPriority, CannotBeChosen,    PortraitIndex,     IconAtlas,                    PediaType,             PediaEntry)
VALUES  ('PROMOTION_ERJAR_PAIK_OFF',         'TXT_KEY_PROMOTION_ERJAR_PAIK_OFF',          'TXT_KEY_PROMOTION_ERJAR_PAIK_OFF_HELP',    'AS2D_IF_LEVELUP',    0,                 0,             1,            59,                 'ABILITY_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ERJAR_PAIK_OFF'),
        ('PROMOTION_ERJAR_PAIK_ON',          'TXT_KEY_PROMOTION_ERJAR_PAIK_ON',         'TXT_KEY_PROMOTION_ERJAR_PAIK_ON_HELP',        'AS2D_IF_LEVELUP',    1,                 0,             1,            34,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ERJAR_PAIK_ON'),
        ('PROMOTION_ERJAR_SHIP_RANGE',       'TXT_KEY_PROMOTION_ERJAR_SHIP_RANGE',    'TXT_KEY_PROMOTION_RANGE',                    'AS2D_IF_LEVELUP',    1,                 0,             1,            34,             'PROMOTION_ATLAS',     'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_ERJAR_SHIP_RANGE');

UPDATE UnitPromotions SET RangeChange = 1 WHERE Type = 'PROMOTION_ERJAR_PAIK_ON';
UPDATE UnitPromotions SET RangeChange = 1 WHERE Type = 'PROMOTION_ERJAR_SHIP_RANGE';
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units     
        (Type,                  Class, PrereqTech,    Combat,    RangedCombat, Range,   FaithCost, Cost,    RequiresFaithPurchaseEnabled,    Moves,    CombatClass,    Domain,        DefaultUnitAI,    Description,                    Civilopedia,                        Strategy,                                Help,                                MilitarySupport,    MilitaryProduction,    Pillage,    ObsoleteTech,    IgnoreBuildingDefense,    GoodyHutUpgradeUnitClass,    AdvancedStartCost,    XPValueAttack,        XPValueDefense,        UnitArtInfo,                    UnitFlagIconOffset,   UnitFlagAtlas,               PortraitIndex,    IconAtlas,                    MoveRate)
SELECT  ('UNIT_ERJAR_PAIK'),    Class, PrereqTech,    Combat,    RangedCombat, Range,   FaithCost, Cost,    RequiresFaithPurchaseEnabled,    Moves,    CombatClass,    Domain,        DefaultUnitAI,    ('TXT_KEY_UNIT_ERJAR_PAIK'),    ('TXT_KEY_UNIT_ERJAR_PAIK_TEXT'),   ('TXT_KEY_UNIT_ERJAR_PAIK_STRATEGY'),    ('TXT_KEY_UNIT_ERJAR_PAIK_HELP'),    MilitarySupport,    MilitaryProduction,    Pillage,    ObsoleteTech,    IgnoreBuildingDefense,    GoodyHutUpgradeUnitClass,    AdvancedStartCost,    XPValueAttack,        XPValueDefense,        ('ART_DEF_UNIT_ERJAR_PAIK'),    0,                    ('ERJAR_UNIT_FLAG_PAIK'),    3,                ('ERJAR_BENGAL_ICON_ATLAS'),  MoveRate
FROM Units WHERE (Type = 'UNIT_CROSSBOWMAN');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	('UNIT_ERJAR_PAIK'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CROSSBOWMAN');
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_ERJAR_PAIK', UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CROSSBOWMAN');
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,			Flavor)
SELECT	('UNIT_ERJAR_PAIK'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CROSSBOWMAN');
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_ERJAR_PAIK'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_CROSSBOWMAN');

INSERT INTO Unit_FreePromotions     
        (UnitType,                 PromotionType)
VALUES  ('UNIT_ERJAR_PAIK',     'PROMOTION_AMPHIBIOUS'),
        ('UNIT_ERJAR_PAIK',     'PROMOTION_ERJAR_PAIK_OFF');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	('UNIT_ERJAR_PAIK'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CROSSBOWMAN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_ERJAR_BENGAL',	'TXT_KEY_LEADER_ERJAR_BENGAL',	'TXT_KEY_LEADER_ERJAR_BENGAL_PEDIA',	'TXT_KEY_LEADER_ERJAR_BENGAL_PEDIA',	'Shuja_scene.xml',	6, 						6, 						5, 							8, 			8, 				4, 				4, 						5, 				4, 			6, 			5, 				6, 			5, 		'ERJAR_BENGAL_ICON_ATLAS',	0);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			 MajorCivApproachType, 				Bias)
VALUES	('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_ERJAR_BENGAL',	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				 MinorCivApproachType, 				Bias)
VALUES	('LEADER_ERJAR_BENGAL',	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_ERJAR_BENGAL',	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_ERJAR_BENGAL',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_ERJAR_BENGAL',	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_ERJAR_BENGAL',	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_ERJAR_BENGAL',	'FLAVOR_OFFENSE', 					6),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_DEFENSE', 					5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_RECON', 					4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_RANGED', 					7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_MOBILE', 					5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_NAVAL', 					8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_NAVAL_GROWTH', 				7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_AIR', 						6),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_EXPANSION', 				3),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_GROWTH', 					8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_PRODUCTION', 				8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_GOLD', 						7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_SCIENCE', 					4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_CULTURE', 					4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_HAPPINESS', 				4),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_WONDER', 					5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_RELIGION', 					3),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_SPACESHIP', 				7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_WATER_CONNECTION', 			8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_NUKE', 						5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_USE_NUKE', 					7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_ARCHAEOLOGY', 				3),
		('LEADER_ERJAR_BENGAL',	'FLAVOR_AIR_CARRIER', 				4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_ERJAR_BENGAL',	'TRAIT_ERJAR_BENGAL');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits
			(Type,					Description,					ShortDescription)
VALUES		('TRAIT_ERJAR_BENGAL',	'TXT_KEY_TRAIT_ERJAR_BENGAL',	'TXT_KEY_TRAIT_ERJAR_BENGAL_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 								Response, 														Bias)
VALUES 	('LEADER_ERJAR_BENGAL', 	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_ERJAR_BENGAL_DENOUNCE_FRIEND%', 				500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_ERJAR_BENGAL_ATTACKED_HOSTILE%', 				500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_ERJAR_BENGAL_DEFEATED%', 						500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_ERJAR_BENGAL_DOW_GENERIC%', 					500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_ERJAR_BENGAL_FIRSTGREETING%', 					500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 	'TXT_KEY_LEADER_ERJAR_BENGAL_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_ERJAR_BENGAL_DENOUNCE%', 						500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_ERJAR_BENGAL_DEC_FRIENDSHIP%', 					500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_HOSTILE_REPEAT', 		'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_HOSTILE_REPEAT%', 		500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_REPEAT_TRADE', 					'TXT_KEY_LEADER_ERJAR_BENGAL_REPEAT_TRADE%', 					500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_POLITE_HELLO', 			'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_POLITE_HELLO%', 			500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_NEUTRAL_HELLO', 			'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_NEUTRAL_HELLO%',			500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_HOSTILE_HELLO', 			'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_HOSTILE_HELLO%', 			500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_WORKING_WITH', 			'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_WORKING_WITH%', 			500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_GREETING_HOSTILE_HUMAN_IS_WARMONGER', 'TXT_KEY_LEADER_ERJAR_BENGAL_GREETING_HOSTILE_HUMAN_IS_WARMONGER%', 500),
		('LEADER_ERJAR_BENGAL', 	'RESPONSE_DOW_BETRAYAL', 					'TXT_KEY_LEADER_ERJAR_BENGAL_DOW_BETRAYAL%', 					500);	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description,						 ShortDescription,						Adjective,								Civilopedia, 							CivilopediaTag, 				 DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 				DawnOfManQuote, 						DawnOfManAudio,						DawnOfManImage)
SELECT	'CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CIV_ERJAR_BENGAL_DESC',	 'TXT_KEY_CIV_ERJAR_BENGAL_SHORT_DESC',	'TXT_KEY_CIV_ERJAR_BENGAL_ADJECTIVE',	'TXT_KEY_CIV5_ERJAR_BENGAL_TEXT_1', 	'TXT_KEY_CIV5_ERJAR_BENGAL',	 'PLAYERCOLOR_ERJAR_BENGAL',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'ERJAR_BENGAL_ICON_ATLAS',	1,				'ERJAR_BENGAL_ALPHA_ATLAS',	'India', 		'BengalCartography.dds','TXT_KEY_CIV5_DAWN_ERJAR_BENGAL_TEXT',	'AS2D_DOM_SPEECH_ERJAR_BENGAL',		'BengalDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_INDIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_01'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_02'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_03'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_04'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_05'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_06'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_07'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_08'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_09'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_10'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_11'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_12'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_13'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_14'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_15'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_16'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_17'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_18'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_19'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_20'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_21'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_22'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_23'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_24'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_25'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_26'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_27'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_28'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_29'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_30'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_31'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_32'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_33'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_34'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_CITY_NAME_ERJAR_BENGAL_35');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_ERJAR_BENGAL', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INDIA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_ERJAR_BENGAL', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INDIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ERJAR_BENGAL', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INDIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'LEADER_ERJAR_BENGAL');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_ERJAR_KATRA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'UNITCLASS_CROSSBOWMAN',	'UNIT_ERJAR_PAIK');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES 	('CIVILIZATION_ERJAR_BENGAL',	'RELIGION_ISLAM');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_River 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Along_River 
		(CivilizationType, 					StartAlongRiver)
VALUES	('CIVILIZATION_ERJAR_BENGAL', 		1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority 
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_ERJAR_BENGAL', 		'REGION_GRASS');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Avoid
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_ERJAR_BENGAL', 		'REGION_TUNDRA'),
		('CIVILIZATION_ERJAR_BENGAL', 		'REGION_DESERT');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_0'),	
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_1'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_2'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_3'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_4'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_5'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_6'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_7'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_8'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_9'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_10'),
		('CIVILIZATION_ERJAR_BENGAL',	'TXT_KEY_SPY_NAME_ERJAR_BENGAL_11');	
--==========================================================================================================================
--==========================================================================================================================
