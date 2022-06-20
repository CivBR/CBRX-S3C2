--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO BuildingClasses
--		(Type, 								  DefaultBuilding, 					Description)
--VALUES	('BUILDINGCLASS_JFD_BRAZIL_PEDRO_I',  'BUILDING_JFD_BRAZIL_PEDRO_I',	'TXT_KEY_BUILDING_JFD_BRAZIL_PEDRO_I');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												 Sound, 				 CityAttack, GreatGeneralCombatModifier, CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		  PediaEntry)
VALUES	('PROMOTION_JFD_CANHONEIRA',			'TXT_KEY_PROMOTION_JFD_CANHONEIRA',				'TXT_KEY_PROMOTION_JFD_CANHONEIRA_HELP',			 'AS2D_IF_LEVELUP', 	 25,		 0,							 1, 			 59, 			'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_CANHONEIRA'),
		('PROMOTION_JFD_INDEPENDENCE_DRAGOON',	'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON',	'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON_HELP',   'AS2D_IF_LEVELUP', 	 0,			 15,						 1, 			 59, 			'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON');

INSERT INTO UnitPromotions 
		(Type, 												Description, 												Help, 																Sound, 				 CityAttack, CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		  PediaEntry)
SELECT	'PROMOTION_JFD_INDEPENDENCE_DRAGOON_GREAT_GENERAL',	'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON_GREAT_GENERAL',	'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON_GREAT_GENERAL_HELP',   'AS2D_IF_LEVELUP', 	 0,			 1, 			 59, 			'ABILITY_ATLAS', 'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_INDEPENDENCE_DRAGOON_GREAT_GENERAL'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Domains
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions_Domains
		(PromotionType, 				DomainType,		 Modifier)
VALUES	('PROMOTION_JFD_CANHONEIRA',	'DOMAIN_LAND',	 25),
		('PROMOTION_JFD_CANHONEIRA',	'DOMAIN_SEA',	 25);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass,				PrereqTech, Cost, Combat,	RangedCombat, Range,  FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 									Strategy, 									 Civilopedia, 								ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 						UnitFlagAtlas, 							UnitFlagIconOffset,  IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_CANHONEIRA',		Class,	'UNITCOMBAT_NAVALRANGED',	PrereqTech, Cost, Combat-5, Combat,		  2,	  FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_CANHONEIRA',		'TXT_KEY_UNIT_JFD_CANHONEIRA_HELP', 	'TXT_KEY_UNIT_JFD_CANHONEIRA_STRATEGY',  	'TXT_KEY_UNIT_JFD_CANHONEIRA_TEXT',			ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_CANHONEIRA',		'JFD_BRAZIL_PEDRO_I_UNIT_FLAG_ATLAS',	0,					 'JFD_BRAZIL_PEDRO_I_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_IRONCLAD';  

INSERT INTO Units 	
		(Type, 								Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 								Help, 											Strategy, 											Civilopedia, 									ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 							UnitFlagAtlas, 							UnitFlagIconOffset,  IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_INDEPENDENCE_DRAGOON',	'TXT_KEY_UNIT_JFD_INDEPENDENCE_DRAGOON_HELP',	'TXT_KEY_UNIT_JFD_INDEPENDENCE_DRAGOON_STRATEGY',	'TXT_KEY_UNIT_JFD_INDEPENDENCE_DRAGOON_TEXT',	ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_INDEPENDENCE_DRAGOON',	'JFD_BRAZIL_PEDRO_I_UNIT_FLAG_ATLAS',	1,					 'JFD_BRAZIL_PEDRO_I_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_CAVALRY';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_CANHONEIRA',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_IRONCLAD';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 			
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_CANHONEIRA',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_IRONCLAD';

INSERT INTO Unit_AITypes 			
		(UnitType, 							UnitAIType)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_CANHONEIRA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_IRONCLAD';

INSERT INTO Unit_Flavors 	
		(UnitType, 							FlavorType, Flavor)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_CANHONEIRA',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_IRONCLAD';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 							UnitClassType)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType,		Cost)
