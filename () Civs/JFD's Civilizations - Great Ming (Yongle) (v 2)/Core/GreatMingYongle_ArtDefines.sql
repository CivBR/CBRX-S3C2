--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_SHENJI_MUSKETEER',	'Unit', 	'sv_ShenjiMuskeeter.dds'),
		('ART_DEF_UNIT_JFD_TREASURE_FLEET',		'Unit', 	'sv_TreasureFleet.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SHENJI_MUSKETEER',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MUSKETMAN';		

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_TREASURE_FLEET',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SHENJI_MUSKETEER', 	'ART_DEF_UNIT_MEMBER_JFD_SHENJI_MUSKETEER',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,							 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_TREASURE_FLEET', 		'ART_DEF_UNIT_MEMBER_JFD_TREASURE_FLEET',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHENJI_MUSKETEER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TREASURE_FLEET',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHENJI_MUSKETEER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TREASURE_FLEET',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHENJI_MUSKETEER',	Scale,	ZOffset, Domain, 'ShenjiMusketeer.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TREASURE_FLEET',	0.14,	ZOffset, Domain, 'TreasureFleet.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_PEACE', 	'JFD_GreatMingYongle_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_WAR', 		'JFD_GreatMingYongle_War', 		'DynamicResident');
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_GREAT_MING_YONGLE_AMBIENCE',		'SND_AMBIENCE_HARUN_AL_RASHID_AMBIENCE', 			'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_PEACE', 			'SND_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_PEACE',		'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_WAR', 			'SND_LEADER_MUSIC_JFD_GREAT_MING_YONGLE_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_GREAT_MING_YONGLE_ICON', 		0.474,	0.360,	0.054,	1),
		('COLOR_PLAYER_JFD_GREAT_MING_YONGLE_BACKGROUND',	0.941,	0.913,	0.800,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 									SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_JFD_GREAT_MING_YONGLE',	'COLOR_PLAYER_JFD_GREAT_MING_YONGLE_ICON',		'COLOR_PLAYER_JFD_GREAT_MING_YONGLE_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		128, 		'JFD_GreatMingYongle_AlphaAtlas_128.dds',		1,				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		80, 		'JFD_GreatMingYongle_AlphaAtlas_80.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		64, 		'JFD_GreatMingYongle_AlphaAtlas_64.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		48, 		'JFD_GreatMingYongle_AlphaAtlas_48.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		45, 		'JFD_GreatMingYongle_AlphaAtlas_45.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		32, 		'JFD_GreatMingYongle_AlphaAtlas_32.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		24, 		'JFD_GreatMingYongle_AlphaAtlas_24.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ALPHA_ATLAS',		16, 		'JFD_GreatMingYongle_AlphaAtlas_16.dds',		1, 				1),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		256, 		'JFD_GreatMingYongle_IconAtlas_256.dds',		2, 				2),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		128, 		'JFD_GreatMingYongle_IconAtlas_128.dds',		2, 				2),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		80, 		'JFD_GreatMingYongle_IconAtlas_80.dds',			2, 				2),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		64, 		'JFD_GreatMingYongle_IconAtlas_64.dds',			2, 				2),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		45, 		'JFD_GreatMingYongle_IconAtlas_45.dds',			2, 				2),
		('JFD_GREAT_MING_YONGLE_ICON_ATLAS', 		32, 		'JFD_GreatMingYongle_IconAtlas_32.dds',			2, 				2),
		('JFD_GREAT_MING_YONGLE_UNIT_FLAG_ATLAS',	32, 		'JFD_GreatMingYongle_UnitFlagAtlas_32.dds',		2, 				2);
--==========================================================================================================================	
--==========================================================================================================================	
