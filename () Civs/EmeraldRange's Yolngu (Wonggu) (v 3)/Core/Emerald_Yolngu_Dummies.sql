------------------------------------------------------------------------------------------------------------------------	
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses 	
		(Type, 						 				DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_DUMMY_EMERALD_YOLNGU',		'BUILDING_DUMMY_EMERALD_YOLNGU',		'Emerald Yolngu Dummy');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 		
		(Type, 									BuildingClass,							GreatPeopleRateModifier,	GreatWorkCount,	Cost, FaithCost, PrereqTech, Description, 			  NeverCapture)
VALUES	('BUILDING_DUMMY_EMERALD_YOLNGU',		'BUILDINGCLASS_DUMMY_EMERALD_YOLNGU',	10,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_ER_YOLNGU_DUM1',	 1),
		('BUILDING_DUMMY_EMERALD_YOLNGU_2',		'BUILDINGCLASS_DUMMY_EMERALD_YOLNGU',	0,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_ER_YOLNGU_DUM2',	 1),
		('BUILDING_ER_YOLNGU_GP_BONUS',			'BUILDINGCLASS_DUMMY_EMERALD_YOLNGU',	15,							-1,				-1,   -1,		 null,		 'TXT_KEY_BUILDING_ER_YOLNGU_DUM3',	 1);

------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	
		(BuildingType, 							YieldType,			Yield)
VALUES	('BUILDING_DUMMY_EMERALD_YOLNGU_2',	'YIELD_CULTURE',		1),
		('BUILDING_DUMMY_EMERALD_YOLNGU_2',	'YIELD_GOLD',		2);
------------------------------------------------------------------------------------------------------------------------	
-- Building_CityToolTipYieldFromOther
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Building_CityToolTipYieldFromOther(BuildingType, YieldType, Yield integer);
INSERT INTO Building_CityToolTipYieldFromOther
		(BuildingType, 							YieldType,			Yield)
VALUES	('BUILDING_DUMMY_EMERALD_YOLNGU_2',	'YIELD_CULTURE',		1),
		('BUILDING_DUMMY_EMERALD_YOLNGU_2',	'YIELD_GOLD',		2);