VALUES	('UNIT_JFD_CANHONEIRA',		'RESOURCE_IRON',	1);

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 							ResourceType, Cost)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_JFD_CANHONEIRA',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_IRONCLAD';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 							PromotionType)
SELECT	'UNIT_JFD_INDEPENDENCE_DRAGOON',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 							PromotionType)
VALUES	('UNIT_JFD_CANHONEIRA',				'PROMOTION_JFD_CANHONEIRA'),
		('UNIT_JFD_INDEPENDENCE_DRAGOON',	'PROMOTION_JFD_INDEPENDENCE_DRAGOON');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 									CivilopediaTag, 									 ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						 PortraitIndex)
VALUES	('LEADER_JFD_BRAZIL_PEDRO_I',	'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I',	'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_PEDIA',		'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_BRAZIL_PEDRO_I',	 'JFD_BrazilPedroI_Scene.xml',  8, 						1, 						7, 							8, 			5, 				6, 				6, 						6, 				5, 			5, 			5, 				4, 			5, 			'JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_BRAZIL_PEDRO_I',	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_RECON', 					5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_MOBILE', 					8),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_AIR', 						4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_PRODUCTION', 				7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_HAPPINESS', 				8),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_RELIGION', 					4),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_BRAZIL_PEDRO_I',	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_BRAZIL_PEDRO_I',	'TRAIT_JFD_BRAZIL_PEDRO_I');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						   Description, 						 ShortDescription)
VALUES	('TRAIT_JFD_BRAZIL_PEDRO_I',   'TXT_KEY_TRAIT_JFD_BRAZIL_PEDRO_I',	 'TXT_KEY_TRAIT_JFD_BRAZIL_PEDRO_I_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES 	('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_DENOUNCE_FRIEND%', 				500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_ATTACKED_HOSTILE%', 				500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_DEFEATED%', 						500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_DOW_GENERIC%', 					500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_FIRSTGREETING%', 				500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_DENOUNCE%', 						500),
		('LEADER_JFD_BRAZIL_PEDRO_I',   'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_BRAZIL_PEDRO_I_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,			Description,							ShortDescription,								Adjective,										Civilopedia,  CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage)
SELECT	'CIVILIZATION_JFD_BRAZIL_PEDRO_I',	'CIVILIZATION_BRAZIL',	'TXT_KEY_CIV_JFD_BRAZIL_PEDRO_I_DESC',	'TXT_KEY_CIV_JFD_BRAZIL_PEDRO_I_SHORT_DESC',	'TXT_KEY_CIV_JFD_BRAZIL_PEDRO_I_ADJECTIVE',		Civilopedia,  CivilopediaTag, 'PLAYERCOLOR_JFD_BRAZIL_PEDRO_I',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_BRAZIL_PEDRO_I_ICON_ATLAS',	0,				'JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS',	'Brazil', 		'JFD_MapBrazilPedroI512.dds',	'TXT_KEY_CIV5_DAWN_JFD_BRAZIL_PEDRO_I_TEXT',	'JFD_DOM_BrazilPedroI.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_BRAZIL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_01'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_02'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_03'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_04'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_05'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_06'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_07'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_08'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_09'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_10'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_11'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_12'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_13'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_14'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_15'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_16'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_17'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_18'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_19'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_20'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_21'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_22'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_23'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_24'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_25'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_26'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_27'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_28'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_29'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_30'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_31'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_32'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_33'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_34'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_35'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_36'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_37'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_38'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_39'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_40'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_41'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_42'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_43'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_44'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_45'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_46'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_CITY_NAME_JFD_BRAZIL_PEDRO_I_47');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_BRAZIL_PEDRO_I', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_BRAZIL_PEDRO_I', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_BRAZIL_PEDRO_I', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_BRAZIL_PEDRO_I',	'LEADER_JFD_BRAZIL_PEDRO_I');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'UNITCLASS_IRONCLAD',	'UNIT_JFD_CANHONEIRA'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'UNITCLASS_CAVALRY',	'UNIT_JFD_INDEPENDENCE_DRAGOON');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_BRAZIL_PEDRO_I',	'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_0'),	
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_1'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_2'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_3'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_4'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_5'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_6'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_7'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_8'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_9'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_10'),
		('CIVILIZATION_JFD_BRAZIL_PEDRO_I', 'TXT_KEY_SPY_NAME_JFD_BRAZIL_PEDRO_I_11');
--==========================================================================================================================
--==========================================================================================================================
