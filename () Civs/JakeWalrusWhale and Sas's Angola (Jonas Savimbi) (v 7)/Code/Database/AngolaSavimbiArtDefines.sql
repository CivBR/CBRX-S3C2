--================================================================
-- Audio
--================================================================
INSERT INTO Audio_Sounds
		(SoundID,										Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_JONAS_SAVIMBI_PEACE',	'Savimbi_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_JONAS_SAVIMBI_WAR',		'Savimbi_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,											SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_JONAS_SAVIMBI_PEACE',		'SND_LEADER_MUSIC_JWW_JONAS_SAVIMBI_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_JONAS_SAVIMBI_WAR',			'SND_LEADER_MUSIC_JWW_JONAS_SAVIMBI_WAR',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,								PrimaryColor,								SecondaryColor,									TextColor)
VALUES	('PLAYERCOLOR_JWW_ANGOLA',	'COLOR_PLAYER_JWW_ANGOLA_ICON',		'COLOR_PLAYER_JWW_ANGOLA_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,									Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_ANGOLA_ICON',		0.714,		0.4,		0.357,		1.0),
		('COLOR_PLAYER_JWW_ANGOLA_BACKGROUND',	0.094,		0.173,		0.098,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,								IconSize,		Filename,							IconsPerRow,	IconsPerColumn)
VALUES	('JWW_ANGOLA_COLOR_ATLAS',			'256',			'AngolaSavimbiIconAtlas256.dds',	3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'128',			'AngolaSavimbiIconAtlas128.dds',	3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'80',			'AngolaSavimbiIconAtlas80.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'64',			'AngolaSavimbiIconAtlas64.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'48',			'AngolaSavimbiIconAtlas48.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'45',			'AngolaSavimbiIconAtlas45.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'32',			'AngolaSavimbiIconAtlas32.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'24',			'AngolaSavimbiIconAtlas24.dds',		3,				2),
		('JWW_ANGOLA_COLOR_ATLAS',			'16',			'AngolaSavimbiIconAtlas16.dds',		3,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'256',			'AngolaSavimbiIconAtlas256.dds',	1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'128',			'AngolaSavimbiIconAtlas128.dds',	1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'80',			'AngolaSavimbiIconAtlas80.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'64',			'AngolaSavimbiIconAtlas64.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'48',			'AngolaSavimbiIconAtlas48.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'45',			'AngolaSavimbiIconAtlas45.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'32',			'AngolaSavimbiIconAtlas32.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'24',			'AngolaSavimbiIconAtlas24.dds',		1,				2),
		('JWW_ANGOLA_ALPHA_ATLAS',			'16',			'AngolaSavimbiIconAtlas16.dds',		1,				2),
		('JWW_ANGOLA_UNIT_ALPHA_ATLAS',		'32',			'T55Alpha.dds',						1,				1);
--================================================================
-- Art Defines
--================================================================
INSERT INTO ArtDefine_UnitInfos
        (TYPE,                      DamageStates,   Formation)
SELECT  'ART_DEF_UNIT_JWW_T55', DamageStates,   Formation
FROM ArtDefine_UnitInfos WHERE (TYPE = 'ART_DEF_UNIT_TANK');
 
INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,                  UnitMemberInfoType,						NumMembers)
SELECT  'ART_DEF_UNIT_JWW_T55', 'ART_DEF_UNIT_MEMBER_JWW_T55',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_TANK');
 
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_T55',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK');
 
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_T55',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TANK');
 
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN,			Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_T55',  Scale,  ZOffset, DOMAIN, 'T55Peru.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (TYPE = 'ART_DEF_UNIT_MEMBER_TANK');

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,			TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_T55',    'Unit',     'sv_T55.dds');
--================================================================
--================================================================