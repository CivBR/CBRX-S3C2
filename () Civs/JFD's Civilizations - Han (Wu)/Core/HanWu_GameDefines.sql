--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------	
-- Specialists
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Specialists
		(Type,							Description,							Strategy,										Visible,	Cost,	IconAtlas,			PortraitIndex)
VALUES	('SPECIALIST_JFD_PAPER_MAKER',	'TXT_KEY_SPECIALIST_JFD_PAPER_MAKER',	'TXT_KEY_SPECIALIST_JFD_PAPER_MAKER_STRATEGY',	1,			0,		'CITIZEN_ATLAS',	0);
--------------------------------------------------------------------------------------------------------------------------
-- SpecialistYields
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO SpecialistYields 	
		(SpecialistType, 				YieldType,			Yield)
VALUES	('SPECIALIST_JFD_PAPER_MAKER',	'YIELD_GOLD',		1),
		('SPECIALIST_JFD_PAPER_MAKER',	'YIELD_PRODUCTION',	1),
		('SPECIALIST_JFD_PAPER_MAKER',	'YIELD_SCIENCE',	1);
------------------------------------------------------------------------------------------------------------------------	
-- JFD_Civilopedia_HideFromPedia
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('SPECIALIST_JFD_PAPER_MAKER');
------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 			DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_PAVILION',	'BUILDING_DUMMY_JFD_PAVILION',	'TXT_KEY_BUILDING_DUMMY_JFD_PAVILION');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 							BuildingClass,						GreatPeopleRateModifier,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,							Help, 										NeverCapture)
VALUES	('BUILDING_DUMMY_JFD_PAVILION',	'BUILDINGCLASS_DUMMY_JFD_PAVILION',	1,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_PAVILION',	'TXT_KEY_BUILDING_DUMMY_JFD_PAVILION_HELP',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass, Cost, FreshWater, GreatPeopleRateModifier, GoldMaintenance, PrereqTech,	Description, 						Civilopedia, 							Help, 									Strategy,								 	ArtDefineTag, 	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_PAVILION',	BuildingClass, Cost, FreshWater, GreatPeopleRateModifier, GoldMaintenance, PrereqTech,	'TXT_KEY_BUILDING_JFD_PAVILION',	'TXT_KEY_BUILDING_JFD_PAVILION_TEXT',	'TXT_KEY_BUILDING_JFD_PAVILION_HELP', 	'TXT_KEY_BUILDING_JFD_PAVILION_STRATEGY',	ArtDefineTag,	MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 3, 				'JFD_HAN_WU_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';	

UPDATE Buildings
SET SpecialistType = 'SPECIALIST_JFD_PAPER_MAKER', SpecialistCount = 1, Description = 'TXT_KEY_BUILDING_JFD_PAPER_MAKER', Help = 'TXT_KEY_BUILDING_JFD_PAPER_MAKER_HELP', Strategy = 'TXT_KEY_BUILDING_JFD_PAPER_MAKER_STRATEGY', BuildingClass = 'BUILDINGCLASS_LIBRARY'
WHERE Type = 'BUILDING_PAPER_MAKER';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges 
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Building_YieldChanges WHERE YieldType = 'YIELD_GOLD' AND BuildingType = 'BUILDING_PAPER_MAKER';
INSERT INTO Building_YieldChanges 	
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_PAVILION',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_PAVILION',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
VALUES	('BUILDING_PAPER_MAKER',	'FLAVOR_GROWTH',	20),
		('BUILDING_JFD_PAVILION',	'FLAVOR_RELIGION',	20);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 									 Strategy, 										Civilopedia, 							 ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 						UnitFlagAtlas, 					 UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_QIANG_SPEARMAN',	'TXT_KEY_UNIT_JFD_QIANG_SPEARMAN_HELP',	 'TXT_KEY_UNIT_JFD_QIANG_SPEARMAN_STRATEGY',   	'TXT_KEY_UNIT_JFD_QIANG_SPEARMAN_TEXT',	 ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_QIANG_SPEARMAN',	'JFD_HAN_WU_UNIT_FLAG_ATLAS',	 0,					 'JFD_HAN_WU_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_SPEARMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_QIANG_SPEARMAN',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SPEARMAN';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_HAN_WU', 	'TXT_KEY_LEADER_JFD_HAN_WU', 	'TXT_KEY_LEADER_JFD_HAN_WU_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HAN_WU', 	'JFD_HanWu_Scene.xml',	'JFD_HAN_WU_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 8,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 4,
Boldness = 7,
DiploBalance = 5,
WarmongerHate = 5,
DenounceWillingness = 5,
DoFWillingness = 6,
Loyalty = 6,
Neediness = 3,
Forgiveness = 4,
Chattiness = 4,
Meanness = 6
WHERE Type = 'LEADER_JFD_HAN_WU';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_HAN_WU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HAN_WU', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_HAN_WU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_HAN_WU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_HAN_WU', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_HAN_WU', 	'MINOR_CIV_APPROACH_BULLY', 		7);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_HAN_WU', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_WONDER', 					6),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_RELIGION', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_HAN_WU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 							 			Response, 															Bias)
VALUES 	('LEADER_JFD_HAN_WU',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_HAN_WU_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_HAN_WU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_ATTACKED_STRONG_HOSTILE', 			 	'TXT_KEY_LEADER_JFD_HAN_WU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_HAN_WU_DEFEATED%', 					 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_HAN_WU_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_HAN_WU_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_HAN_WU_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_HAN_WU_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_HAN_WU_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_HAN_WU_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_HAN_WU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_HAN_WU_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_HAN_WU_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_HAN_WU_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_HAN_WU_REQUEST%', 		  						500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_HAN_WU_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_HAN_WU_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_HAN_WU_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_HAN_WU_DENOUNCE%', 					  			500),
		('LEADER_JFD_HAN_WU',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_HAN_WU_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_HAN_WU', 		'TRAIT_JFD_HAN_WU');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_JFD_HAN_WU',		'TXT_KEY_TRAIT_JFD_HAN_WU',		'TXT_KEY_TRAIT_JFD_HAN_WU_SHORT');	
------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_HAN_WU',	'BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 												BuildingClass,						GreatWorkCount,	Cost, FaithCost, PrereqTech, Description,							Help, 										NeverCapture)
VALUES	('BUILDING_DUMMY_JFD_HAN_WU_GOLD_CAPITAL',			'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_CAPITAL',	'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_CAPITAL',		'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),
		('BUILDING_DUMMY_JFD_HAN_WU_CULTURE_OTHER',			'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),
		('BUILDING_DUMMY_JFD_HAN_WU_GOLD_OTHER',			'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_OTHER',		'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1),	
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_OTHER',			'BUILDINGCLASS_DUMMY_JFD_HAN_WU',	-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU',	'TXT_KEY_BUILDING_DUMMY_JFD_HAN_WU_HELP',	1);
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 										YieldType,				Yield)
VALUES	('BUILDING_DUMMY_JFD_HAN_WU_CULTURE_OTHER',			'YIELD_CULTURE',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_GOLD_CAPITAL',			'YIELD_GOLD',			1),
		('BUILDING_DUMMY_JFD_HAN_WU_GOLD_OTHER',			'YIELD_GOLD',			-1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_CAPITAL',	'YIELD_PRODUCTION',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_OTHER',		'YIELD_PRODUCTION',		-1),
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_CAPITAL',		'YIELD_SCIENCE',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_OTHER',			'YIELD_SCIENCE',		-1);		
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther(BuildingType, YieldType, Yield integer);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 										YieldType,				Yield)
VALUES	('BUILDING_DUMMY_JFD_HAN_WU_CULTURE_OTHER',			'YIELD_CULTURE',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_GOLD_CAPITAL',			'YIELD_GOLD',			1),
		('BUILDING_DUMMY_JFD_HAN_WU_GOLD_OTHER',			'YIELD_GOLD',			-1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_CAPITAL',	'YIELD_PRODUCTION',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_PRODUCTION_OTHER',		'YIELD_PRODUCTION',		-1),
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_CAPITAL',		'YIELD_SCIENCE',		1),
		('BUILDING_DUMMY_JFD_HAN_WU_SCIENCE_OTHER',			'YIELD_SCIENCE',		-1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 						DerivativeCiv,			SoundtrackTag,  MapImage, 				DawnOfManQuote, 					DawnOfManImage,			Description,					ShortDescription,						Adjective,							Civilopedia,									CivilopediaTag,							DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_HAN_WU',	'CIVILIZATION_CHINA',	'China', 		'JFD_MapHanWu512.dds',	'TXT_KEY_CIV_DAWN_JFD_HAN_WU_TEXT',	'JFD_DOM_HanWu.dds',	'TXT_KEY_CIV_JFD_HAN_WU_DESC', 	'TXT_KEY_CIV_JFD_HAN_WU_SHORT_DESC',	'TXT_KEY_CIV_JFD_HAN_WU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_HAN_WU_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_HAN_WU',	'PLAYERCOLOR_JFD_HAN_WU',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_HAN_WU_ICON_ATLAS',	0,				'JFD_HAN_WU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_1'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_2'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_3'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_4'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_5'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_6'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_7'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_8'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_9'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_10'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_11'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_12'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_13'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_14'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_15'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_16'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_17'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_18'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_19'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_20'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_21'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_22'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_23'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_24'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_25'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_26'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_27'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_28'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_29'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_CITY_NAME_JFD_HAN_WU_30');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_JFD_HAN_WU',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_JFD_HAN_WU',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_HAN_WU',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_JFD_HAN_WU',	'LEADER_JFD_HAN_WU');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_CHINA', 		'BUILDINGCLASS_GARDEN',		'BUILDING_JFD_PAVILION'),	
		('CIVILIZATION_JFD_HAN_WU', 'BUILDINGCLASS_LIBRARY',	'BUILDING_PAPER_MAKER');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_HAN_WU', 'UNITCLASS_SPEARMAN',		'UNIT_JFD_QIANG_SPEARMAN');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_JFD_HAN_WU', 'RELIGION_CONFUCIANISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_0'),	
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_1'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_2'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_3'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_4'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_5'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_6'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_7'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_8'),
		('CIVILIZATION_JFD_HAN_WU',	'TXT_KEY_SPY_NAME_JFD_HAN_WU_9');
--==========================================================================================================================
--==========================================================================================================================



