--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									CapitalDefenseModifier,	CapitalDefenseFalloff,	FlankAttackModifier,	VisibilityChange,	MovesChange,	LostWithUpgrade,	Description, 									Help, 												Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_SHENJI_MUSKETEER_1',	30,						-3,						0,						0,					0,				0,					'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_1',		'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_1_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_1'),
		('PROMOTION_JFD_SHENJI_MUSKETEER_2',	0,						0,						0,						1,					1,				0,					'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_2',		'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_2_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_2'),
		('PROMOTION_JFD_SHENJI_MUSKETEER_3',	0,						0,						20,						0,					0,				0,					'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_3',		'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_3_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_3'),
		('PROMOTION_JFD_SHENJI_MUSKETEER_4',	0,						0,						0,						0,					0,				0,					'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_4',		'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_4_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_SHENJI_MUSKETEER_4'),
		('PROMOTION_JFD_TREASURE_FLEET',		0,						0,						0,						1,					0,				0,					'TXT_KEY_PROMOTION_JFD_TREASURE_FLEET',			'TXT_KEY_PROMOTION_JFD_TREASURE_FLEET_HELP',		'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_TREASURE_FLEET');
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombatMods
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_UnitCombatMods
		(PromotionType,							UnitCombatType,		Modifier)
VALUES	('PROMOTION_JFD_SHENJI_MUSKETEER_4',	'UNITCOMBAT_GUN',	33);
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 							Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 							Help, 										Strategy, 										Civilopedia, 								UnitArtInfo, 							UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_SHENJI_MUSKETEER',	'TXT_KEY_UNIT_JFD_SHENJI_MUSKETEER_HELP',	'TXT_KEY_UNIT_JFD_SHENJI_MUSKETEER_STRATEGY', 	'TXT_KEY_UNIT_JFD_SHENJI_MUSKETEER_TEXT',	'ART_DEF_UNIT_JFD_SHENJI_MUSKETEER',	'JFD_GREAT_MING_YONGLE_UNIT_FLAG_ATLAS',	1,					'JFD_GREAT_MING_YONGLE_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_MUSKETMAN';	

UPDATE Units
SET PrereqTech = 'TECH_PHYSICS'
WHERE Type = 'UNIT_JFD_SHENJI_MUSKETEER';

