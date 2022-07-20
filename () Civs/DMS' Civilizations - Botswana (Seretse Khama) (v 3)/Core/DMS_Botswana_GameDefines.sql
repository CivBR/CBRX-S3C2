--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 								Type, 													Description)
VALUES	('BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST', 'BUILDINGCLASS_DMS_THE_CLAY_THAT_BINDS_SPECIALIST', 	'TXT_KEY_BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST'),
		('BUILDING_DMS_MOPHATO_CULTURE',				'BUILDINGCLASS_DMS_MOPHATO_CULTURE', 					'TXT_KEY_BUILDING_DMS_MOPHATO_CULTURE'),
		('BUILDING_DMS_MOPHATO_PRODUCTION',				'BUILDINGCLASS_DMS_MOPHATO_PRODUCTION', 				'TXT_KEY_BUILDING_DMS_MOPHATO_PRODUCTION'),
		('BUILDING_DMS_KGOTLA_HAPPINESS',				'BUILDINGCLASS_DMS_KGOTLA_HAPPINESS', 					'TXT_KEY_BUILDING_DMS_KGOTLA_HAPPINESS');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						BuildingClass,	Cost,	FreeStartEra,	HurryCostModifier,	EspionageModifier,	SpecialistExtraCulture,	TrainedFreePromotion,		GoldMaintenance,	PrereqTech,	Description, 						Civilopedia, 							Help, 									Strategy,								 	ArtDefineTag, 	MinAreaSize,	ConquestProb,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_DMS_KGOTLA'),	BuildingClass,	Cost,	FreeStartEra,	HurryCostModifier,	EspionageModifier,	0,						('PROMOTION_DMS_KGOTLA'),	GoldMaintenance+1,	PrereqTech,	('TXT_KEY_BUILDING_DMS_KGOTLA'),	('TXT_KEY_BUILDING_DMS_KGOTLA_TEXT'),	('TXT_KEY_BUILDING_DMS_KGOTLA_HELP'),	('TXT_KEY_BUILDING_DMS_KGOTLA_STRATEGY'),	ArtDefineTag,	MinAreaSize,	0,				3, 				('DMS_BOTSWANA_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');

INSERT INTO Buildings 
		(Type, 												BuildingClass,											BuildingProductionModifier,	CultureRateModifier,	SpecialistType,			SpecialistCount,	Happiness,	Cost, 	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	GoldMaintenance,	PrereqTech, NeverCapture,	PortraitIndex, 	IconAtlas,				Description, 											Help)
VALUES	('BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST', 	'BUILDINGCLASS_DMS_THE_CLAY_THAT_BINDS_SPECIALIST',		0,							0,						'SPECIALIST_ENGINEER',	1,					0,			-1, 	-1,			NULL,				0,				0,					NULL,		1,				1,				'DMS_BOTSWANA_ATLAS',	'TXT_KEY_BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST',	'TXT_KEY_BUILDING_DMS_THE_CLAY_THAT_BINDS_SPECIALIST_HELP'),
		('BUILDING_DMS_MOPHATO_CULTURE', 					'BUILDINGCLASS_DMS_MOPHATO_CULTURE',					0,							15,						NULL,					0,					0,			-1, 	-1,			NULL,				0,				0,					NULL,		1,				2,				'DMS_BOTSWANA_ATLAS',	'TXT_KEY_BUILDING_DMS_MOPHATO_CULTURE',					'TXT_KEY_BUILDING_DMS_MOPHATO_CULTURE_HELP'),
		('BUILDING_DMS_MOPHATO_PRODUCTION', 				'BUILDINGCLASS_DMS_MOPHATO_PRODUCTION',					15,							0,						NULL,					0,					0,			-1, 	-1,			NULL,				0,				0,					NULL,		1,				2,				'DMS_BOTSWANA_ATLAS',	'TXT_KEY_BUILDING_DMS_MOPHATO_PRODUCTION',				'TXT_KEY_BUILDING_DMS_MOPHATO_PRODUCTION_HELP'),
		('BUILDING_DMS_KGOTLA_HAPPINESS', 					'BUILDINGCLASS_DMS_KGOTLA_HAPPINESS',					0,							0,						NULL,					0,					1,			-1, 	-1,			NULL,				0,				0,					NULL,		1,				3,				'DMS_BOTSWANA_ATLAS',	'TXT_KEY_BUILDING_DMS_KGOTLA_HAPPINESS',				'TXT_KEY_BUILDING_DMS_KGOTLA_HAPPINESS_HELP');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,				Flavor)
