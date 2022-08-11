--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 							BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	EspionageModifier,	Espionage, IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_PANCASILA_MONUMENT'),		BuildingClass,	FreeStartEra,	Cost,	0,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_PANCASILA_MONUMENT'),	('TXT_KEY_CIV5_BUILDING_SENSHI_PANCASILA_MONUMENT_TEXT'),	('TXT_KEY_BUILDING_SENSHI_PANCASILA_MONUMENT_HELP'),	('TXT_KEY_BUILDING_SENSHI_PANCASILA_MONUMENT_STRATEGY'),	ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	EspionageModifier,	Espionage, 'SENSHI_INDONESIA_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_CONSTABLE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_PANCASILA_MONUMENT'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CONSTABLE');

INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,			Flavor)
VALUES	('BUILDING_SENSHI_PANCASILA_MONUMENT',	'FLAVOR_HAPPINESS',	5),
		('BUILDING_SENSHI_PANCASILA_MONUMENT',	'FLAVOR_MILITARY_TRAINING',	5);