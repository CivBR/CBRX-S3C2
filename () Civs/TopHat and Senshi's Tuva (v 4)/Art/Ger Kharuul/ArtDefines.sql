
--==========================================================================================================================
-- ArtDefine_LandmarkTypes
--==========================================================================================================================
INSERT INTO ArtDefine_LandmarkTypes 
			(Type, 									LandmarkType,	FriendlyName)
VALUES		('ART_DEF_IMPROVEMENT_GERKHARUUL',	'Improvement', 	'GERKHARUUL');

--==========================================================================================================================
-- ArtDefine_Landmarks
--==========================================================================================================================
INSERT INTO ArtDefine_Landmarks 
			(ImprovementType, 						Era,	State,				 Scale, LayoutHandler,	ResourceType,			Model,			TerrainContour)
VALUES		('ART_DEF_IMPROVEMENT_GERKHARUUL',		'Any', 	'UnderConstruction', 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Tribe_Bedouin.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_GERKHARUUL',		'Any', 	'Constructed',		 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Tribe_Bedouin.fxsxml', 1),
			('ART_DEF_IMPROVEMENT_GERKHARUUL',		'Any', 	'Pillaged',			 1.0,	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL', 'Tribe_Bedouin.fxsxml', 1);