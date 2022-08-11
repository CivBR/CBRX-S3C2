--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_AMIN_PEACE',		'Sas_Amin_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_AMIN_WAR', 		'Sas_Amin_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_SAS_AMIN_AMBIENCE',	'SND_AMBIENCE_GANDHI_AMBIENCE', 				'GAME_SFX', 	0.0,					20, 		20, 		0, 		 1),
		('AS2D_LEADER_MUSIC_SAS_AMIN_PEACE', 	'SND_LEADER_MUSIC_SAS_AMIN_PEACE',	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_AMIN_WAR',		'SND_LEADER_MUSIC_SAS_AMIN_WAR', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_UGANDA_ICON', 		 0.901, 0.616, 	0.106, 	1),
		('COLOR_PLAYER_SAS_UGANDA_BACKGROUND',  0.541,	0.075,	0.016, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_UGANDA',		'COLOR_PLAYER_SAS_UGANDA_ICON',	'COLOR_PLAYER_SAS_UGANDA_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_UGANDA_ALPHA_ATLAS',			128, 		'SasUgandaAlpha_128.dds',			1,				1),
		('SAS_UGANDA_ALPHA_ATLAS',			80, 		'SasUgandaAlpha_80.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			64, 		'SasUgandaAlpha_64.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			48, 		'SasUgandaAlpha_48.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			45, 		'SasUgandaAlpha_45.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			32, 		'SasUgandaAlpha_32.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			24, 		'SasUgandaAlpha_24.dds',			1, 				1),
		('SAS_UGANDA_ALPHA_ATLAS',			16, 		'SasUgandaAlpha_16.dds',			1, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			256, 		'SasUgandaIcons256.dds',			4, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			128, 		'SasUgandaIcons128.dds',			4, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			80, 		'SasUgandaIcons80.dds',			4, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			64, 		'SasUgandaIcons64.dds',			4, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			45, 		'SasUgandaIcons45.dds',			4, 				1),
		('SAS_UGANDA_ICON_ATLAS', 			32, 		'SasUgandaIcons32.dds',			4, 				1),
		('SAS_RSR_ATLAS',			32, 		'SasRSRFlag.dds',			1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
