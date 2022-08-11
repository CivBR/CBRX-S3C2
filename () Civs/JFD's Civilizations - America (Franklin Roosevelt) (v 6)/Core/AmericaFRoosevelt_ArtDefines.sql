--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_PEACE',		'JFD_AmericaFRoosevelt_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_WAR', 		'JFD_AmericaFRoosevelt_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds	
		(ScriptID, 												SoundID, 											SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_PEACE',		'SND_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_PEACE', 	'GAME_MUSIC', 	45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_WAR',		'SND_LEADER_MUSIC_JFD_AMERICA_F_ROOSEVELT_WAR', 	'GAME_MUSIC', 	45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_AMERICA_F_ROOSEVELT_ICON', 		0.757,	0.757,	0.757,	1),
		('COLOR_PLAYER_JFD_AMERICA_F_ROOSEVELT_BACKGROUND', 0.122,	0.235,	0.337,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 									SecondaryColor, 									 TextColor)
VALUES	('PLAYERCOLOR_JFD_AMERICA_F_ROOSEVELT',		'COLOR_PLAYER_JFD_AMERICA_F_ROOSEVELT_ICON',	'COLOR_PLAYER_JFD_AMERICA_F_ROOSEVELT_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		128, 		'JFD_AmericaFRoosevelt_AlphaAtlas_128.dds',		1,				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		80, 		'JFD_AmericaFRoosevelt_AlphaAtlas_80.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		64, 		'JFD_AmericaFRoosevelt_AlphaAtlas_64.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		48, 		'JFD_AmericaFRoosevelt_AlphaAtlas_48.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		45, 		'JFD_AmericaFRoosevelt_AlphaAtlas_45.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		32, 		'JFD_AmericaFRoosevelt_AlphaAtlas_32.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		24, 		'JFD_AmericaFRoosevelt_AlphaAtlas_24.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ALPHA_ATLAS', 		16, 		'JFD_AmericaFRoosevelt_AlphaAtlas_16.dds',		1, 				1),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			256, 		'JFD_AmericaFRoosevelt_IconAtlas_256.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			128, 		'JFD_AmericaFRoosevelt_IconAtlas_128.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			80, 		'JFD_AmericaFRoosevelt_IconAtlas_80.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			64, 		'JFD_AmericaFRoosevelt_IconAtlas_64.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			45, 		'JFD_AmericaFRoosevelt_IconAtlas_45.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_ICON_ATLAS', 			32, 		'JFD_AmericaFRoosevelt_IconAtlas_32.dds',		2, 				2),
		('JFD_AMERICA_F_ROOSEVELT_PROMOTION_ATLAS',		256, 	    'Tomatekh_PromotionAtlas_256.dds',				2, 				1),
		('JFD_AMERICA_F_ROOSEVELT_PROMOTION_ATLAS',		64, 	    'Tomatekh_PromotionAtlas_64.dds',				2, 				1),
		('JFD_AMERICA_F_ROOSEVELT_PROMOTION_ATLAS',		45, 	    'Tomatekh_PromotionAtlas_45.dds',				2, 				1),
		('JFD_AMERICA_F_ROOSEVELT_PROMOTION_ATLAS',		32, 	    'Tomatekh_PromotionAtlas_32.dds',				2, 				1);
--==========================================================================================================================	
--==========================================================================================================================	


