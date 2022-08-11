-------------------------------------------
--Unit (Ederman)
-------------------------------------------
INSERT INTO Units
		(Type,				Description,				Civilopedia,							Strategy,								Help,								Combat,		RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	PrereqTech,				ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	UnitArtInfo,				UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,						UnitFlagAtlas)
SELECT	'UNIT_JWW_EDERMAN',	'TXT_KEY_UNIT_JWW_EDERMAN',	'TXT_KEY_CIV5_UNIT_JWW_EDERMAN_TEXT',	'TXT_KEY_UNIT_JWW_EDERMAN_STRATEGY',	'TXT_KEY_UNIT_HELP_JWW_EDERMAN',	Combat-7,	RangedCombat, Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	PurchaseOnly, MoveAfterPurchase,	Moves,	Immobile,	Range,	BaseSightRange,	Class,	Special,	Capture,	CombatClass,	Domain,		CivilianAttackPriority,	DefaultUnitAI,	Food,	NoBadGoodies,	RivalTerritory,	MilitarySupport,	MilitaryProduction,	Pillage,	PillagePrereqTech,	Found,	FoundAbroad,	CultureBombRadius,	GoldenAgeTurns,	FreePolicies,	OneShotTourism,	OneShotTourismPercentOthers,	IgnoreBuildingDefense,	PrereqResources,	Mechanized,	Suicide,	CaptureWhileEmbarked,	'TECH_REFRIGERATION',	ObsoleteTech,	GoodyHutUpgradeUnitClass,	HurryCostModifier,	AdvancedStartCost,	MinAreaSize,	AirInterceptRange,	AirUnitCap,	NukeDamageLevel,	WorkRate,	NumFreeTechs,	BaseBeakersTurnsToCount,	BaseCultureTurnsToCount,	RushBuilding,	BaseHurry,	HurryMultiplier,	BaseGold,	NumGoldPerEra,	SpreadReligion,	RemoveHeresy,	ReligionSpreads,	ReligiousStrength,	FoundReligion,	RequiresEnhancedReligion,	ProhibitsSpread,	CanBuyCityState,	CombatLimit,	RangeAttackOnlyInDomain,	RangeAttackIgnoreLOS,	Trade,	NumExoticGoods,	PolicyType,	RangedCombatLimit,	XPValueAttack,	XPValueDefense,	SpecialCargo,	DomainCargo,	Conscription,	ExtraMaintenanceCost,	NoMaintenance,	Unhappiness,	'ART_DEF_UNIT_JWW_EDERMAN',	UnitArtInfoCulturalVariation,	UnitArtInfoEraVariation,	ProjectPrereq,	SpaceshipProject,	LeaderPromotion,	LeaderExperience,	DontShowYields,	ShowInPedia,	MoveRate,	0,					2,			'JWW_TURKMENISTAN_COLOR_ATLAS',	'JWW_TURKMENISTAN_UNIT_ALPHA_ATLAS'
FROM Units WHERE Type = 'UNIT_MARINE';

INSERT INTO UnitGameplay2DScripts
		(UnitType,			SelectionSound,		FirstSelectionSound)
SELECT	'UNIT_JWW_EDERMAN',	SelectionSound,		FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_AITypes
		(UnitType,			UnitAIType)
SELECT	'UNIT_JWW_EDERMAN',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_Flavors
		(UnitType,			FlavorType,			Flavor)
SELECT	'UNIT_JWW_EDERMAN',	FlavorType,			Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_FreePromotions
		(UnitType,			PromotionType)
SELECT	'UNIT_JWW_EDERMAN',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_ProductionModifierBuildings
		(UnitType,				BuildingType, 							ProductionModifier)
VALUES	('UNIT_JWW_EDERMAN',	'BUILDING_JWW_EDERMAN_TRAIN_DUMMY',		150);

INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_JWW_EDERMAN_TRAIN_DUMMY', 	'BUILDING_JWW_EDERMAN_TRAIN_DUMMY', 	'TXT_KEY_BUILDING_JWW_EDERMAN_TRAIN_DUMMY'),
		('BUILDINGCLASS_JWW_EDERMAN_WLTK_DUMMY', 	'BUILDING_JWW_EDERMAN_WLTK_DUMMY', 		'TXT_KEY_BUILDING_JWW_EDERMAN_WLTK_DUMMY');

