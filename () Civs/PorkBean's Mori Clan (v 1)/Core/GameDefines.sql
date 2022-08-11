-- Game Defines for the Mori Clan by PorkBean
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations
		(Type,					Description,				ShortDescription,					Adjective,							Civilopedia,					CivilopediaTag,				DefaultPlayerColor,		ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	IconAtlas,				PortraitIndex,	AlphaIconAtlas,		SoundtrackTag,	MapImage,		DawnOfManQuote,						DawnOfManImage)
SELECT	'CIVILIZATION_PB_MORI',	'TXT_KEY_CIV_PB_MORI_DESC',	'TXT_KEY_CIV_PB_MORI_SHORT_DESC',	'TXT_KEY_CIV_PB_MORI_ADJECTIVE',	'TXT_KEY_PEDIA_PB_MORI_TEXT',	'TXT_KEY_PEDIA_PB_MORI',	'PLAYERCOLOR_PB_MORI',	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	'PB_MORI_ICON_ATLAS',	0,				'MORI_ALPHA_ATLAS',	SoundtrackTag,	'Mori_Map.dds',	'TXT_KEY_CIV5_DAWN_PB_MORI_TEXT',	'Mori_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CityNames
		(CivilizationType,			CityName)
VALUES	('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_1'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_2'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_3'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_4'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_5'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_6'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_7'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_8'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_9'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_10'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_11'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_12'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_13'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_14'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_15'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_16'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_17'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_18'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_19'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_20'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_21'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_22'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_23'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_24'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_25'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_26'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_27'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_28'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_29'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_30'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_31'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_32'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_33'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_34'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_35'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_36'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_37'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_38'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_39'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_CITY_NAME_PB_MORI_40');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,		BuildingClassType)
SELECT	'CIVILIZATION_PB_MORI',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeTechs
		(CivilizationType,		TechType)
SELECT	'CIVILIZATION_PB_MORI',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeUnits
		(CivilizationType,		UnitClassType,	Count,	UnitAIType)
SELECT	'CIVILIZATION_PB_MORI',	UnitClassType,	Count,	UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_JAPAN';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_PB_MORI',	'LEADER_PB_MORI_MOTONARI');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,				BuildingType)
VALUES	('CIVILIZATION_PB_MORI',	'BUILDINGCLASS_AMPHITHEATER',	'BUILDING_PB_HAGIYAKI');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType,			UnitType)
VALUES	('CIVILIZATION_PB_MORI',	'UNITCLASS_CARAVEL',	'UNIT_PB_MURAKAMI_KOBAYA');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_PB_MORI',	'RELIGION_BUDDHISM');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,			StartAlongOcean)
VALUES	('CIVILIZATION_PB_MORI',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_1'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_2'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_3'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_4'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_5'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_6'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_7'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_8'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_9'),
		('CIVILIZATION_PB_MORI',	'TXT_KEY_SPY_NAME_PB_MORI_10');
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
		(Type,						Description,						Civilopedia,									CivilopediaTag,								ArtDefineTag,			VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	IconAtlas,				PortraitIndex)
VALUES	('LEADER_PB_MORI_MOTONARI',	'TXT_KEY_LEADER_PB_MORI_MOTONARI',	'TXT_KEY_LEADER_PB_MORI_MOTONARI_PEDIA_TEXT',	'TXT_KEY_LEADER_PB_MORI_MOTONARI_PEDIA',	'scene_motonari.xml',	9,						7,						7,							6,			7,				5,				7,						3,				3,			5,			5,				5,			7,			'PB_MORI_ICON_ATLAS',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,					MajorCivApproachType,				Bias)
VALUES	('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_WAR',			7),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_HOSTILE',		8),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_DECEPTIVE',		5),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_GUARDED',		5),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_AFRAID',		4),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_FRIENDLY',		4),
		('LEADER_PB_MORI_MOTONARI',		'MAJOR_CIV_APPROACH_NEUTRAL',		5);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_MinorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,					MinorCivApproachType,				Bias)
VALUES	('LEADER_PB_MORI_MOTONARI',		'MINOR_CIV_APPROACH_IGNORE',		7),
		('LEADER_PB_MORI_MOTONARI',		'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_PB_MORI_MOTONARI',		'MINOR_CIV_APPROACH_PROTECTIVE',	5),
		('LEADER_PB_MORI_MOTONARI',		'MINOR_CIV_APPROACH_CONQUEST',		7),
		('LEADER_PB_MORI_MOTONARI',		'MINOR_CIV_APPROACH_BULLY',			8);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							Flavor)
