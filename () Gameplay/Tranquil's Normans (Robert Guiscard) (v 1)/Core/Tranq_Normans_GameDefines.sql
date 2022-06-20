--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- UNITPROMOTIONS
--=======================================================================================================================
-- UnitPromotions
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions		
		(Type, 										Sound, 				CannotBeChosen, LostWithUpgrade)
VALUES	('PROMOTION_TRANQ_EQUITES',					'AS2D_IF_LEVELUP', 	1, 				0),
		('PROMOTION_TRANQ_CONQUEROR',			'AS2D_IF_LEVELUP', 	1, 				0);

update UnitPromotions set Description = 'TXT_KEY_'||Type 
where Type in ( 'PROMOTION_TRANQ_EQUITES',
				'PROMOTION_TRANQ_CONQUEROR');
update UnitPromotions set Help = Description||'_HELP'
where Type in ( 'PROMOTION_TRANQ_EQUITES',
				'PROMOTION_TRANQ_CONQUEROR');
update UnitPromotions set PediaEntry = Help 
where Type in ( 'PROMOTION_TRANQ_EQUITES',
				'PROMOTION_TRANQ_CONQUEROR');
update UnitPromotions set IconAtlas = 'ABILITY_ATLAS', PortraitIndex = 59, PediaType = 'PEDIA_ATTRIBUTES' 
where Type in ( 'PROMOTION_TRANQ_EQUITES',
				'PROMOTION_TRANQ_CONQUEROR');

-------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitCombats
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions_UnitCombats 
        (PromotionType,                         UnitCombatType)
VALUES    ('PROMOTION_TRANQ_EQUITES',                'UNITCOMBAT_MOUNTED');
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
-- Units
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 						Class, Cost,   Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat,	  CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	Description, 						Help, 									Strategy,									Civilopedia, 								Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, UnitArtInfo,						XPValueAttack, XPValueDefense, UnitFlagIconOffset,  UnitFlagAtlas,							MoveRate, PortraitIndex,	IconAtlas)
SELECT	'UNIT_TRANQ_EQUITES',			Class, Cost+10, Moves, FaithCost,	RequiresFaithPurchaseEnabled, GoodyHutUpgradeUnitClass, PrereqTech, Combat+4, CombatClass, Domain, DefaultUnitAI, ObsoleteTech,	'TXT_KEY_UNIT_TRANQ_EQUITES', 			'TXT_KEY_UNIT_TRANQ_EQUITES_HELP',			'TXT_KEY_UNIT_TRANQ_EQUITES_STRATEGY',			'TXT_KEY_UNIT_TRANQ_EQUITES_TEXT',				Pillage, HurryCostModifier, AdvancedStartCost, CombatLimit, 'ART_DEF_UNIT_TRANQ_EQUITES',			XPValueAttack, XPValueDefense, 0,					'TRANQ_EQUITES_UNIT_FLAG_ATLAS',			MoveRate, 2, 				'TRANQ_NORMANS_ICON_ATLAS'
FROM Units WHERE Type = 'UNIT_KNIGHT';	

INSERT INTO Units 	
		(Type, 					    Class, PrereqTech,	Cost, Combat,	Moves,	CivilianAttackPriority,	Special,	Domain, DefaultUnitAI, Description, 								Civilopedia, 									Strategy, 											Help, 			AdvancedStartCost,	WorkRate,	CombatLimit,	DontShowYields, UnitArtInfo, 	UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,			MoveRate)