INSERT INTO Buildings		
		(Type, 									BuildingClass,								Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	GreatWorkSlotType,				Description)
VALUES	('BUILDING_JWW_EDERMAN_TRAIN_DUMMY',	'BUILDINGCLASS_JWW_EDERMAN_TRAIN_DUMMY',	-1,		-1,			-1,				1,				NULL,							'TXT_KEY_BUILDING_JWW_EDERMAN_TRAIN_DUMMY'),
		('BUILDING_JWW_EDERMAN_WLTK_DUMMY',		'BUILDINGCLASS_JWW_EDERMAN_WLTK_DUMMY',		-1,		-1,			1,				1,				'GREAT_WORK_SLOT_LITERATURE',	'TXT_KEY_BUILDING_JWW_EDERMAN_WLTK_DUMMY');
-------------------------------------------
--Building (Gas Pipeline)
-------------------------------------------
INSERT INTO Buildings
		(Type,							Description,							Civilopedia,									Strategy,										Help,										ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	NeverCapture,	NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	NoOccupiedUnhappiness,	WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,	GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	'TXT_KEY_BUILDING_JWW_GAS_PIPELINE',	'TXT_KEY_CIV5_BUILDINGS_JWW_GAS_PIPELINE_TEXT',	'TXT_KEY_BUILDING_JWW_GAS_PIPELINE_STRATEGY',	'TXT_KEY_BUILDING_JWW_GAS_PIPELINE_HELP',	ThemingBonusHelp,	Quote,	GoldMaintenance,	MutuallyExclusiveGroup,	TeamShare,	Water,	River,	FreshWater,	Mountain,	NearbyMountainRequired,	Hill,	Flat,	FoundsReligion,	IsReligious,	BorderObstacle,	PlayerBorderObstacle,	Capital,	GoldenAge,	MapCentering,	1,				NukeImmune,	AllowsWaterRoutes,	ExtraLuxuries,	DiplomaticVoting,	AffectSpiesNow,	NullifyInfluenceModifier,	Cost,	FaithCost,	LeagueCost,	UnlockedByBelief,	UnlockedByLeague,	HolyCity,	NumCityCostMod,	HurryCostModifier,	MinAreaSize,	CitiesPrereq,	LevelPrereq,	CultureRateModifier,	GlobalCultureRateModifier,	GreatPeopleRateModifier,	GlobalGreatPeopleRateModifier,	GreatGeneralRateModifier,	GreatPersonExpendGold,	GoldenAgeModifier,	UnitUpgradeCostMod,	Experience,	GlobalExperience,	FoodKept,	Airlift,	AirModifier,	NukeModifier,	NukeExplosionRand,	HealRateChange,	Happiness,	UnmoddedHappiness,	UnhappinessModifier,	HappinessPerCity,	HappinessPerXPolicies,	CityCountUnhappinessMod,	1,						WorkerSpeedModifier,	MilitaryProductionModifier,	SpaceProductionModifier,	GlobalSpaceProductionModifier,	BuildingProductionModifier,	WonderProductionModifier,	CityConnectionTradeRouteModifier,	CapturePlunderModifier,	PolicyCostModifier,	PlotCultureCostModifier,	GlobalPlotCultureCostModifier,	PlotBuyCostModifier,	GlobalPlotBuyCostModifier,	GlobalPopulationChange,	TechShare,	FreeTechs,	FreePolicies,	FreeGreatPeople,	MedianTechPercentChange,	Gold,	AllowsRangeStrike,	Espionage,	AllowsFoodTradeRoutes,	AllowsProductionTradeRoutes,	Defense,	ExtraCityHitPoints,	GlobalDefenseMod,	MinorFriendshipChange,	VictoryPoints,	ExtraMissionarySpreads,	ReligiousPressureModifier,	EspionageModifier,	GlobalEspionageModifier,	ExtraSpies,	SpyRankChange,	InstantSpyRankChange,	TradeRouteRecipientBonus,	TradeRouteTargetBonus,	NumTradeRouteBonus,	LandmarksTourismPercent,	InstantMilitaryIncrease,	GreatWorksTourismModifier,	XBuiltTriggersIdeologyChoice,	TradeRouteSeaDistanceModifier,	TradeRouteSeaGoldBonus,	TradeRouteLandDistanceModifier,	TradeRouteLandGoldBonus,	CityStateTradeRouteProductionModifier,	GreatScientistBeakerModifier,	BuildingClass,	ArtDefineTag,	NearbyTerrainRequired,	ProhibitedCityTerrain,	VictoryPrereq,	FreeStartEra,	MaxStartEra,	ObsoleteTech,	EnhancedYieldTech,	TechEnhancedTourism,	FreeBuilding,	FreeBuildingThisCity,	FreePromotion,	TrainedFreePromotion,	FreePromotionRemoved,	ReplacementBuildingClass,	PrereqTech,	PolicyBranchType,	SpecialistType,	SpecialistCount,	GreatWorkSlotType,	FreeGreatWork,	GreatWorkCount,	SpecialistExtraCulture,	GreatPeopleRateChange,	ExtraLeagueVotes,	CityWall,	DisplayPosition,	WonderSplashImage,	WonderSplashAnchor,	WonderSplashAudio,	ArtInfoCulturalVariation,	ArtInfoEraVariation,	ArtInfoRandomVariation,	4,				'JWW_TURKMENISTAN_COLOR_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FACTORY';

INSERT INTO Building_ClassesNeededInCity
		(BuildingType,					BuildingClassType)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_FACTORY';

INSERT INTO Building_YieldChanges
		(BuildingType,					YieldType,	Yield)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	YieldType,	Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_FACTORY';

INSERT INTO Building_YieldModifiers
		(BuildingType,					YieldType,	Yield)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	YieldType,	Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_FACTORY';

INSERT INTO	Building_Flavors
		(BuildingType,					FlavorType,	Flavor)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	FlavorType,	Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FACTORY';

INSERT INTO	Building_ResourceQuantityRequirements
		(BuildingType,					ResourceType,	Cost)
SELECT	'BUILDING_JWW_GAS_PIPELINE',	ResourceType,	Cost
FROM Building_ResourceQuantityRequirements WHERE BuildingType = 'BUILDING_FACTORY';
-------------------------------------------
--Leader (Saparmurat Niyazov)
-------------------------------------------
INSERT INTO Leaders
		(Type,								Description,								Civilopedia,									CivilopediaTag,											ArtDefineTag,			VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',	'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV',	'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_JWW_SAPARMURAT_NIYAZOV',	'JWWNiyazovScene.xml',	4,						6,						3,							7,			5,				7,				5,						4,						7,						3,				5,			3,			4,				7,			5,			0,				'JWW_TURKMENISTAN_COLOR_ATLAS');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,				MajorCivApproachType,			Bias)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_WAR',		2),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_HOSTILE',	2),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_DECEPTIVE',	5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_GUARDED',	5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_AFRAID',	7),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_FRIENDLY',	4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MAJOR_CIV_APPROACH_NEUTRAL',	10);

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,				MinorCivApproachType,				Bias)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MINOR_CIV_APPROACH_IGNORE',		9),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MINOR_CIV_APPROACH_FRIENDLY',		3),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MINOR_CIV_APPROACH_PROTECTIVE',	1),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MINOR_CIV_APPROACH_CONQUEST',		1),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'MINOR_CIV_APPROACH_BULLY',			1);