SELECT	('BUILDING_DMS_KGOTLA'),	FlavorType,				Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');

INSERT INTO Building_Flavors 
		(BuildingType, 				FlavorType,					Flavor)
VALUES	('BUILDING_DMS_KGOTLA', 	'FLAVOR_HAPPINESS', 		10),
		('BUILDING_DMS_KGOTLA', 	'FLAVOR_CULTURE',			10);

insert into Building_SpecialistYieldChanges
		(BuildingType, 				SpecialistType,				YieldType,			Yield)
values	('BUILDING_DMS_KGOTLA',		'SPECIALIST_ENGINEER',		'YIELD_CULTURE',	1),
		('BUILDING_DMS_KGOTLA',		'SPECIALIST_ARTIST',		'YIELD_CULTURE',	1),
		('BUILDING_DMS_KGOTLA',		'SPECIALIST_SCIENTIST',		'YIELD_CULTURE',	1),
		('BUILDING_DMS_KGOTLA',		'SPECIALIST_MERCHANT',		'YIELD_CULTURE',	1),
		('BUILDING_DMS_KGOTLA',		'SPECIALIST_WRITER',		'YIELD_CULTURE',	1),
		('BUILDING_DMS_KGOTLA',		'SPECIALIST_MUSICIAN',		'YIELD_CULTURE',	1);
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech,	Combat,		Cost,		RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	Description,					Civilopedia,						Strategy,								Help,								MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,					UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex,	IconAtlas,				MoveRate)
SELECT	('UNIT_DMS_MOPHATO'),	Class, PrereqTech,	Combat-15,	Cost-75,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_DMS_MOPHATO'),	('TXT_KEY_UNIT_DMS_MOPHATO_TEXT'),	('TXT_KEY_UNIT_DMS_MOPHATO_STRATEGY'),	('TXT_KEY_UNIT_DMS_MOPHATO_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_DMS_MOPHATO'),	0,					('DMS_UNIT_FLAG_MOPHATO_ATLAS'),	2,				('DMS_BOTSWANA_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_INFANTRY');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DMS_MOPHATO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_INFANTRY');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_DMS_MOPHATO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_INFANTRY');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType,			Flavor)
SELECT		('UNIT_DMS_MOPHATO'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_INFANTRY');

INSERT INTO Unit_Flavors 
		(UnitType, 					FlavorType,					Flavor)
VALUES	('UNIT_DMS_MOPHATO', 		'FLAVOR_PRODUCTION', 		10),
		('UNIT_DMS_MOPHATO', 		'FLAVOR_CULTURE',			10);
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_DMS_MOPHATO'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_INFANTRY');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_DMS_MOPHATO', 	'PROMOTION_DMS_BOGWERA');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	('UNIT_DMS_MOPHATO'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_INFANTRY');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------ 
INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen, PortraitIndex,  IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DMS_KGOTLA',	'TXT_KEY_PROMOTION_DMS_KGOTLA',		'TXT_KEY_PROMOTION_DMS_KGOTLA_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DMS_KGOTLA_HELP'),
		('PROMOTION_DMS_BOGWERA',	'TXT_KEY_PROMOTION_DMS_BOGWERA',	'TXT_KEY_PROMOTION_DMS_BOGWERA_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DMS_BOGWERA_HELP');
