--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)					
VALUES		('TRAIT_SENSHI_CAMBODIA', 	'TXT_KEY_TRAIT_SENSHI_CAMBODIA', 	'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT');

INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_SENSHI_CAMBODIA', 		'BUILDING_SENSHI_KHMER_CULTURE',	'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT');

INSERT INTO Buildings 		
		(Type, 						 			BuildingClass, 					SpecialistCount, SpecialistType,		Happiness,	PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_SENSHI_SANGKUM_MARKER', 		'BUILDINGCLASS_SENSHI_CAMBODIA',	0,				 null,			0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT',			'TXT_KEY_TRAIT_SENSHI_CAMBODIA',			null,											null,									null,		  0, 			 'SENSHI_CAMBODIA_ATLAS'),
		('BUILDING_RONG_PHEAPYON_MARKER', 		'BUILDINGCLASS_SENSHI_CAMBODIA',	0,				 null,			0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT',			'TXT_KEY_TRAIT_SENSHI_CAMBODIA',			null,											null,									null,		  0, 			 'SENSHI_CAMBODIA_ATLAS'),
		('BUILDING_SENSHI_KHMER_CULTURE', 		'BUILDINGCLASS_SENSHI_CAMBODIA',	0,				 null,			0,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT',			'TXT_KEY_TRAIT_SENSHI_CAMBODIA',			null,											null,									null,		  0, 			 'SENSHI_CAMBODIA_ATLAS'),
		('BUILDING_RONG_PHEAPYON_HAPPINESS', 	'BUILDINGCLASS_SENSHI_CAMBODIA',	0,				 null,			1,			null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_TRAIT_SENSHI_CAMBODIA_SHORT',			'TXT_KEY_TRAIT_SENSHI_CAMBODIA',			null,											null,									null,		  0, 			 'SENSHI_CAMBODIA_ATLAS');

INSERT INTO Building_YieldChanges 	
		(BuildingType, 						 		YieldType, 		Yield)
VALUES	('BUILDING_SENSHI_KHMER_CULTURE', 	'YIELD_CULTURE',	1);