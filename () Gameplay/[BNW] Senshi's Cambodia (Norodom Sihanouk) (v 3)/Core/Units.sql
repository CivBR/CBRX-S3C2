--==========================================================================================================================
-- Units
--==========================================================================================================================
INSERT INTO Units
(Type, 									Class, Cost, Range, PrereqTech, Combat, RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction, Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, Description, 						Civilopedia, 							Help, 									Strategy,									AdvancedStartCost,	UnitArtInfo, 					  UnitFlagIconOffset,	UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT		('UNIT_SENSHI_FUNK'),		Class, Cost, Range, PrereqTech, Combat-10, RangedCombat,	Moves, FaithCost,	RequiresFaithPurchaseEnabled, CombatClass, MilitarySupport, MilitaryProduction,	Domain, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass, XPValueAttack, XPValueDefense, Conscription,  DefaultUnitAI, ('TXT_KEY_UNIT_SENSHI_FUNK'),	('TXT_KEY_CIV5_UNIT_SENSHI_FUNK_TEXT'), 	('TXT_KEY_UNIT_SENSHI_FUNK_HELP'), 	('TXT_KEY_UNIT_SENSHI_FUNK_STRATEGY'),	AdvancedStartCost, 	('ART_DEF_UNIT_SENSHI_FUNK'),  0,					('SENSHI_FUNK_FLAG'),	2, 				('SENSHI_CAMBODIA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================
INSERT INTO UnitGameplay2DScripts
(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SENSHI_FUNK'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================
INSERT INTO Unit_AITypes
(UnitType, 					UnitAIType)
SELECT		('UNIT_SENSHI_FUNK'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_ClassUpgrades
--==========================================================================================================================
INSERT INTO Unit_ClassUpgrades
(UnitType, 					UnitClassType)
SELECT		('UNIT_SENSHI_FUNK'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================
INSERT INTO Unit_Flavors
(UnitType, 					FlavorType, Flavor)
SELECT		'UNIT_SENSHI_FUNK', 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 								PromotionType)
VALUES		('UNIT_SENSHI_FUNK', 		'PROMOTION_IGNORE_TERRAIN_COST'),
			('UNIT_SENSHI_FUNK', 		'PROMOTION_CAN_MOVE_AFTER_ATTACKING');
			-- ('UNIT_SENSHI_FUNK', 		'PROMOTION_SENSHI_FUNK');

INSERT INTO Unit_FreePromotions
			(UnitType, 					PromotionType)
SELECT		'UNIT_SENSHI_FUNK',		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_MACHINE_GUN');
--==========================================================================================================================
--==========================================================================================================================