INSERT INTO	Leader_Flavors
		(LeaderType,						FlavorType,							Flavor)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_OFFENSE',					4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_DEFENSE',					5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_CITY_DEFENSE',				4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_MILITARY_TRAINING',			6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_RECON',						8),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_RANGED',					2),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_MOBILE',					4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_NAVAL',						5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_NAVAL_RECON',				5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_NAVAL_GROWTH',				6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	7),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_AIR',						7),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_EXPANSION',					4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_GROWTH',					6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_TILE_IMPROVEMENT',			8),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_INFRASTRUCTURE',			9),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_PRODUCTION',				8),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_GOLD',						4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_SCIENCE',					2),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_CULTURE',					8),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_HAPPINESS',					6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_GREAT_PEOPLE',				8),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_WONDER',					9),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_RELIGION',					6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_DIPLOMACY',					4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_SPACESHIP',					4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_WATER_CONNECTION',			4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_NUKE',						6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_USE_NUKE',					5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_ESPIONAGE',					9),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_ANTIAIR',					6),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_ARCHAEOLOGY',				3),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_I_TRADE_ORIGIN',			9),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_I_TRADE_DESTINATION',		3),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',	'FLAVOR_AIRLIFT',					5);

INSERT INTO Leader_Traits
		(LeaderType,						TraitType)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',	'TRAIT_JWW_RUHNAMA');