VALUES	('LEADER_PB_MORI_MOTONARI',		'FLAVOR_OFFENSE',					8),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_DEFENSE',					6),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_CITY_DEFENSE',				5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_MILITARY_TRAINING',			6),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_RECON',						4),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_RANGED',					9),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_MOBILE',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_NAVAL',						7),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_NAVAL_RECON',				5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_NAVAL_GROWTH',				5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_NAVAL_TILE_IMPROVEMENT',	9),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_AIR',						3),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_EXPANSION',					12),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_GROWTH',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_TILE_IMPROVEMENT',			5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_PRODUCTION',				8),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_GOLD',						4),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_SCIENCE',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_CULTURE',					7),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_HAPPINESS',					4),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_GREAT_PEOPLE',				7),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_WONDER',					6),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_RELIGION',					6),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_DIPLOMACY',					6),
		('LEADER_PB_MORI_MOTONARI',     'FLAVOR_SPACESHIP',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_WATER_CONNECTION',			5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_NUKE',						7),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_USE_NUKE',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_ESPIONAGE',					5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_ANTIAIR',					4),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_AIRLIFT',					3),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_ARCHAEOLOGY',				2),
		('LEADER_PB_MORI_MOTONARI',		'FLAVOR_AIR_CARRIER',				2);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Traits
		(LeaderType,					TraitType)
VALUES	('LEADER_PB_MORI_MOTONARI',		'TRAIT_PB_MIYAJIMA');
--==========================================================================================================================
-- TRAITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type,					Description,					ShortDescription)
VALUES	('TRAIT_PB_MIYAJIMA',	'TXT_KEY_TRAIT_PB_MIYAJIMA',	'TXT_KEY_TRAIT_PB_MIYAJIMA_SHORT');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type,						Description,						Civilopedia,							Strategy,									Help,									Requirements,	Combat,	RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves,		Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	DefaultUnitAI,			Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,				UnitFlagAtlas)
SELECT	'UNIT_PB_MURAKAMI_KOBAYA',	'TXT_KEY_UNIT_PB_MURAKAMI_KOBAYA',	'TXT_KEY_UNIT_PB_MURAKAMI_KOBAYA_TEXT',	'TXT_KEY_UNIT_PB_MURAKAMI_KOBAYA_STRATEGY',	'TXT_KEY_UNIT_PB_MURAKAMI_KOBAYA_HELP',	Requirements,	Combat,	RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly,	MoveAfterPurchase,	Moves-1,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,	CivilianAttackPriority,	'UNITAI_ATTACK_SEA',	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	'ART_DEF_UNIT_PB_MURAKAMI',	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	'BIPED',	0,					2,				'PB_MORI_ICON_ATLAS',	'MORI_MURAKAMI_FLAG'
FROM Units WHERE Type = 'UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType,					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PB_MURAKAMI_KOBAYA',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType,					UnitAIType)
SELECT	'UNIT_PB_MURAKAMI_KOBAYA',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_IRONCLAD';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType,					FlavorType, Flavor)
SELECT	'UNIT_PB_MURAKAMI_KOBAYA',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_IRONCLAD';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions
		(UnitType,					PromotionType)
VALUES	('UNIT_PB_MURAKAMI_KOBAYA',	'PROMOTION_EXTRA_SIGHT_I'),
		('UNIT_PB_MURAKAMI_KOBAYA',	'PROMOTION_STEAM_POWERED'),
		('UNIT_PB_MURAKAMI_KOBAYA',	'PROMOTION_PB_MURAKAMI_BASE');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType,					UnitClassType)
SELECT	'UNIT_PB_MURAKAMI_KOBAYA',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CARAVEL';
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
		(Type,							Description,							Help,										Sound,				CannotBeChosen,	LostWithUpgrade,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_PB_MURAKAMI_BASE',	'TXT_KEY_PROMOTION_PB_MURAKAMI_BASE',	'TXT_KEY_PROMOTION_PB_MURAKAMI_BASE_HELP',	'AS2D_IF_LEVELUP',	1,				0,					59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_BASE');

