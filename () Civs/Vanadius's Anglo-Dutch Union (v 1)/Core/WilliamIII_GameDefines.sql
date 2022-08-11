--=========================================================================================================================	
-- LEADERS
--=========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 							Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_SPLATDAY_WILLIAM', 		'TXT_KEY_LEADER_SPLATDAY_WILLIAM', 	'TXT_KEY_LEADER_SPLATDAY_WILLIAM_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_SPLATDAY_WILLIAM', 	'KingBilly_Scene.xml',	5, 						7, 						8, 							4, 			6, 				5, 				4, 					 6, 			 7, 		5, 			6, 				5, 			3, 			'SPLATDAY_DUTCH_ATLAS', 	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_WAR', 			7),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_HOSTILE', 		5),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	8),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
		('LEADER_SPLATDAY_WILLIAM', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_SPLATDAY_WILLIAM',		'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_SPLATDAY_WILLIAM',		'MINOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_SPLATDAY_WILLIAM',		'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
		('LEADER_SPLATDAY_WILLIAM',		'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_SPLATDAY_WILLIAM',		'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------		
-- Leader_Flavors
--------------------------------								
INSERT INTO Leader_Flavors 
		(LeaderType, 					FlavorType, 						Flavor)
VALUES	('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_OFFENSE', 					9),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_DEFENSE', 					5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_MILITARY_TRAINING', 		7),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_RECON', 					3),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_RANGED', 					4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_MOBILE', 					3),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_NAVAL', 					7),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_NAVAL_GROWTH', 				8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_AIR', 						4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_EXPANSION', 				9),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_GROWTH', 					5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_INFRASTRUCTURE', 			6),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_GOLD', 						8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_SCIENCE', 					5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_CULTURE', 					6),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_HAPPINESS', 				5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_GREAT_PEOPLE', 				8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_WONDER', 					4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_RELIGION', 					10),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_SPACESHIP', 				3),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_WATER_CONNECTION', 			7),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_NUKE', 						2),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_USE_NUKE', 					2),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_ESPIONAGE', 				8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_AIRLIFT', 					2),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_I_TRADE_DESTINATION', 		8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_I_TRADE_ORIGIN', 			8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		8),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_SPLATDAY_WILLIAM', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------		
-- Leader_Traits
--------------------------------		
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_SPLATDAY_WILLIAM', 		'TRAIT_SPLATDAY_DUTCH');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 						ShortDescription)
VALUES	('TRAIT_SPLATDAY_DUTCH',			'TXT_KEY_TRAIT_SPLATDAY_DUTCH',		'TXT_KEY_TRAIT_SPLATDAY_DUTCH_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 							Description,						ShortDescription, 						Adjective, 								Civilopedia, 							CivilopediaTag, 				DefaultPlayerColor,				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 				PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 	MapImage, 							DawnOfManQuote, 					DawnOfManImage)
SELECT	'CIVILIZATION_SPLATDAY_DUTCH',	'TXT_KEY_CIV_SPLATDAY_DUTCH_DESC',	'TXT_KEY_CIV_SPLATDAY_DUTCH_SHORT_DESC',	'TXT_KEY_CIV_SPLATDAY_DUTCH_ADJECTIVE',	Civilopedia,		CivilopediaTag, 	'PLAYERCOLOR_SPLATDAY_DUTCH',		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'SPLATDAY_DUTCH_ATLAS',	0, 				'SPLATDAY_DUTCH_ALPHA_ATLAS',	SoundtrackTag, 		'GloriousRevMap.dds',		'TXT_KEY_SPLATDAY_DUTCH_DOM',	'KingBillyDOM.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_NETHERLANDS';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
		(CivilizationType, 				CityName)
VALUES	('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_01'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_02'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_03'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_04'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_05'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_06'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_07'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_08'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_09'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_10'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_11'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_12'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_12'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_13'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_14'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_15'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_16'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_17'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_18'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_19'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_20'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_21'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_22'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_23'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_24'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_25'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_26'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_27'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_28'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_29'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_30'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_31'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_32'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_33'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_34'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_35'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_36'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_37'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_38'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_39'),
		('CIVILIZATION_SPLATDAY_DUTCH',   'TXT_KEY_CITY_NAME_SPLATDAY_WILLIAM_40');

--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	'CIVILIZATION_SPLATDAY_DUTCH', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	'CIVILIZATION_SPLATDAY_DUTCH',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_SPLATDAY_DUTCH', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_SPLATDAY_DUTCH', 	'LEADER_SPLATDAY_WILLIAM');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_SPLATDAY_DUTCH', 	'UNITCLASS_FRIGATE', 	'UNIT_VANA_MAN_OF_WAR'),
		('CIVILIZATION_SPLATDAY_DUTCH', 	'UNITCLASS_RIFLEMAN', 	'UNIT_VANA_BLUE_GUARD');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_SPLATDAY_DUTCH', 	'RELIGION_PROTESTANTISM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames
		(CivilizationType, 				SpyName)
SELECT	'CIVILIZATION_SPLATDAY_DUTCH', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_NETHERLANDS';

--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					 Help, 									Strategy, 									Civilopedia, 						ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 				   UnitFlagIconOffset,  IconAtlas,					PortraitIndex)
SELECT	'UNIT_VANA_MAN_OF_WAR',	Class,	CombatClass, PrereqTech, Cost, Combat,	 RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_VANA_MAN_OF_WAR', 'TXT_KEY_UNIT_VANA_MAN_OF_WAR_HELP', 	'TXT_KEY_UNIT_VANA_MAN_OF_WAR_STRATEGY',   'TXT_KEY_UNIT_VANA_MAN_OF_WAR_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo,	'VANA_MAN_OF_WAR_FLAG',  0,					'SPLATDAY_DUTCH_ATLAS',	2
FROM Units WHERE Type = 'UNIT_FRIGATE';  

