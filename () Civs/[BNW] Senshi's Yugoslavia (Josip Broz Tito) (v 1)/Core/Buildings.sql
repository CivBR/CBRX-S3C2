--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	Happiness,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_SPOMENIK'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	Happiness,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_SPOMENIK'),	('TXT_KEY_CIV5_BUILDING_SENSHI_SPOMENIK_TEXT'),	('TXT_KEY_BUILDING_SENSHI_SPOMENIK_HELP'),	('TXT_KEY_BUILDING_SENSHI_SPOMENIK_STRATEGY'),	ArtDefineTag,	SpecialistType, SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	'SENSHI_YUGOSLAVIA_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_THEATRE');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	('BUILDING_SENSHI_SPOMENIK'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_THEATRE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_SPOMENIK'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_THEATRE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_SPOMENIK'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_THEATRE');