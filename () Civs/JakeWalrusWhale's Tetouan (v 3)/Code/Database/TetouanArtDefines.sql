--================================================================
-- Audio
--================================================================
INSERT INTO Audio_Sounds
		(SoundID,											Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_PEACE',		'Tetouan_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_WAR',		'Tetouan_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,											SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_PEACE',			'SND_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_WAR',			'SND_LEADER_MUSIC_JWW_SAYYIDA_AL_HURRA_WAR',		'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,								PrimaryColor,								SecondaryColor,									TextColor)
VALUES	('PLAYERCOLOR_JWW_TETOUAN',	'COLOR_PLAYER_JWW_TETOUAN_ICON',		'COLOR_PLAYER_JWW_TETOUAN_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,									Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_TETOUAN_ICON',		0.667,		0.761,		0.525,		1.0),
		('COLOR_PLAYER_JWW_TETOUAN_BACKGROUND',	0.055,		0.145,		0.165,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_TETOUAN_COLOR_ATLAS',			'256',			'JWWTetouanIconAtlas256.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'128',			'JWWTetouanIconAtlas128.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'80',			'JWWTetouanIconAtlas80.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'64',			'JWWTetouanIconAtlas64.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'48',			'JWWTetouanIconAtlas48.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'45',			'JWWTetouanIconAtlas45.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'32',			'JWWTetouanIconAtlas32.dds',		3,				2),
		('JWW_TETOUAN_COLOR_ATLAS',			'24',			'JWWTetouanIconAtlas24.dds',		3,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'256',			'JWWTetouanIconAtlas256.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'128',			'JWWTetouanIconAtlas128.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'80',			'JWWTetouanIconAtlas80.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'64',			'JWWTetouanIconAtlas64.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'48',			'JWWTetouanIconAtlas48.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'45',			'JWWTetouanIconAtlas45.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'32',			'JWWTetouanIconAtlas32.dds',		1,				2),
		('JWW_TETOUAN_ALPHA_ATLAS',			'24',			'JWWTetouanIconAtlas24.dds',		1,				2),
		('JWW_TETOUAN_UNIT_ALPHA_ATLAS',	'32',			'QursanAlpha32.dds',				1,				1),
		('JWW_TETOUAN_PROMOTION_ATLAS',		'256',			'JWWTetouanPromotionAtlas256.dds',	1,				1),
		('JWW_TETOUAN_PROMOTION_ATLAS',		'64',			'JWWTetouanPromotionAtlas64.dds',	1,				1),
		('JWW_TETOUAN_PROMOTION_ATLAS',		'45',			'JWWTetouanPromotionAtlas45.dds',	1,				1),
		('JWW_TETOUAN_PROMOTION_ATLAS',		'32',			'JWWTetouanPromotionAtlas32.dds',	1,				1);
--================================================================
-- Art Defines
--================================================================
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_QURSAN', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_PRIVATEER');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_QURSAN', 'ART_DEF_UNIT_MEMBER_JWW_QURSAN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PRIVATEER');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_QURSAN',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_QURSAN',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PRIVATEER');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_QURSAN',  Scale,  ZOffset, DOMAIN, 'qursan.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_PRIVATEER');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,				TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_QURSAN',    'Unit',     'QursanSV.dds');
--================================================================
--================================================================