INSERT INTO Units 	
		(Type, 							Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, CombatLimit, DontShowYields, MoveRate, Description, 							Help, 										Strategy, 										Civilopedia, 								UnitArtInfo, 							UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_TREASURE_FLEET',		Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, CombatLimit, DontShowYields, MoveRate, 'TXT_KEY_UNIT_JFD_TREASURE_FLEET',	'TXT_KEY_UNIT_JFD_TREASURE_FLEET_HELP',		'TXT_KEY_UNIT_JFD_TREASURE_FLEET_STRATEGY', 	'TXT_KEY_UNIT_JFD_TREASURE_FLEET_TEXT',		'ART_DEF_UNIT_JFD_TREASURE_FLEET',		'JFD_GREAT_MING_YONGLE_UNIT_FLAG_ATLAS',	0,					'JFD_GREAT_MING_YONGLE_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_GREAT_ADMIRAL';

UPDATE Units
SET CanBuyCityState = 1
WHERE Type = 'UNIT_JFD_TREASURE_FLEET';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_TREASURE_FLEET', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MUSKETMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_TREASURE_FLEET', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSKETMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_TREASURE_FLEET', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_ADMIRAL';

INSERT INTO Unit_FreePromotions
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_TREASURE_FLEET',		'PROMOTION_JFD_TREASURE_FLEET');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 						UniqueName)
VALUES	('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_1'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_2'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_3'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_4'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_5'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_6'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_8'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_9'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_10'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_11'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_12'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_13'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_14'),
		('UNIT_JFD_TREASURE_FLEET',		'TXT_KEY_GREAT_PERSON_JFD_TREASURE_FLEET_15');
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_SHENJI_MUSKETEER', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSKETMAN';		
		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_TREASURE_FLEET', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_ADMIRAL';		
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 						Description, 								Civilopedia, 									CivilopediaTag, 										IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_GREAT_MING_YONGLE', 	'JFD_GreatMingYongle_Scene.xml',	'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE',		'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_GREAT_MING_YONGLE',	'JFD_GREAT_MING_YONGLE_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 7,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 6,
Boldness = 5,
DiploBalance = 5,
WarmongerHate = 6,
DenounceWillingness = 5,
DoFWillingness = 5,
Loyalty = 5,
Neediness = 3,
Forgiveness = 6,
Chattiness = 5,
Meanness = 2
WHERE Type = 'LEADER_JFD_GREAT_MING_YONGLE';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_GREAT_MING_YONGLE', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'MINOR_CIV_APPROACH_BULLY', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_NAVAL', 					7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_NAVAL_RECON', 				8),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_GROWTH', 					7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_GOLD', 						7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_CULTURE', 					6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_WONDER', 					7),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_GREAT_MING_YONGLE', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_DEFEATED%', 					 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_REQUEST%', 		  						500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_DENOUNCE%', 					  			500),
		('LEADER_JFD_GREAT_MING_YONGLE',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_GREAT_MING_YONGLE_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_GREAT_MING_YONGLE', 	'TRAIT_JFD_GREAT_MING_YONGLE');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							ShortDescription)
VALUES	('TRAIT_JFD_GREAT_MING_YONGLE', 	'TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE',	'TXT_KEY_TRAIT_JFD_GREAT_MING_YONGLE_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_DUMMY_JFD_GREAT_MING_YONGLE_1',	'BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1',	'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'API_UNIFIED_YIELDS' AND Value = 1);

INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 							Description)
SELECT	'BUILDINGCLASS_DUMMY_JFD_GREAT_MING_YONGLE_2',	'BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2',	'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'API_UNIFIED_YIELDS' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 									ExtraSpies, GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 										Help)
SELECT	'BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1', 	'BUILDINGCLASS_DUMMY_JFD_GREAT_MING_YONGLE_1', 	1,			-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1',	'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_1_HELP'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'API_UNIFIED_YIELDS' AND Value = 1);

INSERT INTO Buildings 	
		(Type, 						 				BuildingClass, 									ExtraSpies, GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 										Help)
SELECT	'BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2', 	'BUILDINGCLASS_DUMMY_JFD_GREAT_MING_YONGLE_2', 	1,			-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2',	'TXT_KEY_BUILDING_DUMMY_JFD_GREAT_MING_YONGLE_2_HELP'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'API_UNIFIED_YIELDS' AND Value = 1);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,						ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_JFD_TAL_CHINA',	'China', 		'JFD_MapGreatMingYongle512.dds',	'TXT_KEY_CIV_DAWN_JFD_GREAT_MING_YONGLE_TEXT',	'JFD_DOM_GreatMingYongle.dds',	'TXT_KEY_CIV_JFD_GREAT_MING_YONGLE_DESC', 	'TXT_KEY_CIV_JFD_GREAT_MING_YONGLE_SHORT_DESC',	'TXT_KEY_CIV_JFD_GREAT_MING_YONGLE_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_GREAT_MING_YONGLE_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_GREAT_MING_YONGLE',	'PLAYERCOLOR_JFD_GREAT_MING_YONGLE',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_GREAT_MING_YONGLE_ICON_ATLAS',	0,				'JFD_GREAT_MING_YONGLE_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_1'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_2'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_3'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_4'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_5'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_6'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_7'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_8'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_9'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_10'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_11'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_12'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_13'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_14'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_15'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_16'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_17'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_18'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_19'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_20'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_21'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_22'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_23'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_24'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_25'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_26'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_27'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_28'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_29'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_CITY_NAME_JFD_GREAT_MING_YONGLE_30');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses	
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'LEADER_JFD_GREAT_MING_YONGLE');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE', 	'UNITCLASS_MUSKETMAN',		'UNIT_JFD_SHENJI_MUSKETEER'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE', 	'UNITCLASS_GREAT_ADMIRAL',	'UNIT_JFD_TREASURE_FLEET');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'RELIGION_CONFUCIANISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_0'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_1'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_2'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_3'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_4'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_5'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_6'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_7'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_8'),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'TXT_KEY_SPY_NAME_JFD_GREAT_MING_YONGLE_9');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	1);
--=======================================================================================================================
--=======================================================================================================================