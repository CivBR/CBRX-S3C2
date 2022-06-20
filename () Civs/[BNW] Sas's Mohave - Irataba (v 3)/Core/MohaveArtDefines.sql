--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
INSERT INTO ArtDefine_UnitInfos (Type,	DamageStates,		Formation)
SELECT	('ART_DEF_UNIT_SAS_KWANAMI'),	DamageStates,		Formation
FROM ArtDefine_UnitInfos				WHERE Type = 'ART_DEF_UNIT_U_SAXON_HUSCARL';

INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType,	UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_SAS_KWANAMI'),						('ART_DEF_UNIT_MEMBER_SAS_KWANAMI'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos		WHERE UnitInfoType = 'ART_DEF_UNIT_U_SAXON_HUSCARL';

INSERT INTO ArtDefine_UnitMemberCombats (UnitMemberType,	EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_SAS_KWANAMI'),				EnableActions,	DisableActions,	MoveRadius,	ShortMoveRadius,	ChargeRadius,	AttackRadius,	RangedAttackRadius,	MoveRate,	ShortMoveRate,	TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax,	PitchRateMin,	PitchRateMax,	LOSRadiusScale,	TargetRadius,	TargetHeight,	HasShortRangedAttack,	HasLongRangedAttack,	HasLeftRightAttack,	HasStationaryMelee,	HasStationaryRangedAttack,	HasRefaceAfterCombat,	ReformBeforeCombat,	HasIndependentWeaponFacing,	HasOpponentTracking,	HasCollisionAttack,	AttackAltitude,	AltitudeDecelerationDistance,	OnlyTurnInMovementActions,	RushAttackFormation
FROM ArtDefine_UnitMemberCombats		WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SAXON_HUSCARL';

INSERT INTO ArtDefine_UnitMemberCombatWeapons ('UnitMemberType',	'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
SELECT ('ART_DEF_UNIT_MEMBER_SAS_KWANAMI'),						"Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
FROM ArtDefine_UnitMemberCombatWeapons	WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_SAXON_HUSCARL');

INSERT INTO ArtDefine_UnitMemberInfos (Type,	Scale,		ZOffset,		Domain,		Model,							MaterialTypeTag,	 MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_SAS_KWANAMI'),	Scale,		ZOffset,		Domain,		('chimu_axeman.fxsxml'),	MaterialTypeTag,	 MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos			WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SAXON_HUSCARL';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_SAS_KWANAMI',		'Unit', 		'SV_SasKwanami.dds');

--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_SAS_IRATABA_PEACE',		'Sas_Irataba_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_SAS_IRATABA_WAR', 		'Sas_Irataba_War', 		'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_SAS_IRATABA_AMBIENCE',	'SND_AMBIENCE_GANDHI_AMBIENCE', 				'GAME_SFX', 	0.0,					20, 		20, 		0, 		 1),
		('AS2D_LEADER_MUSIC_SAS_IRATABA_PEACE', 	'SND_LEADER_MUSIC_SAS_IRATABA_PEACE',	'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SAS_IRATABA_WAR',		'SND_LEADER_MUSIC_SAS_IRATABA_WAR', 	'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											 Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_SAS_MOHAVE_ICON', 		 0.505, 0.788, 	0.403, 	1),
		('COLOR_PLAYER_SAS_MOHAVE_BACKGROUND',  0.6,	0.156,	0.274, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_SAS_MOHAVE',		'COLOR_PLAYER_SAS_MOHAVE_ICON',	'COLOR_PLAYER_SAS_MOHAVE_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('SAS_MOHAVE_ALPHA_ATLAS',			128, 		'SasMohaveAlpha_128.dds',			1,				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			80, 		'SasMohaveAlpha_80.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			64, 		'SasMohaveAlpha_64.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			48, 		'SasMohaveAlpha_48.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			45, 		'SasMohaveAlpha_45.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			32, 		'SasMohaveAlpha_32.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			24, 		'SasMohaveAlpha_24.dds',			1, 				1),
		('SAS_MOHAVE_ALPHA_ATLAS',			16, 		'SasMohaveAlpha_16.dds',			1, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			256, 		'SasMohaveIcons256.dds',			4, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			128, 		'SasMohaveIcons128.dds',			4, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			80, 		'SasMohaveIcons80.dds',			4, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			64, 		'SasMohaveIcons64.dds',			4, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			45, 		'SasMohaveIcons45.dds',			4, 				1),
		('SAS_MOHAVE_ICON_ATLAS', 			32, 		'SasMohaveIcons32.dds',			4, 				1),
		('SAS_KWANAMI_FLAG', 				32, 		'SasKwanamiFlag.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	
