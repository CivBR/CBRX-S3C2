--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--- CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY     BUILDING_HAPPINESS_DUMMY_SUNDIATA
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							EspionageModifier, Espionage, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 							Help, 									  	Strategy,										Civilopedia, 							    ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_US_DONSON_TON',	EspionageModifier, Espionage, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, 2, MinAreaSize, ConquestProb, 1, 			 'TXT_KEY_BUILDING_US_DONSON_TON', 	'TXT_KEY_BUILDING_US_DONSON_TON_HELP',  'TXT_KEY_BUILDING_US_DONSON_TON_STRATEGY',	'TXT_KEY_BUILDING_US_DONSON_TON_TEXT',  ArtDefineTag, 3, 			 'US_MALI_SUNDIATA_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_BARRACKS';	

INSERT INTO Buildings 	
		(Type, 									BuildingClass,	NoOccupiedUnhappiness, 								GreatWorkCount, Cost,	FaithCost,	NeverCapture,	Description, 									Help)
VALUES	('BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY',	'BUILDINGCLASS_BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY',	1,		-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON', 	'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON');

INSERT INTO Buildings 	
		(Type, 									BuildingClass,	Happiness, 								GreatWorkCount, Cost,	FaithCost,	NeverCapture,	Description, 									Help)
VALUES	('BUILDING_HAPPINESS_DUMMY_SUNDIATA',	'BUILDINGCLASS_HAPPINESS_DUMMY_SUNDIATA',	2,	-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON', 	'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON');
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType, Flavor)
SELECT	'BUILDING_US_DONSON_TON',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_BARRACKS';

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,				Flavor)
VALUES	('BUILDING_US_DONSON_TON',	'FLAVOR_EXPANSION',	20),
		('BUILDING_US_DONSON_TON',	'FLAVOR_GROWTH',		10);
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 					 	Description)
VALUES	('BUILDINGCLASS_DUMMY_US_DONSON_TON', 	'BUILDING_DUMMY_US_DONSON_TON',   	'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON'),
		('BUILDINGCLASS_BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY', 	'BUILDING_SUNDIATA_OCCUPIED_TRAIT_DUMMY',   	'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON'),
		('BUILDINGCLASS_HAPPINESS_DUMMY_SUNDIATA', 	'BUILDING_HAPPINESS_DUMMY_SUNDIATA',   	'TXT_KEY_BUILDING_DUMMY_US_DONSON_TON');
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 							EspionageModifier, Espionage, BuildingClass,	Happiness, HurryCostModifier, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 							Help, 									  	Strategy,										Civilopedia, 							    ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_DUMMY_US_DONSON_TON',	EspionageModifier, Espionage, BuildingClass,	1,	 HurryCostModifier, PrereqTech, 450, SpecialistType, SpecialistCount, FaithCost, 2, MinAreaSize, ConquestProb, 1, 			 'TXT_KEY_BUILDING_US_DONSON_TON', 	'TXT_KEY_BUILDING_US_DONSON_TON_HELP',  'TXT_KEY_BUILDING_US_DONSON_TON_STRATEGY',	'TXT_KEY_BUILDING_US_DONSON_TON_TEXT',  ArtDefineTag, 2, 			 'US_MALI_SUNDIATA_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_BARRACKS';	
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units
(Type, 												Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_US_TON_TIGI'),		Class, Cost, 2, PrereqTech, Combat, 14, Moves, FaithCost, RequiresFaithPurchaseEnabled, ('UNITCOMBAT_ARCHER'), MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  ('UNITAI_RANGED'), ('TXT_KEY_UNIT_US_TON_TIGI'),	('TXT_KEY_UNIT_US_TON_TIGI_TEXT'), 	('TXT_KEY_UNIT_US_TON_TIGI_HELP'), 	('TXT_KEY_UNIT_US_TON_TIGI_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_US_TON_TIGI'),  0,					('US_TON_TIGI_FLAG'),	2, 				('US_MALI_SUNDIATA_ICON_ATLAS')
FROM Units WHERE (Type = 'UNIT_KNIGHT');
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 							UnitAIType)
SELECT	'UNIT_US_TON_TIGI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 							UnitClassType)
SELECT	'UNIT_US_TON_TIGI',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';	
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 							FlavorType, Flavor)
SELECT	'UNIT_US_TON_TIGI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 							SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_US_TON_TIGI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';
--==========================================================================================================================
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Unit_ResourceQuantityRequirements
			(UnitType, 							ResourceType)
VALUES		('UNIT_US_TON_TIGI', 	'RESOURCE_HORSE');
------------------------------------------------------------------------------------------------------------------------	
-- PROMOTIONS
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_FreePromotions
        (UnitType,           PromotionType)
