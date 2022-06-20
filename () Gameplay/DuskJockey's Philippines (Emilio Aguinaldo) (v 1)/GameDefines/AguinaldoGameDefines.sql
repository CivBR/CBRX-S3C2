--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 										Description, 									ShortDescription, 										Adjective,											Civilopedia, 										CivilopediaTag, 							DefaultPlayerColor, 						ArtDefineTag, ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 									PortraitIndex, 	AlphaIconAtlas, 							SoundtrackTag, 	MapImage, 				DawnOfManQuote, 							DawnOfManImage)
SELECT		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'), 	('TXT_KEY_CIV_DJ_PHILIPPINES_AGUINALDO_DESC'), 	('TXT_KEY_CIV_DJ_PHILIPPINES_AGUINALDO_SHORT_DESC'),	('TXT_KEY_CIV_DJ_PHILIPPINES_AGUINALDO_ADJECTIVE'),	('TXT_KEY_CIV5_DJ_PHILIPPINES_AGUINALDO_TEXT_1'),	('TXT_KEY_CIV5_DJ_PHILIPPINES_AGUINALDO'),	('PLAYERCOLOR_DJ_PHILIPPINES_AGUINALDO'), 	ArtDefineTag, ('ARTSTYLE_ASIAN'),	('_ASIA'),		('ASIAN'),		('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS'), 	0, 				('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS'), 	('Indonesia'), 	('AguinaldoMap.dds'), 	('TXT_KEY_CIV5_DOM_DJ_AGUINALDO_TEXT'), 	('AguinaldoDoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SPAIN');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SPAIN' )
	THEN '_SPAIN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_DJ_PHILIPPINES_AGUINALDO';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================				
INSERT INTO Civilization_CityNames 
			(CivilizationType, 							CityName)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_0'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_1'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_2'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_3'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_4'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_5'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_6'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_7'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_8'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_9'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_10'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_11'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_12'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_13'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_14'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_15'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_16'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_17'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_18'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_19'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_20'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_21'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_22'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_23'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_24'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_25'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_26'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_27'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_28'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_29'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_30'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_31'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_32'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_33'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_34'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_35'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_36'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_37'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_38'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_CITY_NAME_DJ_PHILIPPINES_AGUINALDO_39');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 							BuildingClassType)
SELECT		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 							TechType)
SELECT		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 							UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 							LeaderheadType)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'LEADER_DJ_AGUINALDO');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 							UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'UNITCLASS_RIFLEMAN',	'UNIT_DJ_KATIPUNERO');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 							BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'BUILDINGCLASS_STADIUM',	'BUILDING_DJ_AGLIPAYAN_CHURCH');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 							ReligionType)
SELECT		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 							StartAlongOcean)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	1);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 							SpyName)
VALUES		('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_0'),	
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_1'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_2'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_3'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_4'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_5'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_6'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_7'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_8'),
			('CIVILIZATION_DJ_PHILIPPINES_AGUINALDO', 	'TXT_KEY_SPY_NAME_DJ_PHILIPPINES_AGUINALDO_9');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 													Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_DJ_PHILIPPINES_AGUINALDO_ICON', 			0.349,	0.039,	0.039,	1),
			('COLOR_PLAYER_DJ_PHILIPPINES_AGUINALDO_BACKGROUND',	0.867,	0.722,	0.420,	1);
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 										PrimaryColor, 									SecondaryColor, 									TextColor)
VALUES		('PLAYERCOLOR_DJ_PHILIPPINES_AGUINALDO',	'COLOR_PLAYER_DJ_PHILIPPINES_AGUINALDO_ICON',	'COLOR_PLAYER_DJ_PHILIPPINES_AGUINALDO_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES		('LEADER_DJ_AGUINALDO', 	'TXT_KEY_LEADER_DJ_AGUINALDO', 	'TXT_KEY_LEADER_DJ_AGUINALDO_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_DJ_AGUINALDO', 	'Aguinaldo_Scene.xml',		4, 						2, 						4, 							3, 			8, 				8, 				6, 						5, 				9, 			8, 			8, 				6, 			4, 			'DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	2),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_DJ_AGUINALDO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_DJ_AGUINALDO', 	'MINOR_CIV_APPROACH_IGNORE', 		7),
			('LEADER_DJ_AGUINALDO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_DJ_AGUINALDO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_DJ_AGUINALDO', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_DJ_AGUINALDO', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_DJ_AGUINALDO', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_DEFENSE', 					3),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_RECON', 					4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_RANGED', 					3),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_MOBILE', 					2),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_NAVAL', 					5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	6),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_AIR', 						3),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_GROWTH', 					4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_GOLD', 						5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_CULTURE', 					8),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_WONDER', 					4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_RELIGION', 					4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_NUKE', 						2),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_I_TRADE_ORIGIN', 			4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_DJ_AGUINALDO', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_DJ_AGUINALDO', 'TRAIT_DJ_UNDIMMED_BY_TYRANTS_MIGHT');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================						
