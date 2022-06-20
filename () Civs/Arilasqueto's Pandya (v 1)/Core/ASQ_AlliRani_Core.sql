
-----

--Leader

INSERT INTO Leaders
		(Type,					Description,						Civilopedia,							CivilopediaTag,					ArtDefineTag,							VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	PortraitIndex,	IconAtlas)
VALUES	('LEADER_ASQ_ALLIRANI',		'TXT_KEY_LEADER_ASQ_ALLIRANI',			'TXT_KEY_LEADER_ASQ_ALLIRANI_PEDIA',			'TXT_KEY_PEDIA_ASQ_ALLIRANI','AlliRani_Scene.xml',		8,						6,						4,							7,			4,				6,				6,						7,						5,						4,				5,			7,			4,				8,			4,			1,				'ATLAS_ASQ_ALLIRANI');

-----

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType,			MajorCivApproachType,			Bias)
VALUES	('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_WAR',		6),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_HOSTILE',	5),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_DECEPTIVE',	7),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_GUARDED',	6),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_FRIENDLY',	7),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_AFRAID',	3),
		('LEADER_ASQ_ALLIRANI',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);
		
-----

INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType,			MinorCivApproachType,				Bias)
VALUES	('LEADER_ASQ_ALLIRANI',	'MINOR_CIV_APPROACH_IGNORE',		4),
		('LEADER_ASQ_ALLIRANI',	'MINOR_CIV_APPROACH_FRIENDLY',		8),
		('LEADER_ASQ_ALLIRANI',	'MINOR_CIV_APPROACH_PROTECTIVE',	6),
		('LEADER_ASQ_ALLIRANI',	'MINOR_CIV_APPROACH_CONQUEST',		3),
		('LEADER_ASQ_ALLIRANI',	'MINOR_CIV_APPROACH_BULLY',			2);
		
-----

INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType,							Flavor)
VALUES	('LEADER_ASQ_ALLIRANI',	'FLAVOR_OFFENSE',					7),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_DEFENSE',					7),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_CITY_DEFENSE',				4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_MILITARY_TRAINING',			5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_RECON',						6),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_RANGED',					5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_MOBILE',					5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_NAVAL',						11),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_NAVAL_RECON',				5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_NAVAL_GROWTH',				8),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	7),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_AIR',						4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_EXPANSION',					8),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_GROWTH',					9),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_TILE_IMPROVEMENT',			4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_PRODUCTION',				6),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_GOLD',						5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_SCIENCE',					12),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_CULTURE',					5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_HAPPINESS',					8),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_GREAT_PEOPLE',				9),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_WONDER',					4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_RELIGION',					3),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_DIPLOMACY',					6),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_SPACESHIP',					7),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_WATER_CONNECTION',			6),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_NUKE',						3),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_USE_NUKE',					5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_ESPIONAGE',					3),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_ANTIAIR',					4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_AIR_CARRIER',				4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_I_SEA_TRADE_ROUTE',			9),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_ARCHAEOLOGY',				4),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_ASQ_ALLIRANI',	'FLAVOR_AIRLIFT',					4);
		
-----

INSERT INTO Traits
		(Type,					Description,				ShortDescription)
VALUES	('TRAIT_ASQ_ALLIRANI',	'TXT_KEY_TRAIT_ASQ_ALLIRANI',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT');

-----

INSERT INTO Leader_Traits
		(LeaderType,			TraitType)
VALUES	('LEADER_ASQ_ALLIRANI',	'TRAIT_ASQ_ALLIRANI');

--Civilization

INSERT INTO Civilizations
		(Type,						Description,							CivilopediaTag,				ShortDescription,						Adjective,								DefaultPlayerColor,		ArtDefineTag,			ArtStyleType,			ArtStyleSuffix,	ArtStylePrefix,		PortraitIndex,	IconAtlas,			AlphaIconAtlas,			MapImage,		DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA',		'TXT_KEY_PEDIA_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SHORT',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_ADJ',	'PLAYERCOLOR_ASQ_SANGAMPANDYA',	'ART_DEF_ASQ_SANGAMPANDYA',		'ARTSTYLE_ASIAN',		'_ASIA',		'ASIAN',			0,				'ATLAS_ASQ_ALLIRANI',	'ALPHA_ASQ_SANGAMPANDYA',		'AlliRaniMap.dds',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_DOM',	'allirani DoM.dds'
FROM Civilizations WHERE (Type = 'CIVILIZATION_INDIA');

-----


INSERT INTO Civilization_CityNames
		(CivilizationType,				CityName)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_1'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_2'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_3'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_4'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_5'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_6'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_7'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_8'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_9'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_10'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_11'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_12'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_13'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_14'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_15'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_16'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_17'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_18'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_19'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_CITY_20')
		;


--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_ASQ_ALLIRANI',	'RESPONSE_FIRST_GREETING', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_FIRSTGREETING%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_DEFEATED', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_DEFEATED%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_DOW_GENERIC', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_DOW_GENERIC%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_ATTACKED_HOSTILE%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_WORK_WITH_US', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_DEC_FRIENDSHIP%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_WORK_AGAINST_SOMEONE', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_DENOUNCE%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_ASQ_ALLIRANI_DENOUNCE_FRIEND%', 			 				500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_ASQ_ALLIRANI_RESPONSE_TO_BEING_DENOUNCED%', 500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_INFLUENTIAL_ON_AI', 'TXT_KEY_LEADER_ASQ_ALLIRANI_INFLUENTIAL_ON_AI%', 500),
		('LEADER_ASQ_ALLIRANI',	'RESPONSE_INFLUENTIAL_ON_HUMAN', 'TXT_KEY_LEADER_ASQ_ALLIRANI_INFLUENTIAL_ON_HUMAN%', 500)
		;

