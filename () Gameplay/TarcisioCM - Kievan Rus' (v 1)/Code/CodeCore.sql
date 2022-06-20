--==========================================================================================================================		
--==========================================================================================================================
-- Civilizations
--==========================================================================================================================
INSERT INTO Civilizations 	
			(Type, 						DerivativeCiv,						Description, 					ShortDescription, 					Adjective, 								Civilopedia, 						CivilopediaTag, 			DefaultPlayerColor,		  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,			AlphaIconAtlas, 			PortraitIndex,	SoundtrackTag, 	MapImage, 						DawnOfManQuote, 					DawnOfManImage)
SELECT		('CIVILIZATION_TCM_KIEV'), 	('CIVILIZATION_KIEVAN_RUS_MOD'),	('TXT_KEY_CIV_TCM_KIEV_DESC'), 	('TXT_KEY_CIV_TCM_KIEV_SHORT_DESC'), ('TXT_KEY_CIV_TCM_KIEV_ADJECTIVE'), 	('TXT_KEY_CIV5_TCM_KIEV_TEXT_1'),	('TXT_KEY_CIV5_TCM_KIEV'), 	('PLAYERCOLOR_TCM_KIEV'), ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('TCM_KIEV_ATLAS'), 	('TCM_KIEV_ALPHA_ATLAS'), 	0, 				('RUSSIA'),	 	('tcm_kievan_rus_map.dds'), 	('TXT_KEY_CIV5_DOM_TCM_KIEV_TEXT'), ('tcm_kievan_rus_dom.dds')
FROM Civilizations WHERE Type = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilization_CityNames
--==========================================================================================================================		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_01'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_02'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_03'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_04'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_05'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_06'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_07'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_08'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_09'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_10'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_11'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_12'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_13'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_14'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_15'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_16'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_17'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_18'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_19'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_20'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_21'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_22'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_23'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_24'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_25'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_26'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_27'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_28'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_29'),
			('CIVILIZATION_TCM_KIEV', 		'TXT_KEY_CITY_NAME_TCM_KIEV_30');
--==========================================================================================================================
-- Civilization_FreeBuildingClasses
--==========================================================================================================================		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 			BuildingClassType)
VALUES		('CIVILIZATION_TCM_KIEV', 	'BUILDINGCLASS_PALACE');
--==========================================================================================================================
-- Civilization_FreeTechs
--==========================================================================================================================	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 			TechType)
SELECT		('CIVILIZATION_TCM_KIEV'), 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilization_FreeUnits
--==========================================================================================================================	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_TCM_KIEV'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--==========================================================================================================================
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 			LeaderheadType)
VALUES		('CIVILIZATION_TCM_KIEV', 	'LEADER_TCM_OLGA');
--==========================================================================================================================
-- Civilization_UnitClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 			UnitClassType, 		 UnitType)
VALUES		('CIVILIZATION_TCM_KIEV', 	'UNITCLASS_PIKEMAN', 'UNIT_TCM_GOST_CONVOY');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 		BuildingType)
VALUES		('CIVILIZATION_TCM_KIEV', 	'BUILDINGCLASS_MARKET', 'BUILDING_TCM_TORG');
--==========================================================================================================================
-- Civilization_Religions
--==========================================================================================================================	
INSERT INTO Civilization_Religions 
			(CivilizationType, 			ReligionType)
VALUES		('CIVILIZATION_TCM_KIEV', 	'RELIGION_ORTHODOXY');
--==========================================================================================================================
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_0'),	
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_1'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_2'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_3'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_4'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_5'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_6'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_7'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_8'),
			('CIVILIZATION_TCM_KIEV', 	'TXT_KEY_SPY_NAME_TCM_KIEV_9');