INSERT INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat,   RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 				 Help, 								Strategy, 								Civilopedia, 						ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 				UnitFlagAtlas, 				   UnitFlagIconOffset,  IconAtlas,					PortraitIndex)
SELECT	'UNIT_VANA_BLUE_GUARD',	Class,	CombatClass, PrereqTech, Cost+20, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_VANA_BLUE_GUARD', 'TXT_KEY_UNIT_VANA_BLUE_GUARD_HELP', 	'TXT_KEY_UNIT_VANA_BLUE_GUARD_STRATEGY',   'TXT_KEY_UNIT_VANA_BLUE_GUARD_TEXT',	ShowInPedia, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_VANA_BLUE_GUARD',	'VANA_BLUE_GUARD_FLAG',  0,					'SPLATDAY_DUTCH_ATLAS',	3
FROM Units WHERE Type = 'UNIT_RIFLEMAN';  
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_VANA_MAN_OF_WAR',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_VANA_BLUE_GUARD',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_VANA_MAN_OF_WAR',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_VANA_BLUE_GUARD',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_VANA_MAN_OF_WAR',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_VANA_BLUE_GUARD',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_RIFLEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_VANA_MAN_OF_WAR',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_VANA_BLUE_GUARD',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_RIFLEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_VANA_MAN_OF_WAR',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_FRIGATE';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 		
		(UnitType, 				PromotionType)
SELECT	'UNIT_VANA_MAN_OF_WAR',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_FRIGATE';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			 PromotionType)
VALUES	('UNIT_VANA_BLUE_GUARD',	 'PROMOTION_BLITZ');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------

--INSERT INTO UnitPromotions 	
--		(Type,			Description,		Help,		CannotBeChosen,			Sound,		LostWithUpgrade,		CombatPercent,		PortraitIndex,		IconAtlas,		PediaType,		PediaEntry)
--VALUES	('PROMOTION_VANA_BLUE_GUARD_BONUS',	 'TXT_KEY_PROMOTION_VANA_BLUE_GUARD_BONUS', 'TXT_KEY_PROMOTION_VANA_BLUE_GUARD_BONUS_HELP', true, 'AS2D_IF_LEVELUP', true, 15, 11, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_VANA_BLUE_GUARD_BONUS'),
--		('PROMOTION_VANA_MAN_OF_WAR_BONUS',	 'TXT_KEY_PROMOTION_VANA_MAN_OF_WAR_BONUS', 'TXT_KEY_PROMOTION_VANA_MAN_OF_WAR_BONUS_HELP', true, 'AS2D_IF_LEVELUP', true, 20, 11, 'EXPANSION2_PROMOTION_ATLAS', 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_VANA_MAN_OF_WAR_BONUS');
		
