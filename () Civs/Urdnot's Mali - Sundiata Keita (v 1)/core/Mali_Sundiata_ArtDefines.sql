--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						TileType,	Asset)
VALUES	('ART_DEF_UNIT_US_TON_TIGI',	'Unit', 	'SundiataUnitAlpha.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_US_TON_TIGI', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_US_TON_TIGI', 	'ART_DEF_UNIT_MEMBER_US_TON_TIGI', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,									EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_US_TON_TIGI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,									"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_US_TON_TIGI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 												Scale, ZOffset, Domain, Model, 						   MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_US_TON_TIGI',	Scale, ZOffset, Domain, 'SonghaiMedHorseman.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 													Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_US_MALI_SUNDIATA_PEACE', 	'US_Sundiata_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_US_MALI_SUNDIATA_WAR', 		'US_Sundiata_War', 	'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 												SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_US_MALI_SUNDIATA_PEACE', 	'SND_LEADER_MUSIC_US_MALI_SUNDIATA_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_US_MALI_SUNDIATA_WAR',		'SND_LEADER_MUSIC_US_MALI_SUNDIATA_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 														Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_US_MALI_SUNDIATA_ICON', 			0.824,	0.624,	0.369,	1),
		('COLOR_PLAYER_US_MALI_SUNDIATA_BACKGROUND', 	0.396,	0.169,	0.235,	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 										SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_US_MALI_SUNDIATA',	'COLOR_PLAYER_US_MALI_SUNDIATA_ICON',   'COLOR_PLAYER_US_MALI_SUNDIATA_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 											IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('US_MALI_SUNDIATA_ALPHA_ATLAS',		128, 		'SundiataAlpha_128.dds',		1,				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		80, 		'SundiataAlpha_80.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		64, 		'SundiataAlpha_64.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		48, 		'SundiataAlpha_48.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		45, 		'SundiataAlpha_45.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		32, 		'SundiataAlpha_32.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		24, 		'SundiataAlpha_24.dds',		1, 				1),
		('US_MALI_SUNDIATA_ALPHA_ATLAS',		16, 		'SundiataAlpha_16.dds',		1, 				1),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		256, 		'SundiataAtlas_256.dds',		2, 				2),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		128, 		'SundiataAtlas_128.dds',		2, 				2),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		80, 		'SundiataAtlas_80.dds',		2, 				2),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		64, 		'SundiataAtlas_64.dds',		2, 				2),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		45, 		'SundiataAtlas_45.dds',		2, 				2),
		('US_MALI_SUNDIATA_ICON_ATLAS', 		32, 		'SundiataAtlas_32.dds',		2, 				2),
		('US_TON_TIGI_FLAG', 					32, 		'SundiataUnitAlpha32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
