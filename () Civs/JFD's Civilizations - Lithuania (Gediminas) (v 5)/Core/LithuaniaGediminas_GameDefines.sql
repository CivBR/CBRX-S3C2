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
--		(Type, 										DefaultBuilding, 						Description)
--VALUES	('BUILDINGCLASS_JFD_LITHUANIA_GEDIMINAS', 	'BUILDING_JFD_LITHUANIA_GEDIMINAS',		'TXT_KEY_BUILDING_JFD_LITHUANIA_GEDIMINAS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass, GreatWorkCount, Cost, FaithCost, PrereqTech, GoldMaintenance, MinAreaSize, NeverCapture, Description, 						 Help, 										Strategy,										Civilopedia, 								ArtDefineTag,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JFD_SACRED_GROVE',	BuildingClass, GreatWorkCount, Cost, FaithCost, null, 		GoldMaintenance, MinAreaSize, 1, 			'TXT_KEY_BUILDING_JFD_SACRED_GROVE', 'TXT_KEY_BUILDING_JFD_SACRED_GROVE_HELP',	'TXT_KEY_BUILDING_JFD_SACRED_GROVE_STRATEGY',	'TXT_KEY_BUILDING_JFD_SACRED_GROVE_TEXT',	ArtDefineTag,	2, 				'JFD_LITHUANIA_GEDIMINAS_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_SHRINE';	
--------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 						YieldType,				Yield)
SELECT	'BUILDING_JFD_SACRED_GROVE',		YieldType,				Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_SHRINE';		
--------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType,				Flavor)
SELECT	'BUILDING_JFD_SACRED_GROVE',		FlavorType,				Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_TEMPLE';

INSERT INTO Building_Flavors 	
		(BuildingType, 						FlavorType, 			Flavor)
VALUES	('BUILDING_JFD_SACRED_GROVE',		'FLAVOR_EXPANSION', 	30);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions		
		(Type, 									Description, 								Help, 												Sound, 				CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_SAMOGITIAN_WARRIOR', 	'TXT_KEY_PROMOTION_JFD_SAMOGITIAN_WARRIOR', 'TXT_KEY_PROMOTION_JFD_SAMOGITIAN_WARRIOR_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SAMOGITIAN_WARRIOR');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Features
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_Features 
		(PromotionType, 						FeatureType,		Attack)
VALUES	('PROMOTION_JFD_SAMOGITIAN_WARRIOR',	'FEATURE_FOREST',	50);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 							Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,	  CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Description, 							Help, 											Strategy,										Civilopedia, 								Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,					XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,								MoveRate, PortraitIndex, 	IconAtlas)
SELECT	'UNIT_JFD_SAMOGITIAN_WARRIOR',	Class, Cost, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat-2, CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	'TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR', 	'TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR_HELP', 	'TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR_STRATEGY',	'TXT_KEY_UNIT_JFD_SAMOGITIAN_WARRIOR_TEXT', Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, 'ART_DEF_UNIT_JFD_SAMOGITIAN',	XPValueAttack, XPValueDefense, 0,					'JFD_LITHUANIA_GEDIMINAS_UNIT_FLAG_ATLAS',	MoveRate, 3, 				'JFD_LITHUANIA_GEDIMINAS_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_SWORDSMAN';	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SAMOGITIAN_WARRIOR', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';	
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_JFD_SAMOGITIAN_WARRIOR', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_JFD_SAMOGITIAN_WARRIOR', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_JFD_SAMOGITIAN_WARRIOR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_JFD_SAMOGITIAN_WARRIOR',	'PROMOTION_JFD_SAMOGITIAN_WARRIOR');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders			
		(Type, 								Description, 								Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_LITHUANIA_GEDIMINAS', 	'JFD_LithuaniaGediminas_Scene.xml',	5, 						3, 						3, 							8, 			2, 				3, 				4, 						2, 				2, 			1, 			2, 				1, 			1, 			'JFD_LITHUANIA_GEDIMINAS_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'MINOR_CIV_APPROACH_BULLY', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_DEFENSE', 					4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_GROWTH', 					5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_PRODUCTION', 				7),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_RELIGION', 					0),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_LITHUANIA_GEDIMINAS', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_LITHUANIA_GEDIMINAS',	'TRAIT_JFD_LITHUANIA_GEDIMINAS');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 Response, 																Bias)
