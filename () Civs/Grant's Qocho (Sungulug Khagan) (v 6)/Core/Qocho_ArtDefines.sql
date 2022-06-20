--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfos (Type,DamageStates,Formation)
	SELECT	('ART_DEF_UNIT_GT_CHAKAR'), DamageStates, Formation
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_HORSEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfo
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,UnitMemberInfoType,NumMembers)
	SELECT	('ART_DEF_UNIT_GT_CHAKAR'), ('ART_DEF_UNIT_MEMBER_GT_CHAKAR'), NumMembers
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_HORSEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType, EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
	SELECT	('ART_DEF_UNIT_MEMBER_GT_CHAKAR'), EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
	FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons (UnitMemberType, "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
	SELECT ('ART_DEF_UNIT_MEMBER_GT_CHAKAR'), "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos (Type, Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
	SELECT	('ART_DEF_UNIT_MEMBER_GT_CHAKAR'), Scale, ZOffset, Domain, ('Qocho_Chakar.fxsxml'), MaterialTypeTag, MaterialTypeSoundOverrideTag
	FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
VALUES ('ART_DEF_UNIT_GT_CHAKAR', 'Unit', 'Chakar_SV.dds');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 								LoadType)
VALUES	('SND_LEADER_MUSIC_GT_SUNGULUG_PEACE', 		'GT_Qocho_Peace',						'DynamicResident'),
		('SND_LEADER_MUSIC_GT_SUNGULUG_WAR', 		'GT_Qocho_War', 						'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_SUNGULUG_PEACE', 		'SND_LEADER_MUSIC_GT_SUNGULUG_PEACE', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_SUNGULUG_WAR', 			'SND_LEADER_MUSIC_GT_SUNGULUG_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_QOCHO_ICON', 			0.862,	0.760,	0.501,	1),
		('COLOR_PLAYER_GT_QOCHO_BACKGROUND',	0.494,	0.215,	0.090,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 					 TextColor)
VALUES	('PLAYERCOLOR_GT_QOCHO',	'COLOR_PLAYER_GT_QOCHO_ICON', 	'COLOR_PLAYER_GT_QOCHO_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_QOCHO_ATLAS', 				256, 		'Qocho_Atlas256.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				128, 		'Qocho_Atlas128.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				80, 		'Qocho_Atlas80.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				64, 		'Qocho_Atlas64.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				45, 		'Qocho_Atlas45.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				32, 		'Qocho_Atlas32.dds',			3, 				2),
		('GT_QOCHO_ATLAS', 				24, 		'Qocho_Atlas24.dds',			3, 				2),
		('GT_QOCHO_ALPHA_ATLAS', 		128, 		'OCP_QochoAlphaAtlas_128.dds',		1,				1),
		('GT_QOCHO_ALPHA_ATLAS', 		80, 		'OCP_QochoAlphaAtlas_80.dds',		1, 				1),
		('GT_QOCHO_ALPHA_ATLAS', 		64, 		'OCP_QochoAlphaAtlas_64.dds',		1, 				1),
		('GT_QOCHO_ALPHA_ATLAS', 		48, 		'OCP_QochoAlphaAtlas_48.dds',		1, 				1),
		('GT_QOCHO_ALPHA_ATLAS', 		45, 		'OCP_QochoAlphaAtlas_45.dds',		1, 				1),
		('GT_QOCHO_ALPHA_ATLAS', 		32, 		'OCP_QochoAlphaAtlas_32.dds',		1, 				1),
		('GT_QOCHO_ALPHA_ATLAS', 		24, 		'OCP_QochoAlphaAtlas_24.dds',		1, 				1),
		('GT_QOCHO_UNIT_FLAG_ATLAS', 	32, 		'Chakar_UnitFlag_32.dds',			1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	