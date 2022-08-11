--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 					BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture,  Description, 					Help, 								 Strategy,								 Civilopedia, 						 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_SHUL',	BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			'TXT_KEY_BUILDING_JFD_SHUL', 	'TXT_KEY_BUILDING_JFD_SHUL_HELP',   'TXT_KEY_BUILDING_JFD_SHUL_STRATEGY',	 'TXT_KEY_BUILDING_JFD_SHUL_TEXT',   ArtDefineTag, 3, 			  'JFD_KHAZARIA_BULAN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';	

UPDATE Buildings
SET PrereqTech = 'TECH_CURRENCY', GoldMaintenance = 0
WHERE Type = 'BUILDING_JFD_SHUL';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_JFD_SHUL',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, 		Flavor)
SELECT	'BUILDING_JFD_SHUL',	FlavorType, 		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, 					Flavor)
VALUES	('BUILDING_JFD_SHUL',	'FLAVOR_I_LAND_TRADE_ROUTE', 	10),
		('BUILDING_JFD_SHUL',	'FLAVOR_I_TRADE_ORIGIN', 		10);
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType, Yield)
SELECT	'BUILDING_JFD_SHUL',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_TEMPLE';	
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_SHUL',	'BUILDING_DUMMY_JFD_SHUL',  'TXT_KEY_BUILDING_DUMMY_JFD_SHUL');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 						TradeRouteLandGoldBonus,	GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 						 Help)
VALUES	('BUILDING_DUMMY_JFD_SHUL', 	'BUILDINGCLASS_DUMMY_JFD_SHUL', 	100,						-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_SHUL',	 'TXT_KEY_BUILDING_DUMMY_JFD_SHUL_HELP');
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 					LostWithUpgrade, Description, 					Help, 								Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_BEK',	0, 				 'TXT_KEY_PROMOTION_JFD_BEK',	'TXT_KEY_PROMOTION_JFD_BEK_HELP',   'AS2D_IF_LEVELUP',  1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_BEK');
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, WorkRate, CombatLimit, MoveRate, Description, 			Help, 						 Strategy, 							Civilopedia, 					UnitArtInfo, 			UnitFlagAtlas,							UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_BEK',		Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, WorkRate, CombatLimit, MoveRate, 'TXT_KEY_UNIT_JFD_BEK',	'TXT_KEY_UNIT_JFD_BEK_HELP', 'TXT_KEY_UNIT_JFD_BEK_STRATEGY',   'TXT_KEY_UNIT_JFD_BEK_TEXT',	'ART_DEF_UNIT_JFD_BEK',	'JFD_KHAZARIA_BULAN_UNIT_FLAG_ATLAS',	0,					'JFD_KHAZARIA_BULAN_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 			BuildType)
SELECT	'UNIT_JFD_BEK', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JFD_BEK', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JFD_BEK', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_JFD_BEK', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions
		(UnitType, 			PromotionType)
VALUES	('UNIT_JFD_BEK',	'PROMOTION_JFD_BEK');
------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 			UniqueName)
VALUES	('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_1'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_2'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_3'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_4'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_5'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_6'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_7'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_8'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_9'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_10'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_11'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_12'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_13'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_14'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_15'),
		('UNIT_JFD_BEK',	'TXT_KEY_JFD_BEK_UNIQUE_NAME_16');		
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_BEK',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							ArtDefineTag, 					Description, 							Civilopedia, 								CivilopediaTag, 									IconAtlas, 							PortraitIndex)
VALUES	('LEADER_JFD_KHAZARIA_BULAN', 	'JFD_KhazariaBulan_Scene.xml',	'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN',	'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_KHAZARIA_BULAN',	'JFD_KHAZARIA_BULAN_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 4,
WonderCompetitiveness = 2,
MinorCivCompetitiveness = 2,
Boldness = 6,
DiploBalance = 3,
WarmongerHate = 2,
DenounceWillingness = 3,
DoFWillingness = 4,
Loyalty = 2,
Neediness = 2,
Forgiveness = 3,
Chattiness = 2,
Meanness = 6
WHERE Type = 'LEADER_JFD_KHAZARIA_BULAN';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		6),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_KHAZARIA_BULAN', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_KHAZARIA_BULAN', 	'MINOR_CIV_APPROACH_BULLY', 		8);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_MOBILE', 					8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_PRODUCTION', 				3),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_GOLD', 						8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_CULTURE', 					3),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_HAPPINESS', 				3),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_RELIGION', 					8),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_KHAZARIA_BULAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	Bias)
VALUES 	('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_DEFEATED%', 					 			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_REQUEST%', 		  						500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_WINWAR%', 					  			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_DENOUNCE%', 					  			500),
		('LEADER_JFD_KHAZARIA_BULAN',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_KHAZARIA_BULAN_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_KHAZARIA_BULAN', 	'TRAIT_JFD_KHAZARIA_BULAN');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_JFD_KHAZARIA_BULAN', 	'TXT_KEY_TRAIT_JFD_KHAZARIA_BULAN',		'TXT_KEY_TRAIT_JFD_KHAZARIA_BULAN_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,				SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage,					Description,							ShortDescription,								Adjective,										Civilopedia,								CivilopediaTag,						 DefaultPlayerColor,				 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_JFD_TAL_KHAZARIA',	'Persia', 		'JFD_MapKhazariaBulan512.dds',	'TXT_KEY_CIV_DAWN_JFD_KHAZARIA_BULAN_TEXT',		'JFD_DOM_KhazariaBulan.dds',	'TXT_KEY_CIV_JFD_KHAZARIA_BULAN_DESC', 	'TXT_KEY_CIV_JFD_KHAZARIA_BULAN_SHORT_DESC',	'TXT_KEY_CIV_JFD_KHAZARIA_BULAN_ADJECTIVE',		'TXT_KEY_CIV_JFD_KHAZARIA_BULAN_TEXT_1',    'TXT_KEY_CIV_JFD_KHAZARIA_BULAN',	 'PLAYERCOLOR_JFD_KHAZARIA_BULAN',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_KHAZARIA_BULAN_ICON_ATLAS',	0,				'JFD_KHAZARIA_BULAN_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_1'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_2'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_3'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_4'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_5'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_6'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_7'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_8'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_9'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_10'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_11'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_12'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_13'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_14'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_15'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_16'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_17'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_18'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_19'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_20'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_CITY_NAME_JFD_KHAZARIA_BULAN_21');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_KHAZARIA_BULAN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_KHAZARIA_BULAN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_KHAZARIA_BULAN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'LEADER_JFD_KHAZARIA_BULAN');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'BUILDINGCLASS_TEMPLE',		'BUILDING_JFD_SHUL');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'UNITCLASS_GREAT_GENERAL',	'UNIT_JFD_BEK');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'RELIGION_JUDAISM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_0'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_1'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_2'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_3'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_4'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_5'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_6'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_7'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_8'),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',	'TXT_KEY_SPY_NAME_JFD_KHAZARIA_BULAN_9');
--=======================================================================================================================
--=======================================================================================================================