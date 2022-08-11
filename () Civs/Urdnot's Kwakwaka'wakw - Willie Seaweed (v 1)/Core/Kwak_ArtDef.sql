-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                          IconSize,    Filename,                     IconsPerRow,       IconsPerColumn)
VALUES    ('URD_KWAK_ATLAS',     256,    'URD_KwakAtlas_256.dds',        2,                 2),
('URD_KWAK_ATLAS',               128,    'URD_KwakAtlas_128.dds',        2,                 2),
('URD_KWAK_ATLAS',               80,     'URD_KwakAtlas_80.dds',         2,                 2),
('URD_KWAK_ATLAS',               64,     'URD_KwakAtlas_64.dds',         2,                 2),
('URD_KWAK_ATLAS',               45,     'URD_KwakAtlas_45.dds',         2,                 2),
('URD_KWAK_ATLAS',               32,     'URD_KwakAtlas_32.dds',         2,                 2),
('URD_KWAK_ALPHA_ATLAS',         128,    'URD_KwakAlpha_128.dds',        1,                 1),
('URD_KWAK_ALPHA_ATLAS',         64,     'URD_KwakAlpha_64.dds',         1,                 1),
('URD_KWAK_ALPHA_ATLAS',         48,     'URD_KwakAlpha_48.dds',         1,                 1),
('URD_KWAK_ALPHA_ATLAS',         32,     'URD_KwakAlpha_32.dds',         1,                 1),
('URD_KWAK_ALPHA_ATLAS',         24,     'URD_KwakAlpha_24.dds',         1,                 1),
('URD_KWAK_ALPHA_ATLAS',         16,     'URD_KwakAlpha_16.dds',         1,                 1),
('HAMATSA_FLAG_ATLAS',      32,     'Unit_Hamatsa_Flag_32.dds',        1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                            Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_URD_KWAK_ICON',   0.804,   0.451,    0.451,    1),
('COLOR_PLAYER_URD_KWAK_BACKGROUND',       0.125,   0.137,    0.180,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_URD_KWAK',        'COLOR_PLAYER_URD_KWAK_ICON',     'COLOR_PLAYER_URD_KWAK_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		         TileType,		 Asset)
VALUES	('ART_DEF_UNIT_URD_HAMATSA',		'Unit', 		'sv_hamatsa.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                               DamageStates,    Formation)
SELECT    'ART_DEF_UNIT_URD_HAMATSA',       DamageStates,    Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SCOUT';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                    UnitMemberInfoType,                    NumMembers)
SELECT    'ART_DEF_UNIT_URD_HAMATSA',   'ART_DEF_UNIT_MEMBER_URD_HAMATSA',   NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SCOUT';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                                 EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_URD_HAMATSA',    EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                                 "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_URD_HAMATSA',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SCOUT';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                           Scale,    ZOffset, Domain, Model,                     MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_URD_HAMATSA',  Scale,    ZOffset, Domain, 'er_hamatsa.fxsxml', MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SCOUT';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 								   Filename, 		       LoadType)
VALUES	('SND_LEADER_MUSIC_URD_SEAWEED_PEACE',     'Kwak_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_URD_SEAWEED_WAR', 	  'Kwak_War', 	  'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_URD_SEAWEED_PEACE', 		'SND_LEADER_MUSIC_URD_SEAWEED_PEACE', 		'GAME_MUSIC', 	-1.0,					90, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_URD_SEAWEED_WAR', 			'SND_LEADER_MUSIC_URD_SEAWEED_WAR', 		'GAME_MUSIC', 	-1.0,					70, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