INSERT INTO UnitPromotions
		(Type,						Description,						Help,									Sound,				CannotBeChosen,	LostWithUpgrade,	CombatPercent,	PortraitIndex,	IconAtlas,			PediaType,			PediaEntry)
VALUES	('PROMOTION_PB_MURAKAMI_1',	'TXT_KEY_PROMOTION_PB_MURAKAMI_1',	'TXT_KEY_PROMOTION_PB_MURAKAMI_1_HELP',	'AS2D_IF_LEVELUP',	1,				1,					10,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_1'),
		('PROMOTION_PB_MURAKAMI_2',	'TXT_KEY_PROMOTION_PB_MURAKAMI_2',	'TXT_KEY_PROMOTION_PB_MURAKAMI_2_HELP',	'AS2D_IF_LEVELUP',	1,				1,					20,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_2'),
		('PROMOTION_PB_MURAKAMI_3',	'TXT_KEY_PROMOTION_PB_MURAKAMI_3',	'TXT_KEY_PROMOTION_PB_MURAKAMI_3_HELP',	'AS2D_IF_LEVELUP',	1,				1,					30,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_3'),
		('PROMOTION_PB_MURAKAMI_4',	'TXT_KEY_PROMOTION_PB_MURAKAMI_4',	'TXT_KEY_PROMOTION_PB_MURAKAMI_4_HELP',	'AS2D_IF_LEVELUP',	1,				1,					40,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_4'),
		('PROMOTION_PB_MURAKAMI_5',	'TXT_KEY_PROMOTION_PB_MURAKAMI_5',	'TXT_KEY_PROMOTION_PB_MURAKAMI_5_HELP',	'AS2D_IF_LEVELUP',	1,				1,					50,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_5'),
		('PROMOTION_PB_MURAKAMI_6',	'TXT_KEY_PROMOTION_PB_MURAKAMI_6',	'TXT_KEY_PROMOTION_PB_MURAKAMI_6_HELP',	'AS2D_IF_LEVELUP',	1,				1,					60,				59,				'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_PB_MURAKAMI_6');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
		(Type,									DefaultBuilding,					Description)
VALUES	('BUILDINGCLASS_PB_MORI_CULTURE_DUMMY',	'BUILDING_PB_MORI_CULTURE_DUMMY',	'TXT_KEY_BUILDING_PB_MORI_CULTURE_DUMMY');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type,					Description,					Civilopedia,							Strategy,									Help,									ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	NeverCapture,	NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,	GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	PortraitIndex,	WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	IconAtlas,				ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation)
SELECT	'BUILDING_PB_HAGIYAKI',	'TXT_KEY_BUILDING_PB_HAGIYAKI',	'TXT_KEY_BUILDING_PB_HAGIYAKI_TEXT',	'TXT_KEY_BUILDING_PB_HAGIYAKI_STRATEGY',	'TXT_KEY_BUILDING_PB_HAGIYAKI_HELP',	ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	1,				NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	ConquestProb,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,	GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	3,				WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	'PB_MORI_ICON_ATLAS',	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';

INSERT INTO Buildings		
		(Type,								BuildingClass,							Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	Description,								Help)
VALUES	('BUILDING_PB_MORI_CULTURE_DUMMY',	'BUILDINGCLASS_PB_MORI_CULTURE_DUMMY',	-1,		-1,			-1,				1,				'TXT_KEY_BUILDING_PB_MORI_CULTURE_DUMMY',	'TXT_KEY_BUILDING_PB_MORI_CULTURE_DUMMY_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors
		(BuildingType,			FlavorType,	Flavor)
SELECT	'BUILDING_PB_HAGIYAKI',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_AMPHITHEATER';
--------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType,				BuildingClassType)
VALUES	('BUILDING_PB_HAGIYAKI',	'BUILDINGCLASS_SHRINE'),
		('BUILDING_PB_HAGIYAKI',	'BUILDINGCLASS_MONUMENT');
--------------------------------------------------------------------------------------------------------------------------
-- Building_ResourceQuantity
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ResourceQuantity 	
		(BuildingType,				ResourceType,			Quantity)
VALUES	('BUILDING_PB_HAGIYAKI',	'RESOURCE_PORCELAIN',	1);
--------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_PB_MORI_CULTURE_DUMMY',	'YIELD_CULTURE',	1);