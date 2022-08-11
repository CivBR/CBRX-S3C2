--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 								DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_UC_UPCA_CULTURE',  		'BUILDING_UC_UPCA_CULTURE', 		'TXT_KEY_BUILDING_UC_INSTITUTO_LAICO');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
-- Buildings
------------------------------	
INSERT INTO Buildings 
		(Type, 											BuildingClass, 				 	Cost, FaithCost, UnlockedByBelief, GoldMaintenance,  FreeStartEra,	 PrereqTech,			Help, 												Description,							Civilopedia, 							 Strategy, 										 ArtDefineTag, MinAreaSize, HurryCostModifier,	IconAtlas,						ConquestProb, PortraitIndex, SpecialistType, SpecialistCount)
SELECT	'BUILDING_UC_INSTITUTO_LAICO',			BuildingClass,				 	Cost, FaithCost, UnlockedByBelief, GoldMaintenance,				 FreeStartEra,	 PrereqTech,			'TXT_KEY_BUILDING_UC_INSTITUTO_LAICO_HELP',		'TXT_KEY_BUILDING_UC_INSTITUTO_LAICO',	'TXT_KEY_BUILDING_UC_INSTITUTO_LAICO_TEXT',  'TXT_KEY_BUILDING_UC_INSTITUTO_LAICO_STRATEGY', ArtDefineTag, MinAreaSize, HurryCostModifier,	'UC_CENTRAL_AMERICA_ATLAS',	0, 3, SpecialistType, SpecialistCount
FROM Buildings WHERE Type = 'BUILDING_UNIVERSITY';		

INSERT INTO Buildings		
		(Type, 								BuildingClass, 			  	Cost,  FaithCost, GreatWorkCount,  Description, 				 Help,								NeverCapture,	NukeImmune)
VALUES	('BUILDING_UC_UPCA_CULTURE', 				'BUILDINGCLASS_UC_UPCA_CULTURE', 	-1,    -1,		  -1,			   null,  null,	1,	1);		

INSERT INTO Buildings
        (Type,                         BuildingClass, Cost, Description, GoldMaintenance, Civilopedia, Strategy, Help, NeverCapture, IconAtlas, PortraitIndex, SpecialistType,          SpecialistCount)		
SELECT	'BUILDING_UC_UPCA_TEMPLE', BuildingClass, Cost, Description, GoldMaintenance, Civilopedia, Strategy, Help, NeverCapture, IconAtlas, PortraitIndex, 'SPECIALIST_SCIENTIST',  1	
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';																			 																																							 
																																							 																																							 
INSERT INTO Buildings
        (Type,                         BuildingClass, Cost, GreatWorkSlotType, GreatWorkCount, Happiness, Description, Civilopedia, Strategy, Help, NeverCapture, IconAtlas, PortraitIndex, SpecialistType,          SpecialistCount)
SELECT  'BUILDING_UC_UPCA_'||Type,     BuildingClass, Cost, GreatWorkSlotType, GreatWorkCount, Happiness, Description, Civilopedia, Strategy, Help, NeverCapture, IconAtlas, PortraitIndex, 'SPECIALIST_SCIENTIST',  1
FROM Buildings WHERE BuildingClass IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IS NOT NULL) AND Cost <= 0 AND FaithCost > 0;
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 
		(BuildingType, 							FlavorType,			Flavor)
SELECT	'BUILDING_UC_INSTITUTO_LAICO', 	FlavorType,			Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_Flavors     
        (BuildingType,                             FlavorType,        Flavor)
SELECT    'BUILDING_UC_UPCA_'||BuildingType,        FlavorType,        Flavor
FROM Building_Flavors WHERE BuildingType IN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IS NOT NULL)) 
AND BuildingType IN (SELECT Type FROM Buildings WHERE Cost <= 0 AND FaithCost > 0);
------------------------------
-- Building_YieldChanges
------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,			Yield)
SELECT	'BUILDING_UC_INSTITUTO_LAICO',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';

INSERT INTO Building_YieldChanges 	
		(BuildingType, 			YieldType,			Yield)
VALUES	('BUILDING_UC_UPCA_CULTURE',	'YIELD_CULTURE', 1);

INSERT INTO Building_YieldChanges     
        (BuildingType,                         YieldType,        Yield)