SELECT	('UNIT_TRANQ_CONQUEROR'),	Class,	PrereqTech,	Cost, Combat,	Moves,	CivilianAttackPriority,	Special,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_TRANQ_CONQUEROR',	'TXT_KEY_UNIT_TRANQ_CONQUEROR_TEXT',	'TXT_KEY_UNIT_TRANQ_CONQUEROR_STRATEGY',	'TXT_KEY_UNIT_TRANQ_CONQUEROR_HELP',	AdvancedStartCost,	WorkRate,	CombatLimit,	DontShowYields, UnitArtInfo,	0,					'TRANQ_CONQUEROR_UNIT_FLAG_ATLAS',	3, 			'TRANQ_NORMANS_ICON_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_GREAT_GENERAL');
-----------------------------------------------------------------------------
-- UnitGameplay2DScripts
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_TRANQ_EQUITES', 				SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_TRANQ_CONQUEROR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_TRANQ_EQUITES',				UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_TRANQ_CONQUEROR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Builds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
SELECT	'UNIT_TRANQ_CONQUEROR', 	BuildType
FROM Unit_Builds WHERE UnitType = 'UNIT_GREAT_GENERAL';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_TRANQ_EQUITES', 				UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_TRANQ_CONQUEROR', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_GREAT_GENERAL';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_TRANQ_EQUITES',				FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_TRANQ_CONQUEROR',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
-------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
-------------------------------------------------------------------------------------------------------------------------
insert into Unit_FreePromotions
		(UnitType, 						PromotionType)
select	'UNIT_TRANQ_EQUITES',				PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_TRANQ_CONQUEROR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions     
        (UnitType,                             PromotionType)
VALUES    ('UNIT_TRANQ_EQUITES',                'PROMOTION_TRANQ_EQUITES'),
        ('UNIT_TRANQ_CONQUEROR',                'PROMOTION_TRANQ_CONQUEROR');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 				UniqueName)
VALUES	('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_01'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_02'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_03'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_04'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_05'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_06'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_07'),
		('UNIT_TRANQ_CONQUEROR', 	'TXT_KEY_GREAT_PERSON_TRANQ_CONQUEROR_08');
--=======================================================================================================================	
-- LEADERS
--=======================================================================================================================	
-- Leaders
-------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders			
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 							PortraitIndex)
VALUES	('LEADER_TRANQ_NORMANS', 	'TXT_KEY_LEADER_TRANQ_NORMANS', 	'TXT_KEY_LEADER_TRANQ_NORMANS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_TRANQ_NORMANS', 	'RobertGuiscard.xml',	8, 						2, 						7, 							8, 			7, 				5, 				2, 						5, 				5, 			3, 			2, 				4, 			8, 			'TRANQ_NORMANS_ICON_ATLAS', 	1);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
-------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_HOSTILE', 		9),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_TRANQ_NORMANS', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
-------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_TRANQ_NORMANS', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_TRANQ_NORMANS', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_TRANQ_NORMANS', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	5),
		('LEADER_TRANQ_NORMANS', 	'MINOR_CIV_APPROACH_CONQUEST', 		9),
		('LEADER_TRANQ_NORMANS', 	'MINOR_CIV_APPROACH_BULLY', 		9);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
