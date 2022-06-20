-- ======================================================================================================
-- ICON ATLASES
-- ======================================================================================================
-- IconTextureAtlases
---------------------
INSERT INTO IconTextureAtlases
(Atlas,                          IconSize,    Filename,                     IconsPerRow,       IconsPerColumn)
VALUES    ('THP_ZULU_ATLAS',     256,        'THP_ZuluAtlas256.dds',        2,                 2),
('THP_ZULU_ATLAS',               128,        'THP_ZuluAtlas128.dds',        2,                 2),
('THP_ZULU_ATLAS',               80,         'THP_ZuluAtlas80.dds',         2,                 2),
('THP_ZULU_ATLAS',               64,         'THP_ZuluAtlas64.dds',         2,                 2),
('THP_ZULU_ATLAS',               45,         'THP_ZuluAtlas45.dds',         2,                 2),
('THP_ZULU_ATLAS',               32,         'THP_ZuluAtlas32.dds',         2,                 2),
('THP_ZULU_ALPHA_ATLAS',         128,        'THP_ZuluAlpha128.dds',        1,                 1),
('THP_ZULU_ALPHA_ATLAS',         64,         'THP_ZuluAlpha64.dds',         1,                 1),
('THP_ZULU_ALPHA_ATLAS',         48,         'THP_ZuluAlpha48.dds',         1,                 1),
('THP_ZULU_ALPHA_ATLAS',         32,         'THP_ZuluAlpha32.dds',         1,                 1),
('THP_ZULU_ALPHA_ATLAS',         24,         'THP_ZuluAlpha24.dds',         1,                 1),
('THP_ZULU_ALPHA_ATLAS',         16,         'THP_ZuluAlpha16.dds',         1,                 1),
('THP_UNIT_IBUTHO_FLAG_ATLAS',   32,         'Unit_Ibutho_Flag_32.dds',     1,                 1);
-- ======================================================================================================
-- COLORS
-- ======================================================================================================
-- Colors
---------
INSERT INTO Colors
(Type,                                     Red,     Green,    Blue,     Alpha)
VALUES    ('COLOR_PLAYER_THP_ZULU_ICON',   0.780,   0.659,    0.573,    1),
('COLOR_PLAYER_THP_ZULU_BACKGROUND',       0.290,   0.180,    0.137,    1);
---------------
-- PlayerColors
---------------
INSERT INTO PlayerColors
          (Type,                           PrimaryColor,                     SecondaryColor,                   TextColor)
VALUES    ('PLAYERCOLOR_THP_ZULU',        'COLOR_PLAYER_THP_ZULU_ICON',     'COLOR_PLAYER_THP_ZULU_BACKGROUND',     'COLOR_PLAYER_WHITE_TEXT');
-- ======================================================================================================
-- UNIT ART
-- ======================================================================================================
-- ArtDefine_StrategicView
--------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		     TileType,		 Asset)
VALUES	('ART_DEF_UNIT_THP_IBUTHO',		'Unit', 		'sv_ibutho.dds');
----------------------
-- ArtDefine_UnitInfos
----------------------
INSERT INTO ArtDefine_UnitInfos
          (Type,                            DamageStates,     Formation)
SELECT    'ART_DEF_UNIT_THP_IBUTHO',        DamageStates,     Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR';
--------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos
          (UnitInfoType,                UnitMemberInfoType,                NumMembers)
SELECT    'ART_DEF_UNIT_THP_IBUTHO',   'ART_DEF_UNIT_MEMBER_THP_IBUTHO',   NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_ZULU_IMPI_WARRIOR';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats
(UnitMemberType,                             EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT    'ART_DEF_UNIT_MEMBER_THP_IBUTHO',  EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax,   LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack,    HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat,  ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack,      AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR';
------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons
(UnitMemberType,                             "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_IBUTHO',  "Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR';
----------------------------
-- ArtDefine_UnitMemberInfos
----------------------------
INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                       Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT    'ART_DEF_UNIT_MEMBER_THP_IBUTHO',  Scale,    ZOffset, Domain, Model,    MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ZULU_IMPI_WARRIOR';
-- ======================================================================================================
-- AUDIO
-- ======================================================================================================
-- Audio_Sounds
---------------
INSERT INTO Audio_Sounds 
		(SoundID, 									 Filename, 		       LoadType)
VALUES	('SND_LEADER_MUSIC_THP_CETSHWAYO_PEACE',    'Cetshwayo_Peace',    'DynamicResident'),
		('SND_LEADER_MUSIC_THP_CETSHWAYO_WAR', 	    'Cetshwayo_War', 	  'DynamicResident');
-----------------
-- Audio_2DSounds
-----------------
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_THP_CETSHWAYO_PEACE', 		'SND_LEADER_MUSIC_THP_CETSHWAYO_PEACE', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_THP_CETSHWAYO_WAR', 			'SND_LEADER_MUSIC_THP_CETSHWAYO_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
-- ======================================================================================================
-- ======================================================================================================
