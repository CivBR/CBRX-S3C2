--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- RESOURCES
--=======================================================================================================================
-- Resources
-------------------------------------------------------------------------------------------------------------------------	
insert into Resources
		(Type,						TechCityTrade,		ResourceClassType,		ArtDefineTag,				Happiness,	IconString,						IconAtlas,			PortraitIndex)
values	('RESOURCE_LITE_AINU_BEAR',	'TECH_TRAPPING',	'RESOURCECLASS_LUXURY',	'ART_DEF_RESOURCE_SUGAR',	4,			'[ICON_RES_LITE_AINU_BEAR]',	'LITE_AINU_ATLAS',	5);

update Resources set Description = 'TXT_KEY_'||Type where Type = 'RESOURCE_LITE_AINU_BEAR';
update Resources set Civilopedia = Description||'_TEXT' where Type = 'RESOURCE_LITE_AINU_BEAR';
update Resources set Help = Civilopedia where Type = 'RESOURCE_LITE_AINU_BEAR';
-------------------------------------------------------------------------------------------------------------------------
-- Resource_Flavors
-------------------------------------------------------------------------------------------------------------------------	
insert into Resource_Flavors
		(ResourceType,					FlavorType,				Flavor)
values	('RESOURCE_LITE_AINU_BEAR',		'FLAVOR_HAPPINESS',		15);
-------------------------------------------------------------------------------------------------------------------------
-- Resource_TerrainBooleans
-------------------------------------------------------------------------------------------------------------------------	
insert into Resource_TerrainBooleans
		(ResourceType,			TerrainType)
values	('RESOURCE_LITE_AINU_BEAR',	'TERRAIN_SNOW'),
		('RESOURCE_LITE_AINU_BEAR',	'TERRAIN_TUNDRA');
-------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureBooleans
-------------------------------------------------------------------------------------------------------------------------	
insert into Resource_FeatureBooleans
		(ResourceType,			FeatureType)
values	('RESOURCE_LITE_AINU_BEAR',	'FEATURE_MARSH'),
		('RESOURCE_LITE_AINU_BEAR',	'FEATURE_FOREST');
-------------------------------------------------------------------------------------------------------------------------
-- Resource_FeatureTerrainBooleans
-------------------------------------------------------------------------------------------------------------------------	
insert into Resource_FeatureTerrainBooleans
		(ResourceType,			TerrainType)
values	('RESOURCE_LITE_AINU_BEAR',	'TERRAIN_SNOW'),
		('RESOURCE_LITE_AINU_BEAR',	'TERRAIN_TUNDRA');
--=======================================================================================================================
-- UNITPROMOTIONS
--=======================================================================================================================
-- UnitPromotions
-------------------------------------------------------------------------------------------------------------------------	
-------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
-------------------------------------------------------------------------------------------------------------------------	
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
-- Units
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class, Cost,   Moves,	FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,		RangedCombat,	Range,	CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Pillage, HurryCostModifier, AdvancedStartCost,	UnitArtInfo,				XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,				MoveRate, PortraitIndex,	IconAtlas)
SELECT	'UNIT_LITE_AINU_MATAGI',	Class, Cost,   Moves+1, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat-1,	RangedCombat-1,	Range,	CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Pillage, HurryCostModifier, AdvancedStartCost, 'ART_DEF_UNIT_LITE_MATAGI',	XPValueAttack, XPValueDefense, 0,					'LITE_AINU_MATAGI_FLAG',	MoveRate, 1, 				'LITE_AINU_ATLAS'
FROM Units WHERE Type = 'UNIT_ARCHER';

update Units set Description = 'TXT_KEY_'||Type where Type = 'UNIT_LITE_AINU_MATAGI';
update Units set Help = Description||'_HELP' where Type = 'UNIT_LITE_AINU_MATAGI';
update Units set Strategy = Description||'_STRATEGY' where Type = 'UNIT_LITE_AINU_MATAGI';
update Units set Civilopedia = Description||'_TEXT' where Type = 'UNIT_LITE_AINU_MATAGI';
-------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
-------------------------------------------------------------------------------------------------------------------------
insert into UnitGameplay2DScripts
		(UnitType,					SelectionSound,		FirstSelectionSound)
select	'UNIT_LITE_AINU_MATAGI',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_ARCHER';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
-------------------------------------------------------------------------------------------------------------------------
insert into Unit_AITypes
		(UnitType,					UnitAIType)
select	'UNIT_LITE_AINU_MATAGI',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_ARCHER';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
-------------------------------------------------------------------------------------------------------------------------
insert into Unit_ClassUpgrades
		(UnitType,					UnitClassType)
select	'UNIT_LITE_AINU_MATAGI',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_ARCHER';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
-------------------------------------------------------------------------------------------------------------------------
insert into Unit_Flavors
		(UnitType,					FlavorType,		Flavor)
select	'UNIT_LITE_AINU_MATAGI',	FlavorType,		Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_ARCHER';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
-------------------------------------------------------------------------------------------------------------------------
insert into Unit_FreePromotions
		(UnitType,					PromotionType)
