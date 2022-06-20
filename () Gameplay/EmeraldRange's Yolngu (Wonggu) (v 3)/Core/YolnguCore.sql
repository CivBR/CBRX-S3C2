--==========================================
-- Yolngu under Wonggu
-- EmeraldRange
--==========================================
-- Mod Supports
-- See List on Steam
--==========================================
INSERT INTO Colors (Type,						Red,    Green,  Blue,  Alpha)
VALUES ('COLOR_PLAYER_ER_YOLNGU_BACKGROUND',	0.8000, 0.4157, 0.2667, 1.0), --Background is the main colour
	   ('COLOR_PLAYER_ER_YOLNGU_ICON',			0.1529, 0.1765, 0.2863, 1.0); --Icon is the colour of the borders and the image in the middle of your icon.

INSERT INTO PlayerColors (Type,	PrimaryColor,					SecondaryColor,						TextColor)
VALUES ('PLAYERCOLOR_ER_YOLNGU', 'COLOR_PLAYER_ER_YOLNGU_ICON',	'COLOR_PLAYER_ER_YOLNGU_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- CIVILIZATION BASE DEFINES
--==========================================================================================================================	
--This is the main definition: in working on it after the skeleton, go through this to replace the relevant art definitions that current use England or Elizabeth.
INSERT INTO Civilizations																																																			
		(Type, 					  Description, 					ShortDescription, 					Adjective, 							Civilopedia,				CivilopediaTag, 				 DefaultPlayerColor,   	  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, PortraitIndex, 		 IconAtlas, AlphaIconAtlas, 		 MapImage, 				  DawnOfManQuote, 					  DawnOfManImage, DawnOfManAudio,			   SoundtrackTag)					 
SELECT 	'CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIV_ER_YOLNGU_DESC', 'TXT_KEY_CIV_ER_YOLNGU_SHORT_DESC', 'TXT_KEY_CIV_ER_YOLNGU_ADJECTIVE',  'TXT_KEY_ER_YOLNGU_PEDIA',	'TXT_KEY_CIVILOPEDIA_ER_YOLNGU', 'PLAYERCOLOR_ER_YOLNGU', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, PortraitIndex, 'ER_YOLNGU_ATLAS', 'ER_ALPHA_YOLNGU_ATLAS', 'YolnguCartography.dds', 'TXT_KEY_CIV_DAWN_ER_YOLNGU_TEXT', 'YolnguDoM.dds', 'AS2D_DOM_SPEECH_ER_WONGGU', SoundtrackTag
FROM Civilizations WHERE Type = 'CIVILIZATION_POLYNESIA';

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_POLYNESIA' )
	THEN '_POLYNESIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_ER_YOLNGU';

-- Free Techs, Units and Buildings
INSERT INTO Civilization_FreeTechs(CivilizationType, TechType)
SELECT						'CIVILIZATION_ER_YOLNGU', TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_ER_YOLNGU',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
INSERT INTO Civilization_FreeBuildingClasses(CivilizationType, BuildingClassType)
SELECT								 'CIVILIZATION_ER_YOLNGU', BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';

--Add civ start bias and religion bias here
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
SELECT		'CIVILIZATION_ER_YOLNGU', 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_POLYNESIA');
		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 	StartAlongOcean)
VALUES		('CIVILIZATION_ER_YOLNGU', 		'1');	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				 RegionType)
VALUES		('CIVILIZATION_ER_YOLNGU', 	'REGION_JUNGLE');
--==========================================================================================================================	
-- LEADER
--==========================================================================================================================
--There are leader biases put in here (scroll to the right), but this is not the full extent of the biases at all.
INSERT INTO Leaders(Type, 				Description, 						Civilopedia, 					  CivilopediaTag, 			  ArtDefineTag, PortraitIndex,   IconAtlas,	VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, Boldness,  Diplobalance,	WarmongerHate,  DenounceWillingness, 	DoFWillingness, Loyalty, Neediness, Forgiveness, Chattiness, Meanness,  WorkAgainstWillingness, WorkWithWillingness)
SELECT			   'LEADER_ER_WONGGU', 'TXT_KEY_LEADER_ER_WONGGU_DESC', 	'TXT_KEY_LEADER_ER_WONGGU_PEDIA', 'TXT_KEY_LEADER_ER_WONGGU', 'YolnguScene.xml',  1, 'ER_YOLNGU_ATLAS',	3, 						1, 						4, 						 7, 		5, 			 	6, 				7, 						5, 				4, 		 5, 		3, 			 4,			 6, 	   	7,						6
FROM Leaders WHERE Type = 'LEADER_KAMEHAMEHA';

INSERT INTO Civilization_Leaders
VALUES ('CIVILIZATION_ER_YOLNGU', 'LEADER_ER_WONGGU');

INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 			MajorCivApproachType, 			Bias)
VALUES	('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_WAR', 		6),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_HOSTILE',	6),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 4),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_GUARDED', 	8),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_AFRAID', 	3),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_FRIENDLY', 	6),
		('LEADER_ER_WONGGU', 	'MAJOR_CIV_APPROACH_NEUTRAL', 	4);
		
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 			MinorCivApproachType, 			Bias)
VALUES 	('LEADER_ER_WONGGU', 	'MINOR_CIV_APPROACH_IGNORE', 	3),
		('LEADER_ER_WONGGU', 	'MINOR_CIV_APPROACH_FRIENDLY',  7),
		('LEADER_ER_WONGGU', 	'MINOR_CIV_APPROACH_PROTECTIVE',6),
		('LEADER_ER_WONGGU', 	'MINOR_CIV_APPROACH_CONQUEST',  2),
		('LEADER_ER_WONGGU', 	'MINOR_CIV_APPROACH_BULLY', 	2);
		
INSERT INTO Leader_Flavors
		(LeaderType, 			FlavorType, 					Flavor)
VALUES  ('LEADER_ER_WONGGU',	'FLAVOR_OFFENSE',				6),
		('LEADER_ER_WONGGU',	'FLAVOR_DEFENSE', 				8),
		('LEADER_ER_WONGGU',	'FLAVOR_CITY_DEFENSE', 	 		6),
		('LEADER_ER_WONGGU',	'FLAVOR_MILITARY_TRAINING',		5),
		('LEADER_ER_WONGGU',	'FLAVOR_RECON', 				8),
		('LEADER_ER_WONGGU',	'FLAVOR_RANGED',				4),
		('LEADER_ER_WONGGU',	'FLAVOR_MOBILE',				7),
		('LEADER_ER_WONGGU',	'FLAVOR_NAVAL',					8),
		('LEADER_ER_WONGGU',	'FLAVOR_NAVAL_RECON',			9),
		('LEADER_ER_WONGGU',	'FLAVOR_NAVAL_GROWTH',			8),
		('LEADER_ER_WONGGU',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',9),
		('LEADER_ER_WONGGU',	'FLAVOR_AIR', 					2),
		('LEADER_ER_WONGGU',	'FLAVOR_EXPANSION', 			3),
		('LEADER_ER_WONGGU',	'FLAVOR_GROWTH', 				7),
		('LEADER_ER_WONGGU',	'FLAVOR_TILE_IMPROVEMENT',		8),
		('LEADER_ER_WONGGU',	'FLAVOR_INFRASTRUCTURE',		3),
		('LEADER_ER_WONGGU',	'FLAVOR_PRODUCTION',			4),
		('LEADER_ER_WONGGU',	'FLAVOR_GOLD',					7),
		('LEADER_ER_WONGGU',	'FLAVOR_SCIENCE',				6),
		('LEADER_ER_WONGGU',	'FLAVOR_CULTURE',				8),
		('LEADER_ER_WONGGU',	'FLAVOR_HAPPINESS',				7),
		('LEADER_ER_WONGGU',	'FLAVOR_GREAT_PEOPLE',			8),
		('LEADER_ER_WONGGU',	'FLAVOR_WONDER',				2),
		('LEADER_ER_WONGGU',	'FLAVOR_RELIGION',				3),
		('LEADER_ER_WONGGU',	'FLAVOR_DIPLOMACY',				8),
		('LEADER_ER_WONGGU',	'FLAVOR_SPACESHIP',				2),
		('LEADER_ER_WONGGU',	'FLAVOR_WATER_CONNECTION', 		9),
		('LEADER_ER_WONGGU',	'FLAVOR_NUKE',					3),
		('LEADER_ER_WONGGU',	'FLAVOR_USE_NUKE',				3),
		('LEADER_ER_WONGGU',	'FLAVOR_ESPIONAGE',				7),
		('LEADER_ER_WONGGU',	'FLAVOR_ANTIAIR',				4),
		('LEADER_ER_WONGGU',	'FLAVOR_AIR_CARRIER',			2),
		('LEADER_ER_WONGGU',	'FLAVOR_ARCHAEOLOGY',			3),
		('LEADER_ER_WONGGU',	'FLAVOR_I_LAND_TRADE_ROUTE', 	7),
		('LEADER_ER_WONGGU',	'FLAVOR_I_SEA_TRADE_ROUTE',		8),
		('LEADER_ER_WONGGU',	'FLAVOR_I_TRADE_ORIGIN', 		4),
		('LEADER_ER_WONGGU',	'FLAVOR_I_TRADE_DESTINATION',	8),
		('LEADER_ER_WONGGU',	'FLAVOR_AIRLIFT',				2);
		
INSERT INTO Diplomacy_Responses
		(LeaderType,			ResponseType,							Response,									Bias)
VALUES	('LEADER_ER_WONGGU',	'RESPONSE_FIRST_GREETING',			'TXT_KEY_LEADER_ER_WONGGU_FIRSTGREETING%',	1),
		('LEADER_ER_WONGGU',	'RESPONSE_DEFEATED',				'TXT_KEY_LEADER_ER_WONGGU_DEFEATED%',		1),
		('LEADER_ER_WONGGU',	'RESPONSE_DOW_GENERIC',				'TXT_KEY_LEADER_ER_WONGGU_DECLAREWAR%',		1),
		('LEADER_ER_WONGGU',	'RESPONSE_ATTACKED_BETRAYED',		'TXT_KEY_LEADER_ER_WONGGU_ATTACKED%',		1),
		('LEADER_ER_WONGGU',	'RESPONSE_ATTACKED_STRONG_HOSTILE',	'TXT_KEY_LEADER_ER_WONGGU_ATTACKED%',		1),
		('LEADER_ER_WONGGU',	'RESPONSE_ATTACKED_WEAK_HOSTILE',	'TXT_KEY_LEADER_ER_WONGGU_ATTACKED%',		1),
		('LEADER_ER_WONGGU',	'RESPONSE_ATTACKED_HOSTILE',		'TXT_KEY_LEADER_ER_WONGGU_ATTACKED%',		1);
--==========================================================================================================================	
-- Unique Ability: Garma and Milngurr
--==========================================================================================================================
INSERT INTO Traits 
		(Type, 						Description, 						ShortDescription)
VALUES	('TRAIT_ER_GARMA_MILNGURR',	'TXT_KEY_TRAIT_ER_GARMA_MILNGURR', 	'TXT_KEY_TRAIT_ER_GARMA_MILNGURR_SHORT');	

INSERT INTO Leader_Traits(LeaderType, 	TraitType)
VALUES		('LEADER_ER_WONGGU',	'TRAIT_ER_GARMA_MILNGURR');

--==========================================================================================================================	
-- Unique Building: Larrakitj
--==========================================================================================================================	
INSERT INTO Buildings (Type, 		 BuildingClass, Cost, 	FaithCost, UnlockedByBelief, PrereqTech, Help, 									Description,					 		Civilopedia, 							Strategy, 									ArtDefineTag, 	MinAreaSize, 	HurryCostModifier, ConquestProb, GoldMaintenance,	FreeStartEra,	IconAtlas,	PortraitIndex,	DisplayPosition, 	ConquestProb,	AllowsRangeStrike, ConquestProb, Airlift, MutuallyExclusiveGroup, SpecialistType, SpecialistCount, GreatWorkSlotType,	GreatWorkCount, TradeRouteLandDistanceModifier)
SELECT     'BUILDING_ER_LARRAKITJ',  BuildingClass, Cost, 	FaithCost, UnlockedByBelief, PrereqTech, 'TXT_KEY_BUILDING_ER_LARRAKITJ_HELP', 	'TXT_KEY_BUILDING_ER_LARRAKITJ_DESC', 	'TXT_KEY_BUILDING_ER_LARRAKITJ_TEXT', 	'TXT_KEY_BUILDING_ER_LARRAKITJ_STRATEGY', 	ArtDefineTag, 	MinAreaSize,	HurryCostModifier, 80,			 0,					FreeStartEra,	'ER_YOLNGU_ATLAS',		3,	DisplayPosition,	ConquestProb,	AllowsRangeStrike, ConquestProb, Airlift, MutuallyExclusiveGroup, SpecialistType, SpecialistCount, 'GREAT_WORK_SLOT_MUSIC',			 1, 		50
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');

INSERT INTO Building_YieldChanges (BuildingType, YieldType, Yield)
SELECT 					 'BUILDING_ER_LARRAKITJ', YieldType, Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');
INSERT INTO Building_YieldModifiers (BuildingType, YieldType, Yield)
SELECT 					  'BUILDING_ER_LARRAKITJ', YieldType, Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');
INSERT INTO Building_FeatureYieldChanges (BuildingType, FeatureType, YieldType, Yield)
SELECT 					 	  'BUILDING_ER_LARRAKITJ', FeatureType, YieldType, Yield
FROM Building_FeatureYieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');

INSERT INTO Building_Flavors
		(BuildingType, 				FlavorType, 				Flavor)
VALUES	('BUILDING_ER_LARRAKITJ',	'FLAVOR_RELIGION',				40),
		('BUILDING_ER_LARRAKITJ',	'FLAVOR_I_TRADE_DESTINATION',	 5),
		('BUILDING_ER_LARRAKITJ', 	'FLAVOR_I_LAND_TRADE_ROUTE',  	 5),
		('BUILDING_ER_LARRAKITJ',	'FLAVOR_GREAT_PEOPLE',			 5);

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType, 	 	 BuildingType)
VALUES 	('CIVILIZATION_ER_YOLNGU',	'BUILDINGCLASS_TEMPLE', 'BUILDING_ER_LARRAKITJ');
--==========================================================================================================================	
-- Unique Unit: Lippa-lippa
--==========================================================================================================================	
INSERT INTO Units
			(Type, 				Combat,	Class, Cost, FaithCost,	RequiresFaithPurchaseEnabled, NoMaintenance, Special, CombatClass, CombatLimit, Moves, IgnoreBuildingDefense, Pillage, CivilianAttackPriority, Special, PrereqTech,	ObsoleteTech, GoodyHutUpgradeUnitClass, Domain, BaseGold, NumGoldPerEra, DefaultUnitAI, WorkRate, CombatLimit, MilitarySupport, MilitaryProduction, DontShowYields, WorkRate, MoveRate, XPValueAttack, XPValueDefense, Description, 			Civilopedia, 					Strategy,				 		  Help,						    AdvancedStartCost, UnitArtInfoEraVariation, UnitArtInfo, UnitFlagIconOffset, UnitFlagAtlas,	PortraitIndex, 	  IconAtlas)
