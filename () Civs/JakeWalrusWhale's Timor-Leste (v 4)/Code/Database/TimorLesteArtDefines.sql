--================================================================
-- Audio
--================================================================

INSERT INTO Audio_Sounds
		(SoundID,										Filename,				LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_XANANA_GUSMAO_PEACE',	'TimorLeste_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_XANANA_GUSMAO_WAR',		'TimorLeste_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,										SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_XANANA_GUSMAO_PEACE',	'SND_LEADER_MUSIC_JWW_XANANA_GUSMAO_PEACE',	'GAME_MUSIC',	-1.0,					40,			40,		1,			0),
		('AS2D_LEADER_MUSIC_JWW_XANANA_GUSMAO_WAR',		'SND_LEADER_MUSIC_JWW_XANANA_GUSMAO_WAR',	'GAME_MUSIC',	-1.0,					50,			50,		1,			0);

--================================================================
-- Colors
--================================================================

INSERT INTO PlayerColors
		(Type,							PrimaryColor,							SecondaryColor,								TextColor)
VALUES	('PLAYERCOLOR_JWW_TIMOR-LESTE',	'COLOR_PLAYER_JWW_TIMOR-LESTE_ICON',	'COLOR_PLAYER_JWW_TIMOR-LESTE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,										Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_TIMOR-LESTE_ICON',		1.000,		0.831,		0.000,		1),
		('COLOR_PLAYER_JWW_TIMOR-LESTE_BACKGROUND',	0.545,		0.090,		0.000,		1); 

--================================================================
-- Atlases
--================================================================

INSERT INTO IconTextureAtlases
		(Atlas,							IconSize,		Filename,						IconsPerRow,	IconsPerColumn)
VALUES	('JWW_TIMORLESTE_COLOR_ATLAS',		'256',			'TimorLesteIconAtlas256.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'128',			'TimorLesteIconAtlas128.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'80',			'TimorLesteIconAtlas80.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'64',			'TimorLesteIconAtlas64.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'48',			'TimorLesteIconAtlas48.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'45',			'TimorLesteIconAtlas45.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'32',			'TimorLesteIconAtlas32.dds',		3,				2),
		('JWW_TIMORLESTE_COLOR_ATLAS',		'24',			'TimorLesteIconAtlas24.dds',		3,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'256',			'TimorLesteIconAtlas256.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'128',			'TimorLesteIconAtlas128.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'80',			'TimorLesteIconAtlas80.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'64',			'TimorLesteIconAtlas64.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'48',			'TimorLesteIconAtlas48.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'45',			'TimorLesteIconAtlas45.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'32',			'TimorLesteIconAtlas32.dds',		1,				2),
		('JWW_TIMORLESTE_ALPHA_ATLAS',		'24',			'TimorLesteIconAtlas24.dds',		1,				2),
		('JWW_TIMORLESTE_UNIT_ALPHA_ATLAS',	'32',			'FalintilAlpha32.dds',				1,				1);

--================================================================
-- Art Defines
--================================================================

INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_FORCAS_DA_FALINTIL', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_MARINE');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,                 NumMembers)
SELECT  'ART_DEF_UNIT_JWW_FORCAS_DA_FALINTIL', 'ART_DEF_UNIT_MEMBER_JWW_FORCAS_DA_FALINTIL',  NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MARINE');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_FORCAS_DA_FALINTIL',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_FORCAS_DA_FALINTIL',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_MARINE');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_FORCAS_DA_FALINTIL',  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_MARINE');
 
INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,					TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_FORCAS_DA_FALINTIL',    'Unit',     'Falintil_sv.dds');