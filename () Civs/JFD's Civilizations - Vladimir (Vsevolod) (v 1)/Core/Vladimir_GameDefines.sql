--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);

INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_GREAT_PEOPLE', 1);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_CREATED', 1);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							 BuildingClass, Cost, GreatPeopleRateModifier, GoldMaintenance, GreatWorkSlotType,				GreatWorkCount, SpecialistCount, SpecialistType, PrereqTech, Description,								Help,											Strategy,											Civilopedia,									ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, IconAtlas,					PortraitIndex)
SELECT	'BUILDING_JFD_WHITE_CATHEDRAL',	 BuildingClass, Cost, GreatPeopleRateModifier, GoldMaintenance, 'GREAT_WORK_SLOT_LITERATURE',	1,				SpecialistCount, SpecialistType, PrereqTech, 'TXT_KEY_BUILDING_JFD_WHITE_CATHEDRAL',	'TXT_KEY_BUILDING_JFD_WHITE_CATHEDRAL_HELP', 	'TXT_KEY_BUILDING_JFD_WHITE_CATHEDRAL_STRATEGY', 	'TXT_KEY_BUILDING_JFD_WHITE_CATHEDRAL_TEXT', 	ArtDefineTag, MinAreaSize, DisplayPosition, HurryCostModifier, ConquestProb, NeverCapture, FreeStartEra, 'JFD_VLADIMIR_ICON_ATLAS',	2
FROM Buildings WHERE Type = 'BUILDING_GARDEN';
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 		
		(BuildingType, 					 YieldType, Yield)
SELECT	'BUILDING_JFD_WHITE_CATHEDRAL',	 YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GARDEN';

 INSERT INTO Building_YieldChanges 		
		(BuildingType, 					 YieldType, 	Yield)
 VALUES	('BUILDING_JFD_WHITE_CATHEDRAL', 'YIELD_FAITH',	2);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldModifiers 		
		(BuildingType, 					 YieldType, Yield)
SELECT	'BUILDING_JFD_WHITE_CATHEDRAL',	 YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_GARDEN';
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceYieldChanges 		
		(BuildingType, 					 ResourceType, YieldType, Yield)
SELECT	'BUILDING_JFD_WHITE_CATHEDRAL',	 ResourceType, YieldType, Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GARDEN';
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 		
		(BuildingType, 					 FlavorType, Flavor)
SELECT	'BUILDING_JFD_WHITE_CATHEDRAL',	 FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

 INSERT INTO Building_Flavors 		
		(BuildingType, 					 FlavorType, 				  Flavor)
 VALUES	('BUILDING_JFD_WHITE_CATHEDRAL', 'FLAVOR_MILITARY_TRAINING',  20),
		('BUILDING_JFD_WHITE_CATHEDRAL', 'FLAVOR_RELIGION',			  20);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class,	CombatClass, PrereqTech,			Cost, Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 						Help, 										Strategy, 									  Civilopedia, 								ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 						UnitFlagAtlas, 					 UnitFlagIconOffset,  IconAtlas,					PortraitIndex)
SELECT	'UNIT_JFD_PRINCES_RETINUE',	Class,	CombatClass, 'TECH_CIVIL_SERVICE',	Cost, Combat-3, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_PRINCES_RETINUE',	'TXT_KEY_UNIT_JFD_PRINCES_RETINUE_HELP', 	'TXT_KEY_UNIT_JFD_PRINCES_RETINUE_STRATEGY',  'TXT_KEY_UNIT_JFD_PRINCES_RETINUE_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_PRINCES_RETINUE',	'JFD_VLADIMIR_UNIT_FLAG_ATLAS',  0,					  'JFD_VLADIMIR_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_PRINCES_RETINUE',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_JFD_PRINCES_RETINUE',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_JFD_PRINCES_RETINUE',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_JFD_PRINCES_RETINUE',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
--INSERT INTO Unit_ResourceQuantityRequirements
--		(UnitType, 					ResourceType, Cost)
--SELECT	'UNIT_JFD_PRINCES_RETINUE',	ResourceType, Cost
--FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 		
		(UnitType, 						PromotionType)
