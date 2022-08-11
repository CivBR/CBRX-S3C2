--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
INSERT INTO Builds 	
		(Type, 									ImprovementType, Description, Help, Kill, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas)
SELECT	('BUILD_GPUZ_KAYAPO_CUSTOMS_HOUSE'),	ImprovementType, Description, Help, Kill, EntityEvent, HotKey, OrderPriority, IconIndex, IconAtlas
FROM Builds WHERE Type = 'BUILD_CUSTOMS_HOUSE';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, OneShotTourism, OneShotTourismPercentOthers, BaseGold, NumGoldPerEra, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, MoveAfterPurchase, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	('UNIT_GPUZ_BENADIORO'),	Class, OneShotTourism, OneShotTourismPercentOthers, BaseGold, NumGoldPerEra, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, MoveAfterPurchase, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_GPUZ_BENADIORO',	'TXT_KEY_UNIT_GPUZ_BENADIORO_TEXT',	'TXT_KEY_UNIT_GPUZ_BENADIORO_STRATEGY',	'TXT_KEY_UNIT_GPUZ_BENADIORO_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, 'ART_DEF_UNIT_GPUZ_BENADIORO',	0,					'GPUZ_RAONI_UNIT_FLAG_ATLAS',	2, 				'GPUZ_RAONI_ICON_ATLAS', MoveRate
FROM Units WHERE Type = 'UNIT_MERCHANT';
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GPUZ_BENADIORO',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MERCHANT';
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GPUZ_BENADIORO',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MERCHANT';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,	Flavor)
SELECT	'UNIT_GPUZ_BENADIORO',	FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------	
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_GPUZ_BENADIORO', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------	
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
VALUES	('UNIT_GPUZ_BENADIORO', 	'BUILD_GPUZ_KAYAPO_CUSTOMS_HOUSE');
--==========================================================================================================================	
-- DUMMY BUILDINGS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_DUMMY_GPUZ_NEKREX',	'BUILDING_DUMMY_GPUZ_NEKREX',	'TXT_KEY_BUILDING_GPUZ_NEKREX');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 									BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	NeverCapture,	Description, 								Help)
VALUES	('BUILDING_DUMMY_GPUZ_NEKREX',			'BUILDINGCLASS_DUMMY_GPUZ_NEKREX',		-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_GPUZ_NEKREX',	'TXT_KEY_BUILDING_GPUZ_NEKREX'),
		('BUILDING_DUMMY_GPUZ_NEKREX_ECOLOGY',	'BUILDINGCLASS_DUMMY_GPUZ_NEKREX',		-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_GPUZ_NEKREX',	'TXT_KEY_BUILDING_GPUZ_NEKREX');
------------------------------------------------------------------------------------------------------------------------								
-- Building_FeatureYieldChanges																																	
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Building_FeatureYieldChanges
		(BuildingType,							FeatureType,		YieldType,			Yield)
VALUES	('BUILDING_DUMMY_GPUZ_NEKREX',			'FEATURE_JUNGLE',	'YIELD_CULTURE',	1),
		('BUILDING_DUMMY_GPUZ_NEKREX_ECOLOGY',	'FEATURE_JUNGLE',	'YIELD_CULTURE',	2);
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, PrereqTech, SpecialistType,		GreatPeopleRateChange,			Description, 					Civilopedia, 						Help, 								Strategy,								ArtDefineTag, 	MinAreaSize, NeverCapture, 	Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_GPUZ_UNCUA',	BuildingClass, Cost, PrereqTech, 'SPECIALIST_MERCHANT',	2,								'TXT_KEY_BUILDING_GPUZ_UNCUA',	'TXT_KEY_BUILDING_GPUZ_UNCUA_TEXT',	'TXT_KEY_BUILDING_GPUZ_UNCUA_HELP', 'TXT_KEY_BUILDING_GPUZ_UNCUA_STRATEGY',	ArtDefineTag,	MinAreaSize, 1, 			Espionage, EspionageModifier, HurryCostModifier, 3, 				'GPUZ_RAONI_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GRANARY';	
------------------------------	
-- Building_Flavors
------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_GPUZ_UNCUA',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GRANARY';
------------------------------	
-- Building_FeatureYieldChanges
------------------------------	
INSERT INTO Building_FeatureYieldChanges
		(BuildingType,			FeatureType,		YieldType,		Yield)
VALUES	('BUILDING_GPUZ_UNCUA',	'FEATURE_JUNGLE',	'YIELD_FOOD',	1),
		('BUILDING_GPUZ_UNCUA',	'FEATURE_MARSH',	'YIELD_FOOD',	1);

------------------------------	
-- Building_RiverPlotYieldChanges
------------------------------	
INSERT INTO Building_RiverPlotYieldChanges
		(BuildingType,			YieldType,		Yield)
VALUES	('BUILDING_GPUZ_UNCUA',	'YIELD_FOOD',	1);

------------------------------	
-- Building_LakePlotYieldChanges
------------------------------	
INSERT INTO Building_LakePlotYieldChanges
		(BuildingType,			YieldType,		Yield)
VALUES	('BUILDING_GPUZ_UNCUA',	'YIELD_FOOD',	1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders		
		(Type, 					Description, 					CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_GPUZ_RAONI',	'TXT_KEY_LEADER_GPUZ_RAONI',   	'TXT_KEY_CIVILOPEDIA_LEADERS_GPUZ_RAONI', 	'GPuz_Raoni_LS.xml',	5, 						2, 						3, 							12, 		9, 				10, 			10, 					2, 				12, 		12, 		2, 				12, 		3, 			'GPUZ_RAONI_ICON_ATLAS',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_WAR', 			2),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_GUARDED', 		9),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		12),
		('LEADER_GPUZ_RAONI', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 			Bias)
VALUES	('LEADER_GPUZ_RAONI', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GPUZ_RAONI', 		'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_GPUZ_RAONI', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
		('LEADER_GPUZ_RAONI', 		'MINOR_CIV_APPROACH_CONQUEST', 		1),
		('LEADER_GPUZ_RAONI', 		'MINOR_CIV_APPROACH_BULLY', 		1);
--------------------------------			
-- Leader_Flavors
--------------------------------									
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 					Flavor)
VALUES	('LEADER_GPUZ_RAONI', 		'FLAVOR_OFFENSE', 					2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_DEFENSE', 					7),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_RECON', 					9),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_RANGED', 					8),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_MOBILE', 					1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_NAVAL', 					1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_NAVAL_RECON', 				1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_NAVAL_GROWTH', 				1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_AIR', 						7),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_EXPANSION', 				6),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_GROWTH', 					12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_TILE_IMPROVEMENT', 			3),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_INFRASTRUCTURE', 			2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_PRODUCTION', 				2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_GOLD', 						1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_SCIENCE', 					8),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_CULTURE', 					12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_HAPPINESS', 				12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_GREAT_PEOPLE', 				12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_WONDER', 					1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_RELIGION', 					12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_DIPLOMACY', 				12),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_SPACESHIP', 				9),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_WATER_CONNECTION', 			1),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_NUKE', 						2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_ESPIONAGE', 				2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_ARCHAEOLOGY', 				9),
		('LEADER_GPUZ_RAONI', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_GPUZ_RAONI',  'TRAIT_GPUZ_RAONI');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_GPUZ_RAONI',	'TXT_KEY_TRAIT_GPUZ_RAONI', 	'TXT_KEY_TRAIT_GPUZ_RAONI_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 						Description,					ShortDescription, 							Adjective, 				 			CivilopediaTag,						DefaultPlayerColor,			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 		 SoundtrackTag, 	MapImage, 			DawnOfManQuote,							DawnOfManImage)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	'TEXT_KEY_GPUZ_RAONI_KAYAPO',	'TEXT_KEY_GPUZ_RAONI_KAYAPO_SHORT_DESC',	'TEXT_KEY_GPUZ_RAONI_KAYAPO_ADJ', 	'TXT_KEY_CIVILOPEDIA_GPUZ_KAYAPO',	'PLAYERCOLOR_GPUZ_RAONI',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'GPUZ_RAONI_ICON_ATLAS',	0, 				'GPUZ_RAONI_ALPHA_ATLAS', SoundtrackTag, 	'KayapoMap.dds',	'TXT_KEY_CIV5_DAWN_GPUZ_RAONI_TEXT',	'KayapoDOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_MAYA';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_01'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_02'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_03'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_04'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_05'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_06'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_07'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_08'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_09'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_10'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_11'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_12'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_13'),	
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_14'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_15'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_16'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_17'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_18'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_19'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_CITY_GPUZ_RAONI_KAYAPO_20');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_MAYA';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_GPUZ_KAYAPO', TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_MAYA';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_GPUZ_KAYAPO', UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_MAYA';
--------------------------------	
-- Civilization_Leaders
--------------------------------	
INSERT INTO Civilization_Leaders
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GPUZ_KAYAPO',	'LEADER_GPUZ_RAONI');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 		 		UnitType)
VALUES	('CIVILIZATION_GPUZ_KAYAPO',	'UNITCLASS_MERCHANT',	'UNIT_GPUZ_BENADIORO');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_GPUZ_KAYAPO',	'BUILDINGCLASS_GRANARY',	'BUILDING_GPUZ_UNCUA');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------			
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GPUZ_KAYAPO',	'REGION_JUNGLE');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_0'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_1'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_2'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_3'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_4'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_5'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_6'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_7'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_8'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_9'),
		('CIVILIZATION_GPUZ_KAYAPO', 	'TXT_KEY_SPY_NAME_GPUZ_KAYAPO_9');
--==========================================================================================================================
-- DIPLOMACY
--==========================================================================================================================
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_GPUZ_RAONI','RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_GPUZ_RAONI_FIRSTGREETING%','500');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_GPUZ_RAONI','RESPONSE_DEFEATED',			'TXT_KEY_LEADER_GPUZ_RAONI_DEFEATED%','500');