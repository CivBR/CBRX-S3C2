--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_JFD_QIANG_SPEARMAN',		'Unit', 		'sv_QiangSpearman.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_QIANG_SPEARMAN',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SPEARMAN';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_QIANG_SPEARMAN', 		'ART_DEF_UNIT_MEMBER_JFD_QIANG_SPEARMAN',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_QIANG_SPEARMAN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_QIANG_SPEARMAN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_QIANG_SPEARMAN',	Scale,	ZOffset, Domain, 'Han_Spearman.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_HAN_WU_PEACE',		'JFD_HanWu_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_HAN_WU_WAR', 		'JFD_HanWu_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_HAN_WU_PEACE', 		'SND_LEADER_MUSIC_JFD_HAN_WU_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_HAN_WU_WAR', 		'SND_LEADER_MUSIC_JFD_HAN_WU_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_HAN_WU_ICON', 			0.882,	0.654,	0.235,	1),
		('COLOR_PLAYER_JFD_HAN_WU_BACKGROUND',		0.183,	0.129,	0.450,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 						SecondaryColor, 						 TextColor)
VALUES	('PLAYERCOLOR_JFD_HAN_WU',	'COLOR_PLAYER_JFD_HAN_WU_ICON', 	'COLOR_PLAYER_JFD_HAN_WU_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 							IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_HAN_WU_ALPHA_ATLAS', 			128, 		'JFD_HanWu_AlphaAtlas_128.dds',			1,				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			80, 		'JFD_HanWu_AlphaAtlas_80.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			64, 		'JFD_HanWu_AlphaAtlas_64.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			48, 		'JFD_HanWu_AlphaAtlas_48.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			45, 		'JFD_HanWu_AlphaAtlas_45.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			32, 		'JFD_HanWu_AlphaAtlas_32.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			24, 		'JFD_HanWu_AlphaAtlas_24.dds',			1, 				1),
		('JFD_HAN_WU_ALPHA_ATLAS', 			16, 		'JFD_HanWu_AlphaAtlas_16.dds',			1, 				1),
		('JFD_HAN_WU_ICON_ATLAS', 			256, 		'JFD_HanWu_IconAtlas_256.dds',			2, 				2),
		('JFD_HAN_WU_ICON_ATLAS', 			128, 		'JFD_HanWu_IconAtlas_128.dds',			2, 				2),
		('JFD_HAN_WU_ICON_ATLAS', 			80, 		'JFD_HanWu_IconAtlas_80.dds',			2, 				2),
		('JFD_HAN_WU_ICON_ATLAS', 			64, 		'JFD_HanWu_IconAtlas_64.dds',			2, 				2),
		('JFD_HAN_WU_ICON_ATLAS', 			45, 		'JFD_HanWu_IconAtlas_45.dds',			2, 				2),
		('JFD_HAN_WU_ICON_ATLAS', 			32, 		'JFD_HanWu_IconAtlas_32.dds',			2, 				2),
		('JFD_HAN_WU_UNIT_FLAG_ATLAS',		32, 		'JFD_HanWu_UnitFlagAtlas_32.dds',		1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
