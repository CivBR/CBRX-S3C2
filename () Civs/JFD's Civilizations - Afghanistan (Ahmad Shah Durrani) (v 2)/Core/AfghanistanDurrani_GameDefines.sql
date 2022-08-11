--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 					TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 					Help, 								 Strategy,								 Civilopedia, 						  ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_DIVAN',	TradeRouteLandDistanceModifier, TradeRouteLandGoldBonus, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			'TXT_KEY_BUILDING_JFD_DIVAN', 	'TXT_KEY_BUILDING_JFD_DIVAN_HELP',   'TXT_KEY_BUILDING_JFD_DIVAN_STRATEGY',	 'TXT_KEY_BUILDING_JFD_DIVAN_TEXT',   ArtDefineTag, 3, 			   'JFD_AFGHANISTAN_DURRANI_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_CARAVANSARY';	

UPDATE Buildings
SET GreatWorkCount = 1, GreatWorkSlotType = 'GREAT_WORK_SLOT_LITERATURE'
WHERE Type = 'BUILDING_JFD_DIVAN';
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, 		Flavor)
SELECT	'BUILDING_JFD_DIVAN',	FlavorType, 		Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_CARAVANSARY';

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType,			Flavor)
VALUES	('BUILDING_JFD_DIVAN',	'FLAVOR_CULTURE',	20);
--=======================================================================================================================	
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							LostWithUpgrade,	FriendlyLandsModifier,	Description, 						Help, 									 Sound, 			 CannotBeChosen, PortraitIndex, IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_JEZAILCHI',		0, 					10,						'TXT_KEY_PROMOTION_JFD_JEZAILCHI',	'TXT_KEY_PROMOTION_JFD_JEZAILCHI_HELP',  'AS2D_IF_LEVELUP',  1, 			 59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_JEZAILCHI');
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_Terrains
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_Terrains 	
		(PromotionType, 				TerrainType,		Attack)
VALUES	('PROMOTION_JFD_JEZAILCHI',		'TERRAIN_HILL',		20);
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 					Help, 								Strategy, 								Civilopedia, 						UnitArtInfo, 					UnitFlagAtlas,								UnitFlagIconOffset,	IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_JEZAILCHI',	Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_JEZAILCHI',	'TXT_KEY_UNIT_JFD_JEZAILCHI_HELP', 	'TXT_KEY_UNIT_JFD_JEZAILCHI_STRATEGY', 	'TXT_KEY_UNIT_JFD_JEZAILCHI_TEXT',	'ART_DEF_UNIT_JFD_JEZAILCHI',	'JFD_AFGHANISTAN_DURRANI_UNIT_FLAG_ATLAS',  0,					'JFD_AFGHANISTAN_DURRANI_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_CAVALRY';

UPDATE Units
SET Combat = Combat-4, RangedCombat = Combat, Range = 1 
WHERE Type = 'UNIT_JFD_JEZAILCHI';
------------------------------------------------------------------------------------------------------------------------		
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_JEZAILCHI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_JEZAILCHI', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_JEZAILCHI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_JEZAILCHI', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';	