VALUES 	('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_AI_DOF_BACKSTAB', 			 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_DENOUNCE_FRIEND%', 			500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_ATTACKED_HOSTILE', 			 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_ATTACKED_HOSTILE%', 			500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_DEFEATED', 					 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_DEFEATED%', 					500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_DOW_GENERIC', 				 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_DOW_GENERIC%', 				500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_FIRST_GREETING', 				 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_FIRSTGREETING%', 				500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_RESPONSE_TO_BEING_DENOUNCED%',	500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_DENOUNCE%', 					500),
		('LEADER_JFD_LITHUANIA_GEDIMINAS',	'RESPONSE_WORK_WITH_US', 				 'TXT_KEY_LEADER_JFD_LITHUANIA_GEDIMINAS_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 							  ShortDescription)
VALUES	('TRAIT_JFD_LITHUANIA_GEDIMINAS',	'TXT_KEY_TRAIT_JFD_LITHUANIA_GEDIMINAS',  'TXT_KEY_TRAIT_JFD_LITHUANIA_GEDIMINAS_SHORT');	
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 				CaptureDefeatedEnemy,	CannotBeChosen, LostWithUpgrade, PortraitIndex, 	IconAtlas, 		  PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_PROMOTION_JFD_LITHUANIA_GEDIMINAS',	'TXT_KEY_PROMOTION_JFD_LITHUANIA_GEDIMINAS_HELP', 	'AS2D_IF_LEVELUP', 	1,						1, 				0, 				 59, 				'ABILITY_ATLAS',  'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_JFD_LITHUANIA_GEDIMINAS');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Features
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_Features 
		(PromotionType, 						FeatureType,		DoubleMove)
VALUES	('PROMOTION_JFD_LITHUANIA_GEDIMINAS',	'FEATURE_FOREST',	1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilizations 	
		(Type, 										DerivativeCiv,							Description, 									ShortDescription, 									Adjective, 											Civilopedia, 									CivilopediaTag, 							DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 								PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 	MapImage, 								DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',		'TXT_KEY_CIV_TAL_JFD_LITHUANIA_DESC',	'TXT_KEY_CIV_JFD_LITHUANIA_GEDIMINAS_DESC',		'TXT_KEY_CIV_JFD_LITHUANIA_GEDIMINAS_SHORT_DESC', 	'TXT_KEY_CIV_JFD_LITHUANIA_GEDIMINAS_ADJECTIVE',	'TXT_KEY_CIV5_JFD_LITHUANIA_GEDIMINAS_TEXT_1', 	'TXT_KEY_CIV5_JFD_LITHUANIA_GEDIMINAS',		'PLAYERCOLOR_JFD_LITHUANIA_GEDIMINAS', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_LITHUANIA_GEDIMINAS_ICON_ATLAS', 	0, 				'JFD_LITHUANIA_GEDIMINAS_ALPHA_ATLAS', 	'Poland', 		'JFD_MapLithuaniaGediminas512.dds', 	'TXT_KEY_CIV5_DOM_JFD_GEDIMINAS_TEXT', 	'JFD_DOM_LithuaniaGediminas.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLAND';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_01'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_02'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_03'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_04'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_05'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_06'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_07'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_08'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_09'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_10'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_11'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_12'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_13'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_14'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_15'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_16'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_17'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_18'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_19'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_20'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_21'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_22'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_23'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_24'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_25'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_26'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_27'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_28'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_29'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_30'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_31'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_32'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_33'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_34'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_35'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_CITY_NAME_JFD_LITHUANIA_GEDIMINAS_36');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLAND';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLAND';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLAND';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'LEADER_JFD_LITHUANIA_GEDIMINAS');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'UNITCLASS_SWORDSMAN', 	'UNIT_JFD_SAMOGITIAN_WARRIOR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'BUILDINGCLASS_SHRINE', 'BUILDING_JFD_SACRED_GROVE');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS',	'RELIGION_CHRISTIANITY');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 							RegionType)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'REGION_FOREST');			
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_0'),	
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_1'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_2'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_3'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_4'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_5'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_6'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_7'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_8'),
		('CIVILIZATION_JFD_LITHUANIA_GEDIMINAS', 	'TXT_KEY_SPY_NAME_JFD_LITHUANIA_GEDIMINAS_9');
--==========================================================================================================================
--==========================================================================================================================