--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 							DerivativeCiv,			  Description, 							ShortDescription, 						Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor,		 	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,				AlphaIconAtlas, 			 PortraitIndex,	SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					   DawnOfManImage)
SELECT		('CIVILIZATION_TCM_ASSYRIA'), 	('CIVILIZATION_ASSYRIA'), ('TXT_KEY_CIV_TCM_ASSYRIA_DESC'), 	('TXT_KEY_CIV_TCM_ASSYRIA_SHORT_DESC'), ('TXT_KEY_CIV_TCM_ASSYRIA_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_ASSYRIA_TEXT_1'),	('TXT_KEY_CIV5_TCM_ASSYRIA'), 	('PLAYERCOLOR_TCM_ASSYRIA'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_ASSYRIA_ATLAS'), ('TCM_ASSYRIA_ALPHA_ATLAS'), 0, 			('ASSYRIA'),	 ('tcm_assyria_map.dds'), 	('TXT_KEY_CIV5_DOM_TCM_ASSYRIA_TEXT'), ('tcm_assyria_dom.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_01'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_02'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_03'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_04'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_05'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_06'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_07'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_08'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_09'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_10'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_11'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_12'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_13'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_14'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_15'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_16'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_17'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_18'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_19'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_20'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_21'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_22'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_23'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_24'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_25'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_26'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_27'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_28'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_29'),
			('CIVILIZATION_TCM_ASSYRIA', 		'TXT_KEY_CITY_NAME_TCM_ASSYRIA_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_TCM_ASSYRIA'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_ASSYRIA'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'LEADER_TCM_SAMMURAMAT');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 			UnitType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'UNITCLASS_SPEARMAN', 	'UNIT_TCM_SAPPER_UNIT');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 			BuildingType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'BUILDINGCLASS_TEMPLE', 	'BUILDING_TCM_EKALLU');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'RELIGION_ORTHODOXY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_0'),	
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_1'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_2'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_3'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_4'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_5'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_6'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_7'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_8'),
			('CIVILIZATION_TCM_ASSYRIA', 	'TXT_KEY_SPY_NAME_TCM_ASSYRIA_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 				RegionType)
VALUES		('CIVILIZATION_TCM_ASSYRIA', 	'REGION_DESERT');	
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_ASSYRIA_ICON',			0.773,	0.51,	0.204,	1),
			('COLOR_PLAYER_TCM_ASSYRIA_BACKGROUND',		0.318,	0.055,	0.224,	1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES		('PLAYERCOLOR_TCM_ASSYRIA',			'COLOR_PLAYER_TCM_ASSYRIA_ICON', 		'COLOR_PLAYER_TCM_ASSYRIA_BACKGROUND', 			'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 								CivilopediaTag, 						ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_TCM_SAMMURAMAT', 	'TXT_KEY_LEADER_TCM_SAMMURAMAT', 	'TXT_KEY_LEADER_TCM_SAMMURAMAT_PEDIA_TEXT', 'TXT_KEY_LEADER_TCM_SAMMURAMAT_PEDIA', 'tcmSammurmatLS.xml',	9, 						0, 						5, 							8, 			7, 				0, 				4, 					 9, 			 4, 		9, 			12, 		 10, 		 10, 		'TCM_ASSYRIA_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_HOSTILE', 		0),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_GUARDED', 		2),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
			('LEADER_TCM_SAMMURAMAT', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_SAMMURAMAT', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
			('LEADER_TCM_SAMMURAMAT', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_TCM_SAMMURAMAT', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
			('LEADER_TCM_SAMMURAMAT', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_TCM_SAMMURAMAT', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_OFFENSE', 					10),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_DEFENSE', 					4),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_RANGED', 					5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_MOBILE', 					4),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_NAVAL', 					4),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_AIR', 						6),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_GROWTH', 					6),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_TILE_IMPROVEMENT', 			7),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_PRODUCTION', 				9),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_GOLD', 						5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_CULTURE', 					3),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_HAPPINESS', 				4),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_WONDER', 					1),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_RELIGION', 					5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_DIPLOMACY', 				10),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_NUKE', 						10),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_ESPIONAGE', 				10),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_SAMMURAMAT', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_TCM_SAMMURAMAT', 	'TRAIT_TCM_SAMMURAMAT_ASSYRIA');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 								Description, 								ShortDescription)
