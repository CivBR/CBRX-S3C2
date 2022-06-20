--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------ 	
-- Buildings
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Buildings 	
		(Type, 				  BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, NeverCapture, 	Description, 					Help, 								Strategy,								Civilopedia, 						ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_MARAE', BuildingClass,  PrereqTech, Cost, GoldMaintenance, MinAreaSize, ConquestProb, GreatPeopleRateModifier, HurryCostModifier, 1, 				'TXT_KEY_BUILDING_JFD_MARAE', 	'TXT_KEY_BUILDING_JFD_MARAE_HELP', 	'TXT_KEY_BUILDING_JFD_MARAE_STRATEGY',	'TXT_KEY_BUILDING_JFD_MARAE_TEXT',  ArtDefineTag, 3, 			 'JFD_MAORI_POTATAU_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_GARDEN';	

UPDATE Buildings
SET GoldMaintenance = 0, PrereqTech = 'TECH_CIVIL_SERVICE'
WHERE Type = 'BUILDING_JFD_MARAE';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 			BuildingClassType)
VALUES	('BUILDING_JFD_MARAE',	'BUILDINGCLASS_SHRINE');	
------------------------------------------------------------------------------------------------------------------------ 	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, Flavor)
SELECT	'BUILDING_JFD_MARAE',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_GARDEN';

INSERT INTO Building_Flavors 	
		(BuildingType, 			FlavorType, 		Flavor)
VALUES	('BUILDING_JFD_MARAE',	'FLAVOR_GROWTH',	10),
		('BUILDING_JFD_MARAE',	'FLAVOR_CULTURE',	10);	
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						IgnoreTerrainCost,	IgnoreZOC,	ExperiencePercent,	LostWithUpgrade,  Description, 						Help, 									Sound, 				 CannotBeChosen,  PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_TOA_1', 	0,					0,			20,					0,				  'TXT_KEY_PROMOTION_JFD_TOA_1',	'TXT_KEY_PROMOTION_JFD_TOA_1_HELP',		'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TOA_1'),
		('PROMOTION_JFD_TOA_2', 	1,					1,			0,					0,				  'TXT_KEY_PROMOTION_JFD_TOA_2',	'TXT_KEY_PROMOTION_JFD_TOA_2_HELP',		'AS2D_IF_LEVELUP',   1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_TOA_2');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, Description, 				Help, 							Strategy, 							Civilopedia, 					UnitArtInfo, 				UnitFlagAtlas,						  UnitFlagIconOffset,	IconAtlas,						 PortraitIndex)
SELECT	'UNIT_JFD_TOA',		Class, PrereqTech, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, IgnoreBuildingDefense, GoodyHutUpgradeUnitClass, AdvancedStartCost, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_JFD_TOA',	'TXT_KEY_UNIT_JFD_TOA_HELP', 	'TXT_KEY_UNIT_JFD_TOA_STRATEGY', 	'TXT_KEY_UNIT_JFD_TOA_TEXT',	'ART_DEF_UNIT_JFD_TOA',		'JFD_MAORI_POTATAU_UNIT_FLAG_ATLAS',  0,					'JFD_MAORI_POTATAU_ICON_ATLAS',	 2
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';	

UPDATE Units
SET Combat = Combat-5, PrereqTech = 'TECH_CHIVALRY', ObsoleteTech = NULL
WHERE Type = 'UNIT_JFD_TOA';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_JFD_TOA',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------	
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	'UNIT_JFD_TOA', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_JFD_TOA',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_JFD_TOA',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_JFD_TOA',	'PROMOTION_JFD_TOA_1');		
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_TOA', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';	
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 					IconAtlas, 						  PortraitIndex)
VALUES	('LEADER_JFD_MAORI_POTATAU', 	'TXT_KEY_LEADER_JFD_MAORI_POTATAU', 	'TXT_KEY_LEADER_JFD_MAORI_POTATAU_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MAORI_POTATAU', 	'JFD_MaoriPotatau_Scene.xml',	'JFD_MAORI_POTATAU_ICON_ATLAS',   1);