--Units

INSERT INTO Units
		(Type,					Description,					Civilopedia,							Strategy,									Help,									Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	PortraitIndex,	IconAtlas,			UnitFlagIconOffset,	UnitFlagAtlas,	UnitArtInfo,	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech)
SELECT	'UNIT_ASQ_MARAVAL',	'TXT_KEY_UNIT_ASQ_MARAVAL',	'TXT_KEY_UNIT_ASQ_MARAVAL_PEDIA',		'TXT_KEY_UNIT_ASQ_MARAVAL_STRATEGY',		'TXT_KEY_UNIT_ASQ_MARAVAL_HELP',		Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Special,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	Mechanized,	MinAreaSize,	MoveRate,	2,				'ATLAS_ASQ_ALLIRANI',	0,					'ALPHA_ASQ_MARAVAL',	'ART_DEF_UNIT_ASQ_MARAVAL',	XPValueAttack,	XPValueDefense,	CombatLimit,	PrereqTech,	ObsoleteTech
FROM Units WHERE (Type = 'UNIT_SPEARMAN');

-----

INSERT INTO Unit_ClassUpgrades
		(UnitType,			UnitClassType)
SELECT	'UNIT_ASQ_MARAVAL',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SPEARMAN');

-----

INSERT INTO Unit_Flavors
		(UnitType,
						FlavorType,	Flavor)
SELECT	'UNIT_ASQ_MARAVAL',	FlavorType,	Flavor + 3
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SPEARMAN');

-----

INSERT INTO UnitPromotions 
		(Type, 								Description, 							Help, 									Sound, 				OrderPriority,	RangedSupportFire,	LostWithUpgrade,	PortraitIndex,	IconAtlas, 			PediaType, 		PediaEntry)
VALUES	('PROMOTION_ASQ_MARAVAL',			'TXT_KEY_PROMOTION_ASQ_MARAVAL',		'TXT_KEY_PROMOTION_ASQ_MARAVAL_HELP',	'AS2D_IF_LEVELUP', 	1, 				1,				1, 				34,				'ABILITY_ATLAS',	'PEDIA_MELEE',  'TXT_KEY_PROMOTION_ASQ_MARAVAL');

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_ASQ_MARAVAL',	'PROMOTION_ASQ_MARAVAL'),
		('UNIT_ASQ_MARAVAL',	'PROMOTION_AMPHIBIOUS');

--Buildings

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,										Strategy,										Help,										Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas)
SELECT	'BUILDING_ASQ_PEARL_FISHERY',	'TXT_KEY_BUILDING_ASQ_PEARL_FISHERY',	'TXT_KEY_BUILDING_ASQ_PEARL_FISHERY_PEDIA',	'TXT_KEY_BUILDING_ASQ_PEARL_FISHERY_STRATEGY',	'TXT_KEY_BUILDING_ASQ_PEARL_FISHERY_HELP',	Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	3,				'ATLAS_ASQ_ALLIRANI'
FROM Buildings WHERE (Type = 'BUILDING_LIGHTHOUSE');

INSERT INTO Buildings 	
		(Type, 						 	BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description, 						Help,										GreatPeopleRateModifier)
VALUES	('BUILDING_ASQ_PANDYA_GP', 'BUILDINGCLASS_ASQ_PANDYA_GP',			-1, 			-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_ASQ_PANDYA_GP', 	'TXT_KEY_BUILDING_ASQ_PANDYA_GP_HELP',			5);	

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_ASQ_PANDYA_GP',		'BUILDING_ASQ_PANDYA_GP',	'TXT_KEY_BUILDING_ASQ_PANDYA_GP');

-----

INSERT INTO Building_YieldChanges
		(BuildingType,		YieldType,	Yield)
SELECT	'BUILDING_ASQ_PEARL_FISHERY',	YieldType,	Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_LIGHTOUSE');

-----

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,	Flavor)
SELECT	'BUILDING_ASQ_PEARL_FISHERY',	FlavorType,	Flavor + 5
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_LIGHTHOUSE');
		
