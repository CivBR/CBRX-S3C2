-------------------------------------------
--Unit (T-55)
-------------------------------------------
INSERT INTO Units
		(Type,			Description,			Civilopedia,						Strategy,							Help,							Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	Mechanized,	PrereqTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	UnitArtInfo,			ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,					UnitFlagAtlas)
SELECT	'UNIT_JWW_T55',	'TXT_KEY_UNIT_JWW_T55',	'TXT_KEY_CIV5_UNIT_JWW_T55_TEXT',	'TXT_KEY_UNIT_JWW_T55_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_T55',	Combat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,		DefaultUnitAI,		MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	Mechanized,	PrereqTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	'ART_DEF_UNIT_JWW_T55',	ShowInPedia,	MoveRate,	0,					2,				'JWW_ANGOLA_COLOR_ATLAS',	'JWW_ANGOLA_UNIT_ALPHA_ATLAS'
FROM Units WHERE Type = 'UNIT_TANK';

INSERT INTO UnitGameplay2DScripts
		(UnitType,			SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_T55',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_TANK';

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
SELECT	'UNIT_JWW_T55',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TANK';

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
SELECT	'UNIT_JWW_T55',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_TANK';

INSERT INTO Unit_ClassUpgrades
		(UnitType,			UnitClassType)
SELECT	'UNIT_JWW_T55',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_TANK';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	'UNIT_JWW_T55',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_TANK';

INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType,			ResourceType,	Cost)
SELECT	'UNIT_JWW_T55',	ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_TANK';

INSERT INTO UnitPromotions
		(Type,								Description,										Help,													Sound,				CombatPercent,	CannotBeChosen,	PortraitIndex,	IconAtlas,						PediaType,		PediaEntry)
VALUES	('PROMOTION_JWW_T55_RECLAIMED',		'TXT_KEY_PROMOTION_JWW_T55_RECLAIMED',				'TXT_KEY_PROMOTION_JWW_T55_RECLAIMED_HELP',				'AS2D_IF_LEVELUP',	0,				1,				5,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_JWW_T55_RECLAIMED'),
		('PROMOTION_JWW_T55_CAPTURED',		'TXT_KEY_PROMOTION_JWW_T55_CAPTURED',				'TXT_KEY_PROMOTION_JWW_T55_CAPTURED_HELP',				'AS2D_IF_LEVELUP',	25,				1,				5,				'EXPANSION2_PROMOTION_ATLAS',	'PEDIA_SHARED',	'TXT_KEY_PROMOTION_JWW_T55_CAPTURED');
-------------------------------------------
--Building (Diamang Mine)
-------------------------------------------
INSERT INTO Buildings
		(Type,							Description,							Civilopedia,									Strategy,										Help,										GoldMaintenance,	MutuallyExclusiveGroup,	NeverCapture,	NukeImmune,	Cost,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	ProhibitedCityTerrain,	PrereqTech,	PortraitIndex,	WonderSplashAnchor,	IconAtlas)
SELECT	'BUILDING_JWW_DIAMANG_MINE',	'TXT_KEY_BUILDING_JWW_DIAMANG_MINE',	'TXT_KEY_CIV5_BUILDINGS_JWW_DIAMANG_MINE_TEXT',	'TXT_KEY_BUILDING_JWW_DIAMANG_MINE_STRATEGY',	'TXT_KEY_BUILDING_JWW_DIAMANG_MINE_HELP',	GoldMaintenance,	MutuallyExclusiveGroup,	1,				NukeImmune,	Cost,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	0,						PrereqTech,	4,				WonderSplashAnchor,	'JWW_ANGOLA_COLOR_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_STONE_WORKS';

INSERT INTO Building_YieldChanges
		(BuildingType,				YieldType,	Yield)
SELECT	'BUILDING_JWW_DIAMANG_MINE',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_STONE_WORKS';

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					ResourceType,	YieldType,	Yield)
SELECT	'BUILDING_JWW_DIAMANG_MINE',	ResourceType,	YieldType,	Yield
FROM Building_ResourceYieldChanges WHERE BuildingType = 'BUILDING_STONE_WORKS';

INSERT INTO	Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_JWW_DIAMANG_MINE',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STONE_WORKS';

INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 							Description)
VALUES	('BUILDINGCLASS_JWW_DIAMANG_TRAIN_UNITS', 		'BUILDING_JWW_DIAMANG_TRAIN_UNITS', 		'TXT_KEY_JWW_DIAMANG_TRAIN_UNITS');

INSERT INTO Buildings      
        (TYPE,										BuildingClass,									Cost,  FaithCost, GreatWorkCount,  NeverCapture,  Description)
