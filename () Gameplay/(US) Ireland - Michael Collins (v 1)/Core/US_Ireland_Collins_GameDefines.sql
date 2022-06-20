--==========================================================================================================================
-- US_Ireland_TourismCount
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS US_Ireland_TourismCount(numTourism INTEGER DEFAULT 0);
INSERT INTO US_Ireland_TourismCount(numTourism) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30),
(31),
(32),
(33),
(34),
(35),
(36),
(37),
(38),
(39),
(40),
(41),
(42),
(43),
(44),
(45),
(46),
(47),
(48),
(49),
(50);
--==========================================================================================================================	
-- BUILDINGCLASSES
--==========================================================================================================================	
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 										Type, 													Description)
VALUES	('BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN',		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN', 	'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN'),
		('BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER',		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_WRITER', 	'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER'),
		('BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST',		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_ARTIST', 	'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST'),
		('BUILDING_US_AUGUST_DESTINY_DEFENSE',					'BUILDINGCLASS_US_AUGUST_DESTINY_DEFENSE', 				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_DEFENSE'),
		('BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS',		'BUILDINGCLASS_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS', 	'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS'),
		('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS',		'BUILDINGCLASS_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS', 'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS'),
		('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND',			'BUILDINGCLASS_US_PUBLIC_HOUSE_HAPPINESS_IRELAND',		'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND');

INSERT OR REPLACE INTO BuildingClasses
		(Type,																DefaultBuilding,												Description)
SELECT	'BUILDINGCLASS_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_'||numTourism,	'BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_'||numTourism,	'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS'
FROM US_Ireland_TourismCount;

INSERT OR REPLACE INTO BuildingClasses
		(Type,																DefaultBuilding,												Description)
SELECT	'BUILDINGCLASS_US_AUGUST_DESTINY_TOURISM_'||numTourism,				'BUILDING_US_AUGUST_DESTINY_TOURISM_'||numTourism,				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_TOURISM'
FROM US_Ireland_TourismCount;
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	FreeStartEra,	GreatWorkSlotType,			GreatWorkCount,	Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag,	MinAreaSize,	ConquestProb,	HurryCostModifier,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_US_PUBLIC_HOUSE'),	BuildingClass,	Cost,	GoldMaintenance,	PrereqTech,	FreeStartEra,	'GREAT_WORK_SLOT_MUSIC',	1,				('TXT_KEY_BUILDING_US_PUBLIC_HOUSE'),	('TXT_KEY_CIV5_US_PUBLIC_HOUSE_TEXT'),	('TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HELP'),	('TXT_KEY_BUILDING_US_PUBLIC_HOUSE_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				HurryCostModifier,	2, 				('US_IRELAND_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_THEATRE');

INSERT INTO Buildings 	
		(Type, 													BuildingClass,												Cost,	GoldMaintenance,	PrereqTech,	FreeStartEra,	GreatWorkSlotType,	GreatWorkCount,	Happiness,	Description, 													Civilopedia, 													Help, 																Strategy,																ArtDefineTag,	MinAreaSize,	ConquestProb,	HurryCostModifier,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS'),	('BUILDINGCLASS_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS'),	-1,		0,					NULL,		FreeStartEra,	NULL,				0,				1,			('TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS'),	('TXT_KEY_CIV5_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS_TEXT'),	('TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS_HELP'),	('TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_FOREIGN_CIVS_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				HurryCostModifier,	2, 				('US_IRELAND_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_US_PUBLIC_HOUSE');

INSERT INTO Buildings
		(Type, 						 							BuildingClass, 											Cost,	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	SpecialistType,			SpecialistCount,	Defense,	Happiness,	PrereqTech,	MinAreaSize,	Description, 													Help,															ConquestProb,	IconAtlas,			PortraitIndex)
VALUES	('BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN', 		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN',	-1,		-1,			NULL,				0,				'SPECIALIST_MUSICIAN',	1,					0,			0,			NULL,		-1,				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN',		'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_MUSICIAN_HELP',	0,				'US_IRELAND_ATLAS',	0),
		('BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER', 		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_WRITER',	-1,		-1,			NULL,				0,				'SPECIALIST_WRITER',	1,					0,			0,			NULL,		-1,				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER',			'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_WRITER_HELP',	0,				'US_IRELAND_ATLAS',	0),
		('BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST', 		'BUILDINGCLASS_US_AUGUST_DESTINY_SPECIALIST_ARTIST',	-1,		-1,			NULL,				0,				'SPECIALIST_ARTIST',	1,					0,			0,			NULL,		-1,				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST',			'TXT_KEY_BUILDING_US_AUGUST_DESTINY_SPECIALIST_ARTIST_HELP',	0,				'US_IRELAND_ATLAS',	0),
		('BUILDING_US_AUGUST_DESTINY_DEFENSE', 					'BUILDINGCLASS_US_AUGUST_DESTINY_DEFENSE',				-1,		-1,			NULL,				-1,				NULL,					0,					200,		0,			NULL,		-1,				'TXT_KEY_BUILDING_US_AUGUST_DESTINY_DEFENSE',					'TXT_KEY_BUILDING_US_AUGUST_DESTINY_DEFENSE_HELP',				0,				NULL,				-1),
		('BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS', 		'BUILDINGCLASS_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS',	-1,		-1,			NULL,				-1,				NULL,					0,					0,			2,			NULL,		-1,				'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS',		'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS_HELP',	0,				NULL,				-1),
		('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND', 			'BUILDINGCLASS_US_PUBLIC_HOUSE_HAPPINESS_IRELAND',		-1,		-1,			NULL,				-1,				NULL,					0,					0,			1,			NULL,		-1,				'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND',			'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND_HELP',		0,				NULL,				-1);

INSERT INTO Buildings
		(Type,															BuildingClass,														Description,												GreatWorkCount,	Civilopedia,	NukeImmune, ConquestProb,	Cost,	FaithCost,	PrereqTech,	EnhancedYieldTech,		TechEnhancedTourism,	IconAtlas,	PortraitIndex)
SELECT	'BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_'||numTourism,	'BUILDINGCLASS_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_'||numTourism,	'TXT_KEY_BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS',	-1,				null,			1,			100,			-1,		-1,			NULL,		'TECH_PRINTING_PRESS',	numTourism,				null,		0
FROM US_Ireland_TourismCount;

INSERT INTO Buildings
		(Type,												BuildingClass,											Description,									GreatWorkCount,	Civilopedia,	NukeImmune, ConquestProb,	Cost,	FaithCost,	PrereqTech,	EnhancedYieldTech,		TechEnhancedTourism,	IconAtlas,	PortraitIndex)
SELECT	'BUILDING_US_AUGUST_DESTINY_TOURISM_'||numTourism,	'BUILDINGCLASS_US_AUGUST_DESTINY_TOURISM_'||numTourism,	'TXT_KEY_BUILDING_US_AUGUST_DESTINY_TOURISM',	-1,				null,			1,			100,			-1,		-1,			NULL,		'TECH_AGRICULTURE',		numTourism,				null,		0
FROM US_Ireland_TourismCount;
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,		Flavor)
SELECT	('BUILDING_US_PUBLIC_HOUSE'),	FlavorType,		Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_THEATRE');

INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
VALUES	('BUILDING_US_PUBLIC_HOUSE',	'FLAVOR_CULTURE',	25);
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 									YieldType,			Yield)
VALUES	('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND',	'YIELD_CULTURE',	2);
		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 										YieldType,			Yield)
SELECT	'BUILDING_US_AUGUST_DESTINY_TOURISM_'||numTourism,	'YIELD_CULTURE',	numTourism
FROM US_Ireland_TourismCount;
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	('BUILDING_US_PUBLIC_HOUSE'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_THEATRE');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 				Class, 	PrereqTech,	Combat,	Cost,		FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain, DefaultUnitAI, Description, 				Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, ObsoleteTech,	GoodyHutUpgradeUnitClass,	XPValueAttack,	XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	('UNIT_US_FENIAN'),	Class,	PrereqTech,	Combat,	Cost,		FaithCost,		RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_US_FENIAN'),	('TXT_KEY_CIV5_US_FENIAN_TEXT'),	('TXT_KEY_UNIT_US_FENIAN_STRATEGY'),	('TXT_KEY_UNIT_US_FENIAN_HELP'),	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, ObsoleteTech,	GoodyHutUpgradeUnitClass,	XPValueAttack,	XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_US_FENIAN'),	0,					('US_FENIAN_FLAG_ART_ATLAS'),	3, 				('US_IRELAND_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	('UNIT_US_FENIAN'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	('UNIT_US_FENIAN'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,			Flavor)
SELECT	('UNIT_US_FENIAN'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType,			Flavor)
VALUES	('UNIT_US_FENIAN',	'FLAVOR_DEFENSE',	30),
		('UNIT_US_FENIAN',	'FLAVOR_CULTURE',	10);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	('UNIT_US_FENIAN'),	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_RIFLEMAN');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
VALUES	('UNIT_US_FENIAN',	'PROMOTION_US_BLOOD_OF_THE_MARTYRS');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	('UNIT_US_FENIAN'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- Promotions
--------------------------------
INSERT INTO UnitPromotions 	
		(Type, 									Description,									Help,												Sound, 				CannotBeChosen,	LostWithUpgrade,	CombatPercent,	PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_US_BLOOD_OF_THE_MARTYRS',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_HELP',	'AS2D_IF_LEVELUP', 	1, 				0, 					0,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_HELP'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_1',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_1',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_1_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					8,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_1_HELP'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_2',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_2',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_2_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					16,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_2_HELP'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_3',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_3',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_3_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					24,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_3_HELP'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_4',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_4',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_4_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					32,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_4_HELP'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_5',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_5',	'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_5_HELP',	'AS2D_IF_LEVELUP', 	1, 				1, 					40,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_BLOOD_OF_THE_MARTYRS_5_HELP');
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType, 						UnitCombatType)
VALUES	('PROMOTION_US_BLOOD_OF_THE_MARTYRS',	'UNITCOMBAT_GUN'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_1',	'UNITCOMBAT_GUN'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_2',	'UNITCOMBAT_GUN'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_3',	'UNITCOMBAT_GUN'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_4',	'UNITCOMBAT_GUN'),
		('PROMOTION_US_BLOOD_OF_THE_MARTYRS_5',	'UNITCOMBAT_GUN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 									CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_US_MICHAEL_COLLINS', 	'TXT_KEY_LEADER_US_MICHAEL_COLLINS', 	'TXT_KEY_LEADER_US_MICHAEL_COLLINS_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_US_MICHAEL_COLLINS', 		'MichaelCollins_Diplo.xml',	5, 						5, 						6, 							4, 			6, 				6, 				6, 						4, 				5, 			3, 			6, 				7, 			3, 			'US_IRELAND_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_WAR', 			4),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_US_MICHAEL_COLLINS', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_US_MICHAEL_COLLINS', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_US_MICHAEL_COLLINS', 		'MINOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_US_MICHAEL_COLLINS', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_US_MICHAEL_COLLINS', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
		('LEADER_US_MICHAEL_COLLINS', 		'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_OFFENSE', 					6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_DEFENSE', 					7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_RECON', 					7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_RANGED', 					6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_MOBILE', 					5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_NAVAL', 					3),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_NAVAL_RECON', 				3),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_AIR', 						5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_GROWTH', 					5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_INFRASTRUCTURE', 			8),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_GOLD', 						5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_CULTURE', 					7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_GREAT_PEOPLE', 				5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_WONDER', 					5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_RELIGION', 					7),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_DIPLOMACY', 				6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_SPACESHIP', 				5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_NUKE', 						6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_USE_NUKE', 					5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_ESPIONAGE', 				6),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_ARCHAEOLOGY', 				8),
		('LEADER_US_MICHAEL_COLLINS', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_US_MICHAEL_COLLINS', 	'TRAIT_US_AUGUST_DESTINY');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_US_AUGUST_DESTINY', 	'TXT_KEY_TRAIT_US_AUGUST_DESTINY',		'TXT_KEY_TRAIT_US_AUGUST_DESTINY_SHORT');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,				SoundtrackTag, 	MapImage,						DawnOfManQuote,							DawnOfManImage)
SELECT	('CIVILIZATION_US_IRELAND'), 	('TXT_KEY_CIVILIZATION_US_IRELAND'), 	('TXT_KEY_CIVILIZATION_US_IRELAND_SHORT'),	('TXT_KEY_CIVILIZATION_US_IRELAND_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_US_IRELAND'),	('PLAYERCOLOR_US_IRELAND'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('US_IRELAND_ATLAS'),	('US_IRELAND_ALPHA_ATLAS'),	('England'), 	('Ireland_Collins_Map512.dds'),	('TXT_KEY_CIV5_DAWN_US_IRELAND_TEXT'),	('MichaelCollins_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_1'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_2'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_3'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_4'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_5'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_6'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_7'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_8'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_9'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_10'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_11'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_12'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_13'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_14'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_15'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_16'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_17'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_18'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_19'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_20'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_21'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_22'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_23'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_24'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_25'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_26'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_27'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_28'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_29'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_30'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_31'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_32'),
        ('CIVILIZATION_US_IRELAND',   'TXT_KEY_CITY_NAME_CIVILIZATION_US_IRELAND_33');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_US_IRELAND'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_US_IRELAND'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_US_IRELAND'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ENGLAND');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_US_IRELAND',		'LEADER_US_MICHAEL_COLLINS');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_US_IRELAND', 	'UNITCLASS_RIFLEMAN',		'UNIT_US_FENIAN');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_US_IRELAND', 	'BUILDINGCLASS_THEATRE', 	'BUILDING_US_PUBLIC_HOUSE');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_US_IRELAND', 	'RELIGION_CHRISTIANITY');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_0'),	
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_1'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_2'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_3'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_4'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_5'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_6'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_7'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_8'),
		('CIVILIZATION_US_IRELAND', 	'TXT_KEY_SPY_NAME_US_IRELAND_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_US_IRELAND', 	'REGION_HILLS');	
--==========================================================================================================================
--==========================================================================================================================