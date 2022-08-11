--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_JEZAILCHI',		'Unit', 		'sv_Jezailchi.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
VALUES	('ART_DEF_UNIT_JFD_JEZAILCHI',		1, 				'DefaultCavalry');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 		
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_JFD_JEZAILCHI',		'ART_DEF_UNIT_MEMBER_JFD_JEZAILCHI',	5);
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,				Model, 									MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES	('ART_DEF_UNIT_MEMBER_JFD_JEZAILCHI',	0.119999997317791,	'u_afghanistan_camel_gunner.fxsxml',	'CLOTH',		 'FLESH');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_JEZAILCHI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_MORROCAN_BERBER_CAVALRY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons 
		(UnitMemberType,						"Index",	SubIndex,	HitEffect,										HitRadius,	ContinuousFire, WeaponTypeTag,	WeaponTypeSoundOverrideTag)
VALUES	('ART_DEF_UNIT_MEMBER_JFD_JEZAILCHI',	0,			0,			'ART_DEF_VEFFECT_ANTIAIR_IMPACT_$(TERRAIN)',	32.0,		1,				'BULLETHC',		'BULLETHC');
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 												Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_PEACE',		'JFD_AfghanistanDurrani_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_WAR', 		'JFD_AfghanistanDurrani_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 												SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_PEACE', 	'SND_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_WAR',		'SND_LEADER_MUSIC_JFD_AFGHANISTAN_DURRANI_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 													Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JFD_AFGHANISTAN_DURRANI_ICON', 			0.8,	0.749,	0.623,	1),
		('COLOR_PLAYER_JFD_AFGHANISTAN_DURRANI_BACKGROUND', 	0.203,	0.184,	0.098,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 									SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_AFGHANISTAN_DURRANI',		'COLOR_PLAYER_JFD_AFGHANISTAN_DURRANI_ICON',    'COLOR_PLAYER_JFD_AFGHANISTAN_DURRANI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 										IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			128, 		'JFD_AfghanistanDurrani_AlphaAtlas_128.dds',	1,				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			80, 		'JFD_AfghanistanDurrani_AlphaAtlas_80.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			64, 		'JFD_AfghanistanDurrani_AlphaAtlas_64.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			48, 		'JFD_AfghanistanDurrani_AlphaAtlas_48.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			45, 		'JFD_AfghanistanDurrani_AlphaAtlas_45.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			32, 		'JFD_AfghanistanDurrani_AlphaAtlas_32.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			24, 		'JFD_AfghanistanDurrani_AlphaAtlas_24.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ALPHA_ATLAS',			16, 		'JFD_AfghanistanDurrani_AlphaAtlas_16.dds',		1, 				1),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			256, 		'JFD_AfghanistanDurrani_IconAtlas_256.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			128, 		'JFD_AfghanistanDurrani_IconAtlas_128.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			80, 		'JFD_AfghanistanDurrani_IconAtlas_80.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			64, 		'JFD_AfghanistanDurrani_IconAtlas_64.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			45, 		'JFD_AfghanistanDurrani_IconAtlas_45.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_ICON_ATLAS', 			32, 		'JFD_AfghanistanDurrani_IconAtlas_32.dds',		2, 				2),
		('JFD_AFGHANISTAN_DURRANI_UNIT_FLAG_ATLAS', 	32, 		'JFD_AfghanistanDurrani_UnitFlagAtlas_32.dds',	1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
