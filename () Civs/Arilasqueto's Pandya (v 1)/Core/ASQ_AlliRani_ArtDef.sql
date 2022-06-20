INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_ASQ_SANGAMPANDYA_ICON',	round(194.0/255, 3),round(189.0/255, 3),	round(77.0/255, 3), 1),
		('COLOR_ASQ_SANGAMPANDYA_BG',		round(93.0/255, 3),round(17.0/255, 3),		round(37.0/255, 3), 1);

INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_ASQ_SANGAMPANDYA',	'COLOR_ASQ_SANGAMPANDYA_ICON',	'COLOR_ASQ_SANGAMPANDYA_BG',	'COLOR_PLAYER_WHITE_TEXT');


-----

INSERT INTO IconTextureAtlases
		(Atlas,						IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('ALPHA_ASQ_SANGAMPANDYA',			128,		'AlliRaniAlpha128.dds',	1,				1),
		('ALPHA_ASQ_SANGAMPANDYA',			64,			'AlliRaniAlpha64.dds',	1,				1),
		('ALPHA_ASQ_SANGAMPANDYA',			48,			'AlliRaniAlpha48.dds',	1,				1),
		('ALPHA_ASQ_SANGAMPANDYA',			32,			'AlliRaniAlpha32.dds',	1,				1),
		('ALPHA_ASQ_SANGAMPANDYA',			24,			'AlliRaniAlpha24.dds',	1,				1),
		('ATLAS_ASQ_ALLIRANI',			256,		'pandyaAtlas256.dds',	2,				2),
		('ATLAS_ASQ_ALLIRANI',			128,		'pandyaAtlas128.dds',	2,				2),
		('ATLAS_ASQ_ALLIRANI',			80,			'pandyaAtlas80.dds',		2,				2),
		('ATLAS_ASQ_ALLIRANI',			64,			'pandyaAtlas64.dds',		2,				2),
		('ATLAS_ASQ_ALLIRANI',			45,			'pandyaAtlas45.dds',		2,				2),
		('ATLAS_ASQ_ALLIRANI',			32,			'pandyaAtlas32.dds',		2,				2),
		('ALPHA_ASQ_MARAVAL',			32,			'Maraval_Alpha.dds',		1,				1),
		('ALPHA_ASQ_MARAVAL',			128,		'Maraval_Alpha128.dds',	1,				1)
		;

		--------------------------------------------------------------------------------------------------------------------------
		-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_ASQ_MARAVAL',	TileType, 	'yue_Alpha_128.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ASQ_MARAVAL',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_ASQ_MARAVAL', 	'ART_DEF_UNIT_MEMBER_ASQ_MARAVAL',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_MARAVAL',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_MARAVAL',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ASQ_MARAVAL',	Scale,	ZOffset, Domain, 'Spearman_India.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SPEARMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_ASQ_ALLIRANI_PEACE', 		'Pandya_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ASQ_ALLIRANI_WAR', 		'Pandya_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_ASQ_ALLIRANI_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 				'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_ASQ_ALLIRANI_PEACE',		'SND_LEADER_MUSIC_ASQ_ALLIRANI_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_ASQ_ALLIRANI_WAR', 		'SND_LEADER_MUSIC_ASQ_ALLIRANI_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		100, 		1,		 0);

