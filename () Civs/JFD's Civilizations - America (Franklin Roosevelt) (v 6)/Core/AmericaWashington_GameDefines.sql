--==========================================================================================================================
-- UNITS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO UnitPromotions 
		(Type, 							FriendlyLandsAttackModifier,	Description, 						Help, 										Sound, 				CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			  PediaEntry)
VALUES	('PROMOTION_JFD_SCHOONER_1',	25,								'TXT_KEY_PROMOTION_JFD_SCHOONER_1',	'TXT_KEY_PROMOTION_JFD_SCHOONER_1_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_SCHOONER_1'),
		('PROMOTION_JFD_SCHOONER_2',	0,								'TXT_KEY_PROMOTION_JFD_SCHOONER_2',	'TXT_KEY_PROMOTION_JFD_SCHOONER_2_HELP',	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',   'TXT_KEY_PROMOTION_JFD_SCHOONER_2');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions_UnitClasses
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM UnitPromotions_UnitClasses WHERE PromotionType = 'PROMOTION_JFD_SCHOONER_2';
INSERT INTO UnitPromotions_UnitClasses
		(PromotionType, 				UnitClassType,			 Attack)
VALUES	('PROMOTION_JFD_SCHOONER_2',	'UNITCLASS_PRIVATEER',	 33);
--------------------------------------------------------------------------------------------------------------------------
-- Units
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Units 	
		(Type, 					Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	Description, 					Help, 								Strategy, 								Civilopedia, 						ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, UnitArtInfo, 					UnitFlagAtlas, 								UnitFlagIconOffset,  IconAtlas,								PortraitIndex)
SELECT	'UNIT_JFD_SCHOONER',	Class,	CombatClass, PrereqTech, Cost, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_JFD_SCHOONER',	'TXT_KEY_UNIT_JFD_SCHOONER_HELP', 	'TXT_KEY_UNIT_JFD_SCHOONER_STRATEGY',  	'TXT_KEY_UNIT_JFD_SCHOONER_TEXT',	ShowInPedia, Pillage, OneShotTourism, OneShotTourismPercentOthers, AdvancedStartCost, WorkRate, ObsoleteTech, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, CombatLimit,  GoldenAgeTurns,  XPValueAttack, XPValueDefense, Conscription, MoveRate, 'ART_DEF_UNIT_JFD_SCHOONER',		'JFD_AMERICA_WASHINGTON_UNIT_FLAG_ATLAS',	0,					 'JFD_AMERICA_WASHINGTON_ICON_ATLAS',	0
FROM Units WHERE Type = 'UNIT_PRIVATEER';  
--------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SCHOONER',	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_AITypes WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO Unit_AITypes 			
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SCHOONER',	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_Flavors WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SCHOONER',	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_PRIVATEER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 				UnitClassType)
SELECT	'UNIT_JFD_SCHOONER',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 				ResourceType, Cost)
SELECT	'UNIT_JFD_SCHOONER',	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
--------------------------------------------------------------------------------------------------------------------------
DELETE FROM Unit_FreePromotions WHERE UnitType = 'UNIT_JFD_SCHOONER';
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_SCHOONER',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_PRIVATEER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 			  PromotionType)
VALUES	('UNIT_JFD_SCHOONER', 'PROMOTION_JFD_SCHOONER_1'),
		('UNIT_JFD_SCHOONER', 'PROMOTION_JFD_SCHOONER_2');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_AMERICA',	'UNITCLASS_PRIVATEER', 	'UNIT_JFD_SCHOONER');
--==========================================================================================================================
--==========================================================================================================================