--================================================================
-- Audio
--================================================================
INSERT INTO Audio_Sounds
		(SoundID,												Filename,			LoadType)
VALUES	('SND_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_PEACE',		'Turkmenistan_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_WAR',			'Turkmenistan_War',		'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,												SoundID,											SoundType,		TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_PEACE',		'SND_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_PEACE',	'GAME_MUSIC',	-1.0,					30,			30,			1,			0),
		('AS2D_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_WAR',		'SND_LEADER_MUSIC_JWW_SAPARMURAT_NIYAZOV_WAR',		'GAME_MUSIC',	-1.0,					30,			30,			1,			0);
--================================================================
-- Colors
--================================================================
INSERT INTO PlayerColors
		(Type,								PrimaryColor,								SecondaryColor,									TextColor)
VALUES	('PLAYERCOLOR_JWW_TURKMENISTAN',	'COLOR_PLAYER_JWW_TURKMENISTAN_ICON',		'COLOR_PLAYER_JWW_TURKMENISTAN_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');

INSERT INTO Colors
		(Type,											Red,		Green,		Blue,		Alpha)
VALUES	('COLOR_PLAYER_JWW_TURKMENISTAN_ICON',			0.363,		0.633,		0.277,		1.0),
		('COLOR_PLAYER_JWW_TURKMENISTAN_BACKGROUND',	0.263,		0.051,		0.071,		1.0);
--================================================================
-- Atlases
--================================================================
INSERT INTO IconTextureAtlases
		(Atlas,										IconSize,		Filename,								IconsPerRow,	IconsPerColumn)
VALUES	('JWW_TURKMENISTAN_COLOR_ATLAS',			'256',			'JWWTurkmenistanIconAtlas_256.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'128',			'JWWTurkmenistanIconAtlas_128.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'80',			'JWWTurkmenistanIconAtlas_80.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'64',			'JWWTurkmenistanIconAtlas_64.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'48',			'JWWTurkmenistanIconAtlas_48.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'45',			'JWWTurkmenistanIconAtlas_45.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'32',			'JWWTurkmenistanIconAtlas_32.dds',		3,				2),
		('JWW_TURKMENISTAN_COLOR_ATLAS',			'24',			'JWWTurkmenistanIconAtlas_24.dds',		3,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'256',			'JWWTurkmenistanIconAtlas_256.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'128',			'JWWTurkmenistanIconAtlas_128.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'80',			'JWWTurkmenistanIconAtlas_80.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'64',			'JWWTurkmenistanIconAtlas_64.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'48',			'JWWTurkmenistanIconAtlas_48.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'45',			'JWWTurkmenistanIconAtlas_45.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'32',			'JWWTurkmenistanIconAtlas_32.dds',		1,				2),
		('JWW_TURKMENISTAN_ALPHA_ATLAS',			'24',			'JWWTurkmenistanIconAtlas_24.dds',		1,				2),
		('JWW_TURKMENISTAN_UNIT_ALPHA_ATLAS',		'32',			'EdermanAlpha32.dds',					1,				1);
--================================================================
-- Art Defines
--================================================================
INSERT INTO ArtDefine_UnitInfos
        (TYPE,							DamageStates,   Formation)
VALUES  ('ART_DEF_UNIT_JWW_EDERMAN',	1,				'MechanizedInfantry');

INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_JWW_EDERMAN',	'ART_DEF_UNIT_MEMBER_JWW_EDERMAN2',	1);
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_JWW_EDERMAN',	'ART_DEF_UNIT_MEMBER_JWW_EDERMAN',	2);
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_JWW_EDERMAN',	'ART_DEF_UNIT_MEMBER_JWW_EDERMAN2',	1);
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES	('ART_DEF_UNIT_JWW_EDERMAN',	'ART_DEF_UNIT_MEMBER_JWW_EDERMAN',	2);
 
/*INSERT INTO "ArtDefine_UnitMemberCombats" VALUES ("ART_DEF_UNIT_MEMBER_JWW_EDERMAN","Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge","",null,"12",null,null,null,null,"0.3499999940395355",null,null,null,null,null,null,null,null,null,null,"8","1",null,null,null,null,"1","1",null,null,null,null,null,null,"",null);*/
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER';
INSERT INTO ArtDefine_UnitMemberCombats
        (UnitMemberType,                    EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN2',  EnableActions,  DisableActions, MoveRadius, ShortMoveRadius,    ChargeRadius,   AttackRadius,   RangedAttackRadius, MoveRate,   ShortMoveRate,  TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY';
 
/*INSERT INTO "ArtDefine_UnitMemberCombatWeapons" VALUES ("ART_DEF_UNIT_MEMBER_JWW_EDERMAN","0","0","",null,null,null,null,null,"",null,null,null,null,null,null,null,null,"BULLET","BULLET",null);*/
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PARATROOPER';
INSERT INTO ArtDefine_UnitMemberCombatWeapons
        (UnitMemberType,                        "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN2',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY';

/*INSERT INTO "ArtDefine_UnitMemberInfos" VALUES ("ART_DEF_UNIT_MEMBER_JWW_EDERMAN","0.10000000059604645",null,"","modernsoldier.fxsxml","CLOTH","FLESH");*/
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN',  0.12,  ZOffset, DOMAIN, 'modernsoldier.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE TYPE = 'ART_DEF_UNIT_MEMBER_PARATROOPER';
INSERT INTO ArtDefine_UnitMemberInfos
        (TYPE,                                  Scale,  ZOffset, DOMAIN, Model,  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT  'ART_DEF_UNIT_MEMBER_JWW_EDERMAN2',  0.115,  ZOffset, DOMAIN, 'BMP2Iran.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE TYPE = 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY';

INSERT INTO ArtDefine_StrategicView
        (StrategicViewType,				TileType,   Asset)
VALUES  ('ART_DEF_UNIT_JWW_EDERMAN',    'Unit',     'sv_Ederman.dds');
--================================================================