------------------------------
-- UnitPromotions_UnitCombats
------------------------------
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 			UnitCombatType)
VALUES		('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_MOUNTED'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_MELEE'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_ARCHER'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_RECON'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_SIEGE'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_GUN'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_ARMOR'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_NAVALMELEE'),
			('PROMOTION_DMS_KGOTLA',	'UNITCOMBAT_NAVALRANGED'),
			('PROMOTION_DMS_BOGWERA',	'UNITCOMBAT_GUN');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 							Civilopedia, 								CivilopediaTag, 									ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_DMS_SERETSE_KHAMA', 	'TXT_KEY_LEADER_DMS_SERETSE_KHAMA', 	'TXT_KEY_LEADER_DMS_SERETSE_KHAMA_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_SERETSE_KHAMA', 	'DMS_Seretse_Khama.xml',	5, 						5, 						8, 							5, 			8, 				5, 				6, 						7, 				9, 			6, 			6, 				5, 			3, 			'DMS_BOTSWANA_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_WAR', 			3),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_SERETSE_KHAMA', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_DMS_SERETSE_KHAMA', 		'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_DMS_SERETSE_KHAMA', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_DMS_SERETSE_KHAMA', 		'MINOR_CIV_APPROACH_CONQUEST', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_OFFENSE', 					4),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_CITY_DEFENSE', 				7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_RECON', 					7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_RANGED', 					6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_MOBILE', 					5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_NAVAL', 					5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_AIR', 						7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_EXPANSION', 				5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_GROWTH', 					6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_PRODUCTION', 				7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_GOLD', 						5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_CULTURE', 					7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_HAPPINESS', 				7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_WONDER', 					4),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_RELIGION', 					3),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_DIPLOMACY', 				9),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_SPACESHIP', 				6),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_WATER_CONNECTION', 			3),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_NUKE', 						2),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_USE_NUKE', 					7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_ESPIONAGE', 				7),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_DMS_SERETSE_KHAMA', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_DMS_SERETSE_KHAMA', 		'TRAIT_DMS_THE_CLAY_THAT_BINDS');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_DMS_THE_CLAY_THAT_BINDS', 	'TXT_KEY_TRAIT_DMS_THE_CLAY_THAT_BINDS', 	'TXT_KEY_TRAIT_DMS_THE_CLAY_THAT_BINDS_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations
		(Type, 								Description, 								ShortDescription,									Adjective,												CivilopediaTag,											DefaultPlayerColor,					ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, PortraitIndex,	IconAtlas,					AlphaIconAtlas,						SoundtrackTag,	MapImage,						DawnOfManQuote,									DawnOfManImage)
SELECT	('CIVILIZATION_DMS_BOTSWANA'), 		('TXT_KEY_CIVILIZATION_DMS_BOTSWANA'), 		('TXT_KEY_CIVILIZATION_DMS_BOTSWANA_SHORT'),		('TXT_KEY_CIVILIZATION_DMS_BOTSWANA_ADJECTIVE'),		('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_BOTSWANA'),		('PLAYERCOLOR_DMS_BOTSWANA'),		ArtDefineTag,	ArtStyleType,	ArtStyleSuffix, ArtStylePrefix, 0,				('DMS_BOTSWANA_ATLAS'),		('DMS_BOTSWANA_ALPHA_ATLAS'),		('Zulu'),		('DMS_Botswana_Map512.dds'), 	('TXT_KEY_CIV5_DAWN_DMS_BOTSWANA_TEXT'), 		('DMS_Khama_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,					CityName)
VALUES	('CIVILIZATION_DMS_BOTSWANA', 	 	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_1'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_2'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_3'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_4'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_5'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_6'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_7'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_8'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_9'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_10'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_11'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_12'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_13'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_14'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_15'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_16'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_17'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_18'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_19'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_20'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_21'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_22'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_23'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_24'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_25'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_26'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_27'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_28'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_29'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_30'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_31'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_32'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_33'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_34'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_35'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_36'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_37'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_38'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_39'),
        ('CIVILIZATION_DMS_BOTSWANA',   	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_BOTSWANA_40');			
--------------------------------		
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_DMS_BOTSWANA'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_DMS_BOTSWANA'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_BOTSWANA'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_DMS_BOTSWANA',		'LEADER_DMS_SERETSE_KHAMA');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_DMS_BOTSWANA', 		'UNITCLASS_INFANTRY',		'UNIT_DMS_MOPHATO');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_DMS_BOTSWANA', 		'BUILDINGCLASS_CONSTABLE', 		'BUILDING_DMS_KGOTLA');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 					ReligionType)
SELECT	('CIVILIZATION_DMS_BOTSWANA'), 		ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_0'),	
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_1'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_2'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_3'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_4'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_5'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_6'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_7'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_8'),
		('CIVILIZATION_DMS_BOTSWANA', 	'TXT_KEY_SPY_NAME_DMS_BOTSWANA_9');
--------------------------------	
-- Civilization_Start_Region_Priority 
--------------------------------		
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_DMS_BOTSWANA', 	'REGION_HILLS');
--==========================================================================================================================
--==========================================================================================================================