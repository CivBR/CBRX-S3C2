------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 											RangeChange,	RangedAttackModifier,	LostWithUpgrade,  Description, 											Help, 														Sound, 				CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			 PediaEntry)
VALUES	('PROMOTION_SENSHI_PARTISAN_RANGE',				1,				0,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE',			'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_HELP', 			'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE'),
		('PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_1',	0,				5,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH',	'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH'),
		('PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_2',	0,				5,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH',	'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH'),
		('PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_3',	0,				5,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH',	'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH'),
		('PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_4',	0,				5,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH',	'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH'),
		('PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_5',	0,				5,						1,				  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH',	'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH_HELP', 	'AS2D_IF_LEVELUP', 	1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSHI_PARTISAN_RANGE_STRENGTH');
--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 										DefaultBuilding, 					 Description)
VALUES	('BUILDINGCLASS_SENSHI_YUGOSLAVIA_TITO', 	'BUILDING_SENSHI_YUGOSLAVIA_TITO',  'TXT_KEY_BUILDING_SENSHI_YUGOSLAVIA_TITO');
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						 					BuildingClass, 								GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	NukeImmune, Description)
VALUES	('BUILDING_SENSHI_YUGOSLAVIA_TITO_CULTURE',		'BUILDINGCLASS_SENSHI_YUGOSLAVIA_TITO', 	-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_SENSHI_YUGOSLAVIA_TITO_CULTURE'),
		('BUILDING_SENSHI_YUGOSLAVIA_TITO_PRODUCTION',	'BUILDINGCLASS_SENSHI_YUGOSLAVIA_TITO', 	-1,				-1,   -1, 		 null, 		 1,				1,			'TXT_KEY_BUILDING_SENSHI_YUGOSLAVIA_TITO_PRODUCTION');
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 
		(BuildingType, 									YieldType,			Yield)
VALUES	('BUILDING_SENSHI_YUGOSLAVIA_TITO_CULTURE',    'YIELD_CULTURE',   1),
		('BUILDING_SENSHI_YUGOSLAVIA_TITO_PRODUCTION',  'YIELD_PRODUCTION',   1);	
--------------------------------------------------------------------------------------------------------------------------
-- Policies
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policies
		(Type,									Description)
VALUES	('POLICY_SENSHI_YUGOSLAVIA_TITO',		'TXT_KEY_POLICY_SENSHI_YUGOSLAVIA_TITO');	
--------------------------------------------------------------------------------------------------------------------------
-- Policy_BuildingClassCultureChanges
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				1
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE MilitaryProductionModifier > 0) AND (MaxGlobalInstances = -1 AND MaxPlayerInstances = -1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				2
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE MilitaryProductionModifier > 0) AND (MaxGlobalInstances = 1 OR MaxPlayerInstances = 1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				1
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_UnitCombatProductionModifiers WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = -1 AND MaxPlayerInstances = -1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				2
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_UnitCombatProductionModifiers WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = 1 OR MaxPlayerInstances = 1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				1
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_DomainProductionModifiers WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = -1 AND MaxPlayerInstances = -1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				2
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_DomainProductionModifiers WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = 1 OR MaxPlayerInstances = 1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				1
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_DomainFreeExperiences WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = -1 AND MaxPlayerInstances = -1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				2
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_DomainFreeExperiences WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = 1 OR MaxPlayerInstances = 1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				1
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_UnitCombatFreeExperiences WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = -1 AND MaxPlayerInstances = -1);

INSERT INTO Policy_BuildingClassCultureChanges
		(PolicyType, 						BuildingClassType, 	CultureChange)
SELECT	'POLICY_SENSHI_YUGOSLAVIA_TITO', 	Type, 				2
FROM BuildingClasses WHERE DefaultBuilding IN (SELECT Type FROM Buildings WHERE Type IN (SELECT BuildingType FROM Building_UnitCombatFreeExperiences WHERE BuildingType IS NOT NULL)) AND (MaxGlobalInstances = 1 OR MaxPlayerInstances = 1);
--==========================================================================================================================
--==========================================================================================================================