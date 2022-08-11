--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_KILOSH',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_KILOSH', 'TXT_KEY_UNIT_SAS_KILOSH_HELP', 	 'TXT_KEY_UNIT_SAS_KILOSH_STRATEGY',  'TXT_KEY_UNIT_SAS_KILOSH_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_KILOSH',	 'SAS_KILOSH_FLAG',	0,					'SAS_MODOC_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_RIFLEMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_KILOSH',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_KILOSH',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_KILOSH',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_KILOSH',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_KILOSH',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_KILOSH', 'PROMOTION_SAS_KILOSH_PROMO');

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen,	RoughDefense, IconAtlas,  PortraitIndex,			CanMoveAfterAttacking,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_KILOSH_PROMO',	'TXT_KEY_PROMOTION_SAS_KILOSH_PROMO',	'TXT_KEY_PROMOTION_SAS_KILOSH_PROMO_HELP',	'AS2D_IF_LEVELUP', 	1,	'20',	'ABILITY_ATLAS', 				59,		1,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_KILOSH_PROMO_HELP');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				NoLimit,		Description)
VALUES	('BUILDINGCLASS_SAS_MODOC_DFENS1',	'BUILDING_SAS_MODOC_DFENS1',	1,	'TXT_KEY_BUILDING_SAS_MODOC_DFENS1'),
		('BUILDINGCLASS_SAS_MODOC_DFENS2',	'BUILDING_SAS_MODOC_DFENS2',	1,	'TXT_KEY_BUILDING_SAS_MODOC_DFENS2'),
		('BUILDINGCLASS_SAS_MODOC_FOOD',	'BUILDING_SAS_MODOC_FOOD',	1,	'TXT_KEY_IMPROVEMENT_SAS_MODOCFOOD'),
		('BUILDINGCLASS_SAS_MODOC_AIRLIFT',	'BUILDING_SAS_MODOC_AIRLIFT',	0,	'TXT_KEY_BUILDING_SAS_MODOC_AIRLIFT');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	Defense,	ExtraCityHitPoints,	Mountain,	Airlift,	NukeImmune,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_SAS_MODOC_DFENS1',	 'BUILDINGCLASS_SAS_MODOC_DFENS1',		-1, 			-1,		-1,	0,	'100',	'10',	0,	0,	1, 		null,		1,				'TXT_KEY_BUILDING_SAS_MODOC_DFENS1',	'TXT_KEY_BUILDING_SAS_MODOC_DFENS1'),
		('BUILDING_SAS_MODOC_DFENS2',	 'BUILDINGCLASS_SAS_MODOC_DFENS2',		-1, 			-1,		-1,	0,	'200',	'20',	0,	0,	1, 		null,		1,				'TXT_KEY_BUILDING_SAS_MODOC_DFENS2',	'TXT_KEY_BUILDING_SAS_MODOC_DFENS2'),
		('BUILDING_SAS_MODOC_FOOD',	 'BUILDINGCLASS_SAS_MODOC_FOOD',		-1, 			-1,		-1,	0,	0,	0,	0,	0,	1, 		null,		1,				'TXT_KEY_IMPROVEMENT_SAS_MODOCFOOD',	'TXT_KEY_IMPROVEMENT_SAS_MODOCFOOD'),
		('BUILDING_SAS_MODOC_AIRLIFT',	 'BUILDINGCLASS_SAS_MODOC_AIRLIFT',		-1, 			-1,		-1,	0,	0,	0,	1,	1,	1, 		null,		1,				'TXT_KEY_BUILDING_SAS_MODOC_AIRLIFT',	'TXT_KEY_BUILDING_SAS_MODOC_AIRLIFT');

INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,			Yield)
VALUES		('BUILDING_SAS_MODOC_FOOD', 	'YIELD_FOOD',	1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb,	GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance, Description, 							Civilopedia, 							Help, 										Strategy,				ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT		('BUILDING_SAS_PITHOUSE'),	HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb,	GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance, ('TXT_KEY_BUILDING_SAS_PITHOUSE'),	('TXT_KEY_BUILDING_SAS_PITHOUSE_PEDIA'),	('TXT_KEY_BUILDING_SAS_PITHOUSE_HELP'),	('TXT_KEY_BUILDING_SAS_PITHOUSE_STRATEGY'),	ArtDefineTag, 3, 				('SAS_MODOC_ICON_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';

UPDATE Buildings
SET	
	PrereqTech	= 	(SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER'), 
	Cost 		= 	(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER'), 
	FaithCost 	= 	(SELECT FaithCost FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER')
WHERE Type = 'BUILDING_SAS_PITHOUSE';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_SAS_PITHOUSE'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AMPHITHEATER';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_SAS_PITHOUSE'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_AMPHITHEATER';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_KINTPUASH',	 'TXT_KEY_LEADER_SAS_KINTPUASH',	'TXT_KEY_LEADER_SAS_KINTPUASH_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_KINTPUASH',	'Sas_Kintpuash_Scene.xml',	6, 						4, 						6, 							8, 			7, 				4, 				4, 						6, 				6, 			6, 			5, 				3, 			5, 			'SAS_MODOC_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_KINTPUASH',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_KINTPUASH',	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_SAS_KINTPUASH',	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_KINTPUASH',	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_SAS_KINTPUASH',	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_SAS_KINTPUASH',	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_KINTPUASH',	'FLAVOR_OFFENSE', 					6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_DEFENSE', 					8),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_CITY_DEFENSE', 				9),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_RECON', 					5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_RANGED', 					7),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_MOBILE', 					6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_NAVAL', 					6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_AIR', 						8),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_EXPANSION', 				6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_GROWTH', 					8),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_GOLD', 						6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_SCIENCE', 					6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_CULTURE', 					7),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_WONDER', 					5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_RELIGION', 					4),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_SPACESHIP', 				5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_NUKE', 						5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_USE_NUKE', 					5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_AIRLIFT', 					6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_I_TRADE_ORIGIN', 			6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_SAS_KINTPUASH',	'FLAVOR_AIR_CARRIER', 				2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_KINTPUASH',	'TRAIT_SAS_KINTPUASH');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription,	FreeBuilding)
VALUES	('TRAIT_SAS_KINTPUASH',  'TXT_KEY_TRAIT_SAS_KINTPUASH',	 'TXT_KEY_TRAIT_SAS_KINTPUASH_SHORT',	'BUILDING_SAS_MODOC_AIRLIFT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES	('LEADER_SAS_KINTPUASH',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_KINTPUASH_DEFEATED%', 						500),
		('LEADER_SAS_KINTPUASH',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_KINTPUASH_FIRSTGREETING%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_MODOC',		'Shoshone', 		'SasModoc412.dds',		'TXT_KEY_CIV_DAWN_SAS_MODOC_TEXT',	'Sas_Kintpuash_DOM.dds',	'TXT_KEY_CIV_SAS_MODOC_DESC', 	'TXT_KEY_CIV_SAS_MODOC_SHORT_DESC',	'TXT_KEY_CIV_SAS_MODOC_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_SAS_MODOC_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_SAS_MODOC',		'PLAYERCOLOR_SAS_MODOC',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_MODOC_ICON_ATLAS',	0,				'SAS_MODOC_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_0'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_1'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_2'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_3'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_4'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_5'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_6'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_7'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_8'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_SPY_NAME_CIV_SAS_MODOC_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_1'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_2'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_3'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_4'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_5'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_6'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_7'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_8'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_9'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_10'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_11'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_12'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_13'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_14'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_15'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_16'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_17'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_18'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_19'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_20'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_21'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_22'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_23'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_24'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_25'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_26'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_27'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_28'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_29'),
		('CIVILIZATION_SAS_MODOC',	'TXT_KEY_CITY_NAME_SAS_MODOC_30');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_MODOC', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_MODOC', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_MODOC', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_MODOC',	'LEADER_SAS_KINTPUASH');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_MODOC', 	'UNITCLASS_RIFLEMAN',			'UNIT_SAS_KILOSH');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_SAS_MODOC', 	'BUILDINGCLASS_AMPHITHEATER',	'BUILDING_SAS_PITHOUSE');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_SAS_MODOC',	'REGION_HILLS');