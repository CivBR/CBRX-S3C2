--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 												Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_KOPASSUS'),		Class, Cost, Range, PrereqTech, Combat, RangedCombat, Moves, FaithCost, RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_KOPASSUS'),	('TXT_KEY_UNIT_CIV5_SENSHI_KOPASSUS_TEXT'), 	('TXT_KEY_UNIT_SENSHI_KOPASSUS_HELP'), 	('TXT_KEY_UNIT_SENSHI_KOPASSUS_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_KOPASSUS'),  0,					('SENSHI_KOPASSUS_FLAG'),	2, 				('SENSHI_INDONESIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_KOPASSUS'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_KOPASSUS'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_KOPASSUS'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_KOPASSUS', 	FlavorType, Flavor+3
FROM Unit_Flavors WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_SENSHI_KOPASSUS', 		'PROMOTION_GOLDEN_AGE_POINTS');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_KOPASSUS',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_PARATROOPER');
--==========================================================================================================================
--==========================================================================================================================
