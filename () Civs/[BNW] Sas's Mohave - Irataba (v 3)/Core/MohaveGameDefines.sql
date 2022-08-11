--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 			 Help, 							 Strategy, 							Civilopedia, 					ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 			 UnitFlagAtlas, 				UnitFlagIconOffset, IconAtlas,					PortraitIndex)
SELECT	'UNIT_SAS_KWANAMI',		Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_SAS_KWANAMI', 'TXT_KEY_UNIT_SAS_KWANAMI_HELP', 	 'TXT_KEY_UNIT_SAS_KWANAMI_STRATEGY',  'TXT_KEY_UNIT_SAS_KWANAMI_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_SAS_KWANAMI',	 'SAS_KWANAMI_FLAG',	0,					'SAS_MOHAVE_ICON_ATLAS',	2
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';   	
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_SAS_KWANAMI',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_SAS_KWANAMI',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_SAS_KWANAMI',		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_SAS_KWANAMI',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO UnitPromotions 
		(Type, 						Description, 						Help, 									Sound, 				CannotBeChosen,	IconAtlas,  PortraitIndex,			PediaType, 			PediaEntry)
VALUES	('PROMOTION_ER_KWANAMI',	'TXT_KEY_PROMOTION_SAS_KWANAMI_PROMO',	'TXT_KEY_PROMOTION_SAS_KWANAMI_PROMO_HELP',	'AS2D_IF_LEVELUP', 	1,	'ABILITY_ATLAS', 				59,	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SAS_KWANAMI_PROMO_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_SAS_KWANAMI',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_SAS_KWANAMI', 'PROMOTION_AMPHIBIOUS'),
			('UNIT_SAS_KWANAMI', 'PROMOTION_ER_KWANAMI');
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 				NoLimit,		Description)
VALUES	('BUILDINGCLASS_ER_MOHAVEGOLDDUMMY',	'BUILDING_ER_MOHAVEGOLDDUMMY',	0,	'TXT_KEY_BUILDING_ER_MOHAVEGOLDDUMMY'),
		('BUILDINGCLASS_ER_MOHAVEFOODDUMMY',	'BUILDING_ER_MOHAVEFOODDUMMY',	0,	'TXT_KEY_BUILDING_ER_MOHAVEFOODDUMMY'),
		('BUILDINGCLASS_DJ_MOHAVE_EM_MARKER',	'BUILDING_DJ_MOHAVE_EM_MARKER',	1,	'TXT_KEY_BUILDING_DJ_MOHAVE_EM_MARKER');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Happiness,	Description, 						Help)
VALUES	('BUILDING_ER_MOHAVEGOLDDUMMY',	 'BUILDINGCLASS_ER_MOHAVEGOLDDUMMY',		-1, 			-1,		-1,	0,	1, 		null,		1,	0,				'TXT_KEY_BUILDING_ER_MOHAVEGOLDDUMMY',	'TXT_KEY_BUILDING_ER_MOHAVEGOLDDUMMY'),
		('BUILDING_ER_MOHAVEFOODDUMMY',	 'BUILDINGCLASS_ER_MOHAVEFOODDUMMY',		-1, 			-1,		-1,	0,	1, 		null,		1,	0,				'TXT_KEY_BUILDING_ER_MOHAVEFOODDUMMY',	'TXT_KEY_BUILDING_ER_MOHAVEFOODDUMMY'),
		('BUILDING_DJ_MOHAVE_EM_MARKER',	 'BUILDINGCLASS_DJ_MOHAVE_EM_MARKER',		-1, 			-1,		-1,	0,	1, 		null,		1,	'1',				'TXT_KEY_BUILDING_DJ_MOHAVE_EM_MARKER',	'TXT_KEY_BUILDING_DJ_MOHAVE_EM_MARKER');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 						 HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb, SpecialistType, SpecialistCount, MinAreaSize, GoldMaintenance, Description, 							Civilopedia, 							Help, 										Strategy,				ArtDefineTag, PortraitIndex,	IconAtlas)