SELECT	'UNIT_JFD_PRINCES_RETINUE',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_JFD_VLADIMIR', 	'TXT_KEY_LEADER_JFD_VLADIMIR',	'TXT_KEY_LEADER_JFD_VLADIMIR_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_VLADIMIR', 	'JFD_Vladimir_Scene.xml',   9, 						4, 						7, 							8, 			3, 				2, 				6, 						5, 				2, 			1, 			2, 				2, 			9, 			'JFD_VLADIMIR_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_HOSTILE', 		8),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_VLADIMIR', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_VLADIMIR', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_VLADIMIR', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_VLADIMIR', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_VLADIMIR', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_VLADIMIR', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_VLADIMIR', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_RECON', 					5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_GROWTH', 					4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_RELIGION', 					8),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_DIPLOMACY', 				4),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_VLADIMIR', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_VLADIMIR', 	'TRAIT_JFD_VLADIMIR');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_JFD_VLADIMIR', 	'TXT_KEY_TRAIT_JFD_VLADIMIR',	'TXT_KEY_TRAIT_JFD_VLADIMIR_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									 Sound, 				AttackMod,		FreePillageMoves, CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_JFD_VLADIMIR',	'TXT_KEY_PROMOTION_JFD_VLADIMIR',	'TXT_KEY_PROMOTION_JFD_VLADIMIR_HELP',	 'AS2D_IF_LEVELUP', 	50,				1,				  1, 			  59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_VLADIMIR');

INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, LostWithUpgrade,  PortraitIndex,  IconAtlas, 		PediaType, 			 PediaEntry)
SELECT	'PROMOTION_JFD_VLADIMIR_WRITER',	'TXT_KEY_PROMOTION_JFD_VLADIMIR_WRITER',	'TXT_KEY_PROMOTION_JFD_VLADIMIR_WRITER_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 				  59, 			  'ABILITY_ATLAS',  'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_JFD_VLADIMIR_WRITER'
WHERE NOT EXISTS (SELECT Name FROM CustomModOptions WHERE Name = 'COMMUNITY_PATCH' AND Value = 1);
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses																												 
		(LeaderType, 				ResponseType, 								Response, 													 Bias)
VALUES 	('LEADER_JFD_VLADIMIR', 	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_VLADIMIR_DENOUNCE_FRIEND%', 			 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_VLADIMIR_ATTACKED_HOSTILE%', 			 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_VLADIMIR_DEFEATED%', 					 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_VLADIMIR_DOW_GENERIC%', 				 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_VLADIMIR_FIRSTGREETING%', 				 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 	'TXT_KEY_LEADER_JFD_VLADIMIR_RESPONSE_TO_BEING_DENOUNCED%',  500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_VLADIMIR_DENOUNCE%', 					 500),
		('LEADER_JFD_VLADIMIR', 	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_VLADIMIR_DEC_FRIENDSHIP%', 				 500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description,						ShortDescription,						Adjective,								Civilopedia, 						 CivilopediaTag, 				DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,					PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 					 DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_VLADIMIR',	'TXT_KEY_CIV_JFD_VLADIMIR_DESC',	'TXT_KEY_CIV_JFD_VLADIMIR_SHORT_DESC',	'TXT_KEY_CIV_JFD_VLADIMIR_ADJECTIVE',	'TXT_KEY_CIV5_JFD_VLADIMIR_TEXT_1',  'TXT_KEY_CIV5_JFD_VLADIMIR',	'PLAYERCOLOR_JFD_VLADIMIR',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_VLADIMIR_ICON_ATLAS',	0,				'JFD_VLADIMIR_ALPHA_ATLAS',	'Russia', 		'JFD_MapVladimir512.dds',	 'TXT_KEY_CIV5_DAWN_JFD_VLADIMIR_TEXT',	'JFD_DOM_Vladimir.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_01'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_02'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_03'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_04'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_05'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_06'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_07'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_08'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_09'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_10'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_11'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_12'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_13'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_14'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_15'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_16'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_17'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_18'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_19'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_20'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_21'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_22'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_23'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_CITY_NAME_JFD_VLADIMIR_24');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_JFD_VLADIMIR', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_JFD_VLADIMIR', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_VLADIMIR', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_JFD_VLADIMIR',	'LEADER_JFD_VLADIMIR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				 UnitType)
VALUES	('CIVILIZATION_JFD_VLADIMIR', 	'UNITCLASS_LONGSWORDSMAN',	 'UNIT_JFD_PRINCES_RETINUE');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_JFD_VLADIMIR', 	'BUILDINGCLASS_GARDEN',	'BUILDING_JFD_WHITE_CATHEDRAL');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_JFD_VLADIMIR',	'RELIGION_ORTHODOXY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_0'),	
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_1'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_2'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_3'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_4'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_5'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_6'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_7'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_8'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_9'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_10'),
		('CIVILIZATION_JFD_VLADIMIR', 	'TXT_KEY_SPY_NAME_JFD_VLADIMIR_11');
--==========================================================================================================================
--==========================================================================================================================
