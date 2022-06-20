--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- BuildingClasses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
            (Type,						DefaultBuilding,			Description)
VALUES      ('BUILDINGCLASS_GT_QOCHO', 'BUILDING_GT_KARIZ_TRADE',	'TXT_KEY_BUILDING_GT_KARIZ_TRADE');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
       (Type,                 	BuildingClass, Cost, FoodKept,    GoldMaintenance, River, 	HurryCostModifier, MinAreaSize, ConquestProb, ArtDefineTag, Description,              		Strategy,                              Civilopedia,                      	 Help,                              PrereqTech, IconAtlas,         	PortraitIndex)
SELECT 'BUILDING_GT_KARIZ',  	BuildingClass, Cost, FoodKept-20, GoldMaintenance, 1, 		HurryCostModifier, MinAreaSize, ConquestProb, ArtDefineTag, 'TXT_KEY_BUILDING_GT_KARIZ', 	'TXT_KEY_BUILDING_GT_KARIZ_STRATEGY', 'TXT_KEY_BUILDING_GT_KARIZ_TEXT', 	'TXT_KEY_BUILDING_GT_KARIZ_HELP', 	PrereqTech, 'GT_QOCHO_ATLAS', 	4
FROM Buildings WHERE Type = 'BUILDING_AQUEDUCT';
--------------------------------------------------------------------------------------------------------------------------
-- Buildings: Invisible
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
			(Type, 						 			BuildingClass, 						Description,						GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_GT_KARIZ_TRADE', 			'BUILDINGCLASS_GT_QOCHO',			'TXT_KEY_BUILDING_GT_KARIZ_TRADE',		-1, 			-1,   -1, 		 null,			1),
			('BUILDING_GT_CHAKAR_CHEAPER', 			'BUILDINGCLASS_GT_QOCHO',			'TXT_KEY_BUILDING_GT_CHAKAR_CHEAPER',	-1, 			-1,   -1, 		 null,			1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class,	CombatClass, WorkRate, PrereqTech, Combat,	 FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description, 				Help, 							Strategy, 								 Civilopedia, 						MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 			  UnitFlagAtlas, 			UnitFlagIconOffset,	IconAtlas,			PortraitIndex,	MoveRate)
SELECT	'UNIT_GT_CHAKAR',	Class,	CombatClass, WorkRate, PrereqTech, Combat-1, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, CombatClass, Domain, DefaultUnitAI, CivilianAttackPriority, Special, 'TXT_KEY_UNIT_GT_CHAKAR',	'TXT_KEY_UNIT_GT_CHAKAR_HELP',	'TXT_KEY_UNIT_GT_CHAKAR_STRATEGY', 	 'TXT_KEY_CIV5_GT_CHAKAR_TEXT',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_GT_CHAKAR', 'GT_QOCHO_UNIT_FLAG_ATLAS',	0,					'GT_QOCHO_ATLAS',	3,				MoveRate
FROM Units WHERE Type = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_CHAKAR',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_GT_CHAKAR',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_GT_CHAKAR',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
            (Type,                   Description,                    Help,                                Sound,             CannotBeChosen, CombatPercent, PortraitIndex, IconAtlas,      PediaType,        PediaEntry,                     IgnoreZOC)
VALUES      ('PROMOTION_GT_CHAKAR', 'TXT_KEY_PROMOTION_GT_CHAKAR', 'TXT_KEY_PROMOTION_GT_CHAKAR_HELP', 'AS2D_IF_LEVELUP', 1,           10,            59,           'ABILITY_ATLAS', 'PEDIA_SHARED',  'TXT_KEY_PROMOTION_GT_CHAKAR',  1);
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_GT_CHAKAR',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_FreePromotions
           (UnitType,       PromotionType)
VALUES     ('UNIT_GT_CHAKAR', 'PROMOTION_GT_CHAKAR');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	'UNIT_GT_CHAKAR',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_ProductionModifierBuildings
		(UnitType, 			BuildingType, 					ProductionModifier)
VALUES	('UNIT_GT_CHAKAR',	'BUILDING_GT_CHAKAR_CHEAPER', 	20);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 					    Description, 					Civilopedia, 						    CivilopediaTag, 					ArtDefineTag, 		    VictoryCompetitiveness, 	WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES	('LEADER_GT_SUNGULUG', 	'TXT_KEY_LEADER_GT_SUNGULUG',	'TXT_KEY_LEADER_GT_SUNGULUG_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_SUNGULUG', 	'Sungulug_Diplo.xml',	6, 							3, 						3, 							9, 			8, 				8, 				9, 						9, 				2, 			9, 			5, 				7, 			8, 			'GT_QOCHO_ATLAS', 	1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 			    MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_AFRAID', 		5),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_GT_SUNGULUG', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 			     MinorCivApproachType, 				Bias)
VALUES	('LEADER_GT_SUNGULUG', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_SUNGULUG', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_GT_SUNGULUG', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_GT_SUNGULUG', 	'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_GT_SUNGULUG', 	'MINOR_CIV_APPROACH_BULLY', 		3);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 			    FlavorType, 						Flavor)
VALUES	('LEADER_GT_SUNGULUG', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_RECON', 					4),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_RANGED', 					4),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_MOBILE', 					7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_NAVAL', 					2),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_AIR', 						7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_EXPANSION', 				6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_GROWTH', 					7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_PRODUCTION', 				7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_GOLD', 						7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_SCIENCE', 					6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_CULTURE', 					7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_HAPPINESS', 				5),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_WONDER', 					4),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_RELIGION', 					8),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_DIPLOMACY', 				6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_WATER_CONNECTION', 			8),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_NUKE', 						5),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_USE_NUKE', 					7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_ESPIONAGE', 				6),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_AIRLIFT', 					7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		3),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_ARCHAEOLOGY', 				7),
		('LEADER_GT_SUNGULUG', 	'FLAVOR_AIR_CARRIER', 				4);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 			TraitType)
