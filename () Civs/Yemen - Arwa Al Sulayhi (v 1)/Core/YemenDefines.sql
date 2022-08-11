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
		(Type, 							DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_URD_YEMEN', 	'BUILDING_URD_YEMEN', 		'TXT_KEY_BUILDING_URD_YEMEN'),
		('BUILDINGCLASS_URD_MBS_2',		'BUILDING_URD_ARWA_MBS_2',	'TXT_KEY_BUILDING_URD_YEMEN'),
		('BUILDINGCLASS_URD_MBS_3',		'BUILDING_URD_ARWA_MBS_3',	'TXT_KEY_BUILDING_URD_YEMEN'),
		('BUILDINGCLASS_URD_MBS_4',		'BUILDING_URD_ARWA_MBS_4',	'TXT_KEY_BUILDING_URD_YEMEN'),
		('BUILDINGCLASS_URD_MBS_5',		'BUILDING_URD_ARWA_MBS_5',	'TXT_KEY_BUILDING_URD_YEMEN');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 						Description,					ShortDescription,					Adjective,							Civilopedia, 					CivilopediaTag, 			DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				PortraitIndex,	AlphaIconAtlas,				SoundtrackTag,  MapImage, 			DawnOfManQuote, 				DawnOfManImage)
SELECT	'CIVILIZATION_URD_YEMEN',	'TXT_KEY_CIV_URD_YEMEN_DESC',	'TXT_KEY_CIV_URD_YEMEN_SHORT_DESC',	'TXT_KEY_CIV_URD_YEMEN_ADJECTIVE', 'TXT_KEY_CIV5_URD_YEMEN_TEXT_1',  'TXT_KEY_CIV5_URD_YEMEN',	'PLAYERCOLOR_URD_YEMEN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'URD_YEMEN_ICON_ATLAS',	0,				'URD_YEMEN_ALPHA_ATLAS',	'ARABIA', 		'MapYemen.dds',		'TXT_KEY_DOM_URD_YEMEN_TEXT',	'UrdDomYemen.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_ARABIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_01'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_02'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_03'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_04'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_05'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_06'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_07'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_08'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_09'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_10'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_11'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_12'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_13'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_14'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_15'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_16'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_17'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_18'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_19'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_20'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_21'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_22'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_23'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_CITY_NAME_URD_YEMEN_24');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_URD_YEMEN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_URD_YEMEN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_URD_YEMEN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_URD_YEMEN',	'LEADER_URD_ARWA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_URD_YEMEN', 	'UNITCLASS_SWORDSMAN',	'UNIT_URD_BAKIL');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_URD_YEMEN',	'RELIGION_ISLAM');	

--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,				RegionType)
VALUES	('CIVILIZATION_URD_YEMEN',		'REGION_DESERT');