SELECT    'BUILDING_UC_UPCA_'||BuildingType,    YieldType,        Yield
FROM Building_YieldChanges WHERE BuildingType IN (SELECT DefaultBuilding FROM BuildingClasses WHERE Type IN (SELECT BuildingClassType FROM Belief_BuildingClassFaithPurchase WHERE BuildingClassType IS NOT NULL)) 
AND BuildingType IN (SELECT Type FROM Buildings WHERE Cost <= 0 AND FaithCost > 0) 
AND YieldType != 'YIELD_FAITH';
------------------------------
-- Building_FeatureYieldChanges
------------------------------	
INSERT INTO Building_FeatureYieldChanges
		(BuildingType, 			FeatureType,	YieldType,			Yield)
SELECT	'BUILDING_UC_INSTITUTO_LAICO',	FeatureType,	YieldType, Yield
FROM Building_FeatureYieldChanges WHERE BuildingType = 'BUILDING_UNIVERSITY';
------------------------------
-- Building_ResourceYieldChanges
------------------------------	
INSERT INTO Building_ResourceYieldChanges
		(BuildingType, 			ResourceType,	YieldType,			Yield)
VALUES	('BUILDING_UC_UPCA_BUILDING_MONASTERY',	'RESOURCE_WINE',	'YIELD_CULTURE', 1),
		('BUILDING_UC_UPCA_BUILDING_MONASTERY',	'RESOURCE_INCENSE',	'YIELD_CULTURE', 1),
		('BUILDING_UC_UPCA_BUILDING_MONASTERY',	'RESOURCE_WINE',	'YIELD_SCIENCE', 1),
		('BUILDING_UC_UPCA_BUILDING_MONASTERY',	'RESOURCE_INCENSE',	'YIELD_SCIENCE', 1);
------------------------------
-- Building_YieldModifiers
------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 			YieldType, Yield)
SELECT	'BUILDING_UC_INSTITUTO_LAICO', YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_UNIVERSITY';
------------------------------
-- Building_ClassesNeededInCity
------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 		BuildingClassType)
SELECT	'BUILDING_UC_INSTITUTO_LAICO', BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_UNIVERSITY';
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class,	Combat,	Cost, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, PrereqTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass, XPValueAttack,	Description,						Help,									Strategy,									Civilopedia,							 AdvancedStartCost,      UnitArtInfo,						UnitFlagAtlas,							UnitFlagIconOffset, IconAtlas,			PortraitIndex)
SELECT	'UNIT_UC_EAP', 	Class,	Combat, Cost, Moves, CombatClass, Domain,  DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, PrereqTech,	IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, XPValueAttack,	'TXT_KEY_UNIT_UC_EAP',	'TXT_KEY_UNIT_UC_EAP_HELP',	'TXT_KEY_UNIT_UC_EAP_STRATEGY',	'TXT_KEY_UNIT_UC_EAP_TEXT', AdvancedStartCost,     'ART_DEF_UNIT_UC_EAP',	'UC_UNIT_FLAG_EAP_FLAG_ATLAS',	0,					'UC_CENTRAL_AMERICA_ATLAS',	2
FROM Units WHERE Type = 'UNIT_RIFLEMAN';
--------------------------------
-- UnitGameplay2DScripts 
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_UC_EAP', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_UC_EAP', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_UC_EAP', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_UC_EAP', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT INTO Unit_FreePromotions
		(UnitType,				PromotionType)
VALUES	('UNIT_UC_EAP',	'PROMOTION_UC_EAP');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_UC_EAP',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions
		(Type, Description, Help, PortraitIndex, IconAtlas, PediaType, PediaEntry)
