--=======================================================================================================================
-- BuildingClasses
--=======================================================================================================================
INSERT INTO BuildingClasses
			(Type, 						DefaultBuilding, 		Description)
VALUES		('BUILDINGCLASS_MC_KILWA',	'BUILDING_MC_KILWA', 	'TXT_KEY_BUILDING_MC_KILWA');
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings		
			(Type, 					BuildingClass, 			  	Cost, 	FaithCost,	GreatWorkCount,	GoldMaintenance, PrereqTech,	Description, 						NeverCapture)
VALUES		('BUILDING_MC_KILWA',	'BUILDINGCLASS_MC_KILWA', 	-1, 	-1,			-1,				0, 				 null, 			'TXT_KEY_BUILDING_MC_KILWA', 	1);
--==========================================================================================================================
-- Building_DomainProductionModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers
			(BuildingType,				YieldType,		Yield)
VALUES		('BUILDING_MC_KILWA',		'YIELD_FOOD',	5);
--==========================================================================================================================	
--==========================================================================================================================	