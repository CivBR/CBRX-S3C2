--==========================================================================================================================	
-- IMPROVEMENTS
--==========================================================================================================================		
-- Improvements
------------------------------
INSERT INTO Improvements
		(Type,									Description,									Help,												Civilopedia,										ArtDefineTag,									IconAtlas,					PortraitIndex,	SpecificCivRequired,	CivilizationType,				PillageGold,	FreshWaterMakesValid,	RequiresFlatlands,	RemovesResource,	NoTwoAdjacent,	RiverSideMakesValid,	RequiresFlatlandsOrFreshWater)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'TXT_KEY_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'TXT_KEY_IMPROVEMENT_PG_YERBAMATE_PLANTATION_HELP', 'TXT_KEY_IMPROVEMENT_PG_YERBAMATE_PLANTATION_TEXT', 'ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'PG_RIODELAPLATA_ATLAS',	5,				1,						'CIVILIZATION_PG_RIODELAPLATA',	25,				1,						1,					1,					1,				1,						1);

------------------------------
-- Improvement_FreshWaterYields
------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType,						YieldType,			Yield)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'YIELD_FOOD',		1);

INSERT INTO Improvement_Yields
		(ImprovementType,						YieldType,			Yield)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'YIELD_CULTURE',	2);


------------------------------
-- Improvement_FreshWaterYields
------------------------------
--INSERT INTO Improvement_RiverSideYields
--		(ImprovementType,						YieldType,			Yield)
--VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'YIELD_FOOD',		2);

--INSERT INTO Improvement_RiverSideYields
--		(ImprovementType,						YieldType,			Yield)
--VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'YIELD_CULTURE',	2);



------------------------------
-- Improvement_Prereq_NatureYields
------------------------------
INSERT INTO Improvement_PrereqNatureYields
		(ImprovementType,							YieldType,		Yield)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',		'YIELD_FOOD',	1);

------------------------------
-- Valid Terrains
------------------------------
INSERT INTO Improvement_ValidTerrains
		(ImprovementType,			TerrainType)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'TERRAIN_PLAINS');

INSERT INTO Improvement_ValidTerrains
		(ImprovementType,			TerrainType)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'TERRAIN_GRASS');

------------------------------
-- Builds
------------------------------
INSERT INTO Builds
		(Type,								ImprovementType,						PrereqTech,					Time,	Description,								EntityEvent,				HotKey,	OrderPriority,	IconAtlas,					IconIndex)
VALUES	('BUILD_PG_YERBAMATE_PLANTATION',	'IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'TECH_HORSEBACK_RIDING',	600,	'TXT_KEY_BUILD_PG_YERBAMATE_PLANTATION',	'ENTITY_EVENT_IRRIGATE',	'KB_Y', 98,				'PG_RIODELAPLATA_ATLAS',	3);

------------------------------
-- BuildFeatures
------------------------------
INSERT INTO BuildFeatures
		(BuildType,							FeatureType,		PrereqTech,				Time,	Production,	Remove)
VALUES	('BUILD_PG_YERBAMATE_PLANTATION',	'FEATURE_JUNGLE',	'TECH_BRONZE_WORKING',	400,	0,			1);

INSERT INTO BuildFeatures
		(BuildType,							FeatureType,		PrereqTech,				Time,	Production,	Remove)
VALUES	('BUILD_PG_YERBAMATE_PLANTATION',	'FEATURE_FOREST',	'TECH_MINING',			400,	20,			1);

INSERT INTO BuildFeatures
		(BuildType,							FeatureType,		PrereqTech,				Time,	Production,	Remove)
VALUES	('BUILD_PG_YERBAMATE_PLANTATION',	'FEATURE_MARSH',	'TECH_MASONRY',			600,	0,			1);

------------------------------
-- Unit_Builds
------------------------------
INSERT INTO Unit_Builds
		(UnitType,			BuildType)
VALUES	('UNIT_WORKER',		'BUILD_PG_YERBAMATE_PLANTATION');

--==========================================================================================================================	
-- RESOURCES
--==========================================================================================================================		
-- Resources
------------------------------
INSERT INTO Resources
		(Type,						Description,						Help,									Civilopedia,							ResourceClassType,		IconString,			IconAtlas,					PortraitIndex,	ArtDefineTag)
VALUES	('RESOURCE_PG_YERBAMATE',	'TXT_KEY_RESOURCE_PG_YERBAMATE',	'TXT_KEY_RESOURCE_PG_YERBAMATE_HELP',	'TXT_KEY_RESOURCE_PG_YERBAMATE_TEXT',	'RESOURCECLASS_BONUS',	'[ICON_RES_MATE]',	'PG_RIODELAPLATA_ATLAS',	6,				'ART_DEF_RESOURCE_PG_YERBAMATE');

------------------------------
-- Resource_QuantityTypes
------------------------------
INSERT INTO Resource_QuantityTypes
		(ResourceType,				Quantity)
VALUES	('RESOURCE_PG_YERBAMATE',	1);

------------------------------
-- Building_ResourceYieldChanges
------------------------------

INSERT INTO Building_ResourceYieldChanges 	
		(BuildingType, 			ResourceType,				YieldType,		Yield)
VALUES	('BUILDING_GRANARY',	'RESOURCE_PG_YERBAMATE',	'YIELD_FOOD',	1);


------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ImprovementType,						ResourceType)
VALUES	('IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'RESOURCE_PG_YERBAMATE');
	

--==========================================================================================================================
--==========================================================================================================================