SELECT		('BUILDING_SAS_KUTINYAM'),	HurryCostModifier, FreeStartEra, BuildingClass, PrereqTech, Cost, FaithCost, ConquestProb, SpecialistType, SpecialistCount, MinAreaSize, 0, ('TXT_KEY_BUILDING_SAS_KUTINYAM'),	('TXT_KEY_BUILDING_SAS_KUTINYAM_PEDIA'),	('TXT_KEY_BUILDING_SAS_KUTINYAM_HELP'),	('TXT_KEY_BUILDING_SAS_KUTINYAM_STRATEGY'),	ArtDefineTag, 3, 				('SAS_MOHAVE_ICON_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';

UPDATE Buildings
SET	
	PrereqTech	= 	(SELECT PrereqTech FROM Buildings WHERE Type = 'BUILDING_TEMPLE'), 
	Cost 		= 	(SELECT Cost FROM Buildings WHERE Type = 'BUILDING_TEMPLE'), 
	FaithCost 	= 	(SELECT FaithCost FROM Buildings WHERE Type = 'BUILDING_TEMPLE')
WHERE Type = 'BUILDING_SAS_KUTINYAM';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity 	
			(BuildingType, 				BuildingClassType)
SELECT		('BUILDING_SAS_KUTINYAM'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_TEMPLE';	
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,			Yield)
VALUES		('BUILDING_SAS_KUTINYAM', 	'YIELD_FAITH',	1);

INSERT INTO Building_RiverPlotYieldChanges
			(BuildingType, 				YieldType, 			Yield)
VALUES		('BUILDING_SAS_KUTINYAM',		'YIELD_FAITH',		1);

INSERT INTO Building_RiverPlotYieldChanges
        (BuildingType,            YieldType,        Yield)
VALUES    ('BUILDING_ER_MOHAVEGOLDDUMMY',    'YIELD_GOLD',    1),
		  ('BUILDING_ER_MOHAVEFOODDUMMY',    'YIELD_FOOD',    1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Leaders
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 							 Description, 							 Civilopedia, 								CivilopediaTag, 	ArtDefineTag, 			    VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_SAS_IRATABA',	 'TXT_KEY_LEADER_SAS_IRATABA',	'TXT_KEY_LEADER_SAS_IRATABA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SAS_IRATABA',	'Sas_Irataba_Scene.xml',	4, 						3, 						5, 							4, 			7, 				4, 				4, 						8, 				8, 			6, 			7, 				4, 			4, 			'SAS_MOHAVE_ICON_ATLAS', 1);
--------------------------------------------------------------------------------------------------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					 MajorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_WAR', 			5),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_AFRAID', 		6),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_SAS_IRATABA',	'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					 MinorCivApproachType, 				Bias)
VALUES	('LEADER_SAS_IRATABA',	'MINOR_CIV_APPROACH_IGNORE', 		8),
		('LEADER_SAS_IRATABA',	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_SAS_IRATABA',	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_SAS_IRATABA',	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_SAS_IRATABA',	'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 					 FlavorType, 						Flavor)