--==========================================================================================================================	
-- Colors
--==========================================================================================================================			
INSERT INTO Colors 
			(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_TCM_KIEV_ICON',			0.941,	0.82,	0.584,	1),
			('COLOR_PLAYER_TCM_KIEV_BACKGROUND',	0.525,	0.298,	0,		1); 
--==========================================================================================================================	
-- PlayerColors
--==========================================================================================================================				
INSERT INTO PlayerColors 
			(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES		('PLAYERCOLOR_TCM_KIEV',	'COLOR_PLAYER_TCM_KIEV_ICON', 	'COLOR_PLAYER_TCM_KIEV_BACKGROUND', 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 					Description, 				Civilopedia, 						  CivilopediaTag, 					ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, Chattiness, Meanness, 	IconAtlas, 			PortraitIndex)
VALUES		('LEADER_TCM_OLGA', 	'TXT_KEY_LEADER_TCM_OLGA', 	'TXT_KEY_LEADER_TCM_OLGA_PEDIA_TEXT', 'TXT_KEY_LEADER_TCM_OLGA_PEDIA',  'tcm_Olga_Leaderhead.xml',	9, 						2, 						9, 						 9, 		8, 				2, 				7, 					 4, 			 10, 		7, 			0, 			 5, 		 10, 		'TCM_KIEV_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 			MajorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_GUARDED', 		3),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_TCM_OLGA', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		7);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_TCM_OLGA', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
			('LEADER_TCM_OLGA', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_TCM_OLGA', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	8),
			('LEADER_TCM_OLGA', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_TCM_OLGA', 	'MINOR_CIV_APPROACH_BULLY', 		7);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_TCM_OLGA', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_TCM_OLGA', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_TCM_OLGA', 	'FLAVOR_CITY_DEFENSE', 				9),
			('LEADER_TCM_OLGA', 	'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_TCM_OLGA', 	'FLAVOR_RECON', 					5),
			('LEADER_TCM_OLGA', 	'FLAVOR_RANGED', 					5),
			('LEADER_TCM_OLGA', 	'FLAVOR_MOBILE', 					3),
			('LEADER_TCM_OLGA', 	'FLAVOR_NAVAL', 					3),
			('LEADER_TCM_OLGA', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_TCM_OLGA', 	'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_TCM_OLGA', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_TCM_OLGA', 	'FLAVOR_AIR', 						5),
			('LEADER_TCM_OLGA', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_TCM_OLGA', 	'FLAVOR_GROWTH', 					4),
			('LEADER_TCM_OLGA', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
			('LEADER_TCM_OLGA', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_TCM_OLGA', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_TCM_OLGA', 	'FLAVOR_GOLD', 						8),
			('LEADER_TCM_OLGA', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_TCM_OLGA', 	'FLAVOR_CULTURE', 					6),
			('LEADER_TCM_OLGA', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_TCM_OLGA', 	'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_TCM_OLGA', 	'FLAVOR_WONDER', 					4),
			('LEADER_TCM_OLGA', 	'FLAVOR_RELIGION', 					8),
			('LEADER_TCM_OLGA', 	'FLAVOR_DIPLOMACY', 				9),
			('LEADER_TCM_OLGA', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_TCM_OLGA', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_TCM_OLGA', 	'FLAVOR_NUKE', 						9),
			('LEADER_TCM_OLGA', 	'FLAVOR_USE_NUKE', 					9),
			('LEADER_TCM_OLGA', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_TCM_OLGA', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_TCM_OLGA', 	'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_TCM_OLGA', 	'FLAVOR_I_TRADE_ORIGIN', 			7),
			('LEADER_TCM_OLGA', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
			('LEADER_TCM_OLGA', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_TCM_OLGA', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_TCM_OLGA', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_TCM_OLGA', 	'TRAIT_TCM_OLGA_KIEV');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 					ShortDescription)
VALUES		('TRAIT_TCM_OLGA_KIEV', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_TCM_OLGA_PEACE', 	'tcm_kiev_peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_TCM_OLGA_WAR',		'tcm_kiev_war', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 							SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_TCM_OLGA_PEACE', 	'SND_LEADER_MUSIC_TCM_OLGA_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_TCM_OLGA_WAR', 		'SND_LEADER_MUSIC_TCM_OLGA_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						 		DefaultBuilding, 			Description)
VALUES		('BUILDINGCLASS_TCM_KIEV_DUMMY', 	'BUILDING_TCM_DUMMY_KIEV', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================			
INSERT INTO Buildings
			(Type, 					BuildingClass, FreeStartEra, Cost, GoldMaintenance, PrereqTech, NeverCapture, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, ConquestProb, Description,						Help,								Civilopedia,					Strategy,								ArtDefineTag, MinAreaSize, 	HurryCostModifier, IconAtlas,			PortraitIndex)
SELECT		('BUILDING_TCM_TORG'),	BuildingClass, FreeStartEra, Cost, GoldMaintenance, PrereqTech, NeverCapture, SpecialistType, SpecialistCount, TradeRouteRecipientBonus, TradeRouteTargetBonus, ConquestProb, ('TXT_KEY_BUILDING_TCM_TORG'), 	('TXT_KEY_BUILDING_TCM_TORG_HELP'),	('TXT_KEY_CIV5_TCM_TORG_TEXT'),	('TXT_KEY_BUILDING_TCM_TORG_STRATEGY'),	ArtDefineTag, MinAreaSize, 	HurryCostModifier, ('TCM_KIEV_ATLAS'), 	3
FROM Buildings WHERE Type = 'BUILDING_MARKET';		

INSERT INTO Buildings 	
			(Type, 									BuildingClass, 					GreatWorkCount, Cost, FaithCost, NukeImmune, ConquestProb,  PrereqTech,	Description, 							Help,									PortraitIndex, 	IconAtlas)
VALUES		('BUILDING_TCM_KIEV_GOLD_DUMMY',		'BUILDINGCLASS_TCM_KIEV_DUMMY', -1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT',	0, 				'TCM_KIEV_ATLAS'),
			('BUILDING_TCM_KIEV_PRODUCTION_DUMMY',	'BUILDINGCLASS_TCM_KIEV_DUMMY', -1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT',	0, 				'TCM_KIEV_ATLAS'),
			('BUILDING_TCM_KIEV_XP_DUMMY',			'BUILDINGCLASS_TCM_KIEV_DUMMY', -1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT',	0, 				'TCM_KIEV_ATLAS'),
			('BUILDING_TCM_KIEV_GOLD_PUPPET_DUMMY',	'BUILDINGCLASS_TCM_KIEV_DUMMY', -1, 			-1,   -1, 		 1,		 	 0,				NULL, 		'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT', 	'TXT_KEY_TRAIT_TCM_OLGA_KIEV_SHORT',	0, 				'TCM_KIEV_ATLAS');
--==========================================================================================================================	
-- Building_Flavors	
--==========================================================================================================================				
INSERT INTO Building_Flavors 
			(BuildingType, 			FlavorType,						Flavor)
VALUES		('BUILDING_TCM_TORG', 	'FLAVOR_GOLD',					25),
			('BUILDING_TCM_TORG', 	'FLAVOR_I_TRADE_ORIGIN',		25),
			('BUILDING_TCM_TORG', 	'FLAVOR_I_TRADE_DESTINATION',	25),
			('BUILDING_TCM_TORG', 	'FLAVOR_GREAT_PEOPLE',			2),
			('BUILDING_TCM_TORG', 	'FLAVOR_PRODUCTION',			10);
--==========================================================================================================================	
-- Building_YieldChanges	
--==========================================================================================================================
			INSERT INTO Building_YieldChanges 
			(BuildingType, 							YieldType,			Yield)
VALUES		('BUILDING_TCM_TORG', 					'YIELD_GOLD',		1),
			('BUILDING_TCM_KIEV_GOLD_DUMMY', 		'YIELD_GOLD',		1),
			('BUILDING_TCM_KIEV_PRODUCTION_DUMMY', 	'YIELD_PRODUCTION',	2);
--==========================================================================================================================	
-- Building_DomainFreeExperiences
--==========================================================================================================================					
INSERT INTO Building_DomainFreeExperiences 
			(BuildingType, 					DomainType,			Experience)
VALUES		('BUILDING_TCM_KIEV_XP_DUMMY', 	'DOMAIN_LAND',		10),
			('BUILDING_TCM_KIEV_XP_DUMMY', 	'DOMAIN_SEA',		10),
			('BUILDING_TCM_KIEV_XP_DUMMY', 	'DOMAIN_AIR',		10);
--==========================================================================================================================	
-- Building_YieldModifiers	
--==========================================================================================================================
			INSERT INTO Building_YieldModifiers 
			(BuildingType, 							YieldType,		Yield)
VALUES		('BUILDING_TCM_TORG', 					'YIELD_GOLD',	25),
			('BUILDING_TCM_KIEV_GOLD_PUPPET_DUMMY', 'YIELD_GOLD',	25);
--==========================================================================================================================
--==========================================================================================================================	
-- Units
--==========================================================================================================================		
INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 									 	Strategy, 									Help, 								  MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,					  	 PortraitIndex, IconAtlas,			 MoveRate)
SELECT		Class,		('UNIT_TCM_GOST_CONVOY'),   PrereqTech, Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_TCM_GOST_CONVOY'), 	('TXT_KEY_CIVILOPEDIA_UNITS_TCM_GOST_CONVOY_TEXT'), ('TXT_KEY_UNIT_TCM_GOST_CONVOY_STRATEGY'), ('TXT_KEY_UNIT_HELP_TCM_GOST_CONVOY'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_TCM_GOST_CONVOY'),	0,					('TCM_UNIT_FLAG_GOST_CONVOY_ATLAS'), 2, 			('TCM_KIEV_ATLAS'),  MoveRate
FROM Units WHERE (Type = 'UNIT_PIKEMAN');
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_TCM_GOST_CONVOY'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');		
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_TCM_GOST_CONVOY'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PIKEMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================		
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 					UnitClassType)
VALUES		('UNIT_TCM_GOST_CONVOY', 	'UNITCLASS_LANCER');
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_TCM_GOST_CONVOY', 	'FLAVOR_OFFENSE',		5),
			('UNIT_TCM_GOST_CONVOY', 	'FLAVOR_DEFENSE',		7);
--==========================================================================================================================	
-- Unit_FreePromotions
--==========================================================================================================================		
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				 PromotionType)
VALUES		('UNIT_TCM_GOST_CONVOY', 'PROMOTION_ANTI_MOUNTED_I');
--==========================================================================================================================	
--==========================================================================================================================
--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================	
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_FIRST_GREETING',						'TXT_KEY_LEADER_TCM_OLGA_FIRSTGREETING%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_DEFEATED',							'TXT_KEY_LEADER_TCM_OLGA_DEFEATED%','1');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_RESPONSE_TO_BEING_DENOUNCED',		'TXT_KEY_LEADER_TCM_OLGA_RESPONSE_TO_BEING_DENOUNCED%','500');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_HUMAN_DENOUNCE_SO_AI_DENOUNCE',		'TXT_KEY_LEADER_TCM_OLGA_HUMAN_DENOUNCE_SO_AI_DENOUNCE%','500');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_WORK_AGAINST_SOMEONE',				'TXT_KEY_LEADER_TCM_OLGA_DENOUNCE%','500');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_DOW_BETRAYAL',						'TXT_KEY_LEADER_TCM_OLGA_DOW_BETRAYAL%','500');
INSERT INTO Diplomacy_Responses (LeaderType, ResponseType, Response, Bias) VALUES ('LEADER_TCM_OLGA','RESPONSE_ATTACKED_MILITARY_PROMISE_BROKEN',	'TXT_KEY_LEADER_TCM_OLGA_ATTACKED_MILITARY_PROMISE_BROKEN%','500');
--==========================================================================================================================	
--==========================================================================================================================	
			INSERT INTO Policies 
			(Type, 								Description)
VALUES		('POLICY_TCM_KIEV_DECISION', 		'TXT_KEY_DECISIONS_TCM_KIEV_REFORM');


