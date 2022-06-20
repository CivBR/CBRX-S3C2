--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,	Happiness,	PrereqTech,	Description,								Civilopedia,								Help,											Strategy,							ArtDefineTag,	SpecialistType,	SpecialistCount,	MinAreaSize,	ConquestProb,	HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	IconAtlas,				PortraitIndex)
SELECT	('BUILDING_SENSHI_PHEAPYON'),		BuildingClass,	FreeStartEra,	Cost,	GoldMaintenance,			1,	PrereqTech,	('TXT_KEY_BUILDING_SENSHI_PHEAPYON'),	('TXT_KEY_CIV5_BUILDING_SENSHI_PHEAPYON_TEXT'),	('TXT_KEY_BUILDING_SENSHI_PHEAPYON_HELP'),	('TXT_KEY_BUILDING_SENSHI_PHEAPYON_STRATEGY'),	ArtDefineTag,	SpecialistType, SpecialistCount,	MinAreaSize,	0,				HurryCostModifier,	GreatWorkSlotType,	GreatWorkCount,	'SENSHI_CAMBODIA_ATLAS',	3
FROM Buildings WHERE (Type = 'BUILDING_OPERA_HOUSE');
------------------------------	
-- Building_ClassesNeededInCity
------------------------------		
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 					BuildingClassType)
SELECT	('BUILDING_SENSHI_PHEAPYON'),	BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_OPERA_HOUSE');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 					FlavorType,			Flavor)
SELECT	('BUILDING_SENSHI_PHEAPYON'),	FlavorType,			Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_OPERA_HOUSE');
------------------------------	
-- Building_YieldChanges
------------------------------		
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,		Yield)
SELECT	('BUILDING_SENSHI_PHEAPYON'),	YieldType,		Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_OPERA_HOUSE');
------------------------------	
-- Building_ThemingBonuses
------------------------------		
INSERT INTO Building_ThemingBonuses 	
		(BuildingType, 					Description,		Bonus,	SameEra,	MustBeArt,	RequiresOwner,	RequiresAnyButOwner,	MustBeArtifact,	AIPriority)
SELECT	('BUILDING_SENSHI_PHEAPYON'),	Description,		Bonus,	SameEra,	MustBeArt,	RequiresOwner,	RequiresAnyButOwner,	MustBeArtifact,	AIPriority
FROM Building_ThemingBonuses WHERE (BuildingType = 'BUILDING_OPERA_HOUSE');