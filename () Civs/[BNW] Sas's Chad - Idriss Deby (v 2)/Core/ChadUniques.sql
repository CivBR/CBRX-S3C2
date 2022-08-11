--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Class, 								Type, PrereqTech,	Combat,	RangedCombat,	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	Range,	CombatClass,	Domain,		DefaultUnitAI,	Description,								Civilopedia,									Strategy,											Help,											MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		UnitArtInfo,								UnitFlagIconOffset,	UnitFlagAtlas,									PortraitIndex,	IconAtlas,				MoveRate)
SELECT	Class,	('UNIT_SAS_TECHNICAL'), PrereqTech,	'45',	'55',	Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves + 2,	'2',	CombatClass,	Domain,		DefaultUnitAI,	('TXT_KEY_UNIT_SAS_TECHNICAL'),	('TXT_KEY_CIVILOPEDIA_SAS_TECHNICAL_TEXT'),	('TXT_KEY_UNIT_SAS_TECHNICAL_STRATEGY'),	('TXT_KEY_UNIT_SAS_TECHNICAL_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	ObsoleteTech,	IgnoreBuildingDefense,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	XPValueAttack,		XPValueDefense,		('ART_DEF_UNIT_SAS_TECHNICAL'),	0,					('SAS_TECHNICAL_FLAG'),	4,				('CIV_COLOR_ATLAS_SAS_CHAD'),	MoveRate
FROM Units WHERE (Type = 'UNIT_ANTI_TANK_GUN');

INSERT INTO Units 	
			(Class, 	Type, 						PrereqTech, Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, Description, 						Civilopedia, 									 	Strategy, 									Help, 								  MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, 						UnitFlagIconOffset,	UnitFlagAtlas,					  	 PortraitIndex, IconAtlas,			 MoveRate)
SELECT		Class,		('UNIT_SAS_FAP'),   PrereqTech, Combat, Cost, ObsoleteTech, FaithCost, RequiresFaithPurchaseEnabled, Moves, CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_SAS_FAP'), 	('TXT_KEY_CIVILOPEDIA_SAS_FAP_TEXT'), ('TXT_KEY_UNIT_SAS_FAP_STRATEGY'), ('TXT_KEY_UNIT_SAS_FAP_HELP'), MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, Mechanized, CombatLimit, MinAreaSize, Pillage, XPValueAttack, XPValueDefense, Conscription, ('ART_DEF_UNIT_SAS_FAP'),	0,					('SAS_FAP_FLAG'), 3, 			('CIV_COLOR_ATLAS_SAS_CHAD'),  MoveRate
FROM Units WHERE (Type = 'UNIT_INFANTRY');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 							SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SAS_TECHNICAL'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ANTI_TANK_GUN');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT		('UNIT_SAS_FAP'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_INFANTRY');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
			(UnitType, 							UnitAIType)
SELECT		('UNIT_SAS_TECHNICAL'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ANTI_TANK_GUN');

INSERT INTO Unit_AITypes 	
			(UnitType, 					UnitAIType)
SELECT		('UNIT_SAS_FAP'), 	UnitAIType
FROM Unit_AIType WHERE (UnitType = 'UNIT_INFANTRY');	
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
			(UnitType, 							FlavorType,			Flavor)
SELECT		('UNIT_SAS_TECHNICAL'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ANTI_TANK_GUN');

INSERT INTO Unit_Flavors 	
			(UnitType, 					FlavorType,				Flavor)
VALUES		('UNIT_SAS_FAP', 	'FLAVOR_OFFENSE',		22),
			('UNIT_SAS_FAP', 	'FLAVOR_DEFENSE',		22);
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 							UnitClassType)
SELECT	('UNIT_SAS_TECHNICAL'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_ANTI_TANK_GUN');

INSERT INTO Unit_ClassUpgrades 		
			(UnitType, 					UnitClassType)
SELECT		('UNIT_SAS_FAP'), 	UnitClassType
FROM UnitClassType WHERE (UnitType = 'UNIT_INFANTRY');	
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_SAS_CHADLAKE',	'BUILDING_SAS_CHADLAKE',	'TXT_KEY_BUILDING_SAS_CHADLAKE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 								 BuildingClass, 							GreatWorkCount, Cost,	FaithCost,	ConquestProb,	NukeImmune,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_SAS_CHADLAKE',	 'BUILDINGCLASS_SAS_CHADLAKE',		-1, 			-1,		-1,	0,	1, 		null,		0,				'TXT_KEY_BUILDING_SAS_CHADLAKE',	'TXT_KEY_BUILDING_SAS_CHADLAKE');
--==========================================================================================================================	
-- Building_TerrainYieldChanges
--==========================================================================================================================	
INSERT INTO Building_LakePlotYieldChanges
			(BuildingType, 				YieldType, 			Yield)
VALUES		('BUILDING_SAS_CHADLAKE',		'YIELD_FOOD',		1);

UPDATE Civilizations SET PortraitIndex = 1 WHERE Type = 'CIVILIZATION_SAS_CHAD' AND ((SELECT strftime('%Y-%m-%d','now')) == strftime('%Y-04-01') OR (SELECT strftime('%Y-%m-%d','now')) == strftime('%Y-04-20') OR (SELECT strftime('%Y-%m-%d','now')) == strftime('%Y-09-05') OR (SELECT strftime('%Y-%m-%d','now')) == strftime('%Y-06-18') OR (SELECT strftime('%Y-%m-%d','now')) == strftime('%Y-12-02'));