VALUES  ('BUILDING_JWW_DIAMANG_TRAIN_UNITS',		'BUILDINGCLASS_JWW_DIAMANG_TRAIN_UNITS',		-1,    -1,        -1,              0,            'TXT_KEY_JWW_DIAMANG_TRAIN_UNITS');

INSERT INTO Building_DomainProductionModifiers
		(BuildingType,							DomainType,		Modifier)
VALUES	('BUILDING_JWW_DIAMANG_TRAIN_UNITS',	'DOMAIN_LAND',	5),
		('BUILDING_JWW_DIAMANG_TRAIN_UNITS',	'DOMAIN_SEA',	5),
		('BUILDING_JWW_DIAMANG_TRAIN_UNITS',	'DOMAIN_AIR',	5);
-------------------------------------------
--Resource (Blood Diamonds)
-------------------------------------------
INSERT INTO Resources
		(Type,							Description,							Civilopedia,										Help,										ResourceClassType,		CivilizationType,			ArtDefineTag,				Happiness,	ResourceUsage,	IconString,							PortraitIndex,	IconAtlas)
VALUES	('RESOURCE_JWW_BLOOD_DIAMONDS',	'TXT_KEY_RESOURCE_JWW_BLOOD_DIAMONDS',	'TXT_KEY_CIV5_RESOURCE_JWW_BLOOD_DIAMONDS_TEXT',	'TXT_KEY_RESOURCE_JWW_BLOOD_DIAMONDS_HELP',	'RESOURCECLASS_LUXURY',	'CIVILIZATION_JWW_ANGOLA',	'ART_DEF_RESOURCE_GEMS',	4,			2,				'[ICON_RES_JWW_BLOOD_DIAMONDS]',	5,				'JWW_ANGOLA_COLOR_ATLAS');

INSERT INTO Resource_YieldChanges
		(ResourceType,					YieldType,		Yield)
VALUES	('RESOURCE_JWW_BLOOD_DIAMONDS',	'YIELD_GOLD',	1);

INSERT INTO Resource_Flavors
		(ResourceType,					FlavorType,			Flavor)
VALUES	('RESOURCE_JWW_BLOOD_DIAMONDS',	'FLAVOR_GOLD',		15);
-------------------------------------------
--Leader (Jonas Savimbi)
-------------------------------------------
INSERT INTO Leaders
		(Type,							Description,						Civilopedia,								CivilopediaTag,										ArtDefineTag,			VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',	'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI',	'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_JONAS_SAVIMBI',	'SasSavimbiScene.xml',	8,						1,						4,							9,			5,				6,				3,						9,						8,						7,				1,			7,			2,				7,			2,			0,				'JWW_ANGOLA_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,					MajorCivApproachType,			Bias)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_WAR',		6),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_HOSTILE',	5),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_GUARDED',	7),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_AFRAID',	1),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_FRIENDLY',	7),
		('LEADER_JWW_JONAS_SAVIMBI',	'MAJOR_CIV_APPROACH_NEUTRAL',	1);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,					MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',	'MINOR_CIV_APPROACH_IGNORE',		9),
		('LEADER_JWW_JONAS_SAVIMBI',	'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_JWW_JONAS_SAVIMBI',	'MINOR_CIV_APPROACH_PROTECTIVE',	1),
		('LEADER_JWW_JONAS_SAVIMBI',	'MINOR_CIV_APPROACH_CONQUEST',		6),
		('LEADER_JWW_JONAS_SAVIMBI',	'MINOR_CIV_APPROACH_BULLY',			5);

INSERT INTO	Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_OFFENSE',					9),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_DEFENSE',					2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_CITY_DEFENSE',				3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_MILITARY_TRAINING',			8),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_RECON',						6),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_RANGED',					7),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_MOBILE',					3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_NAVAL',						2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_NAVAL_RECON',				3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_NAVAL_GROWTH',				3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_AIR',						6),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_EXPANSION',					8),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_GROWTH',					2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_TILE_IMPROVEMENT',			7),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_INFRASTRUCTURE',			3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_PRODUCTION',				8),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_GOLD',						7),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_SCIENCE',					3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_CULTURE',					2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_HAPPINESS',					3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_GREAT_PEOPLE',				1),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_WONDER',					3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_RELIGION',					1),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_DIPLOMACY',					7),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_SPACESHIP',					3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_WATER_CONNECTION',			2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_NUKE',						3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_USE_NUKE',					9),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_ESPIONAGE',					10),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_ANTIAIR',					10),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_AIR_CARRIER',				2),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_ARCHAEOLOGY',				3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_I_LAND_TRADE_ROUTE',		7),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_I_SEA_TRADE_ROUTE',			3),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_I_TRADE_ORIGIN',			9),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_I_TRADE_DESTINATION',		4),
		('LEADER_JWW_JONAS_SAVIMBI',	'FLAVOR_AIRLIFT',					8);