VALUES	('PROMOTION_UC_EAP', 'TXT_KEY_PROMOTION_UC_EAP', 'TXT_KEY_PROMOTION_UC_EAP_ HELP', 44, 'PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PRIZE_SHIPS');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_UC_MORAZAN', 	'TXT_KEY_LEADER_UC_MORAZAN',		'TXT_KEY_LEADER_UC_MORAZAN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_UC_MORAZAN', 	'MorazanLS.xml',	9, 						6, 						6, 							8, 			8, 				9, 				7, 						6, 				8, 			4, 			4, 				6, 			5, 			'UC_CENTRAL_AMERICA_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_UC_MORAZAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_UC_MORAZAN', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_UC_MORAZAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_UC_MORAZAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
		('LEADER_UC_MORAZAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_UC_MORAZAN', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_UC_MORAZAN', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_RECON', 					5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_RANGED', 					5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_MOBILE', 					4),
		('LEADER_UC_MORAZAN', 	'FLAVOR_NAVAL', 					7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_NAVAL_GROWTH', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_AIR', 						6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_GROWTH', 					7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_UC_MORAZAN', 	'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_GOLD', 						5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_SCIENCE', 					9),
		('LEADER_UC_MORAZAN', 	'FLAVOR_CULTURE', 					8),
		('LEADER_UC_MORAZAN', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_WONDER', 					5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_RELIGION', 					8),
		('LEADER_UC_MORAZAN', 	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_SPACESHIP', 				8),
		('LEADER_UC_MORAZAN', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_NUKE', 						6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_USE_NUKE', 					5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_ESPIONAGE', 				7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_AIRLIFT', 					7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_UC_MORAZAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_UC_MORAZAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_UC_MORAZAN', 	'FLAVOR_ARCHAEOLOGY', 				6),
		('LEADER_UC_MORAZAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_UC_MORAZAN', 	'TRAIT_UC_CENTRAL_AMERICA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 									Description, 								ShortDescription)
VALUES	('TRAIT_UC_CENTRAL_AMERICA', 		'TXT_KEY_TRAIT_UC_CENTRAL_AMERICA',		'TXT_KEY_TRAIT_UC_CENTRAL_AMERICA_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 												Description,								ShortDescription,									Adjective,										Civilopedia, CivilopediaTag, DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,							SoundtrackTag,  MapImage, 						DawnOfManQuote, 								DawnOfManImage)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA',	'TXT_KEY_CIV_UC_CENTRAL_AMERICA_DESC',	'TXT_KEY_CIV_UC_CENTRAL_AMERICA_SHORT_DESC',		'TXT_KEY_CIV_UC_CENTRAL_AMERICA_ADJ',	'TXT_KEY_CIV_UC_CENTRAL_AMERICA_TEXT', 'TXT_KEY_CIV_UC_CENTRAL_AMERICA', 'PLAYERCOLOR_UC_CENTRAL_AMERICA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'UC_CENTRAL_AMERICA_ATLAS',	0,				'UC_CENTRAL_AMERICA_ALPHA_ATLAS',	'Spain', 		'MapCentroamerica.dds',	'TXT_KEY_DAWN_UC_CENTRAL_AMERICA',		'CentroamericaDoM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_VENICE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType,            CityName)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_0'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_1'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_2'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_3'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_4'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_5'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_6'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_7'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_8'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_9'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_10'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_11'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_12'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_13'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_14'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_15'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_16'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_17'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_18'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_19'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_20'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_21'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_22'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_23'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_24'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_25'),
		('CIVILIZATION_UC_CENTRAL_AMERICA',   'TXT_KEY_CITY_NAME_UC_CENTRAL_AMERICA_26');
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA',	'LEADER_UC_MORAZAN');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA', 	'BUILDINGCLASS_UNIVERSITY',	'BUILDING_UC_INSTITUTO_LAICO');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA', 	'UNITCLASS_RIFLEMAN',		'UNIT_UC_EAP');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions
		(CivilizationType, 						ReligionType)
SELECT	'CIVILIZATION_UC_CENTRAL_AMERICA', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================	
-- PLAYER COLORS
--==========================================================================================================================
-- Colors
--------------------------------		
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_UC_CENTRAL_AMERICA_ICON', 	.235,	.459,	.553,	    1),
			('COLOR_PLAYER_UC_CENTRAL_AMERICA_BACKGROUND', 	.941,	.906,	.796, 	1);
--==========================================================================================================================
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES		('PLAYERCOLOR_UC_CENTRAL_AMERICA',	'COLOR_PLAYER_UC_CENTRAL_AMERICA_ICON', 	'COLOR_PLAYER_UC_CENTRAL_AMERICA_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_0'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_1'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_2'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_3'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_4'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_5'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_6'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_7'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_8'),
		('CIVILIZATION_UC_CENTRAL_AMERICA', 'TXT_KEY_SPY_NAME_UC_CENTRAL_AMERICA_9');