VALUES  ('UNIT_US_TON_TIGI',  'PROMOTION_MUST_SET_UP'),
        ('UNIT_US_TON_TIGI',  'PROMOTION_INDIRECT_FIRE');
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 										ArtDefineTag, 							Description, 									Civilopedia, 										 CivilopediaTag, 												IconAtlas, 									PortraitIndex)
VALUES	('LEADER_US_MALI_SUNDIATA', 	'US_Sundiata_Scene.xml',	'TXT_KEY_LEADER_US_MALI_SUNDIATA',	'TXT_KEY_LEADER_US_MALI_SUNDIATA_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_US_MALI_SUNDIATA',	'US_MALI_SUNDIATA_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 9,
WonderCompetitiveness = 3,
MinorCivCompetitiveness = 7,
Boldness = 9,
DiploBalance = 7,
WarmongerHate = 8,
DenounceWillingness = 9,
DoFWillingness = 6,
Loyalty = 6,
Neediness = 3,
Forgiveness = 2,
Chattiness = 5,
Meanness = 9
WHERE Type = 'LEADER_US_MALI_SUNDIATA';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 								MajorCivApproachType, 				Bias)
VALUES	('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		3),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_US_MALI_SUNDIATA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 								MinorCivApproachType, 				Bias)
VALUES	('LEADER_US_MALI_SUNDIATA', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_US_MALI_SUNDIATA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_US_MALI_SUNDIATA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
		('LEADER_US_MALI_SUNDIATA', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_US_MALI_SUNDIATA', 	'MINOR_CIV_APPROACH_BULLY', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 								FlavorType, 						Flavor)
VALUES	('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_OFFENSE', 					9),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_DEFENSE', 					7),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_CITY_DEFENSE', 				3),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_RECON', 					4),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_RANGED', 					8),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_MOBILE', 					9),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_NAVAL', 					3),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_NAVAL_GROWTH', 				1),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_AIR', 						7),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_GROWTH', 					4),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_GOLD', 						9),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_SCIENCE', 					7),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_CULTURE', 					4),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_HAPPINESS', 				8),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_GREAT_PEOPLE', 				2),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_WONDER', 					2),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_RELIGION', 					6),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_NUKE', 						7),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_USE_NUKE', 					5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_ESPIONAGE', 				4),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_AIRLIFT', 					3),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_US_MALI_SUNDIATA', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 								ResponseType, 							 			Response, 																	 			Bias)
VALUES 	('LEADER_US_MALI_SUNDIATA',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_DEFEATED%', 					 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_DOW_GENERIC%', 				 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_US_MALI_SUNDIATA_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_FIRSTGREETING%', 				 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_US_MALI_SUNDIATA_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_US_MALI_SUNDIATA_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_US_MALI_SUNDIATA_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_US_MALI_SUNDIATA_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_US_MALI_SUNDIATA_LUXURY_TRADE%', 		  					500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_US_MALI_SUNDIATA_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_US_MALI_SUNDIATA_REQUEST%', 		  						500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_US_MALI_SUNDIATA_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_US_MALI_SUNDIATA_WINWAR%', 					  				500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_DENOUNCE%', 					  			500),
		('LEADER_US_MALI_SUNDIATA',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_US_MALI_SUNDIATA_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 								TraitType)
VALUES	('LEADER_US_MALI_SUNDIATA', 	'TRAIT_US_MALI_SUNDIATA');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 										Description, 									ShortDescription)
VALUES	('TRAIT_US_MALI_SUNDIATA', 		'TXT_KEY_TRAIT_US_MALI_SUNDIATA',	'TXT_KEY_TRAIT_US_MALI_SUNDIATA_SHORT');
------------------------------------------------------------------------------------------------------------------------
-- Policies
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type,												 Description,											BuildingPurchaseCostModifier)
VALUES	('POLICY_US_MALI_SUNDIATA_ACTIVE',		 'TXT_KEY_TRAIT_US_MALI_SUNDIATA_SHORT',	-15),
		('POLICY_US_MALI_SUNDIATA_INACTIVE',	 'TXT_KEY_TRAIT_US_MALI_SUNDIATA_SHORT',	0);
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 																	SoundtrackTag,  MapImage, 								DawnOfManQuote, 										DawnOfManImage,							Description,										ShortDescription,										Adjective,												Civilopedia,														CivilopediaTag,												DefaultPlayerColor,							ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,									PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_US_MALI_SUNDIATA',	SoundtrackTag, 		'malismal.dds',	'TXT_KEY_CIV_DAWN_US_MALI_SUNDIATA_TEXT',	'US_Sundiata_DoM.dds',	'TXT_KEY_CIV_US_MALI_SUNDIATA_DESC', 	'TXT_KEY_CIV_US_MALI_SUNDIATA_SHORT_DESC',	'TXT_KEY_CIV_US_MALI_SUNDIATA_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_US_MALI_SUNDIATA_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_US_MALI_SUNDIATA',	'PLAYERCOLOR_US_MALI_SUNDIATA',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'US_MALI_SUNDIATA_ICON_ATLAS',	0,				'US_MALI_SUNDIATA_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 								CityName)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_1'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_2'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_3'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_4'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_5'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_6'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_7'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_8'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_9'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_10'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_11'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_12'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_13'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_14'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_15'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_16'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_17'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_18'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_19'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_20'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_21'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_22'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_CITY_NAME_US_MALI_SUNDIATA_23');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 								BuildingClassType)
SELECT	'CIVILIZATION_US_MALI_SUNDIATA', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 								TechType)
SELECT	'CIVILIZATION_US_MALI_SUNDIATA', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 								UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_US_MALI_SUNDIATA', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 								LeaderheadType)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'LEADER_US_MALI_SUNDIATA');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 								BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'BUILDINGCLASS_BARRACKS',	'BUILDING_US_DONSON_TON');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 								UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'UNITCLASS_KNIGHT',			'UNIT_US_TON_TIGI');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 								ReligionType)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'RELIGION_ISLAM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 								SpyName)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_0'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_1'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_2'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_3'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_4'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_5'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_6'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_7'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_8'),
		('CIVILIZATION_US_MALI_SUNDIATA',	'TXT_KEY_SPY_NAME_US_MALI_SUNDIATA_9');
--=======================================================================================================================
--=======================================================================================================================