INSERT INTO Unit_FreePromotions
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_JEZAILCHI', 'PROMOTION_JFD_JEZAILCHI');
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ResourceQuantityRequirements
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_JEZAILCHI', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';
------------------------------------------------------------------------------------------------------------------------	
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_JFD_JEZAILCHI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								ArtDefineTag, 						Description, 								Civilopedia, 									CivilopediaTag, 										IconAtlas, 								PortraitIndex)
VALUES	('LEADER_JFD_AFGHANISTAN_DURRANI', 	'JFD_AfghanistanDurrani_Scene.xml',	'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_AFGHANISTAN_DURRANI',	'JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 5,
WonderCompetitiveness = 6,
MinorCivCompetitiveness = 5,
Boldness = 6,
DiploBalance = 6,
WarmongerHate = 6,
DenounceWillingness = 6,
DoFWillingness = 6,
Loyalty = 6,
Neediness = 5,
Forgiveness = 4,
Chattiness = 4,
Meanness = 4
WHERE Type = 'LEADER_JFD_AFGHANISTAN_DURRANI';	
------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'MINOR_CIV_APPROACH_BULLY', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_OFFENSE', 					4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_RANGED', 					4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_NAVAL', 					4),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_AIR', 						3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_GOLD', 						6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_HAPPINESS', 				6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_WONDER', 					6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_RELIGION', 					6),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_DIPLOMACY', 				5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_WATER_CONNECTION', 			5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_AFGHANISTAN_DURRANI', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_ATTACKED_HOSTILE%', 			 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_DEFEATED%', 					 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_EXPANSION_SERIOUS_WARNING%', 	 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_FIRSTGREETING%', 				 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_GREETING_POLITE_HELLO%', 		 		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_LUXURY_TRADE%', 		  				500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_OPEN_BORDERS_EXCHANGE%', 		  		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_REQUEST%', 		  						500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_TOO_SOON_NO_PEACE%', 			  		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_RESPONSE_TO_BEING_DENOUNCED%',   		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_WINWAR%', 					  			500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_DENOUNCE%', 					  		500),
		('LEADER_JFD_AFGHANISTAN_DURRANI',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_AFGHANISTAN_DURRANI_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_AFGHANISTAN_DURRANI', 	'TRAIT_JFD_AFGHANISTAN_DURRANI');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_AFGHANISTAN_DURRANI', 	'TXT_KEY_TRAIT_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_TRAIT_JFD_AFGHANISTAN_DURRANI_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 										DerivativeCiv,					SoundtrackTag,  MapImage, 							DawnOfManQuote, 									DawnOfManImage,						Description,									ShortDescription,									Adjective,											Civilopedia,												CivilopediaTag,										 DefaultPlayerColor,					 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,								PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI',		'TXT_KEY_JFD_TAL_AFGHANISTAN',	'France', 		'JFD_MapAfghanistanDurrani512.dds',	'TXT_KEY_CIV_DAWN_JFD_AFGHANISTAN_DURRANI_TEXT',	'JFD_DOM_AfghanistanDurrani.dds',	'TXT_KEY_CIV_JFD_AFGHANISTAN_DURRANI_DESC', 	'TXT_KEY_CIV_JFD_AFGHANISTAN_DURRANI_SHORT_DESC',	'TXT_KEY_CIV_JFD_AFGHANISTAN_DURRANI_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_AFGHANISTAN_DURRANI_TEXT_1',  'TXT_KEY_CIVILOPEDIA_CIVS_JFD_AFGHANISTAN_DURRANI',	 'PLAYERCOLOR_JFD_AFGHANISTAN_DURRANI',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_AFGHANISTAN_DURRANI_ICON_ATLAS',	0,				'JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 							CityName)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_1'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_2'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_3'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_4'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_5'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_6'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_7'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_8'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_9'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_10'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_11'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_12'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_13'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_14'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_15'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_16'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_17'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_18'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_19'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_20'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_21'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_22'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_23'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_24'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_25'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_26'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_27'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_28'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_CITY_NAME_JFD_AFGHANISTAN_DURRANI_29');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 							BuildingClassType)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 							TechType)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 							LeaderheadType)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'LEADER_JFD_AFGHANISTAN_DURRANI');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 							BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'BUILDINGCLASS_CARAVANSARY',	'BUILDING_JFD_DIVAN');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 							UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'UNITCLASS_CAVALRY',			'UNIT_JFD_JEZAILCHI');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 							ReligionType)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'RELIGION_ISLAM');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 							SpyName)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_0'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_1'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_2'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_3'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_4'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_5'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_6'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_7'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_8'),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'TXT_KEY_SPY_NAME_JFD_AFGHANISTAN_DURRANI_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 							RegionType)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI', 	'REGION_HILLS');
--=======================================================================================================================
--=======================================================================================================================