UPDATE Leaders
SET VictoryCompetitiveness = 7,
WonderCompetitiveness = 5,
MinorCivCompetitiveness = 7,
Boldness = 6,
DiploBalance = 6,
WarmongerHate = 7,
DenounceWillingness = 5,
DoFWillingness = 6,
Loyalty = 6,
Neediness = 5,
Forgiveness = 5,
Chattiness = 5,
Meanness = 5
WHERE Type = 'LEADER_JFD_MAORI_POTATAU';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_GUARDED', 		9),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_AFRAID', 		7),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------ 				
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_MAORI_POTATAU', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_MAORI_POTATAU', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_JFD_MAORI_POTATAU', 	'MINOR_CIV_APPROACH_BULLY', 		7);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------				
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_CITY_DEFENSE', 				2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_RANGED', 					2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_MOBILE', 					3),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_NAVAL', 					2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_NAVAL_RECON', 				2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_PRODUCTION', 				6),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_CULTURE', 					8),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_RELIGION', 					2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_SPACESHIP', 				3),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_MAORI_POTATAU', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 			Response, 																	Bias)
VALUES 	('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_DEFEATED%', 					 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_MAORI_POTATAU_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_MAORI_POTATAU_GREETING_HOSTILE_HELLO%', 		 		500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_MAORI_POTATAU_GREETING_NEUTRAL_HELLO%', 		 		500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_MAORI_POTATAU_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_MAORI_POTATAU_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_MAORI_POTATAU_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_MAORI_POTATAU_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_PLOT_BUYING_SERIOUS_WARNING', 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_PLOT_BUYING_SERIOUS_WARNING%', 			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_MAORI_POTATAU_REQUEST%', 		  						500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_TOO_SOON_FOR_DOF', 						'TXT_KEY_LEADER_JFD_MAORI_POTATAU_TOO_SOON_FOR_DOF%', 						500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_DENOUNCE%', 					  			500),
		('LEADER_JFD_MAORI_POTATAU',	'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_MAORI_POTATAU_DEC_FRIENDSHIP%', 			  	  		500);
------------------------------------------------------------------------------------------------------------------------ 
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_JFD_MAORI_POTATAU',	'TRAIT_JFD_MAORI_POTATAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Traits
------------------------------------------------------------------------------------------------------------------------ 
INSERT INTO Traits 
		(Type, 							Description, 						ShortDescription)
VALUES	('TRAIT_JFD_MAORI_POTATAU', 	'TXT_KEY_TRAIT_JFD_MAORI_POTATAU',  'TXT_KEY_TRAIT_JFD_MAORI_POTATAU_SHORT');
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------ 
-- Civilizations
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilizations 	
		(Type, 								DerivativeCiv,						SoundtrackTag,  MapImage, 						DawnOfManQuote, 							DawnOfManImage,				Description,							ShortDescription,							Adjective,									Civilopedia,											CivilopediaTag,									DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU',	'TXT_KEY_CIV_TAL_JFD_MAORI_DESC',	'Polynesia', 	'JFD_MapMaoriPotatau512.dds',	'TXT_KEY_CIV_DAWN_JFD_MAORI_POTATAU_TEXT',	'JFD_DOM_MaoriPotatau.dds',	'TXT_KEY_CIV_JFD_MAORI_POTATAU_DESC', 	'TXT_KEY_CIV_JFD_MAORI_POTATAU_SHORT_DESC',	'TXT_KEY_CIV_JFD_MAORI_POTATAU_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_MAORI_POTATAU_TEXT_1',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_MAORI_POTATAU',	'PLAYERCOLOR_JFD_MAORI_POTATAU',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_MAORI_POTATAU_ICON_ATLAS',	0,				'JFD_MAORI_POTATAU_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_POLYNESIA';

UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_CIV_TAL_JFD_MAORI_DESC'
WHERE Type = 'CIVILIZATION_MC_MAORI';

--JFD_MaoriPotatau_Civilizations
CREATE TRIGGER JFD_MaoriPotatau_Civilizations
AFTER INSERT ON Civilizations
WHEN NEW.Type != 'CIVILIZATION_MC_MAORI'
BEGIN
	UPDATE Civilizations
	SET DerivativeCiv = 'TXT_KEY_CIV_TAL_JFD_MAORI_DESC'
	WHERE Type = 'CIVILIZATION_MC_MAORI';
END;
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 					CityName)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_01'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_02'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_03'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_04'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_05'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_06'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_07'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_08'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_09'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_10'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_11'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_12'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_13'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_14'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_15'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_16'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_17'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_18'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_19'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_20'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_21'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_22'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_23'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_24'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_25'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_26'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_27'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_28'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_CITY_NAME_JFD_MAORI_POTATAU_29');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------ 		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'LEADER_JFD_MAORI_POTATAU');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_BuildingClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'BUILDINGCLASS_GARDEN',		'BUILDING_JFD_MARAE');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'UNITCLASS_LONGSWORDSMAN', 	'UNIT_JFD_TOA');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------ 
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------ 	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_0'),	
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_1'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_2'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_3'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_4'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_5'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_6'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_7'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_8'),
		('CIVILIZATION_JFD_MAORI_POTATAU', 	'TXT_KEY_SPY_NAME_JFD_MAORI_POTATAU_9');
--=======================================================================================================================
--=======================================================================================================================