-------------------------------------------
--Trait (Ruhnama)
-------------------------------------------
INSERT INTO Traits
		(Type,					Description,					ShortDescription)
VALUES	('TRAIT_JWW_RUHNAMA',	'TXT_KEY_TRAIT_JWW_RUHNAMA',	'TXT_KEY_TRAIT_JWW_RUHNAMA_SHORT');

INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_JWW_TURKMEN_UA_DUMMY', 	'BUILDING_JWW_TURKMEN_UA_DUMMY', 		'TXT_KEY_BUILDING_JWW_TURKMEN_UA_DUMMY');

INSERT INTO Buildings		
		(Type, 									BuildingClass,								Cost,	FaithCost,	GreatWorkCount,	NeverCapture,	Description)
VALUES	('BUILDING_JWW_TURKMEN_UA_DUMMY',		'BUILDINGCLASS_JWW_TURKMEN_UA_DUMMY',		-1,		-1,			-1,				1,				'TXT_KEY_BUILDING_JWW_TURKMEN_UA_DUMMY');
-------------------------------------------
--Great Work (Ruhnama)
-------------------------------------------
INSERT INTO Unit_UniqueNames
		(UnitType,		UniqueName,											GreatWorkType)
VALUES	('UNIT_WRITER',	'TXT_KEY_GREAT_PERSON_JWW_SAPARMURAT_TURKMENBASHY',	'GREAT_WORK_JWW_RUHNAMA');

INSERT INTO GreatWorks
		(Type,						Description,						GreatWorkClassType,			Image,							Quote)
VALUES	('GREAT_WORK_JWW_RUHNAMA',	'TXT_KEY_GREAT_WORK_JWW_RUHNAMA',	'GREAT_WORK_LITERATURE',	'GreatWriter_Background.dds',	'TXT_KEY_GREAT_WORK_QUOTE_JWW_RUHNAMA');
-------------------------------------------
--Diplomacy Responses
-------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType,						  ResponseType,									   Response,																		Bias)
VALUES	('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_ATTACKED_HOSTILE',                     'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_ATTACKED_GENERIC%',						500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_DEFEATED',                             'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_DEFEATED%',								500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_DOW_GENERIC',                          'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_DOW_GENERIC%',							500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_EXPANSION_SERIOUS_WARNING',            'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_EXPANSION_SERIOUS_WARNING%',				500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_FIRST_GREETING',                       'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_FIRSTGREETING%',							500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_GREETING_AT_WAR_HOSTILE',			   'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_GREETING_AT_WAR_HOSTILE%',				500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_GREETING_POLITE_HELLO',                'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_GREETING_POLITE_HELLO%',					500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_GREETING_NEUTRAL_HELLO',               'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_GREETING_NEUTRAL_HELLO%',					500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_GREETING_HOSTILE_HELLO',               'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_GREETING_HOSTILE_HELLO%',					500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING',  'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_HOSTILE_AGGRESSIVE_MILITARY_WARNING%',	500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_INFLUENTIAL_ON_AI',                    'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_INFLUENTIAL_ON_AI%',						500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_INFLUENTIAL_ON_HUMAN',                 'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_INFLUENTIAL_ON_HUMAN%',					500),	
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_LETS_HEAR_IT',                         'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_LETS_HEAR_IT%',							500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_LUXURY_TRADE',                         'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_LUXURY_TRADE%',							500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_NO_PEACE',                             'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_NO_PEACE%',								500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_OPEN_BORDERS_EXCHANGE',                'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_OPEN_BORDERS_EXCHANGE%',					500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS',         'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_LOSEWAR%',								500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_REPEAT_NO',                            'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_REPEAT_NO%',								500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_RESPONSE_REQUEST',                     'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_RESPONSE_REQUEST%',						500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		   'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_RESPONSE_TO_BEING_DENOUNCED%',			500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_TOO_SOON_NO_PEACE',                    'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_TOO_SOON_NO_PEACE_1%',					500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_WINNER_PEACE_OFFER',                   'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_WINWAR%',									500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_WORK_AGAINST_SOMEONE',                 'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_DENOUNCE%',								500),
		('LEADER_JWW_SAPARMURAT_NIYAZOV',     'RESPONSE_WORK_WITH_US',                         'TXT_KEY_LEADER_JWW_SAPARMURAT_NIYAZOV_DEC_FRIENDSHIP%',							500);