select	'UNIT_LITE_AINU_MATAGI',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_ARCHER';
--=======================================================================================================================
-- POLICIES
--=======================================================================================================================
-- Policies
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassProductionModifiers
-------------------------------------------------------------------------------------------------------------------------
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
-------------------------------------------------------------------------------------------------------------------------
insert into BuildingClasses
		(Type,								DefaultBuilding)
values	('BUILDINGCLASS_LITE_AINU_DUMMY',	'BUILDING_LITE_AINU_DUMMY');

update BuildingClasses set Description = 'TXT_KEY_'||DefaultBuilding where Type in ('BUILDINGCLASS_LITE_AINU_DUMMY');
--=======================================================================================================================
-- BUILDINGS
--=======================================================================================================================
-- Buildings
-------------------------------------------------------------------------------------------------------------------------
insert into Buildings 	
		(Type, 							BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	MinAreaSize,	HurryCostModifier,	NeverCapture,	ArtDefineTag,	FreeStartEra,	PortraitIndex,	IconAtlas)
select	'BUILDING_LITE_AINU_HEPER_SET',	BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	MinAreaSize,	HurryCostModifier,	1, 				ArtDefineTag,	FreeStartEra,	4, 				'LITE_AINU_ATLAS'
from Buildings where Type = 'BUILDING_GRANARY';

insert into Buildings
		(Type, 							BuildingClass,						Cost, 	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture)
values	('BUILDING_LITE_AINU_DUMMY',	'BUILDINGCLASS_LITE_AINU_DUMMY',	-1, 	-1,			NULL,				-1,				0,					NULL,		1);

update Buildings set AllowsFoodTradeRoutes = 1 where Type = 'BUILDING_LITE_AINU_HEPER_SET';
update Buildings set NearbyTerrainRequired = 'TERRAIN_TUNDRA' where Type = 'BUILDING_LITE_AINU_DUMMY';
update Buildings set Description = 'TXT_KEY_'||Type where Type in ('BUILDING_LITE_AINU_DUMMY', 'BUILDING_LITE_AINU_HEPER_SET');
update Buildings set Help = Description||'_HELP' where Type in ('BUILDING_LITE_AINU_DUMMY', 'BUILDING_LITE_AINU_HEPER_SET');
update Buildings set Strategy = Description||'_STRATEGY' where Type in ('BUILDING_LITE_AINU_HEPER_SET');
update Buildings set Civilopedia = Description||'_TEXT' where Type in ('BUILDING_LITE_AINU_HEPER_SET');
-------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
-------------------------------------------------------------------------------------------------------------------------
insert into Building_Flavors
		(BuildingType,					FlavorType,		Flavor)
select	'BUILDING_LITE_AINU_HEPER_SET',	FlavorType,		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';

insert into Building_Flavors
		(BuildingType,						FlavorType,			Flavor)
values	('BUILDING_LITE_AINU_HEPER_SET',	'FLAVOR_RELIGION',	15);
-------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
-------------------------------------------------------------------------------------------------------------------------
insert into Building_YieldChanges
		(BuildingType,					YieldType,		Yield)
select	'BUILDING_LITE_AINU_HEPER_SET',	YieldType,		Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_GRANARY';
-------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceYieldChanges
-------------------------------------------------------------------------------------------------------------------------
insert into Building_ResourceYieldChanges
		(BuildingType,					ResourceType,		YieldType,		Yield)
select	'BUILDING_LITE_AINU_HEPER_SET',	ResourceType,		YieldType,		Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_GRANARY';

insert into Building_ResourceYieldChanges
		(BuildingType,						ResourceType,		YieldType,		Yield)
values	('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_DEER',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_SHEEP',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_HORSE',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_FISH',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_FUR',		'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_COW',		'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_BISON',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_CRAB',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_IVORY',	'YIELD_FAITH',	1),
		('BUILDING_LITE_AINU_HEPER_SET',	'RESOURCE_WHALE',	'YIELD_FAITH',	1);
-------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
-------------------------------------------------------------------------------------------------------------------------
insert into Building_ResourceQuantity
		(BuildingType, 					ResourceType,				Quantity)
values	('BUILDING_LITE_AINU_DUMMY',	'RESOURCE_LITE_AINU_BEAR',		1);
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
-- Leaders
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leaders			
		(Type, 						Description, 							Civilopedia, 								CivilopediaTag, 					ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas,			PortraitIndex)
