--Arapaho under Pretty Nose
--By Arilasqueto
--Code by ExplosvieWatermelon & Arilasqueto

-----

--Leader

INSERT INTO Leaders
		(Type,					Description,						Civilopedia,							CivilopediaTag,					ArtDefineTag,							VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_ASQ_PRETTYNOSE',	'TXT_KEY_LEADER_ASQ_PRETTYNOSE',		'TXT_KEY_LEADER_PEDIA_ASQ_PRETTYNOSE',		'TXT_KEY_LEADER_ASQ_PRETTYNOSE_PEDIA',		'arapaho_LS.xml',						7,						8,						3,			5,			6,				5,				3,						4,						4,						4,				6,			4,			4,				3,			5,			1,				'ATLAS_ASQ_ARAPAHO');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_WAR',		5),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_HOSTILE',	2),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_DECEPTIVE',	2),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_GUARDED',	4),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_FRIENDLY',	6),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_ASQ_PRETTYNOSE',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_ASQ_PRETTYNOSE',	'MINOR_CIV_APPROACH_IGNORE',		5),
		('LEADER_ASQ_PRETTYNOSE',	'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_ASQ_PRETTYNOSE',	'MINOR_CIV_APPROACH_PROTECTIVE',	5),
		('LEADER_ASQ_PRETTYNOSE',	'MINOR_CIV_APPROACH_CONQUEST',		4),
		('LEADER_ASQ_PRETTYNOSE',	'MINOR_CIV_APPROACH_BULLY',			4);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_OFFENSE',					7),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_DEFENSE',					7),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_CITY_DEFENSE',				5),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_MILITARY_TRAINING',			6),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_RECON',						4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_RANGED',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_MOBILE',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_NAVAL',						3),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_NAVAL_RECON',				2),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_NAVAL_GROWTH',				2),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	2),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_AIR',						4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_EXPANSION',					9),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_GROWTH',					3),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_PRODUCTION',				9),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_GOLD',						6),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_SCIENCE',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_CULTURE',					3),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_HAPPINESS',					5),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_GREAT_PEOPLE',				4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_WONDER',					8),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_RELIGION',					7),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_DIPLOMACY',					3),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_SPACESHIP',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_WATER_CONNECTION',			3),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_NUKE',						4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_USE_NUKE',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_ESPIONAGE',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_ANTIAIR',					4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_I_LAND_TRADE_ROUTE',		7),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_I_SEA_TRADE_ROUTE',			2),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_ARCHAEOLOGY',				4),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_ASQ_PRETTYNOSE',	'FLAVOR_AIRLIFT',					4);
		
-----

INSERT INTO Traits
		(Type,					Description,				ShortDescription)
VALUES	('TRAIT_ASQ_PRETTYNOSE',	'TXT_KEY_TRAIT_ASQ_PRETTYNOSE',	'TXT_KEY_TRAIT_ASQ_PRETTYNOSE_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_ASQ_PRETTYNOSE',	'TRAIT_ASQ_PRETTYNOSE');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,							CivilopediaTag,				ShortDescription,						Adjective,								DefaultPlayerColor,			ArtDefineTag,				ArtStyleType,				ArtStyleSuffix,	ArtStylePrefix,		PortraitIndex,	IconAtlas,				AlphaIconAtlas,			MapImage,				DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO',		'TXT_KEY_PEDIA_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SHORT',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_ADJ',	'PLAYERCOLOR_ASQ_ARAPAHO',	ArtDefineTag,		ArtStyleType,		ArtStyleSuffix,		ArtStylePrefix,			0,				'ATLAS_ASQ_ARAPAHO',		'ALPHA_ASQ_ARAPAHO',		'arapahoMap.dds',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_DOM',	'arapahoDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';

-----

INSERT INTO Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_1'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_2'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_3'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_4'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_5'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_6'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_7'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_8'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_9'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_10'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_11'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_12'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_13'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_14'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_15'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_16'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_17'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_18'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_19'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_20'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_21'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_22'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_23'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_24'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_25'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_26'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_27'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_28'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_29'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_CITY_30')
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,		UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech,	BaseHurry,	HurryMultiplier)
SELECT	'UNIT_ASQ_BENIIINEN',		'TXT_KEY_UNIT_ASQ_BENIIINEN',		'TXT_KEY_UNIT_ASQ_BENIIINEN_PEDIA',			'TXT_KEY_UNIT_ASQ_BENIIINEN_STRATEGY',			'TXT_KEY_UNIT_ASQ_BENIIINEN_HELP',			Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	2,				'ATLAS_ASQ_ARAPAHO',	0,					'ALPHA_ASQ_BENIIINEN',	'ART_DEF_UNIT_ASQ_BENIIINEN',	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech,	BaseHurry,	HurryMultiplier
FROM Units WHERE (Type = 'UNIT_KNIGHT');

-----

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,	Flavor)
SELECT	'UNIT_ASQ_BENIIINEN',	FlavorType,	Flavor + 4
FROM Unit_Flavors WHERE (UnitType = 'UNIT_KNIGHT');

-----

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	'UNIT_ASQ_BENIIINEN',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_KNIGHT');

-----

INSERT INTO Unit_FreePromotions
		(UnitType,	PromotionType)
VALUES	('UNIT_ASQ_BENIIINEN',	'PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC');

--Buildings

INSERT INTO Buildings
		(Type,					Description,					Civilopedia,						Strategy,								Help,								Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas,			Water,	GoldMaintenance,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus)