VALUES	('LEADER_SAS_IRATABA',	'FLAVOR_OFFENSE', 					7),
		('LEADER_SAS_IRATABA',	'FLAVOR_DEFENSE', 					6),
		('LEADER_SAS_IRATABA',	'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_SAS_IRATABA',	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_SAS_IRATABA',	'FLAVOR_RECON', 					8),
		('LEADER_SAS_IRATABA',	'FLAVOR_RANGED', 					5),
		('LEADER_SAS_IRATABA',	'FLAVOR_MOBILE', 					6),
		('LEADER_SAS_IRATABA',	'FLAVOR_NAVAL', 					7),
		('LEADER_SAS_IRATABA',	'FLAVOR_NAVAL_RECON', 				6),
		('LEADER_SAS_IRATABA',	'FLAVOR_NAVAL_GROWTH', 				7),
		('LEADER_SAS_IRATABA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	7),
		('LEADER_SAS_IRATABA',	'FLAVOR_AIR', 						6),
		('LEADER_SAS_IRATABA',	'FLAVOR_EXPANSION', 				7),
		('LEADER_SAS_IRATABA',	'FLAVOR_GROWTH', 					7),
		('LEADER_SAS_IRATABA',	'FLAVOR_TILE_IMPROVEMENT', 			9),
		('LEADER_SAS_IRATABA',	'FLAVOR_INFRASTRUCTURE', 			7),
		('LEADER_SAS_IRATABA',	'FLAVOR_PRODUCTION', 				6),
		('LEADER_SAS_IRATABA',	'FLAVOR_GOLD', 						6),
		('LEADER_SAS_IRATABA',	'FLAVOR_SCIENCE', 					6),
		('LEADER_SAS_IRATABA',	'FLAVOR_CULTURE', 					4),
		('LEADER_SAS_IRATABA',	'FLAVOR_HAPPINESS', 				8),
		('LEADER_SAS_IRATABA',	'FLAVOR_GREAT_PEOPLE', 				6),
		('LEADER_SAS_IRATABA',	'FLAVOR_WONDER', 					5),
		('LEADER_SAS_IRATABA',	'FLAVOR_RELIGION', 					8),
		('LEADER_SAS_IRATABA',	'FLAVOR_DIPLOMACY', 				7),
		('LEADER_SAS_IRATABA',	'FLAVOR_SPACESHIP', 				5),
		('LEADER_SAS_IRATABA',	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_SAS_IRATABA',	'FLAVOR_NUKE', 						3),
		('LEADER_SAS_IRATABA',	'FLAVOR_USE_NUKE', 					3),
		('LEADER_SAS_IRATABA',	'FLAVOR_ESPIONAGE', 				5),
		('LEADER_SAS_IRATABA',	'FLAVOR_AIRLIFT', 					5),
		('LEADER_SAS_IRATABA',	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_SAS_IRATABA',	'FLAVOR_I_TRADE_ORIGIN', 			7),
		('LEADER_SAS_IRATABA',	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
		('LEADER_SAS_IRATABA',	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_SAS_IRATABA',	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_SAS_IRATABA',	'FLAVOR_AIR_CARRIER', 				2);
--------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SAS_IRATABA',	'TRAIT_SAS_IRATABA');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Traits
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 						 Description, 						 ShortDescription)
VALUES	('TRAIT_SAS_IRATABA',  'TXT_KEY_TRAIT_SAS_IRATABA',	 'TXT_KEY_TRAIT_SAS_IRATABA_SHORT');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 					ResponseType, 								Response, 															Bias)
VALUES 	('LEADER_SAS_IRATABA',	'RESPONSE_AI_DOF_BACKSTAB', 				'TXT_KEY_LEADER_SAS_IRATABA_DENOUNCE_FRIEND%', 				500),
		('LEADER_SAS_IRATABA',	'RESPONSE_ATTACKED_HOSTILE', 				'TXT_KEY_LEADER_SAS_IRATABA_ATTACKED_HOSTILE%', 				500),
		('LEADER_SAS_IRATABA',	'RESPONSE_DEFEATED', 						'TXT_KEY_LEADER_SAS_IRATABA_DEFEATED%', 						500),
		('LEADER_SAS_IRATABA',	'RESPONSE_DOW_GENERIC', 					'TXT_KEY_LEADER_SAS_IRATABA_DOW_GENERIC%', 					500),
		('LEADER_SAS_IRATABA',	'RESPONSE_FIRST_GREETING', 					'TXT_KEY_LEADER_SAS_IRATABA_FIRSTGREETING%', 					500),
		('LEADER_SAS_IRATABA',	'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_SAS_IRATABA_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_SAS_IRATABA',	'RESPONSE_WORK_AGAINST_SOMEONE', 			'TXT_KEY_LEADER_SAS_IRATABA_DENOUNCE%', 						500),
		('LEADER_SAS_IRATABA',	'RESPONSE_WORK_WITH_US', 					'TXT_KEY_LEADER_SAS_IRATABA_DEC_FRIENDSHIP%', 				500);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
----------------------------------------------------------------------------------------------------------------------------
-- Civilizations
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilizations 	
		(Type, 									SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_SAS_MOHAVE',		'Shoshone', 		'SasMohave412.dds',		'TXT_KEY_CIV_DAWN_SAS_MOHAVE_TEXT',	'Sas_Irataba_DOM.dds',	'TXT_KEY_CIV_SAS_MOHAVE_DESC', 	'TXT_KEY_CIV_SAS_MOHAVE_SHORT_DESC',	'TXT_KEY_CIV_SAS_MOHAVE_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_SAS_MOHAVE_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_SAS_MOHAVE',		'PLAYERCOLOR_SAS_MOHAVE',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SAS_MOHAVE_ICON_ATLAS',	0,				'SAS_MOHAVE_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_SHOSHONE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 					SpyName)
VALUES	('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_0'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_1'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_2'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_3'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_4'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_5'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_6'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_7'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_8'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_SPY_NAME_CIV_SAS_MOHAVE_9');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_1'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_2'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_3'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_4'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_5'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_6'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_7'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_8'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_9'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_10'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_11'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_12'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_13'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_14'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_15'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_16'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_17'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_18'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_19'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_20'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_21'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_22'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_23'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_24'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_25'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_26'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_27'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_28'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_29'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_30'),
		('CIVILIZATION_SAS_MOHAVE',	'TXT_KEY_CITY_NAME_SAS_MOHAVE_31');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	'CIVILIZATION_SAS_MOHAVE', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------		
-- Civilization_FreeTechs
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	'CIVILIZATION_SAS_MOHAVE', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SAS_MOHAVE', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_SHOSHONE';
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_SAS_MOHAVE',	'LEADER_SAS_IRATABA');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_SAS_MOHAVE', 	'UNITCLASS_LONGSWORDSMAN',			'UNIT_SAS_KWANAMI');
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 			BuildingType)
VALUES	('CIVILIZATION_SAS_MOHAVE', 	'BUILDINGCLASS_TEMPLE',	'BUILDING_SAS_KUTINYAM');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_SAS_MOHAVE',	'REGION_DESERT');