--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_0'),	
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_1'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_2'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_3'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_4'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_5'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_6'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_7'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_8'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_9'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_10'),
		('CIVILIZATION_URD_YEMEN', 	'TXT_KEY_SPY_NAME_URD_YEMEN_11');
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 									Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 					VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_URD_ARWA', 	'TXT_KEY_LEADER_URD_ARWA_NAME',	'TXT_KEY_LEADER_URD_ARWA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_URD_ARWA', 	'ArwaFallback.xml',				6, 							6, 						4, 							5, 			4, 				6, 				6, 						6, 				6, 			4, 			4, 				4, 			2, 			'URD_YEMEN_ICON_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_URD_ARWA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_URD_ARWA', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_URD_ARWA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_URD_ARWA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_URD_ARWA', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_URD_ARWA', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			FlavorType, 						Flavor)
VALUES	('LEADER_URD_ARWA', 	'FLAVOR_OFFENSE', 					5),
		('LEADER_URD_ARWA', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_URD_ARWA', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_URD_ARWA', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_URD_ARWA', 	'FLAVOR_RECON', 					2),
		('LEADER_URD_ARWA', 	'FLAVOR_RANGED', 					5),
		('LEADER_URD_ARWA', 	'FLAVOR_MOBILE', 					6),
		('LEADER_URD_ARWA', 	'FLAVOR_NAVAL', 					5),
		('LEADER_URD_ARWA', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_URD_ARWA', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_URD_ARWA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_URD_ARWA', 	'FLAVOR_AIR', 						7),
		('LEADER_URD_ARWA', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_URD_ARWA', 	'FLAVOR_GROWTH', 					8),
		('LEADER_URD_ARWA', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_URD_ARWA', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_URD_ARWA', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_URD_ARWA', 	'FLAVOR_GOLD', 						6),
		('LEADER_URD_ARWA', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_URD_ARWA', 	'FLAVOR_CULTURE', 					8),
		('LEADER_URD_ARWA', 	'FLAVOR_HAPPINESS', 				8),
		('LEADER_URD_ARWA', 	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_URD_ARWA', 	'FLAVOR_WONDER', 					7),
		('LEADER_URD_ARWA', 	'FLAVOR_RELIGION', 					8),
		('LEADER_URD_ARWA', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_URD_ARWA', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_URD_ARWA', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_URD_ARWA', 	'FLAVOR_NUKE', 						4),
		('LEADER_URD_ARWA', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_URD_ARWA', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_URD_ARWA', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_URD_ARWA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_URD_ARWA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_URD_ARWA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_URD_ARWA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_URD_ARWA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_URD_ARWA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_URD_ARWA', 	'TRAIT_URD_YEMEN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 				ShortDescription)
VALUES	('TRAIT_URD_YEMEN', 	'TXT_KEY_TRAIT_URD_YEMEN',	'TXT_KEY_TRAIT_URD_YEMEN_SHORT');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 					BuildingType)
VALUES	('CIVILIZATION_URD_YEMEN',					'BUILDINGCLASS_GRANARY',		'BUILDING_URD_ARWA_MBS');
--=========================================================================================================================
-- BUILDINGS
-- Is there a way to do this through one statement? This feels ugly
--=========================================================================================================================
INSERT INTO Buildings 	
		(Type, 							AllowsFoodTradeRoutes, FreeStartEra, BuildingClass,  PrereqTech, Cost, FaithCost, UnlockedByBelief, GoldMaintenance, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_URD_ARWA_MBS',		AllowsFoodTradeRoutes, FreeStartEra, BuildingClass,  PrereqTech, 0.5* Cost, FaithCost, UnlockedByBelief, 0,				 MinAreaSize, ConquestProb, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_URD_ARWA_MBS', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_HELP', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_STRATEGY',	'TXT_KEY_BUILDING_URD_ARWA_MBS_TEXT',	ArtDefineTag, 5, 			 'URD_YEMEN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
INSERT INTO Buildings 	
		(Type, 							FreeStartEra, BuildingClass,					PrereqTech, Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_URD_ARWA_MBS_2',		FreeStartEra, 'BUILDINGCLASS_URD_MBS_2',		null,		0.5 * Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, 1, 		'TXT_KEY_BUILDING_URD_ARWA_MBS', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_HELP', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_STRATEGY',	'TXT_KEY_BUILDING_URD_ARWA_MBS_TEXT',	ArtDefineTag, 2, 			 'URD_YEMEN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
INSERT INTO Buildings 	
		(Type, 							FreeStartEra, BuildingClass,					PrereqTech, Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_URD_ARWA_MBS_3',		FreeStartEra, 'BUILDINGCLASS_URD_MBS_3',		null,		0.5 * Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, 1, 		'TXT_KEY_BUILDING_URD_ARWA_MBS', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_HELP', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_STRATEGY',	'TXT_KEY_BUILDING_URD_ARWA_MBS_TEXT',	ArtDefineTag, 6, 			 'URD_YEMEN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
INSERT INTO Buildings 	
		(Type, 							FreeStartEra, BuildingClass,					PrereqTech, Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_URD_ARWA_MBS_4',		FreeStartEra, 'BUILDINGCLASS_URD_MBS_4',		null,		0.5 * Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, 1, 		'TXT_KEY_BUILDING_URD_ARWA_MBS', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_HELP', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_STRATEGY',	'TXT_KEY_BUILDING_URD_ARWA_MBS_TEXT',	ArtDefineTag, 3, 			 'URD_YEMEN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
INSERT INTO Buildings 	
		(Type, 							Happiness,	FreeStartEra, BuildingClass,					PrereqTech, Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, NeverCapture, 	Description, 						Help, 									Strategy,									Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_URD_ARWA_MBS_5',		2,			FreeStartEra, 'BUILDINGCLASS_URD_MBS_5',		null,		0.5 * Cost, FaithCost, UnlockedByBelief, MinAreaSize, ConquestProb, HurryCostModifier, 1, 		'TXT_KEY_BUILDING_URD_ARWA_MBS', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_HELP', 	'TXT_KEY_BUILDING_URD_ARWA_MBS_STRATEGY',	'TXT_KEY_BUILDING_URD_ARWA_MBS_TEXT',	ArtDefineTag, 7, 			 'URD_YEMEN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_URD_ARWA_MBS',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_URD_ARWA_MBS_2',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_URD_ARWA_MBS_3',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_URD_ARWA_MBS_4',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_URD_ARWA_MBS_5',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_URD_ARWA_MBS',		YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
------------------------------------------------------------------------------------------------------------------------	                                                                                                                 				
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	'BUILDING_URD_ARWA_MBS',		BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_GRANARY';
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
VALUES	('BUILDING_URD_ARWA_MBS_2',		'BUILDINGCLASS_GRANARY'),
		('BUILDING_URD_ARWA_MBS_3',		'BUILDINGCLASS_URD_MBS_2'),
		('BUILDING_URD_ARWA_MBS_4',		'BUILDINGCLASS_URD_MBS_3'),
		('BUILDING_URD_ARWA_MBS_5',		'BUILDINGCLASS_URD_MBS_4');

INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	 BuildingType,					'BUILDINGCLASS_URD_MBS_1'
FROM Building_ClassesNeededInCity
WHERE BuildingClassType = 'BUILDINGCLASS_GRANARY';
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,	Yield)
SELECT	'BUILDING_URD_ARWA_MBS',		YieldType,	Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_GRANARY';
------------------------------------------------------------------------------------------------------------------------	
-- Building_GlobalYieldModifiers
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_GlobalYieldModifiers 	
		(BuildingType, 					YieldType,			Yield)
VALUES	('BUILDING_URD_ARWA_MBS',		'YIELD_FOOD',		2),
		('BUILDING_URD_ARWA_MBS_2',		'YIELD_FOOD',		2),
		('BUILDING_URD_ARWA_MBS_3',		'YIELD_FOOD',		2),
		('BUILDING_URD_ARWA_MBS_4',		'YIELD_FOOD',		2),
		('BUILDING_URD_ARWA_MBS_5',		'YIELD_FOOD',		2);


CREATE TABLE IF NOT EXISTS Building_ProvidesAccesstoFreshWater (
  BuildingType text
);
INSERT INTO Building_ProvidesAccesstoFreshWater
			(BuildingType)
VALUES		('BUILDING_URD_ARWA_MBS_5');

INSERT OR REPLACE INTO Features (TYPE, Description, Civilopedia, Movement, AddsFreshWater, PortraitIndex, IconAtlas)
VALUES ('FEATURE_WATER_DUMMY', 'TXT_KEY_FEATURE_URD_WATER_DUMMY', 'TXT_KEY_FEATURE_URD_WATER_DUMMY_TEXT', 1, 1, 0, 'NEW_TERRAIN_ATLAS_DLC');
--------------------------------------------------------------------------------------------------------------------------
-- Dummies
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 		
		(Type, 								BuildingClass,						GreatWorkCount,	Cost, 	FaithCost, 	PrereqTech,  Description,									Help, 						NeverCapture)
VALUES	('BUILDING_URD_YEMEN_MBS_FOOD',		'BUILDINGCLASS_URD_YEMEN',	-1,   			-1,		-1,			null,		 'TXT_KEY_BUILDING_URD_YEMEN_FOOD_DUMMY',	'TXT_KEY_BUILDING_URD_YEMEN_FOOD_DUMMY',	1);

INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_URD_YEMEN_MBS_FOOD',		'YIELD_FOOD',		1);

INSERT INTO Buildings
(Type, BuildingClass, GreatWorkCount, Cost, FaithCost, PrereqTech, Description, Help, NeverCapture, Capital)
SELECT 'BUILDING_URD_DUMMY_'||Type, 'BUILDINGCLASS_URD_YEMEN', -1, -1, -1, null, 'TXT_KEY_BUILDING_URD_YEMEN_RESOURCE_DUMMY', 'TXT_KEY_BUILDING_URD_YEMEN_RESOURCE_DUMMY', 1, 1
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';

CREATE TRIGGER UrdYemenLuxDummy AFTER INSERT ON RESOURCES
WHEN New.ResourceClassType = 'RESOURCECLASS_LUXURY'
BEGIN
INSERT INTO Buildings
(Type, BuildingClass, GreatWorkCount, Cost, FaithCost, PrereqTech, Description, Help, NeverCapture, Capital)
VALUES ('BUILDING_URD_DUMMY_'||New.Type, 'BUILDINGCLASS_URD_YEMEN', -1, -1, -1, null, 'TXT_KEY_BUILDING_URD_YEMEN_RESOURCE_DUMMY', 'TXT_KEY_BUILDING_URD_YEMEN_RESOURCE_DUMMY', 1, 1);
END;

--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_URD_ARWA',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_URD_ARWA_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_URD_ARWA',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_URD_ARWA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_URD_ARWA',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_URD_ARWA_DEFEATED%', 					 			500),
		('LEADER_URD_ARWA',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_URD_ARWA_DOW_GENERIC%', 				 				500),
		('LEADER_URD_ARWA',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_URD_ARWA_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_URD_ARWA',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_URD_ARWA_FIRSTGREETING%', 				 			500),
		('LEADER_URD_ARWA',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_URD_ARWA_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_URD_ARWA',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_URD_ARWA_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_URD_ARWA',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_URD_ARWA_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_URD_ARWA',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_URD_ARWA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 		500),
		('LEADER_URD_ARWA',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_URD_ARWA_LUXURY_TRADE%', 		  					500),
		('LEADER_URD_ARWA',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_URD_ARWA_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_URD_ARWA',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_URD_ARWA_PLOT_BUYING_SERIOUS_WARNING%', 				500),
		('LEADER_URD_ARWA',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_URD_ARWA_REQUEST%', 		  							500),
		('LEADER_URD_ARWA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_URD_ARWA_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_URD_ARWA',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_URD_ARWA_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_URD_ARWA',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_URD_ARWA_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_URD_ARWA',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_URD_ARWA_DENOUNCE%', 					  			500),
		('LEADER_URD_ARWA',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_URD_ARWA_DEC_FRIENDSHIP%', 			  	  			500);

--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost,	Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 									Civilopedia, 						MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 						UnitFlagIconOffset, IconAtlas,						PortraitIndex)
SELECT	'UNIT_URD_BAKIL',		Class,	CombatClass, PrereqTech, Cost,	Combat, RangedCombat, Range,	FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_URD_BAKIL',	'TXT_KEY_UNIT_URD_BAKIL_HELP', 'TXT_KEY_UNIT_URD_BAKIL_STRATEGY',   'TXT_KEY_UNIT_URD_BAKIL_TEXT',	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_URD_BAKIL',	'URD_YEMEN_UNIT_FLAG_ATLAS',	0,					'URD_YEMEN_ICON_ATLAS',	4
FROM Units WHERE Type = 'UNIT_SWORDSMAN';      
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_URD_BAKIL',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_URD_BAKIL',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_URD_BAKIL',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_URD_BAKIL',		ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_URD_BAKIL',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
VALUES	('UNIT_URD_BAKIL',		'PROMOTION_BAKIL_HILLS');

--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_URD_BAKIL',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_SWORDSMAN';

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			  PediaEntry)
VALUES	('PROMOTION_BAKIL_HILLS',	'TXT_KEY_PROMOTION_BAKIL_HILLS',	'TXT_KEY_PROMOTION_BAKIL_HILLS_HELP',	'AS2D_IF_LEVELUP', 	1, 				13, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_BAKIL_HILLS');

INSERT INTO UnitPromotions_Terrains
		(PromotionType,				TerrainType,		DoubleMove)
VALUES	('PROMOTION_BAKIL_HILLS',	'TERRAIN_HILL',		1);