VALUES		('TRAIT_TCM_SAMMURAMAT_ASSYRIA', 	'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA', 	'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_SAMMURAMAT_PEACE', 	'TCM_SAMMURAMAT_PEACE', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_SAMMURAMAT_WAR',		'TCM_SAMMURAMAT_WAR', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 									SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_SAMMURAMAT_PEACE', 		'SND_LEADER_MUSIC_TCM_SAMMURAMAT_PEACE', 	'GAME_MUSIC', 	75, 		75, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_SAMMURAMAT_WAR', 		'SND_LEADER_MUSIC_TCM_SAMMURAMAT_WAR', 		'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 			DefaultBuilding, 				Description)
VALUES		('BUILDINGCLASS_TCM_ASSYRIA_DUMMY', 	'BUILDING_TCM_DUMMY_ASSYRIA', 	'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					    BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture,	Description,						Help,									Civilopedia,						Strategy,										ArtDefineTag, MinAreaSize, 	HurryCostModifier, IconAtlas,				PortraitIndex)
SELECT		('BUILDING_TCM_EKALLU'),	BuildingClass, Cost, GoldMaintenance, PrereqTech, NeverCapture,	('TXT_KEY_BUILDING_TCM_EKALLU'),	('TXT_KEY_BUILDING_TCM_EKALLU_HELP'),	('TXT_KEY_CIV5_TCM_EKALLU_TEXT'),	('TXT_KEY_BUILDING_TCM_EKALLU_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, ('TCM_ASSYRIA_ATLAS'), 	3
FROM Buildings WHERE Type = 'BUILDING_TEMPLE';		

INSERT INTO Buildings 	
			(Type, 								BuildingClass, 						UnmoddedHappiness,	GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb,  PrereqTech,	Description, 									Help,											PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_ASSYRIA_FOOD',		'BUILDINGCLASS_TCM_ASSYRIA_DUMMY', 	0,					-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT', 	'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT',	0, 				'TCM_ASSYRIA_ATLAS'),
			('BUILDING_TCM_ASSYRIA_HAPPINESS',	'BUILDINGCLASS_TCM_ASSYRIA_DUMMY', 	5,					-1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT', 	'TXT_KEY_TRAIT_TCM_SAMMURAMAT_ASSYRIA_SHORT',	0, 				'TCM_ASSYRIA_ATLAS');
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================					
INSERT INTO Building_Flavors 
			(BuildingType, 				FlavorType,				Flavor)
VALUES		('BUILDING_TCM_EKALLU', 	'FLAVOR_RELIGION',		40);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================					
INSERT INTO Building_YieldChanges 
			(BuildingType, 					YieldType,			Yield)
VALUES		('BUILDING_TCM_EKALLU', 		'YIELD_FAITH',		2),
			('BUILDING_TCM_ASSYRIA_FOOD', 	'YIELD_FOOD',		2);
--==========================================================================================================================	
-- Building_ClassesNeededInCity
--==========================================================================================================================					
INSERT INTO Building_ClassesNeededInCity 
			(BuildingType, 				BuildingClassType)
VALUES		('BUILDING_TCM_EKALLU', 	'BUILDINGCLASS_SHRINE');
--==========================================================================================================================
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat,		Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 									 	Strategy, 							  		Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 				UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, IconAtlas,				 MoveRate)
SELECT		Class,		('UNIT_TCM_SAPPER_UNIT'),	PrereqTech, Combat-1,	Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_SAPPER_UNIT'),  ('TXT_KEY_CIVILOPEDIA_UNITS_TCM_SAPPER_UNIT_TEXT'), ('TXT_KEY_UNIT_TCM_SAPPER_UNIT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_TCM_SAPPER_UNIT'), 	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_SAPPER'),	0,					('TCM_UNIT_FLAG_SAPPER_ATLAS'), 2, 			 ('TCM_ASSYRIA_ATLAS'),  MoveRate
FROM Units WHERE (Type = 'UNIT_SPEARMAN');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_SAPPER_UNIT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SPEARMAN');		
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_SAPPER_UNIT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SPEARMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_TCM_SAPPER_UNIT', 	'UNITCLASS_PIKEMAN');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_TCM_SAPPER_UNIT', 	'FLAVOR_OFFENSE',		6),
			('UNIT_TCM_SAPPER_UNIT', 	'FLAVOR_DEFENSE',		1);