-------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_TRANQ_NORMANS', 	'FLAVOR_OFFENSE', 					9),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_CITY_DEFENSE', 				9),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_RECON', 					2),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_RANGED', 					5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_MOBILE', 					6),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_NAVAL', 					4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_AIR', 						6),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_EXPANSION', 				7),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_GROWTH', 					5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_GOLD', 						6),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_CULTURE', 					5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_WONDER', 					2),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_RELIGION', 					4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_SPACESHIP', 				4),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_NUKE', 						6),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_USE_NUKE', 					8),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_AIRLIFT', 					3),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_TRANQ_NORMANS', 	'FLAVOR_AIR_CARRIER', 				5);
-------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_TRANQ_NORMANS',	'TRAIT_TRANQ_NORMANS');
--=======================================================================================================================	
-- DIPLOMACY
--=======================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
-------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 							 Response, 																Bias)
VALUES 	('LEADER_TRANQ_NORMANS',	'RESPONSE_AI_DOF_BACKSTAB', 			 'TXT_KEY_LEADER_TRANQ_NORMANS_DENOUNCE_FRIEND%', 			500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_ATTACKED_HOSTILE', 			 'TXT_KEY_LEADER_TRANQ_NORMANS_ATTACKED_HOSTILE%', 			500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_DEFEATED', 					 'TXT_KEY_LEADER_TRANQ_NORMANS_DEFEATED%', 					500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_DOW_GENERIC', 				 'TXT_KEY_LEADER_TRANQ_NORMANS_DOW_GENERIC%', 				500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_FIRST_GREETING', 				 'TXT_KEY_LEADER_TRANQ_NORMANS_FIRSTGREETING%', 				500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  'TXT_KEY_LEADER_TRANQ_NORMANS_RESPONSE_TO_BEING_DENOUNCED%',	500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_WORK_AGAINST_SOMEONE', 		 'TXT_KEY_LEADER_TRANQ_NORMANS_DENOUNCE%', 					500),
		('LEADER_TRANQ_NORMANS',	'RESPONSE_WORK_WITH_US', 				 'TXT_KEY_LEADER_TRANQ_NORMANS_DEC_FRIENDSHIP%', 				500);
--=======================================================================================================================	
-- TRAITS
--=======================================================================================================================	
-- Traits
-------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 						  ShortDescription)
VALUES	('TRAIT_TRANQ_NORMANS',	'TXT_KEY_TRAIT_TRANQ_NORMANS',  'TXT_KEY_TRAIT_TRANQ_NORMANS_SHORT');	
--=======================================================================================================================	
-- CIVILIZATIONS
--=======================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
-- Civilizations
-------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilizations 	
		(Type, 									Description, 								ShortDescription,                                      DerivativeCiv,			Adjective, 		Civilopedia, 	CivilopediaTag,     DefaultPlayerColor, 		   ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 							DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_TRANQ_NORMANS',		'TXT_KEY_CIV_TRANQ_NORMANS_DESC',		'TXT_KEY_CIV_TRANQ_NORMANS_SHORT_DESC', 'CIVILIZATION_FRANCE',  'TXT_KEY_CIV_TRANQ_NORMANS_ADJECTIVE',	Civilopedia, 	CivilopediaTag,		'PLAYERCOLOR_TRANQ_NORMANS', 	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'TRANQ_NORMANS_ICON_ATLAS', 	0, 				'TRANQ_NORMANS_ALPHA_ATLAS', 	'France', 		'NormansMap.dds', 	'TXT_KEY_CIV5_DOM_TRANQ_ROBERTGUISCARD_TEXT', 	'NormansDOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_FRANCE';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
-------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_01'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_02'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_03'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_04'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_05'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_06'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_07'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_08'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_09'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_10'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_11'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_12'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_13'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_14'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_15'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_16'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_17'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_18'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_19'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_20'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_21'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_22'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_23'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_24'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_25'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_26'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_27'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_28'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_29'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_30'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_31'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_32'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_33'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_34'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_35'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_CITY_NAME_TRANQ_NORMANS_36');
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
-------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_TRANQ_NORMANS',		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_TRANQ_NORMANS',		TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_TRANQ_NORMANS',		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_FRANCE';
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
-------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	'LEADER_TRANQ_NORMANS');	
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	'UNITCLASS_KNIGHT', 	'UNIT_TRANQ_EQUITES'),
		('CIVILIZATION_TRANQ_NORMANS', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_TRANQ_CONQUEROR');
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_TRANQ_NORMANS',	'RELIGION_CHRISTIANITY');	
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Along_Ocean
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	1);	
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Start_Place_First_Along_Ocean
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Start_Place_First_Along_Ocean 
		(CivilizationType, 						PlaceFirst)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	1);				
-------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
-------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_0'),	
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_1'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_2'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_3'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_4'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_5'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_6'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_7'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_8'),
		('CIVILIZATION_TRANQ_NORMANS', 	'TXT_KEY_SPY_NAME_TRANQ_NORMANS_9');
--=======================================================================================================================
--=======================================================================================================================