INSERT INTO Traits
			(Type,									Description,									ShortDescription)
VALUES		('TRAIT_DJ_UNDIMMED_BY_TYRANTS_MIGHT',	'TXT_KEY_TRAIT_DJ_UNDIMMED_BY_TYRANTS_MIGHT',	'TXT_KEY_TRAIT_DJ_UNDIMMED_BY_TYRANTS_MIGHT_SHORT');
--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
			(Type, 					Class, Cost, PrereqTech,	Combat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 						Help, 								Strategy,								AdvancedStartCost,	UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT		('UNIT_DJ_KATIPUNERO'), Class, Cost, PrereqTech,	Combat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_DJ_KATIPUNERO_DESC'),	('TXT_KEY_CIV5_UNITS_DJ_KATIPUNERO_TEXT'), 	('TXT_KEY_UNIT_DJ_KATIPUNERO_HELP'), 	('TXT_KEY_UNIT_DJ_KATIPUNERO_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_DJ_KATIPUNERO'), 0,					('UNIT_FLAG_DJ_KATIPUNERO_ATLAS'),	2, 				('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS')
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_DJ_KATIPUNERO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
			(UnitType, 					UnitAIType)
SELECT		('UNIT_DJ_KATIPUNERO'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
			(UnitType, 				UnitClassType)
SELECT		('UNIT_DJ_KATIPUNERO'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_DJ_KATIPUNERO',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
			(UnitType,				FlavorType, Flavor)
SELECT		('UNIT_DJ_KATIPUNERO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_RIFLEMAN');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 								BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation,	Happiness, NeverCapture, 	Description, 									Civilopedia, 											Help, 											Strategy,											ArtDefineTag, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_DJ_AGLIPAYAN_CHURCH'),	BuildingClass,	PrereqTech,	Cost, GoldMaintenance, MinAreaSize, DisplayPosition, GreatWorkCount, GreatWorkSlotType, ArtInfoEraVariation,	Happiness, 1,	 			('TXT_KEY_BUILDING_DJ_AGLIPAYAN_CHURCH_DESC'),	('TXT_KEY_CIV5_BUILDINGS_DJ_AGLIPAYAN_CHURCH_TEXT'),	('TXT_KEY_BUILDING_DJ_AGLIPAYAN_CHURCH_HELP'),	('TXT_KEY_BUILDING_DJ_AGLIPAYAN_CHURCH_STRATEGY'),	ArtDefineTag, 3, 				('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_STADIUM';
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================	
INSERT INTO Building_ClassesNeededInCity
		(BuildingType,						BuildingClassType)
VALUES	('BUILDING_DJ_AGLIPAYAN_CHURCH',	'BUILDINGCLASS_TEMPLE');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges 	
			(BuildingType, 					YieldType, 			Yield)
VALUES		('BUILDING_DJ_AGLIPAYAN_CHURCH', 'YIELD_FAITH',	2);
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================	
INSERT INTO Building_Flavors 	
			(BuildingType, 						 FlavorType, Flavor)
SELECT		('BUILDING_DJ_AGLIPAYAN_CHURCH'),	 FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_STADIUM';
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,								Response,														Bias)
VALUES  ('LEADER_DJ_AGUINALDO',		'RESPONSE_AI_DOF_BACKSTAB',					'TXT_KEY_LEADER_DJ_AGUINALDO_DENOUNCE_FRIEND%',					500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_ATTACKED_HOSTILE',				'TXT_KEY_LEADER_DJ_AGUINALDO_ATTACKED_HOSTILE%',				500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_DEFEATED',						'TXT_KEY_LEADER_DJ_AGUINALDO_DEFEATED%',						500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_DOW_GENERIC',						'TXT_KEY_LEADER_DJ_AGUINALDO_DOW_GENERIC%',						500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_FIRST_GREETING',					'TXT_KEY_LEADER_DJ_AGUINALDO_FIRSTGREETING%',					500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_DJ_AGUINALDO_RESPONSE_TO_BEING_DENOUNCED%',		500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_WORK_AGAINST_SOMEONE',			'TXT_KEY_LEADER_DJ_AGUINALDO_DENOUNCE%',						500),
        ('LEADER_DJ_AGUINALDO',		'RESPONSE_WORK_WITH_US',					'TXT_KEY_LEADER_DJ_AGUINALDO_DEC_FRIENDSHIP%',					500);