--Defines

INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ASQ_SANGAMPANDYA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_INDIA';
-----

INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_ASQ_SANGAMPANDYA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_INDIA';

-----

INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_ASQ_SANGAMPANDYA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_INDIA';

-----

INSERT INTO Civilization_Leaders
		(CivilizationType,			LeaderheadType)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'LEADER_ASQ_ALLIRANI');

-----

INSERT INTO Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'RELIGION_HINDUISM');

-----

INSERT INTO Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_1'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_2'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_3'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_4'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_5'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_6'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_7'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_8'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_9'),
		('CIVILIZATION_ASQ_SANGAMPANDYA',	'TXT_KEY_CIVILIZATION_ASQ_SANGAMPANDYA_SPY_10');

-----

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType,				UnitClassType,					UnitType)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'UNITCLASS_SPEARMAN',	'UNIT_ASQ_MARAVAL');

-----

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,				BuildingClassType,			BuildingType)
VALUES	('CIVILIZATION_ASQ_SANGAMPANDYA',	'BUILDINGCLASS_LIGHTHOUSE',	'BUILDING_ASQ_PEARL_FISHERY');

-- C15

INSERT INTO Policies
		(Type,			Description)
VALUES	('POLICY_ASQ_PANDYA_DEFAULT',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_SCIENCE',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_ADMIRAL',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_WRITER',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_MUSICIAN',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_MERCHANT',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_GENERAL',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_PROPHET',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('POLICY_ASQ_PANDYA_ENGINEE',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT');

INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,					ImprovementType,			YieldType,			Yield)
VALUES	('POLICY_ASQ_PANDYA_SCIENCE',	'IMPROVEMENT_ACADEMY',		'YIELD_SCIENCE',	2),
		('POLICY_ASQ_PANDYA_ENGINEE',	'IMPROVEMENT_MANUFACTORY',	'YIELD_SCIENCE',	2);

INSERT INTO BuildingClasses
		(DefaultBuilding,				Type,									Description)
VALUES	('BUILDING_ASQ_PANDYA_ENGINEER',	'BUILDINGCLASS_ASQ_PANDYA_ENGINGEER',	'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('BUILDING_ASQ_PANDYA_ARTIST',	'BUILDINGCLASS_ASQ_PANDYA_ARTIST',		'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('BUILDING_ASQ_PANDYA_MUSIC',	'BUILDINGCLASS_ASQ_PANDYA_MUSIC',		'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('BUILDING_ASQ_PANDYA_MERCH',	'BUILDINGCLASS_ASQ_PANDYA_MERCH',		'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT'),
		('BUILDING_ASQ_PANDYA_PROPH',	'BUILDINGCLASS_ASQ_PANDYA_PROPH',		'TXT_KEY_TRAIT_ASQ_ALLIRANI_SHORT');

INSERT INTO Buildings
		(Type,							BuildingClass,							Description,							Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	NeverCapture,	NukeImmune,	IconAtlas,	PortraitIndex)
SELECT	DefaultBuilding,				Type,									Description,							-1,		-1,			-1,				NULL,		1,				1,			'BW_ATLAS_1',	13
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_ASQ_PANDYA_ENGINGEER', 'BUILDINGCLASS_ASQ_PANDYA_ARTIST', 'BUILDINGCLASS_ASQ_PANDYA_MUSIC', 'BUILDINGCLASS_ASQ_PANDYA_MERCH', 'BUILDINGCLASS_ASQ_PANDYA_PROPH');

INSERT INTO Building_YieldChanges
		(BuildingType,	YieldType,	Yield)
SELECT	Type,			'YIELD_SCIENCE',	1
FROM Buildings WHERE Type IN ('BUILDING_ASQ_PANDYA_ARTIST',	'BUILDING_ASQ_PANDYA_MUSIC', 'BUILDING_ASQ_PANDYA_MERCH');

INSERT INTO Building_YieldChangesPerPop
		(BuildingType,					YieldType,		Yield)
VALUES	('BUILDING_ASQ_PANDYA_PROPH',	'YIELD_SCIENCE',	25);

INSERT INTO Building_ResourceYieldChanges
		(BuildingType,					YieldType,		Yield,	ResourceType)
SELECT	'BUILDING_ASQ_PANDYA_ENGINEER',	'YIELD_SCIENCE',	1,		Type
FROM Resources WHERE ResourceUsage = 1;

-- Fuck you write your own trigger
