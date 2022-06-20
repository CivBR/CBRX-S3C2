
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_SEN_APOSTLE',	'BUILDING_DUMMY_SEN_APOSTLE',	'TXT_KEY_BUILDING_DUMMY_SEN_APOSTLE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 							 BuildingClass, 						ReligiousPressureModifier,	GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_DUMMY_SEN_APOSTLE',	 'BUILDINGCLASS_DUMMY_SEN_APOSTLE',		100,						-1, 			-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_DUMMY_SEN_APOSTLE',	'TXT_KEY_BUILDING_DUMMY_SEN_APOSTLE_HELP');

------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_SEN_MISSIONSHUS',	'BUILDING_DUMMY_SEN_MISSIONSHUS',	'TXT_KEY_BUILDING_DUMMY_SEN_APOSTLE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 							 BuildingClass, 						FoodKept,	GreatWorkCount, Cost,	FaithCost,	PrereqTech,	NeverCapture,	Description, 						Help)
VALUES	('BUILDING_DUMMY_SEN_MISSIONSHUS',	 'BUILDINGCLASS_DUMMY_SEN_MISSIONSHUS',		5,						-1, 			-1,		-1, 		null,		1,				'TXT_KEY_BUILDING_DUMMY_SEN_MISSIONSHUS',	'TXT_KEY_BUILDING_DUMMY_SEN_MISSIONSHUS_HELP');

------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 	 		DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_SEN_MARKER',	'BUILDING_DUMMY_SEN_MARKER',	'TXT_KEY_BUILDING_DUMMY_SEN_APOSTLE');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Buildings 	
		(Type, 							 BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	PrereqTech,	ConquestProb,	Description, 						Help)
VALUES	('BUILDING_DUMMY_SEN_MARKER',	 'BUILDINGCLASS_DUMMY_SEN_MARKER',					-1, 			-1,		-1, 		null,		100,				'TXT_KEY_BUILDING_DUMMY_SEN_MARKER',	'TXT_KEY_BUILDING_DUMMY_SEN_MARKER_HELP');
