--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_Sounds 	
		(SoundID, 							Filename, 			LoadType)
VALUES	('SND_SOUND_JFD_GENERIC_CHOICE', 	'GenericChoice',	'DynamicResident'),
		('SND_SOUND_JFD_EPITHETS_POPUP',	'Epithet_Popup',	'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Audio_2DSounds 
		(ScriptID, 							SoundID, 							SoundType, 		Looping, DontTriggerDuplicates,	DontPlayMoreThan,	TaperSoundtrackVolume,	MinVolume, 	MaxVolume)
VALUES	('AS2D_SOUND_JFD_GENERIC_CHOICE', 	'SND_SOUND_JFD_GENERIC_CHOICE',		'GAME_SFX', 	0,		 1,						1,					-1.0,					100, 		100),
		('AS2D_SOUND_JFD_EPITHETS_POPUP', 	'SND_SOUND_JFD_EPITHETS_POPUP', 	'GAME_SFX', 	0,		 1,						1,					-1.0,					100, 		100);	
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 					Red, 	Green, 	Blue,	Alpha)
VALUES	('COLOR_JFD_EPITHET', 	0.976,	0.733,	0.247,	1);
--==========================================================================================================================
-- FONT ICONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- IconFontTextures
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontTextures 
		(IconFontTexture, 							IconFontTextureFile)
VALUES	('ICON_FONT_TEXTURE_JFD_EPITHET_PROGRESS',	'FontIcons_JFD_EpithetProgress_22');		
------------------------------------------------------------------------------------------------------------------------
-- IconFontMapping
------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO IconFontMapping 
		(IconName, 				IconFontTexture,							IconMapping)
VALUES	('ICON_JFD_EPITHET_PROGRESS',	'ICON_FONT_TEXTURE_JFD_EPITHET_PROGRESS',	1);
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_EPITHETS_NOTIFICATION_ATLAS', 	80, 		'JFD_Epithets_NotificationAtlas_80.dds',	1, 				1);
--==========================================================================================================================
--==========================================================================================================================