INSERT INTO Leader_Traits
		(LeaderType,				TraitType)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',	'TRAIT_JWW_THREE_DAY_HALLOWEEN');
-------------------------------------------
--Trait (Three-Day Halloween)
-------------------------------------------
INSERT INTO Traits
		(Type,								Description,								ShortDescription)
VALUES	('TRAIT_JWW_THREE_DAY_HALLOWEEN',	'TXT_KEY_TRAIT_JWW_THREE_DAY_HALLOWEEN',	'TXT_KEY_TRAIT_JWW_THREE_DAY_HALLOWEEN_SHORT');
-------------------------------------------
--Diplomacy Responses
-------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,					ResponseType,									 Response,																	Bias)
VALUES	('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_ATTACKED_GENERIC%',						500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DEFEATED%',								500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_DOW_GENERIC',                          'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DOW_GENERIC%',							500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_EXPANSION_SERIOUS_WARNING',            'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_EXPANSION_SERIOUS_WARNING%',			500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_FIRSTGREETING%',						500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			   'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_GREETING_AT_WAR_HOSTILE%',				500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_GREETING_POLITE_HELLO',                'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_GREETING_POLITE_HELLO%',				500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_GREETING_NEUTRAL_HELLO',               'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_GREETING_NEUTRAL_HELLO%',				500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_GREETING_HOSTILE_HELLO',               'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_GREETING_HOSTILE_HELLO%',				500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_INFLUENTIAL_ON_AI',                    'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_INFLUENTIAL_ON_AI%',					500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_INFLUENTIAL_ON_HUMAN%',					500),	
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_LETS_HEAR_IT%',							500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_LUXURY_TRADE%',							500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_NO_PEACE%',								500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_OPEN_BORDERS_EXCHANGE%',				500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_LOSEWAR%',								500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_REPEAT_NO%',							500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_RESPONSE_REQUEST%',						500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		  'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_RESPONSE_TO_BEING_DENOUNCED%',			500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_TOO_SOON_NO_PEACE_1%',					500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_WINWAR%',								500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DENOUNCE%',								500),
		('LEADER_JWW_JONAS_SAVIMBI',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_JWW_JONAS_SAVIMBI_DEC_FRIENDSHIP%',						500);
-------------------------------------------
--Civilization (Angola)
-------------------------------------------
INSERT INTO Civilizations
		(Type,						Description,					CivilopediaTag,									Playable,	AIPlayable,		ShortDescription,						Adjective,							DefaultPlayerColor,				ArtDefineTag,					ArtStyleType,				ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,			IconAtlas,					AlphaIconAtlas,				MapImage,				DawnOfManQuote,								DawnOfManImage)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CIV_JWW_ANGOLA_DESC',	'TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_JWW_ANGOLA',	1,			1,				'TXT_KEY_CIV_JWW_ANGOLA_SHORT_DESC',	'TXT_KEY_CIV_JWW_ANGOLA_ADJECTIVE',	'PLAYERCOLOR_JWW_ANGOLA',		'ART_DEF_CIVILIZATION_ZULU',	'ARTSTYLE_MIDDLE_EAST',		'_AFRI',			'AFRICAN',			1,						'JWW_ANGOLA_COLOR_ATLAS',	'JWW_ANGOLA_ALPHA_ATLAS',	'JWWSavimbiMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_ANGOLA_TEXT',		'SasSavimbiDOM.dds');

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'LEADER_JWW_JONAS_SAVIMBI');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,				BuildingType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'BUILDINGCLASS_STONE_WORKS',	'BUILDING_JWW_DIAMANG_MINE');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,		UnitType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'UNITCLASS_TANK',	'UNIT_JWW_T55');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,			TechType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,			UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Start_Region_Avoid
		(CivilizationType,			RegionType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'REGION_TUNDRA');

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'RELIGION_CHRISTIANITY');

INSERT INTO	Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_0'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_1'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_2'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_3'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_4'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_5'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_6'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_7'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_8'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_9'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_10'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_11'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_12'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_13'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_14'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_15'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_16'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_17'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_18'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_19'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_20'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_21'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_22'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_23'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_24'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_25'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_26'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_27'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_28'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_29'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_30'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_31'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_32'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_33'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_34'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_35'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_36'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_37'),
		('CIVILIZATION_JWW_ANGOLA',	'TXT_KEY_CITY_NAME_JWW_ANGOLA_38');
		
INSERT INTO Civilization_SpyNames
		(CivilizationType,				SpyName)
VALUES	('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_0'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_1'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_2'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_3'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_4'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_5'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_6'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_7'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_8'),
		('CIVILIZATION_JWW_ANGOLA',		'TXT_KEY_SPY_NAME_JWW_ANGOLA_9');
--============================================	
--============================================
