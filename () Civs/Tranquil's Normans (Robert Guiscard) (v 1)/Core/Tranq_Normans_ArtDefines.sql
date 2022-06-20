--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_TRANQ_EQUITES', 		'Unit', 		'FlagEquites_SV.dds'),
		('ART_DEF_UNIT_TRANQ_CONQUEROR', 	'Unit', 		'FlagConqueror_SV.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_TRANQ_EQUITES',					DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_TRANQ_CONQUEROR',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL_KHAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_TRANQ_EQUITES', 					'ART_DEF_UNIT_MEMBER_TRANQ_EQUITES',			NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,							NumMembers)
SELECT	'ART_DEF_UNIT_TRANQ_CONQUEROR', 		'ART_DEF_UNIT_MEMBER_TRANQ_CONQUEROR',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_EQUITES',			EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_CONQUEROR',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_EQUITES',			"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_CONQUEROR',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_EQUITES',Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								    Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_TRANQ_CONQUEROR',	Scale, ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_TRANQ_NORMANS_PEACE', 		'Tranq_RobertGuiscard_Peace', 			'DynamicResident'),
		('SND_LEADER_MUSIC_TRANQ_NORMANS_WAR', 		'Tranq_RobertGuiscard_War', 			'DynamicResident');			
--------------------------------------------------------------------------------------------------------------------------	
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 											SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_TRANQ_NORMANS_PEACE', 			'SND_LEADER_MUSIC_TRANQ_NORMANS_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		0),
		('AS2D_LEADER_MUSIC_TRANQ_NORMANS_WAR', 			'SND_LEADER_MUSIC_TRANQ_NORMANS_WAR', 		'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,	Alpha)
VALUES	('COLOR_PLAYER_TRANQ_NORMANS_ICON', 			0.63922,	0.23137,	0.12549,	1),
		('COLOR_PLAYER_TRANQ_NORMANS_BACKGROUND', 	0.71765,	0.83529,	0.83137,	1);
--------------------------------------------------------------------------------------------------------------------------	
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_TRANQ_NORMANS',		'COLOR_PLAYER_TRANQ_NORMANS_ICON',	'COLOR_PLAYER_TRANQ_NORMANS_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('TRANQ_NORMANS_ALPHA_ATLAS',		128, 		'NormansAlpha128.dds',			1,				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		80, 		'NormansAlpha80.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		64, 		'NormansAlpha64.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		48, 		'NormansAlpha48.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		45, 		'NormansAlpha45.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		32, 		'NormansAlpha32.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		24, 		'NormansAlpha24.dds',			1, 				1),
		('TRANQ_NORMANS_ALPHA_ATLAS',		16, 		'NormansAlpha16.dds',			1, 				1),
		('TRANQ_NORMANS_ICON_ATLAS', 		256, 		'NormansAtlas256.dds',			2, 				2),
		('TRANQ_NORMANS_ICON_ATLAS', 		128, 		'NormansAtlas128.dds',			2, 				2),
		('TRANQ_NORMANS_ICON_ATLAS', 		80, 		'NormansAtlas80.dds',			2, 				2),
		('TRANQ_NORMANS_ICON_ATLAS', 		64, 		'NormansAtlas64.dds',			2, 				2),
		('TRANQ_NORMANS_ICON_ATLAS', 		45, 		'NormansAtlas45.dds',			2, 				2),
		('TRANQ_NORMANS_ICON_ATLAS', 		32, 		'NormansAtlas32.dds',			2, 				2),
		('TRANQ_EQUITES_UNIT_FLAG_ATLAS',	32, 		'FlagEquites_32.dds',			1, 				1),
		('TRANQ_CONQUEROR_UNIT_FLAG_ATLAS',	32, 		'FlagConqueror_32.dds',		    1, 				1);
	
INSERT INTO IconTextureAtlases 
		(Atlas, 					IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('TS_CONQUEROR_ACTION_ATLAS', 64, 		'TS_ConquerorAction_64.dds',				1, 				1),
		('TS_CONQUEROR_ACTION_ATLAS', 45, 		'TS_ConquerorAction_45.dds',				1, 				1);

--==========================================================================================================================	
--==========================================================================================================================	
