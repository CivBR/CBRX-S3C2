--==========================================================================================================================
-- Improvements
--==========================================================================================================================
INSERT INTO Improvements
			(Type,												SpecificCivRequired,	RequiresFeature,	DefenseModifier,	UpgradeTime,	CivilizationType,				GoldMaintenance,	NoTwoAdjacent,	Description,							Civilopedia,														ArtDefineTag,						DestroyedWhenPillaged,	Permanent,	PillageGold,	BuildableOnResources,	PortraitIndex,	IconAtlas)
VALUES		('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',		1,						0,					25,					50,				'CIVILIZATION_THP_SEN_TUVA',	0,					0,				'TXT_KEY_IMPROVEMENT_THP_SEN_GER_KHARUUL',			'TXT_KEY_IMPROVEMENT_THP_SEN_GER_KHARUUL_PEDIA',		'ART_DEF_IMPROVEMENT_GERKHARUUL', 	0,		1,			100,			0,						3,				'THP_SEN_TUVA_ATLAS'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_YES_RELIG',		0,						0,					50,					50,				null,							0,					0,				'TXT_KEY_IMPROVEMENT_THP_SEN_GER_KHARUUL',			'TXT_KEY_IMPROVEMENT_THP_SEN_GER_KHARUUL_PEDIA',		'ART_DEF_IMPROVEMENT_GERKHARUUL', 	0,		1,			100,			0,						3,				'THP_SEN_TUVA_ATLAS');
--==========================================================================================================================
-- Improvement_ValidTerrains
--==========================================================================================================================
INSERT INTO Improvement_ValidTerrains
			(ImprovementType,								TerrainType)
VALUES		('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_GRASS'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_PLAINS'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_DESERT'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_HILL'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_TUNDRA'),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'TERRAIN_SNOW');
--==========================================================================================================================
-- Improvement_Yields
--==========================================================================================================================
INSERT INTO Improvement_Yields
			(ImprovementType,							YieldType,			Yield)
VALUES		('IMPROVEMENT_THP_SEN_GER_KHARUUL_YES_RELIG',	'YIELD_FAITH',		2),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_YES_RELIG',	'YIELD_PRODUCTION',	1),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'YIELD_FAITH',		1),
			('IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- Builds
--==========================================================================================================================
INSERT INTO Builds
			(Type,									PrereqTech,					Time,			ImprovementType,								Description,								Help,												Recommendation,								EntityEvent,				HotKey,		OrderPriority,	CtrlDown,	IconIndex,	IconAtlas)
VALUES		('BUILD_THP_SEN_GER_KHARUUL',	'TECH_TRAPPING',			800,            'IMPROVEMENT_THP_SEN_GER_KHARUUL_NO_RELIG',		'TXT_KEY_BUILD_THP_SEN_GER_KHARUUL',		'TXT_KEY_BUILD_THP_SEN_GER_KHARUUL_HELP',			'TXT_KEY_BUILD_THP_SEN_GER_KHARUUL_REC',	'ENTITY_EVENT_BUILD',		'K',		96,				1,			4,		'THP_SEN_TUVA_ATLAS');
--==========================================================================================================================
-- Unit_Builds
--==========================================================================================================================
INSERT INTO Unit_Builds
			(UnitType,		BuildType)
VALUES		('UNIT_WORKER',	'BUILD_THP_SEN_GER_KHARUUL');
--==========================================================================================================================
--==========================================================================================================================