SELECT		'UNIT_ER_LIPPA',	Combat,	Class, Cost, FaithCost, RequiresFaithPurchaseEnabled, NoMaintenance, Special, CombatClass, CombatLimit, Moves, IgnoreBuildingDefense, Pillage, CivilianAttackPriority, Special, PrereqTech, ObsoleteTech, GoodyHutUpgradeUnitClass, Domain, BaseGold, NumGoldPerEra, DefaultUnitAI, WorkRate, CombatLimit, MilitarySupport, MilitaryProduction, DontShowYields, WorkRate, MoveRate, XPValueAttack, XPValueDefense, 'TXT_KEY_UNIT_ER_LIPPA', 'TXT_KEY_CIV5_UNIT_ER_LIPPA',   'TXT_KEY_UNIT_ER_LIPPA_STRATEGY', 'TXT_KEY_UNIT_ER_LIPPA_HELP', AdvancedStartCost, 0,		    'ART_DEF_UNIT_ER_LIPPA', 0,				   'ER_LIPPA_FLAG',	2,	       'ER_YOLNGU_ATLAS'
FROM Units WHERE (Type = 'UNIT_TRIREME');

INSERT INTO UnitGameplay2DScripts
		(UnitType, 			SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_ER_LIPPA',	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_TRIREME');