VALUES	('LEADER_LITE_SHAKUSHAIN', 	'TXT_KEY_LEADER_LITE_SHAKUSHAIN_DESC', 	'TXT_KEY_LEADER_LITE_SHAKUSHAIN_PEDIA', 	'TXT_KEY_LEADER_LITE_SHAKUSHAIN', 	'LITE_Ainu_Leaderhead.xml',		6, 						2, 						3, 							6, 			6, 				8, 				7, 						6, 				5, 			6, 			4, 				5, 			4, 			'LITE_AINU_ATLAS',	2);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_WAR', 			7),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_LITE_SHAKUSHAIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_MinorCivApproachBiases
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_LITE_SHAKUSHAIN', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_LITE_SHAKUSHAIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_LITE_SHAKUSHAIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
			('LEADER_LITE_SHAKUSHAIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_LITE_SHAKUSHAIN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_OFFENSE', 					3),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_DEFENSE', 					7),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_RECON', 					3),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_RANGED', 					8),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_MOBILE', 					5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_NAVAL', 					4),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_NAVAL_RECON', 				2),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_AIR', 						5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_EXPANSION', 				4),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_GROWTH', 					6),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_TILE_IMPROVEMENT', 			3),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_GOLD', 						5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_CULTURE', 					9),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_WONDER', 					2),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_RELIGION', 					8),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_SPACESHIP', 				7),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_NUKE', 						5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_USE_NUKE', 					5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_AIRLIFT', 					6),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_LITE_SHAKUSHAIN', 	'FLAVOR_AIR_CARRIER', 				5);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
-------------------------------------------------------------------------------------------------------------------------	
insert into Leader_Traits
		(LeaderType, 				TraitType)
values	('LEADER_LITE_SHAKUSHAIN',	'TRAIT_LITE_IOMANTE');
--=======================================================================================================================	
-- DIPLOMACY
--=======================================================================================================================	
-- Diplomacy_Responses
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 				ResponseType, 							 Response, 															Bias)
VALUES 	('LEADER_LITE_SHAKUSHAIN',	'RESPONSE_DEFEATED', 					 'TXT_KEY_LEADER_LITE_SHAKUSHAIN_DEFEATED_%', 						500),
		('LEADER_LITE_SHAKUSHAIN',	'RESPONSE_FIRST_GREETING', 				 'TXT_KEY_LEADER_LITE_SHAKUSHAIN_FIRST_GREETING_%', 				500),
		('LEADER_LITE_SHAKUSHAIN',	'RESPONSE_INSULT_LEADER', 				 'TXT_KEY_LEADER_LITE_SHAKUSHAIN_INSULT_LEADER_%',					500),
		('LEADER_LITE_SHAKUSHAIN',	'RESPONSE_ATTACKED_HOSTILE', 			 'TXT_KEY_LEADER_LITE_SHAKUSHAIN_ATTACKED_HOSTILE_%',				500);
--=======================================================================================================================	
-- TRAITS
--=======================================================================================================================	
-- Traits
-------------------------------------------------------------------------------------------------------------------------	
insert into Traits
		(Type, 					Description,						ShortDescription)
values	('TRAIT_LITE_IOMANTE',	'TXT_KEY_TRAIT_LITE_IOMANTE_DESC',	'TXT_KEY_TRAIT_LITE_IOMANTE_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
-- Civilizations
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations 	
		(Type, 						CivilopediaTag,					DefaultPlayerColor,		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 				DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_LITE_AINU',	'TXT_KEY_CIVLOPEDIA_LITE_AINU',	'PLAYERCOLOR_LITE_AINU',ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'LITE_AINU_ATLAS',	0, 				'LITE_AINU_ALPHA_ATLAS', 	'Japan', 		'LITE_Ainu_Map.dds', 	'TXT_KEY_DAWN_OF_MAN_LITE_AINU_TEXT', 	'LITE_Ainu_DoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_JAPAN';

update Civilizations set Description = 'TXT_KEY_'||Type where Type = 'CIVILIZATION_LITE_AINU';
update Civilizations set ShortDescription = Description||'_SHORT' where Type = 'CIVILIZATION_LITE_AINU';
update Civilizations set Adjective = Description||'_ADJECTIVE' where Type = 'CIVILIZATION_LITE_AINU';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CityNames 
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_1'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_2'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_3'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_4'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_5'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_6'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_7'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_8'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_9'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_10'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_11'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_12'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_13'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_14'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_15'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_16'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_17'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_18'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_19'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_20'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_21'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_22'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_23'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_24'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_25'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_26'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_27'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_28'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_CITY_NAME_LITE_AINU_29');	
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_LITE_AINU',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_JAPAN';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_LITE_AINU',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_JAPAN';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_LITE_AINU',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_JAPAN';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_LITE_AINU', 	'LEADER_LITE_SHAKUSHAIN');	
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_LITE_AINU', 	'UNITCLASS_ARCHER', 	'UNIT_LITE_AINU_MATAGI');
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_LITE_AINU', 	'BUILDINGCLASS_GRANARY',	'BUILDING_LITE_AINU_HEPER_SET');
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_LITE_AINU', 	'RELIGION_SHINTO');
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 			RegionType)
VALUES	('CIVILIZATION_LITE_AINU', 	'REGION_TUNDRA');		
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_0'),	
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_1'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_2'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_3'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_4'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_5'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_6'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_7'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_8'),
		('CIVILIZATION_LITE_AINU', 	'TXT_KEY_SPY_NAME_LITE_AINU_9');
--=======================================================================================================================
--=======================================================================================================================