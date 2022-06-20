--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 									BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_MISSIONSHUS'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_MISSIONSHUS'),	('TXT_KEY_CIV5_BUILDING_SENSHI_MISSIONSHUS_TEXT'),	('TXT_KEY_BUILDING_SENSHI_MISSIONSHUS_HELP'),	('TXT_KEY_BUILDING_SENSHI_MISSIONSHUS_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	'SENSHI_GREENLAND_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_TEMPLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_MISSIONSHUS'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_TEMPLE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_MISSIONSHUS'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_TEMPLE');
------------------------------	
-- Building_YieldModifiers
------------------------------		
INSERT INTO Building_YieldModifiers 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_MISSIONSHUS'),	YieldType,		Yield
FROM Building_YieldModifiers WHERE (BuildingType = 'BUILDING_TEMPLE');