-------------------------------------------
--Civilization (Turkmenistan)
-------------------------------------------
INSERT INTO Civilizations
		(Type,								Description,							CivilopediaTag,							Playable,	AIPlayable,		ShortDescription,								Adjective,									DefaultPlayerColor,					ArtDefineTag,					ArtStyleType,				ArtStyleSuffix,		ArtStylePrefix,		PortraitIndex,		IconAtlas,						AlphaIconAtlas,					MapImage,					DawnOfManQuote,								DawnOfManImage)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CIV_JWW_TURKMENISTAN_DESC',	'TXT_KEY_CIV5_JWW_TURKMENISTAN',		1,			1,				'TXT_KEY_CIV_JWW_TURKMENISTAN_SHORT_DESC',		'TXT_KEY_CIV_JWW_TURKMENISTAN_ADJECTIVE',	'PLAYERCOLOR_JWW_TURKMENISTAN',		'ART_DEF_CIVILIZATION_RUSSIA',	'ARTSTYLE_MIDDLE_EAST',		'_AFRI',			'AFRICAN',			1,					'JWW_TURKMENISTAN_COLOR_ATLAS',	'JWW_TURKMENISTAN_ALPHA_ATLAS',	'JWWTurkmenistanMap.dds',	'TXT_KEY_CIV5_DAWN_JWW_TURKMENISTAN_TEXT',	'JWWNiyazovDoM.dds');

INSERT INTO Civilization_Leaders
		(CivilizationType,					LeaderheadType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'LEADER_JWW_SAPARMURAT_NIYAZOV');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,					BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'BUILDINGCLASS_FACTORY',	'BUILDING_JWW_GAS_PIPELINE');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,					UnitClassType,		UnitType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'UNITCLASS_MARINE',	'UNIT_JWW_EDERMAN');

INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType,					BuildingClassType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'BUILDINGCLASS_PALACE');

INSERT INTO Civilization_FreeTechs
		(CivilizationType,					TechType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'TECH_AGRICULTURE');

INSERT INTO Civilization_FreeUnits
		(CivilizationType,					UnitClassType,			UnitAIType,			Count)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

INSERT INTO Civilization_Start_Region_Priority
		(CivilizationType,					RegionType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'REGION_DESERT');

INSERT INTO Civilization_Religions
		(CivilizationType,					ReligionType)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'RELIGION_ISLAM');

INSERT INTO	Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_0'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_1'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_2'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_3'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_4'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_5'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_6'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_7'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_8'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_9'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_10'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_11'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_12'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_13'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_14'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_15'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_16'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_17'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_18'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_19'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_20'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_21'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_22'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_23'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_24'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_25'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_26'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_27'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_28'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_29'),
		('CIVILIZATION_JWW_TURKMENISTAN',	'TXT_KEY_CITY_NAME_JWW_TURKMENISTAN_30');
		
INSERT INTO Civilization_SpyNames
		(CivilizationType,						SpyName)
VALUES	('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_0'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_1'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_2'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_3'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_4'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_5'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_6'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_7'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_8'),
		('CIVILIZATION_JWW_TURKMENISTAN',		'TXT_KEY_SPY_NAME_JWW_TURKMENISTAN_9');
--============================================	
--============================================