VALUES	('LEADER_GT_SUNGULUG', 	'TRAIT_GT_QOCHO');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						ShortDescription)
VALUES	('TRAIT_GT_QOCHO', 			'TXT_KEY_TRAIT_GT_QOCHO',			'TXT_KEY_TRAIT_GT_QOCHO_SHORT');
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 			ResponseType, 									Response, 															Bias)
VALUES 	('LEADER_GT_SUNGULUG', 	'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_GT_SUNGULUG_ATTACKED_GENERIC%', 					500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_GT_SUNGULUG_DEFEATED%', 							500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_GT_SUNGULUG_DOW_GENERIC%', 							500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_EXPANSION_SERIOUS_WARNING', 			'TXT_KEY_LEADER_GT_SUNGULUG_EXPANSION_SERIOUS_WARNING%', 			500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_GT_SUNGULUG_FIRSTGREETING%', 						500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_GREETING_AT_WAR_HOSTILE', 			'TXT_KEY_LEADER_GT_SUNGULUG_GREETING_AT_WAR_HOSTILE%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_GREETING_POLITE_HELLO', 				'TXT_KEY_LEADER_GT_SUNGULUG_GREETING_POLITE_HELLO%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_GREETING_NEUTRAL_HELLO', 				'TXT_KEY_LEADER_GT_SUNGULUG_GREETING_NEUTRAL_HELLO%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_GREETING_HOSTILE_HELLO', 				'TXT_KEY_LEADER_GT_SUNGULUG_GREETING_HOSTILE_HELLO%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 'TXT_KEY_LEADER_GT_SUNGULUG_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_INFLUENTIAL_ON_AI', 					'TXT_KEY_LEADER_GT_SUNGULUG_INFLUENTIAL_ON_AI%', 					500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_INFLUENTIAL_ON_HUMAN', 				'TXT_KEY_LEADER_GT_SUNGULUG_INFLUENTIAL_ON_HUMAN%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_LETS_HEAR_IT', 						'TXT_KEY_LEADER_GT_SUNGULUG_LETS_HEAR_IT%', 						500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_LUXURY_TRADE', 						'TXT_KEY_LEADER_GT_SUNGULUG_LUXURY_TRADE%', 						500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_NO_PEACE', 							'TXT_KEY_LEADER_GT_SUNGULUG_NO_PEACE%', 							500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_OPEN_BORDERS_EXCHANGE', 				'TXT_KEY_LEADER_GT_SUNGULUG_OPEN_BORDERS_EXCHANGE%', 				500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_PEACE_MADE_BY_HUMAN_GRACIOUS', 		'TXT_KEY_LEADER_GT_SUNGULUG_LOSEWAR%', 								500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_REPEAT_NO', 							'TXT_KEY_LEADER_GT_SUNGULUG_REPEAT_NO%', 							500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_RESPONSE_REQUEST', 					'TXT_KEY_LEADER_GT_SUNGULUG_RESPONSE_REQUEST%', 					500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED', 		'TXT_KEY_LEADER_GT_SUNGULUG_RESPONSE_TO_BEING_DENOUNCED%', 			500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_TOO_SOON_NO_PEACE', 					'TXT_KEY_LEADER_GT_SUNGULUG_TOO_SOON_NO_PEACE_1%', 					500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_WINNER_PEACE_OFFER', 					'TXT_KEY_LEADER_GT_SUNGULUG_WINWAR%', 								500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_WORK_AGAINST_SOMEONE', 				'TXT_KEY_LEADER_GT_SUNGULUG_DENOUNCE%', 							500),
		('LEADER_GT_SUNGULUG', 	'RESPONSE_WORK_WITH_US', 						'TXT_KEY_LEADER_GT_SUNGULUG_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations 	
		(Type, 						Description,					ShortDescription,					Adjective,							Civilopedia, 					CivilopediaTag, 			DefaultPlayerColor,		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			PortraitIndex,	AlphaIconAtlas,			SoundtrackTag,  MapImage, 				DawnOfManQuote, 					DawnOfManImage)
SELECT 'CIVILIZATION_GT_QOCHO',   'TXT_KEY_CIV_GT_QOCHO_DESC',	'TXT_KEY_CIV_GT_QOCHO_SHORT_DESC',	'TXT_KEY_CIV_GT_QOCHO_ADJECTIVE',	'TXT_KEY_CIV5_GT_QOCHO_TEXT_1','TXT_KEY_CIV5_GT_QOCHO',	'PLAYERCOLOR_GT_QOCHO',ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'GT_QOCHO_ATLAS',	0,				'GT_QOCHO_ALPHA_ATLAS','Mongol', 		'Qocho_Map.dds',	   'TXT_KEY_CIV5_DAWN_GT_QOCHO_TEXT',	'Qocho_DOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_MONGOL';	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 			CityName)
VALUES	('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_01'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_02'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_03'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_04'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_05'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_06'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_07'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_08'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_09'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_10'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_11'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_12'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_13'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_14'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_15'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_16'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_17'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_18'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_19'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_20'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_21'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_22'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_23'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_24'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_25'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_25'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_26'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_27'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_28'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_29'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_30'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_31'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_32'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_33'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_34'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_35'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_36'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_37'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_38'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_39'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_40'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_41'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_42'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_43'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_44'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_45'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_46'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_47'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_48'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_49'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_CITY_NAME_GT_QOCHO_50');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 			BuildingClassType)
SELECT	'CIVILIZATION_GT_QOCHO', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 			TechType)
SELECT	'CIVILIZATION_GT_QOCHO', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_GT_QOCHO', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_MONGOL';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_GT_QOCHO',	'LEADER_GT_SUNGULUG');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_GT_QOCHO', 	'BUILDINGCLASS_AQUEDUCT',	'BUILDING_GT_KARIZ');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_GT_QOCHO', 	'UNITCLASS_HORSEMAN',		'UNIT_GT_CHAKAR');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 			ReligionType)
VALUES	('CIVILIZATION_GT_QOCHO',	'RELIGION_BUDDHISM');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 			RegionType)
VALUES	('CIVILIZATION_GT_QOCHO',	'REGION_DESERT'),
		('CIVILIZATION_GT_QOCHO',	'REGION_HILLS');	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_River
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Along_River
           (CivilizationType,  		StartAlongRiver)
VALUES     ('CIVILIZATION_GT_QOCHO', 1);
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_River
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 			RegionType)
VALUES	('CIVILIZATION_GT_QOCHO',	'REGION_JUNGLE');		
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_0'),	
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_1'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_2'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_3'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_4'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_5'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_6'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_7'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_8'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_9'),
		('CIVILIZATION_GT_QOCHO', 	'TXT_KEY_SPY_NAME_GT_QOCHO_10');
--==========================================================================================================================
--==========================================================================================================================
