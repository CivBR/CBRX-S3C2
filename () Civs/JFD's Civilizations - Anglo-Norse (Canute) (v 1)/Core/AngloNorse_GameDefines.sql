--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text default null, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_JFD_ANGLO_NORSE', 	'BUILDING_JFD_ANGLO_NORSE', 	'TXT_KEY_BUILDING_JFD_ANGLO_NORSE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 										Description, 									Help, 													Sound, 				CityAttack,	CityAttackPlunderModifier,	CannotBeChosen, LostWithUpgrade, PortraitIndex,  IconAtlas, 						PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_DRAKKER',					'TXT_KEY_PROMOTION_JFD_DRAKKER',				'TXT_KEY_PROMOTION_JFD_DRAKKER_HELP',					'AS2D_IF_LEVELUP', 	0,			0,							1, 				0, 				 59, 			 'ABILITY_ATLAS',   				'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_DRAKKER'),
		('PROMOTION_JFD_DRAKKER_COASTAL_RAIDER',	'TXT_KEY_PROMOTION_JFD_DRAKKER_COASTAL_RAIDER',	'TXT_KEY_PROMOTION_JFD_DRAKKER_COASTAL_RAIDER_HELP',	'AS2D_IF_LEVELUP', 	20,			33,							1, 				0, 				 3, 			 'EXPANSION_PROMOTION_ATLAS',   	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_DRAKKER_COASTAL_RAIDER'),
		('PROMOTION_JFD_TINGLID_ACTIVE',			'TXT_KEY_PROMOTION_JFD_TINGLID',				'TXT_KEY_PROMOTION_JFD_TINGLID_HELP',					'AS2D_IF_LEVELUP', 	0,			0,							1, 				0, 				 0, 			 'JFD_ANGLO_NORSE_PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_TINGLID'),
		('PROMOTION_JFD_TINGLID_INACTIVE',			'TXT_KEY_PROMOTION_JFD_TINGLID',				'TXT_KEY_PROMOTION_JFD_TINGLID_HELP',					'AS2D_IF_LEVELUP', 	0,			0,							1, 				0, 				 59, 			 'ABILITY_ATLAS',   				'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_TINGLID');
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				Help, 							 Strategy, 								Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_JFD_DRAKKER',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_DRAKKER',	'TXT_KEY_UNIT_JFD_DRAKKER_HELP', 'TXT_KEY_UNIT_JFD_DRAKKER_STRATEGY',   'TXT_KEY_UNIT_JFD_DRAKKER_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_DRAKKER',	'JFD_ANGLO_NORSE_UNIT_FLAG_ATLAS',	0,					'JFD_ANGLO_NORSE_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_GALLEASS';      

INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				Help, 							 Strategy, 								Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_JFD_TINGLID',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_TINGLID',	'TXT_KEY_UNIT_JFD_TINGLID_HELP', 'TXT_KEY_UNIT_JFD_TINGLID_STRATEGY',   'TXT_KEY_UNIT_JFD_TINGLID_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_TINGLID',	'JFD_ANGLO_NORSE_UNIT_FLAG_ATLAS',	1,					'JFD_ANGLO_NORSE_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_PIKEMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_DRAKKER',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TINGLID',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_DRAKKER',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_TINGLID',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_DRAKKER',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_TINGLID',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_DRAKKER',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_TINGLID',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_DRAKKER',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_TINGLID',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PIKEMAN';

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_JFD_DRAKKER',	'PROMOTION_JFD_DRAKKER'),
		('UNIT_JFD_DRAKKER',	'PROMOTION_JFD_DRAKKER_COASTAL_RAIDER'),
		('UNIT_JFD_TINGLID',	'PROMOTION_JFD_TINGLID_ACTIVE');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_DRAKKER',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GALLEASS';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_TINGLID',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PIKEMAN';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			 VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_CANUTE', 	'TXT_KEY_LEADER_JFD_CANUTE',	'TXT_KEY_LEADER_JFD_CANUTE_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_CANUTE', 	'JFD_Canute_Scene.xml',	 8, 						3, 						2, 							9, 			3, 				3, 				3, 						4, 				4, 			4, 			3, 				4, 			4, 			'JFD_ANGLO_NORSE_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_CANUTE', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_CANUTE', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_CANUTE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_CANUTE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_CANUTE', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_CANUTE', 	'MINOR_CIV_APPROACH_BULLY', 		9);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_JFD_CANUTE', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_CANUTE', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_CANUTE', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_CANUTE', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_JFD_CANUTE', 	'FLAVOR_RECON', 					2),
		('LEADER_JFD_CANUTE', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_NAVAL', 					8),
		('LEADER_JFD_CANUTE', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_JFD_CANUTE', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_CANUTE', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_CANUTE', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_JFD_CANUTE', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_PRODUCTION', 				7),
		('LEADER_JFD_CANUTE', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_CANUTE', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_CANUTE', 	'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_CANUTE', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_CANUTE', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_JFD_CANUTE', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_CANUTE', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_CANUTE', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_CANUTE', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_JFD_CANUTE', 	'TRAIT_JFD_ANGLO_NORSE');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_JFD_ANGLO_NORSE', 	'TXT_KEY_TRAIT_JFD_ANGLO_NORSE',	'TXT_KEY_TRAIT_JFD_ANGLO_NORSE_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 									 BuildingClass,						BuildingProductionModifier, 	GreatWorkCount,	Cost, 	FaithCost, 	PrereqTech,  Description,									Help, 												NeverCapture)
VALUES	('BUILDING_JFD_ANGLO_NORSE_PRODUCTION',	 'BUILDINGCLASS_JFD_ANGLO_NORSE',	10,								-1,   			-1,		-1,			null,		 'TXT_KEY_BUILDING_JFD_ANGLO_NORSE_PRODUCTION',	'TXT_KEY_BUILDING_JFD_ANGLO_NORSE_PRODUCTION_HELP',	1);
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 			ResponseType, 									Response, 															Bias)
VALUES 	('LEADER_JFD_CANUTE', 	'RESPONSE_AI_DOF_BACKSTAB', 					'TXT_KEY_LEADER_JFD_CANUTE_DENOUNCE%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_ATTACKED_EXCITED', 					'TXT_KEY_LEADER_JFD_CANUTE_ATTACKED_EXCITED%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_JFD_CANUTE_ATTACKED_HOSTILE%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_ATTACKED_SAD', 						'TXT_KEY_LEADER_JFD_CANUTE_ATTACKED_SAD%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_ATTACKED_STRONG_HOSTILE', 			'TXT_KEY_LEADER_JFD_CANUTE_ATTACKED_HOSTILE%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_ATTACKED_WEAK_HOSTILE', 				'TXT_KEY_LEADER_JFD_CANUTE_ATTACKED_HOSTILE%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_JFD_CANUTE_DEFEATED%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DONT_SETTLE_NO', 						'TXT_KEY_LEADER_JFD_CANUTE_DONT_SETTLE_NO%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DONT_SETTLE_YES', 					'TXT_KEY_LEADER_JFD_CANUTE_DONT_SETTLE_YES%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_JFD_CANUTE_DOW_GENERIC%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DOW_LAND', 							'TXT_KEY_LEADER_JFD_CANUTE_DOW_LAND%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_DOW_WORLD_CONQUEST', 					'TXT_KEY_LEADER_JFD_CANUTE_DOW_WORLD_CONQUEST%', 					500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_EMBASSY_EXCHANGE', 					'TXT_KEY_LEADER_JFD_CANUTE_EMBASSY_EXCHANGE%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_CANUTE_EXPANSION_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_JFD_CANUTE_FIRSTGREETING%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_AT_WAR_HOSTILE', 			'TXT_KEY_LEADER_JFD_CANUTE_GREETING_AT_WAR_HOSTILE%', 				500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_FRIENDLY_STRONG_MILITARY',  	'TXT_KEY_LEADER_JFD_CANUTE_GREETING_FRIENDLY_STRONG_MILITARY%', 	500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_HOSTILE_HUMAN_SMALL_ARMY',   'TXT_KEY_LEADER_JFD_CANUTE_GREETING_HOSTILE_HUMAN_SMALL_ARMY%', 	500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_POLITE_HELLO', 				'TXT_KEY_LEADER_JFD_CANUTE_GREETING_POLITE_HELLO%', 				500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_NEUTRAL_HELLO', 				'TXT_KEY_LEADER_JFD_CANUTE_GREETING_NEUTRAL_HELLO%', 				500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_GREETING_HOSTILE_HELLO', 				'TXT_KEY_LEADER_JFD_CANUTE_GREETING_HOSTILE_HELLO%', 				500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_JFD_CANUTE_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_INFLUENTIAL_ON_AI', 					'TXT_KEY_LEADER_JFD_CANUTE_INFLUENTIAL_ON_AI%', 					500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_INFLUENTIAL_ON_HUMAN', 				'TXT_KEY_LEADER_JFD_CANUTE_INFLUENTIAL_ON_HUMAN%', 					500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_INSULT_CITIES', 						'TXT_KEY_LEADER_JFD_CANUTE_INSULT_CITIES%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_INSULT_MILITARY', 					'TXT_KEY_LEADER_JFD_CANUTE_INSULT_MILITARY%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_LETS_HEAR_IT', 						'TXT_KEY_LEADER_JFD_CANUTE_LETS_HEAR_IT%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_LUXURY_TRADE', 						'TXT_KEY_LEADER_JFD_CANUTE_LUXURY_TRADE%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_NO_PEACE', 							'TXT_KEY_LEADER_JFD_CANUTE_NO_PEACE%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 				'TXT_KEY_LEADER_JFD_CANUTE_OPEN_BORDERS_EXCHANGE%', 				500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_PEACE_OFFER', 						'TXT_KEY_LEADER_JFD_CANUTE_PEACE_OFFER%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_REPEAT_NO', 							'TXT_KEY_LEADER_JFD_CANUTE_REPEAT_NO%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_REPEAT_TRADE', 						'TXT_KEY_LEADER_JFD_CANUTE_REPEAT_TRADE%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_REQUEST', 							'TXT_KEY_LEADER_JFD_CANUTE_RESPONSE_REQUEST%', 						500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 		'TXT_KEY_LEADER_JFD_CANUTE_RESPONSE_TO_BEING_DENOUNCED%', 			500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_TOO_SOON_FOR_DOF', 					'TXT_KEY_LEADER_JFD_CANUTE_TOO_SOON_FOR_DOF_1%', 					500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_TOO_SOON_NO_PEACE', 					'TXT_KEY_LEADER_JFD_CANUTE_TOO_SOON_NO_PEACE_1%', 					500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_WARMONGER', 							'TXT_KEY_LEADER_JFD_CANUTE_WARMONGER%', 							500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_WINNER_PEACE_OFFER', 					'TXT_KEY_LEADER_JFD_CANUTE_WINWAR%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_WORK_AGAINST_SOMEONE', 				'TXT_KEY_LEADER_JFD_CANUTE_DENOUNCE%', 								500),
		('LEADER_JFD_CANUTE', 	'RESPONSE_WORK_WITH_US', 						'TXT_KEY_LEADER_JFD_CANUTE_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								Description,						 ShortDescription,							Adjective,								 Civilopedia, 							 CivilopediaTag, 					DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,					SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE',		'TXT_KEY_CIV_JFD_ANGLO_NORSE_DESC',	 'TXT_KEY_CIV_JFD_ANGLO_NORSE_SHORT_DESC',	'TXT_KEY_CIV_JFD_ANGLO_NORSE_ADJECTIVE', 'TXT_KEY_CIV5_JFD_ANGLO_NORSE_TEXT_1',  'TXT_KEY_CIV5_JFD_ANGLO_NORSE',	'PLAYERCOLOR_JFD_ANGLO_NORSE',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ANGLO_NORSE_ICON_ATLAS',	0,				'JFD_ANGLO_NORSE_ALPHA_ATLAS',	'Denmark', 		'JFD_MapAngloNorse512.dds',		'TXT_KEY_CIV5_DAWN_JFD_ANGLO_NORSE_TEXT',	'JFD_DOM_AngloNorse.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_01'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_02'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_03'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_04'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_05'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_06'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_07'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_08'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_09'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_10'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_11'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_12'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_13'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_14'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_15'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_16'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_17'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_18'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_19'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_20'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_21'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_22'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_23'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_24'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_25'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_26'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_27'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_28'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_29'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_30'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_31'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_CITY_NAME_JFD_ANGLO_NORSE_32');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ANGLO_NORSE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_DENMARK';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE',	'LEADER_JFD_CANUTE');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE', 	'UNITCLASS_GALLEASS',	'UNIT_JFD_DRAKKER'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'UNITCLASS_PIKEMAN',	'UNIT_JFD_TINGLID');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE',	'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_0'),	
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_1'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_2'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_3'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_4'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_5'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_6'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_7'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_8'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_9'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_10'),
		('CIVILIZATION_JFD_ANGLO_NORSE', 	'TXT_KEY_SPY_NAME_JFD_ANGLO_NORSE_11');
--==========================================================================================================================
--==========================================================================================================================
