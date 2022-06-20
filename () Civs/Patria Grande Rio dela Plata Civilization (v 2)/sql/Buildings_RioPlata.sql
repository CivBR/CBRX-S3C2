--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================		
-- Civilization_BuildingClassOverrides 
--------------------------------		

------------------------------
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses 
		(Type, 											Description, 			DefaultBuilding)
VALUES	('BUILDINGCLASS_PG_RIODELAPLATA_GOLDEN_BONUS', 	-1,						'BUILDING_PG_RIODELAPLATA_GOLDEN_BONUS'),
		('BUILDINGCLASS_PG_YERBAMATE_HAPPINESS',		-1,						'BUILDING_PG_YERBAMATE_HAPPINESS');

------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings 
		(Type, 										BuildingClass,									Description, 			Cost,	GreatWorkCount,	NeverCapture,	NukeImmune,	MinAreaSize,	Happiness)
VALUES	('BUILDING_PG_RIODELAPLATA_GOLDEN_BONUS',	'BUILDINGCLASS_PG_RIODELAPLATA_GOLDEN_BONUS',	-1,						-1,		-1,				1,				1,			-1,				0),
		('BUILDING_PG_YERBAMATE_HAPPINESS',			'BUILDINGCLASS_PG_YERBAMATE_HAPPINESS',			-1,						-1,		-1,				1,				1,			-1,				1);
------------------------------
-- Building_GlobalYieldModifiers
------------------------------
INSERT INTO Building_GlobalYieldModifiers
		(BuildingType,								YieldType,		Yield)
VALUES	('BUILDING_PG_RIODELAPLATA_GOLDEN_BONUS',	'YIELD_FOOD',	25);

--==========================================================================================================================
--==========================================================================================================================