INSERT INTO Unit_Builds
		(UnitType,			BuildType)
SELECT 	'UNIT_ER_LIPPA',	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_TRIREME');
INSERT INTO Unit_AITypes
		(UnitType,		  UnitAIType)
SELECT	'UNIT_ER_LIPPA', UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_TRIREME';

INSERT INTO Unit_FreePromotions
				(UnitType,	PromotionType)
SELECT   'UNIT_ER_LIPPA',	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Unit_Flavors
		(UnitType, 			FlavorType,				   Flavor)
VALUES	('UNIT_ER_LIPPA',	'FLAVOR_NAVAL', 				7),
		('UNIT_ER_LIPPA',	'FLAVOR_NAVAL_RECON',   		4),
		('UNIT_ER_LIPPA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT',3);

INSERT INTO Unit_ClassUpgrades
		(UnitType,			UnitClassType)
SELECT  'UNIT_ER_LIPPA',	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_TRIREME');

INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 		  UnitClassType,		UnitType)
VALUES	('CIVILIZATION_ER_YOLNGU', 'UNITCLASS_TRIREME', 	'UNIT_ER_LIPPA');
--==========================================================================================================================
--City Names can be added: there is a lua script that can generate this SQL fully for you.
INSERT INTO Civilization_CityNames (CivilizationType, CityName) 
VALUES  ('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_1'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_2'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_3'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_4'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_5'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_6'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_7'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_8'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_9'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_10'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_11'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_12'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_13'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_14'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_15'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_16'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_17'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_18'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_19'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_20'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_21'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_22'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_23'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_24'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_25'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_26'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_27'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_28'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_29'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_30'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_31'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_32'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_33'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_34'),
		('CIVILIZATION_ER_YOLNGU', 'TXT_KEY_CIVILIZATION_ER_YOLNGU_CITY_35');

--Spy Names
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 			SpyName)
VALUES	('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_0'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_1'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_2'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_3'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_4'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_5'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_6'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_7'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_8'),
		('CIVILIZATION_ER_YOLNGU',	'TXT_KEY_SPY_NAME_ER_YOLNGU_9');
