--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_RSR',		Class,	CombatClass, PrereqTech, '325', '50', RangedCombat, Range, '650', RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_RSR', 'TXT_KEY_UNIT_SAS_RSR_HELP', 	 'TXT_KEY_UNIT_SAS_RSR_STRATEGY',  'TXT_KEY_UNIT_SAS_RSR_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_RSR',	 'SAS_RSR_ATLAS',	0,					'SAS_UGANDA_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_MARINE';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_RSR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MARINE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_RSR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MARINE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_RSR',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MARINE';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_RSR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_MARINE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_RSR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MARINE';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_RSR', 'PROMOTION_SAS_RSR_PROMO');

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen, IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_RSR_PROMO',	'TXT_KEY_PROMOTION_SAS_RSR_PROMO',	'TXT_KEY_PROMOTION_SAS_RSR_PROMO_HELP',	'AS2D_IF_LEVELUP', 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_PROMO_HELP');

INSERT INTO UnitPromotions
		(Type, 							Description, 								Help, 				Sound,				CombatPercent, 		CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_SAS_RSR_1',	'TXT_KEY_PROMOTION_SAS_RSR_1',		'TXT_KEY_PROMOTION_SAS_RSR_1_HELP',	'AS2D_IF_LEVELUP',	10,				1,	59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_1'),
		('PROMOTION_SAS_RSR_2',	'TXT_KEY_PROMOTION_SAS_RSR_2',		'TXT_KEY_PROMOTION_SAS_RSR_2_HELP',	'AS2D_IF_LEVELUP',	20,				1,	59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_2'),
		('PROMOTION_SAS_RSR_3',	'TXT_KEY_PROMOTION_SAS_RSR_3',		'TXT_KEY_PROMOTION_SAS_RSR_3_HELP',	'AS2D_IF_LEVELUP',	30,				1,	59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_3'),
		('PROMOTION_SAS_RSR_4',	'TXT_KEY_PROMOTION_SAS_RSR_4',		'TXT_KEY_PROMOTION_SAS_RSR_4_HELP',	'AS2D_IF_LEVELUP',	40,				1,	59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_4'),
		('PROMOTION_SAS_RSR_5',	'TXT_KEY_PROMOTION_SAS_RSR_5',		'TXT_KEY_PROMOTION_SAS_RSR_5_HELP',	'AS2D_IF_LEVELUP',	50,				1,	59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_RSR_5');

--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb,	GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance, Description, 							Civilopedia, 							Help, 										Strategy,				ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT		('BUILDING_SAS_SRB'),	HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb,	GreatWorkCount,	GreatWorkSlotType, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance, ('TXT_KEY_BUILDING_SAS_SRB'),	('TXT_KEY_BUILDING_SAS_SRB_PEDIA'),	('TXT_KEY_BUILDING_SAS_SRB_HELP'),	('TXT_KEY_BUILDING_SAS_SRB_STRATEGY'),	ArtDefineTag, 3, 				('SAS_UGANDA_ICON_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_POLICE_STATION';

UPDATE Buildings
SET	
	PrereqTech	= 	(SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_POLICE_STATION'), 
	Cost 		= 	(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_POLICE_STATION'), 
	FaithCost 	= 	(SELECT FaithCost FROM Buildings WHERE Type = 'BUILDING_POLICE_STATION')
WHERE Type = 'BUILDING_SAS_SRB';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_SAS_SRB'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_POLICE_STATION';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 				YieldType, Yield)
SELECT		('BUILDING_SAS_SRB'),	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_POLICE_STATION';
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_AMIN',	 'TXT_KEY_LEADER_SAS_AMIN',	'TXT_KEY_LEADER_SAS_AMIN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_AMIN',	'Sas_Amin_Scene.xml',									10, 						6, 						7, 							11, 			1, 				3, 				6, 						7, 				3, 			7, 			6, 				4, 			8, 			'SAS_UGANDA_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_AMIN',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_AMIN',	'MINOR_CIV_APPROACH_IGNORE', 		7),
		('LEADER_SAS_AMIN',	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_AMIN',	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_SAS_AMIN',	'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_SAS_AMIN',	'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_AMIN',	'FLAVOR_OFFENSE', 					9),
		('LEADER_SAS_AMIN',	'FLAVOR_DEFENSE', 					5),
		('LEADER_SAS_AMIN',	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_SAS_AMIN',	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_SAS_AMIN',	'FLAVOR_RECON', 					5),
		('LEADER_SAS_AMIN',	'FLAVOR_RANGED', 					7),
		('LEADER_SAS_AMIN',	'FLAVOR_MOBILE', 					6),
		('LEADER_SAS_AMIN',	'FLAVOR_NAVAL', 					6),
		('LEADER_SAS_AMIN',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_AMIN',	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_SAS_AMIN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_SAS_AMIN',	'FLAVOR_AIR', 						8),
		('LEADER_SAS_AMIN',	'FLAVOR_EXPANSION', 				7),
		('LEADER_SAS_AMIN',	'FLAVOR_GROWTH', 					6),
		('LEADER_SAS_AMIN',	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_SAS_AMIN',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_AMIN',	'FLAVOR_PRODUCTION', 				8),
		('LEADER_SAS_AMIN',	'FLAVOR_GOLD', 						7),
		('LEADER_SAS_AMIN',	'FLAVOR_SCIENCE', 					6),
		('LEADER_SAS_AMIN',	'FLAVOR_CULTURE', 					6),
		('LEADER_SAS_AMIN',	'FLAVOR_HAPPINESS', 				6),
		('LEADER_SAS_AMIN',	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_SAS_AMIN',	'FLAVOR_WONDER', 					5),
		('LEADER_SAS_AMIN',	'FLAVOR_RELIGION', 					5),
		('LEADER_SAS_AMIN',	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_SAS_AMIN',	'FLAVOR_SPACESHIP', 				5),
		('LEADER_SAS_AMIN',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_SAS_AMIN',	'FLAVOR_NUKE', 						8),
		('LEADER_SAS_AMIN',	'FLAVOR_USE_NUKE', 					8),
		('LEADER_SAS_AMIN',	'FLAVOR_ESPIONAGE', 				8),
		('LEADER_SAS_AMIN',	'FLAVOR_AIRLIFT', 					9),
		('LEADER_SAS_AMIN',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_SAS_AMIN',	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_SAS_AMIN',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_AMIN',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_AMIN',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_SAS_AMIN',	'FLAVOR_AIR_CARRIER', 				2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_AMIN',	'TRAIT_SAS_AMIN');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_AMIN',  'TXT_KEY_TRAIT_SAS_AMIN',	 'TXT_KEY_TRAIT_SAS_AMIN_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES	('LEADER_SAS_AMIN',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_AMIN_DEFEATED%', 						500),
		('LEADER_SAS_AMIN',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_AMIN_FIRSTGREETING%', 					500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_UGANDA',		'Songhai', 		'SasUganda412.dds',		'TXT_KEY_CIV_DAWN_SAS_UGANDA_TEXT',	'Sas_Amin_DOM.dds',	'TXT_KEY_CIV_SAS_UGANDA_DESC', 	'TXT_KEY_CIV_SAS_UGANDA_SHORT_DESC',	'TXT_KEY_CIV_SAS_UGANDA_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_SAS_UGANDA_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_SAS_UGANDA',		'PLAYERCOLOR_SAS_UGANDA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_UGANDA_ICON_ATLAS',	0,				'SAS_UGANDA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_ZULU';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_0'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_1'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_2'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_3'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_4'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_5'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_6'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_7'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_8'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_SPY_NAME_CIV_SAS_UGANDA_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_1'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_2'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_3'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_4'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_5'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_6'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_7'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_8'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_9'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_10'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_11'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_12'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_13'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_14'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_15'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_16'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_17'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_18'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_19'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_20'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_21'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_22'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_23'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_24'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_25'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_26'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_27'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_28'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_29'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_30'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_31'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_32'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_33'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_34'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_35'),
		('CIVILIZATION_SAS_UGANDA',	'TXT_KEY_CITY_NAME_SAS_UGANDA_36');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_UGANDA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ZULU';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_UGANDA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ZULU';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_UGANDA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ZULU';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_UGANDA',	'LEADER_SAS_AMIN');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_UGANDA', 	'UNITCLASS_MARINE',			'UNIT_SAS_RSR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_SAS_UGANDA', 	'BUILDINGCLASS_POLICE_STATION',	'BUILDING_SAS_SRB');
--==========================================================================================================================	
-- Civilization_Start_Region_Avoid
--==========================================================================================================================			
INSERT INTO Civilization_Start_Region_Avoid 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_SAS_UGANDA', 	'REGION_TUNDRA');	