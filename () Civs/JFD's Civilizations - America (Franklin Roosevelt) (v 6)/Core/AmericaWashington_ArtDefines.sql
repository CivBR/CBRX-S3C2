--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_SCHOONER', 	'Unit', 	'sv_Schooner.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
DELETE FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_JFD_SCHOONER';
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SCHOONER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PRIVATEER';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------	
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_JFD_SCHOONER';
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SCHOONER', 	UnitMemberInfoType,	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PRIVATEER';
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		256, 		'JFD_AmericaWashington_IconAtlas_256.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		128, 		'JFD_AmericaWashington_IconAtlas_128.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		80, 		'JFD_AmericaWashington_IconAtlas_80.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		64, 		'JFD_AmericaWashington_IconAtlas_64.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		45, 		'JFD_AmericaWashington_IconAtlas_45.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_ICON_ATLAS', 		32, 		'JFD_AmericaWashington_IconAtlas_32.dds',		1, 				1),
		('JFD_AMERICA_WASHINGTON_UNIT_FLAG_ATLAS',	32, 		'JFD_AmericaWashington_UnitFlagAtlas_32.dds',	1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	