--==========================================================================================================================	
--==========================================================================================================================	
-- Policies
--==========================================================================================================================
INSERT INTO Policies
			(Type, 									Description)
VALUES		('POLICY_TCM_ASSYRIA_BANKS_BABYLON', 	'TXT_KEY_DECISIONS_TCM_ASSYRIA_BANKS_BABYLON'),
			('POLICY_TCM_ASSYRIA_VICTORY_STELE', 	'TXT_KEY_DECISIONS_TCM_ASSYRIA_VICTORY_STELE');
--==========================================================================================================================	
-- Policy_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 							BuildingClassType,			Happiness)
VALUES		('POLICY_TCM_ASSYRIA_VICTORY_STELE', 	'BUILDINGCLASS_MONUMENT',	'1');
--==========================================================================================================================	
-- UnitPromotions
--==========================================================================================================================	
INSERT INTO UnitPromotions 
			(Type, 							 Description, 							 Help, 												Sound, 				LostWithUpgrade, OrderPriority, PromotionPrereqOr1, 	 CityAttack,	OnlyDefensive, 	NearbyEnemyCombatMod, 	NearbyEnemyCombatRange, CannotBeChosen,	PortraitIndex, 	IconAtlas,			PediaType, 			PediaEntry)
VALUES		('PROMOTION_TCM_LITERAL_DUMMY',	 'TXT_KEY_PROMOTION_TCM_LITERAL_DUMMY',  'TXT_KEY_PROMOTION_TCM_LITERAL_DUMMY_HELP',		'AS2D_IF_LEVELUP',	0, 				 0, 			-1, 					 0, 			1,				15,						1,						1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_LITERAL_DUMMY'),
			('PROMOTION_TCM_BATTLE_ENGINEER','TXT_KEY_PROMOTION_TCM_BATTLE_ENGINEER','TXT_KEY_PROMOTION_TCM_BATTLE_ENGINEER_HELP',		'AS2D_IF_LEVELUP',	1,				 0, 			-1, 					 150, 			0,				0,						0,						1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_BATTLE_ENGINEER'),
			('PROMOTION_TCM_SAPPING',		 'TXT_KEY_PROMOTION_TCM_SAPPING',		 'TXT_KEY_PROMOTION_TCM_SAPPING_HELP',				'AS2D_IF_LEVELUP',	1,				 0, 			-1, 					 0, 			0,				0,						0,						1,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_SAPPING'),
			('PROMOTION_TCM_SAPPING_2',		 'TXT_KEY_PROMOTION_TCM_SAPPING_2',		 'TXT_KEY_PROMOTION_TCM_SAPPING_2_HELP',			'AS2D_IF_LEVELUP',	1,				 1, 			'PROMOTION_TCM_SAPPING', 0, 			0,				0,						0,						0,				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_TCM_SAPPING_2');
--==========================================================================================================================
INSERT INTO UnitPromotions_UnitCombats 
			(PromotionType, 		  UnitCombatType)
VALUES		('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_RECON'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_ARCHER'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_MOUNTED'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_MELEE'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_SIEGE'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_GUN'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_ARMOR'),
			('PROMOTION_TCM_SAPPING', 'UNITCOMBAT_HELICOPTER'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_RECON'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_ARCHER'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_MOUNTED'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_MELEE'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_SIEGE'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_GUN'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_ARMOR'),
			('PROMOTION_TCM_SAPPING_2', 'UNITCOMBAT_HELICOPTER');
--==========================================================================================================================