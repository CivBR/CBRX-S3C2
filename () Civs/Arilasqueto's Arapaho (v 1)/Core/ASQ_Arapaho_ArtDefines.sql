INSERT INTO Colors
		(Type, Red, Green, Blue, Alpha)
VALUES	('COLOR_ASQ_ARAPAHO_BG',	0.227,	0.094,	0.133,	1),
		('COLOR_ASQ_ARAPAHO_ICON',	0.773,	0.757,	0.824,	1);

INSERT INTO PlayerColors
		(Type,	PrimaryColor,	SecondaryColor,	TextColor)
VALUES	('PLAYERCOLOR_ASQ_ARAPAHO',	'COLOR_ASQ_ARAPAHO_ICON',	'COLOR_ASQ_ARAPAHO_BG',	'COLOR_PLAYER_WHITE_TEXT');

-----

INSERT INTO IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_ASQ_ARAPAHO',	256,	'arapahoAtlas_256.dds',	2,	2),
		('ATLAS_ASQ_ARAPAHO',	128,	'arapahoAtlas_128.dds',	2,	2),
		('ATLAS_ASQ_ARAPAHO',	80,	'arapahoAtlas_80.dds',	2,	2),
		('ATLAS_ASQ_ARAPAHO',	64,	'arapahoAtlas_64.dds',	2,	2),
		('ATLAS_ASQ_ARAPAHO',	45,	'arapahoAtlas_45.dds',	2,	2),
		('ATLAS_ASQ_ARAPAHO',	32,	'arapahoAtlas_32.dds',	2,	2),
		('ALPHA_ASQ_BENIIINEN',	32,	'beniiinenAlpha_32.dds',	1,	1),
		('ALPHA_ASQ_ARAPAHO',	64,	'arapahoAlpha_64.dds',	1,	1),
		('ALPHA_ASQ_ARAPAHO',	48,	'arapahoAlpha_48.dds',	1,	1),
		('ALPHA_ASQ_ARAPAHO',	32,	'arapahoAlpha_32.dds',	1,	1),
		('ALPHA_ASQ_ARAPAHO',	24,	'arapahoAlpha_24.dds',	1,	1);

--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_ASQ_BENIIINEN',	TileType, 	'beniiinenAlpha_128.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ASQ_BENIIINEN',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_ASQ_BENIIINEN', 	'ART_DEF_UNIT_MEMBER_ASQ_BENIIINEN',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_BENIIINEN',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_BENIIINEN',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_BENIIINEN',	Scale,	ZOffset, Domain, 'er_arapaho.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_ASQ_PRETTYNOSE_PEACE', 		'China_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_PRETTYNOSE_WAR', 		'China_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ASQ_PRETTYNOSE_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 				'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_ASQ_PRETTYNOSE_PEACE',		'SND_LEADER_MUSIC_ASQ_DAJI_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ASQ_PRETTYNOSE_WAR', 		'SND_LEADER_MUSIC_ASQ_DAJI_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		100, 		1,		 0);