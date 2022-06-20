--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_PG_RIODELAPLATA', 	'UNITCLASS_CAVALRY',		'UNIT_PG_GRANADEROS');

-- Units
--------------------------------
INSERT INTO Units 	
			(Type, 					PrereqTech, Class, Combat,	RangedCombat,	CombatClass, Cost,   FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,							PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		'UNIT_PG_GRANADEROS',	PrereqTech, Class, Combat,	Combat-3,		CombatClass, Cost+5, FaithCost, RequiresFaithPurchaseEnabled, Moves, 1,		Domain, DefaultUnitAI, 'TXT_KEY_UNIT_PG_GRANADEROS',	'TXT_KEY_CIV5_PG_GRANADEROS_TEXT', 	'TXT_KEY_UNIT_PG_GRANADEROS_STRATEGY',	'TXT_KEY_UNIT_PG_GRANADEROS_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_PG_GRANADEROS',	0,					'PG_RIODELAPLATA_GRANADEROS_FLAG_ATLAS',	2, 				'PG_RIODELAPLATA_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_CAVALRY');

INSERT INTO Units 	
			(Type, 							PrereqTech, Class, Combat,		RangedCombat,	CombatClass, Cost,   FaithCost, RequiresFaithPurchaseEnabled, Moves, Range, Domain, DefaultUnitAI, Description, 							Civilopedia, 									Strategy, 										Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, UnitArtInfo, 					UnitFlagIconOffset,	UnitFlagAtlas,							PortraitIndex, 	IconAtlas,					MoveRate, GoldenAgeTurns)
SELECT		'UNIT_PG_SANMARTIN_PATRICIOS',	PrereqTech, Class, Combat-1,	RangedCombat,	CombatClass, -1,	-1,			RequiresFaithPurchaseEnabled, Moves, Range,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_PG_SANMARTIN_PATRICIOS',	'TXT_KEY_CIV5_PG_SANMARTIN_PATRICIOS_TEXT', 	'TXT_KEY_UNIT_PG_SANMARTIN_PATRICIOS_STRATEGY',	'TXT_KEY_UNIT_PG_SANMARTIN_PATRICIOS_HELP',	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, 'ART_DEF_UNIT_PG_SANMARTIN_PATRICIOS',	0,					'PG_SANMARTIN_PATRICIOS_FLAG_ATLAS',	7, 				'PG_RIODELAPLATA_ATLAS',	MoveRate, 4
FROM Units WHERE (Type = 'UNIT_RIFLEMAN');

--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PG_GRANADEROS', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_CAVALRY';	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_PG_SANMARTIN_PATRICIOS', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_RIFLEMAN';	

--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	'UNIT_PG_GRANADEROS', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_PG_SANMARTIN_PATRICIOS', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_RIFLEMAN';

--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType,	Cost)
SELECT	'UNIT_PG_GRANADEROS', 		ResourceType,	Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_CAVALRY';

--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_PG_GRANADEROS', 		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_CAVALRY';


--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_PG_GRANADEROS', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_CAVALRY';

--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_PG_GRANADEROS', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
SELECT	'UNIT_PG_SANMARTIN_PATRICIOS',	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_RIFLEMAN';

INSERT OR REPLACE INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_PG_GRANADEROS', 		'PROMOTION_PG_GRANADEROS_ON');

--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 								Help, 											Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry,								GoldenAgeValueFromKills)
VALUES	('PROMOTION_PG_SANMARTIN_TRAIT',	'TXT_KEY_PROMOTION_PG_SANMARTIN_TRAIT',		'TXT_KEY_PROMOTION_PG_SANMARTIN_TRAIT_HELP', 	'AS2D_IF_LEVELUP', 	1, 				4, 			'EXPANSION2_PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_SANMARTIN_TRAIT',	100),
		('PROMOTION_PG_GRANADEROS_ON', 		'TXT_KEY_PROMOTION_PG_GRANADEROS_ON',		'TXT_KEY_PROMOTION_PG_GRANADEROS_ON_HELP', 		'AS2D_IF_LEVELUP', 	1, 				31, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PG_GRANADEROS',		0),
		('PROMOTION_PG_GRANADEROS_OFF', 	'TXT_KEY_PROMOTION_PG_GRANADEROS_OFF',		'TXT_KEY_PROMOTION_PG_GRANADEROS_OFF_HELP', 	'AS2D_IF_LEVELUP', 	1, 				58, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_PG_GRANADEROS',		0);
