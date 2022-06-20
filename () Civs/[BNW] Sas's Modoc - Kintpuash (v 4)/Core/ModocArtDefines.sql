--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_KILOSH', 1, 'UnFormed');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_KILOSH', 'ART_DEF_UNIT_MEMBER_SAS_KILOSH', 12);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_KILOSH', 0.14, 'Art/Model/modoc_kilosh.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_KILOSH', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_KILOSH', 0, 0, 'BULLET', 'BULLET');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_SAS_KILOSH',		'Unit', 		'SV_SasKilosh.dds');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_KINTPUASH_PEACE',		'Sas_Kintpuash_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_KINTPUASH_WAR', 		'Sas_Kintpuash_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_SAS_KINTPUASH_AMBIENCE',	'SND_AMBIENCE_NAPOLEON_AMBIENCE', 				'GAME_SFX', 	0.0,					15, 		15, 		0, 		 1),
		('AS2D_LEADER_MUSIC_SAS_KINTPUASH_PEACE', 	'SND_LEADER_MUSIC_SAS_KINTPUASH_PEACE',	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_KINTPUASH_WAR',		'SND_LEADER_MUSIC_SAS_KINTPUASH_WAR', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_MODOC_ICON', 		 0.701, 0.737, 	0.478, 	1),
		('COLOR_PLAYER_SAS_MODOC_BACKGROUND',  0.294,	0.156,	0.180, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_MODOC',		'COLOR_PLAYER_SAS_MODOC_ICON',	'COLOR_PLAYER_SAS_MODOC_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_MODOC_ALPHA_ATLAS',			128, 		'SasModocAlpha_128.dds',			1,				1),
		('SAS_MODOC_ALPHA_ATLAS',			80, 		'SasModocAlpha_80.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			64, 		'SasModocAlpha_64.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			48, 		'SasModocAlpha_48.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			45, 		'SasModocAlpha_45.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			32, 		'SasModocAlpha_32.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			24, 		'SasModocAlpha_24.dds',			1, 				1),
		('SAS_MODOC_ALPHA_ATLAS',			16, 		'SasModocAlpha_16.dds',			1, 				1),
		('SAS_MODOC_ICON_ATLAS', 			256, 		'SasModocIcons256.dds',			4, 				1),
		('SAS_MODOC_ICON_ATLAS', 			128, 		'SasModocIcons128.dds',			4, 				1),
		('SAS_MODOC_ICON_ATLAS', 			80, 		'SasModocIcons80.dds',			4, 				1),
		('SAS_MODOC_ICON_ATLAS', 			64, 		'SasModocIcons64.dds',			4, 				1),
		('SAS_MODOC_ICON_ATLAS', 			45, 		'SasModocIcons45.dds',			4, 				1),
		('SAS_MODOC_ICON_ATLAS', 			32, 		'SasModocIcons32.dds',			4, 				1),
		('SAS_KILOSH_FLAG', 				32, 		'SasKiloshFlag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