SELECT	'BUILDING_ASQ_TRAVOIS',	'TXT_KEY_BUILDING_ASQ_TRAVOIS',	'TXT_KEY_BUILDING_ASQ_TRAVOIS_PEDIA',	'TXT_KEY_BUILDING_ASQ_TRAVOIS_STRATEGY',	'TXT_KEY_BUILDING_ASQ_TRAVOIS_HELP',	Cost,	HurryCostModifier,	-1,				Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	3,				'ATLAS_ASQ_ARAPAHO',	Water,	GoldMaintenance,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus
FROM Buildings WHERE (Type = 'BUILDING_CARAVANSARY');

INSERT INTO Buildings         
        (Type,                                         BuildingClass,                        GreatWorkCount,    Cost,     FaithCost,     PrereqTech,  Description,                            Help,                      PortraitIndex, IconAtlas, NeverCapture, TradeRouteLandDistanceModifier)
VALUES  ('BUILDING_ASQ_RANGE_DUMMY',        'BUILDINGCLASS_ASQ_ARAPAHO_TRADE_RANGE',    -1,               -1,        -1,            null,         'TXT_KEY_BUILDING_ASQ_RANGE_DUMMY',    'TXT_KEY_BUILDING_ASQ_RANGE_DUMMY',    19, 'BW_ATLAS_1',          1, 10);

INSERT INTO Buildings
        (Type,                                    BuildingClass,                            Description,                            Civilopedia,    GreatWorkCount,    PlotCultureCostModifier, NukeImmune, ConquestProb,    Cost,    FaithCost,    PrereqTech,    PortraitIndex, IconAtlas, NumTradeRouteBonus)
VALUES    ('BUILDING_ASQ_TRADE_SLOT_DUMMY',        'BUILDINGCLASS_ASQ_ARAPAHO_TRADE_SLOT',    'TXT_KEY_BUILDING_ASQ_TRADE_SLOT_DUMMY',    null,        -1,                0,                         1,             100,            -1,        -1,            null,               19,    'BW_ATLAS_1',                  1);

INSERT INTO BuildingClasses
        (Type,                                 DefaultBuilding,                 Description, NoLimit)
VALUES    ('BUILDINGCLASS_ASQ_ARAPAHO_TRADE_SLOT',     'BUILDING_ASQ_TRADE_SLOT_DUMMY',     'TXT_KEY_BUILDING_ASQ_ARAPAHO', 1),
        ('BUILDINGCLASS_ASQ_ARAPAHO_TRADE_RANGE',     'BUILDING_ASQ_RANGE_DUMMY',     'TXT_KEY_BUILDING_ASQ_ARAPAHO', 1);

INSERT INTO Building_SeaPlotYieldChanges
		(BuildingType,		YieldType,	Yield)
SELECT	'BUILDING_ASQ_TRAVOIS',	YieldType,	Yield
FROM Building_SeaPlotYieldChanges WHERE (BuildingType = 'BUILDING_CARAVANSARY');

-----

INSERT INTO Building_SeaResourceYieldChanges
		(BuildingType,	YieldType,	Yield)
SELECT	'BUILDING_ASQ_TRAVOIS',	YieldType,	Yield
FROM Building_SeaResourceYieldChanges WHERE (BuildingType = 'BUILDING_CARAVANSARY');

-----

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,	ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_ASQ_TRAVOIS',	ResourceType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE (BuildingType = 'BUILDING_CARAVANSARY');

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_ASQ_TRAVOIS',	FlavorType,	Flavor + 3
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CARAVANSARY');
		
--Defines

INSERT INTO Civilization_FreeUnits
		(CivilizationType,				UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

-----

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'BUILDINGCLASS_PALACE');

-----

INSERT INTO Civilization_FreeTechs
		(CivilizationType,			TechType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'TECH_AGRICULTURE');

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'LEADER_ASQ_PRETTYNOSE');

-----

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'RELIGION_CHRISTIANITY');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_1'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_2'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_3'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_4'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_5'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_6'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_7'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_8'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_9'),
		('CIVILIZATION_ASQ_ARAPAHO',	'TXT_KEY_CIVILIZATION_ASQ_ARAPAHO_SPY_10');

--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_FIRSTGREETING%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_DEFEATED%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_DOW_GENERIC%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_WORK_WITH_US', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_DEC_FRIENDSHIP%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_WORK_AGAINST_SOMEONE', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_DENOUNCE%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_ASQ_PRETTYNOSE_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_ASQ_PRETTYNOSE_RESPONSE_TO_BEING_DENOUNCED%', 500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_INFLUENTIAL_ON_AI', 'TXT_KEY_LEADER_ASQ_PRETTYNOSE_INFLUENTIAL_ON_AI%', 500),
		('LEADER_ASQ_PRETTYNOSE',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 'TXT_KEY_LEADER_ASQ_PRETTYNOSE_INFLUENTIAL_ON_HUMAN%', 500)
		;

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,				UnitType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'UNITCLASS_KNIGHT',	'UNIT_ASQ_BENIIINEN');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_ASQ_ARAPAHO',	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_ASQ_TRAVOIS');

-----

INSERT INTO UnitPromotions
		(Type, Description, Help, PortraitIndex, IconAtlas, Sound, CannotBeChosen, PediaType, PediaEntry,	IgnoreZOC)
VALUES	('PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC',	'TXT_KEY_PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC',	'TXT_KEY_PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC_HELP',	59,	'ABILITY_ATLAS',	'AS2D_IF_LEVELUP',	1,	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_ASQ_ARAPAHO_IGNORE_ZOC_HELP',	1);