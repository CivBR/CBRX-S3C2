--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
--INSERT INTO BuildingClasses
--		(Type, 										DefaultBuilding, 					  Description)
--VALUES	('BUILDINGCLASS_JFD_AMERICA_F_ROOSEVELT',	'BUILDING_JFD_AMERICA_F_ROOSEVELT',	  'TXT_KEY_BUILDING_JFD_AMERICA_F_ROOSEVELT');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, Cost, GoldMaintenance, PrereqTech, Description, 							Help, 										Strategy,										Civilopedia, 							XBuiltTriggersIdeologyChoice,	SpecialistType, SpecialistCount,   ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_ARMS_FACTORY',	BuildingClass, Cost, GoldMaintenance, PrereqTech, 'TXT_KEY_BUILDING_JFD_ARMS_FACTORY',	'TXT_KEY_BUILDING_JFD_ARMS_FACTORY_HELP', 	'TXT_KEY_BUILDING_JFD_ARMS_FACTORY_STRATEGY',	'TXT_KEY_CIV5_BUILDINGS_FACTORY_TEXT',	3,								SpecialistType, SpecialistCount+1, ArtDefineTag, MinAreaSize, ConquestProb, HurryCostModifier, 2, 				'JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FACTORY';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_JFD_ARMS_FACTORY',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FACTORY';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_JFD_ARMS_FACTORY',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_FACTORY';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType, Yield)
SELECT	'BUILDING_JFD_ARMS_FACTORY',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_FACTORY';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ResourceQuantityRequirements 	
		(BuildingType, 					ResourceType, Cost)
SELECT	'BUILDING_JFD_ARMS_FACTORY',	ResourceType, Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_FACTORY';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_DomainProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_DomainProductionModifiers 	
		(BuildingType, 					DomainType,				Modifier)
VALUES	('BUILDING_JFD_ARMS_FACTORY',	'DOMAIN_AIR',			20);
--------------------------------------------------------------------------------------------------------------------------	
-- Building_UnitCombatProductionModifiers
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers 	
		(BuildingType, 					UnitCombatType,			Modifier)
VALUES	('BUILDING_JFD_ARMS_FACTORY',	'UNITCOMBAT_SIEGE',		20),
		('BUILDING_JFD_ARMS_FACTORY',	'UNITCOMBAT_ARMOR',		20);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 								Civilopedia, 										CivilopediaTag, 										ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_AMERICA_F_ROOSEVELT', 	'JFD_AmericaFRoosevelt_Scene.xml',	8, 						6, 						2, 							6, 			7, 				6, 				8, 						6, 				6, 			6, 			5, 				5, 			2, 			'JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_HOSTILE', 		2),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'MINOR_CIV_APPROACH_CONQUEST', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_DEFENSE', 					5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_RECON', 					7),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_RANGED', 					6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_MOBILE', 					8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_SCIENCE', 					4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_CULTURE', 					5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_WONDER', 					4),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_RELIGION', 					2),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_NUKE', 						12),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_USE_NUKE', 					12),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_AIRLIFT', 					3),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_AMERICA_F_ROOSEVELT', 	'TRAIT_JFD_AMERICA_F_ROOSEVELT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 								Response, 																Bias)
VALUES 	('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_DENOUNCE_FRIEND%', 				500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_ATTACKED_HOSTILE%', 			500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_DEFEATED%', 					500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_DOW_GENERIC%', 					500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_FIRSTGREETING%', 				500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_DENOUNCE%', 					500),
		('LEADER_JFD_AMERICA_F_ROOSEVELT',  'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_JFD_AMERICA_F_ROOSEVELT_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_TRAIT_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_TRAIT_JFD_AMERICA_F_ROOSEVELT_SHORT');
--------------------------------------------------------------------------------------------------------------------------	
-- Trait_ImprovementYieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Trait_ImprovementYieldChanges 
		(TraitType, 						ImprovementType,				YieldType,			Yield)
VALUES	('TRAIT_JFD_AMERICA_F_ROOSEVELT', 	'IMPROVEMENT_CUSTOMS_HOUSE',	'YIELD_CULTURE',	2),
		('TRAIT_JFD_AMERICA_F_ROOSEVELT', 	'IMPROVEMENT_MANUFACTORY',		'YIELD_CULTURE',	2);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations
		(Type, 										DerivativeCiv,			 Description, 									ShortDescription, 									Adjective, 											Civilopedia, CivilopediaTag, DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 								PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 							DawnOfManQuote, 							DawnOfManImage)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'CIVILIZATION_AMERICA',	 'TXT_KEY_CIV_JFD_AMERICA_F_ROOSEVELT_DESC', 	'TXT_KEY_CIV_JFD_AMERICA_F_ROOSEVELT_SHORT_DESC', 	'TXT_KEY_CIV_JFD_AMERICA_F_ROOSEVELT_ADJECTIVE',	Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_AMERICA_F_ROOSEVELT', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 	0, 				'JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS',	'America', 		'JFD_MapAmericaFRoosevelt512.dds', 	'TXT_KEY_CIV_JFD_AMERICA_F_ROOSEVELT_DAWN', 'JFD_DOM_AmericaFRoosevelt.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_01'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_02'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_03'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_04'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_05'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_06'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_07'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_08'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_09'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_10'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_11'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_12'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_13'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_14'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_15'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_16'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_17'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_18'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_19'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_20'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_21'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_22'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_23'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_24'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_25'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_26'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_27'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_28'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_29'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'TXT_KEY_CITY_NAME_JFD_AMERICA_F_ROOSEVELT_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_AMERICA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'RELIGION_PROTESTANTISM');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Leaders
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT',	'LEADER_JFD_AMERICA_F_ROOSEVELT');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'BUILDINGCLASS_FACTORY', 	'BUILDING_JFD_ARMS_FACTORY');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM Civilization_UnitClassOverrides WHERE UnitType = 'UNIT_AMERICAN_B17';	
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 							UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'UNITCLASS_BOMBER',			'UNIT_AMERICAN_B17');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_0'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_1'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_2'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_3'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_4'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_5'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_6'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_7'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_8'),
		('CIVILIZATION_JFD_AMERICA_F_ROOSEVELT', 	'TXT_KEY_SPY_NAME_JFD_AMERICA_F_ROOSEVELT_9');
--==========================================================================================================================
--==========================================================================================================================