INSERT INTO Colors
		(Type,						Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_ERW_KOKANG_ICON',	0.713,	0.899,	0.863,	1),
		('COLOR_ERW_KOKANG_BG',		0.278,	0.075,	0.169,	1);

INSERT INTO PlayerColors
		(Type,						PrimaryColor,			SecondaryColor,			TextColor)
VALUES	('PLAYERCOLOR_ERW_KOKANG',	'COLOR_ERW_KOKANG_ICON',	'COLOR_ERW_KOKANG_BG',	'COLOR_PLAYER_WHITE_TEXT');

-----

INSERT INTO IconTextureAtlases
		(Atlas,					IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('ATLAS_ERW_KOKANG',	256,		'KokangAtlas256.dds',	3,	2),
		('ATLAS_ERW_KOKANG',	128,		'KokangAtlas128.dds',	3,	2),
		('ATLAS_ERW_KOKANG',	80,		'KokangAtlas80.dds',	3,	2),
		('ATLAS_ERW_KOKANG',	64,		'KokangAtlas64.dds',	3,	2),
		('ATLAS_ERW_KOKANG',	45,		'KokangAtlas45.dds',	3,	2),
		('ATLAS_ERW_KOKANG',	32,		'KokangAtlas32.dds',	3,	2),
		('ALPHA_ERW_KOKANG',	64,	'KokangAlphaAtlas64.dds',	1,	1),
		('ALPHA_ERW_KOKANG',	48,	'KokangAlphaAtlas48.dds',	1,	1),
		('ALPHA_ERW_KOKANG',	32,	'KokangAlphaAtlas32.dds',	1,	1),
		('ALPHA_ERW_KOKANG',	24,	'KokangAlphaAtlas24.dds',	1,	1),
		('ALPHA_ERW_KAKWEYE',	32,	'unitflag_er_kakweye.dds',	1,	1);

		

--Model
	
INSERT INTO ArtDefine_LandmarkTypes	
		(Type, 								LandmarkType, 	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_ERW_POPPY', 	'Improvement', 	'EW_Garden');

-----

INSERT INTO ArtDefine_Landmarks
		(Era, 	State, 					Scale,	ImprovementType,									LayoutHandler, 	ResourceType, 			Model, 										TerrainContour)
VALUES	('Any', 'Constructed',		 	0.3, 	'ART_DEF_IMPROVEMENT_ERW_POPPY', 'SNAPSHOT', 		'ART_DEF_RESOURCE_ALL', 'EW_Garden.fxsxml', 	0);

--Audio

INSERT INTO Audio_Sounds
		(SoundID,	Filename,	LoadType)
VALUES	('SND_LEADER_MUSIC_ERW_OLIVE_YANG_PEACE',	'Kokang_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ERW_OLIVE_YANG_WAR',		'Kokang_War',	'DynamicResident'),
		('SND_DOM_SPEECH_ERW_OLIVE_YANG',	'Kokang_DoM',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID,	SoundID,	SoundType,	TaperSoundtrackVolume,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_ERW_OLIVE_YANG_PEACE',	'SND_LEADER_MUSIC_ERW_OLIVE_YANG_PEACE',	'GAME_MUSIC',	-1.0,	55,	55,	1,	0),
		('AS2D_LEADER_MUSIC_ERW_OLIVE_YANG_WAR',	'SND_LEADER_MUSIC_ERW_OLIVE_YANG_WAR',		'GAME_MUSIC',	-1.0,	60,	60,	1,	0),
		('AS2D_DOM_SPEECH_ERW_OLIVE_YANG',			'SND_DOM_SPEECH_ERW_OLIVE_YANG',			'GAME_SPEECH',	-1.0,	75,	75,	1,	0);

--Unit



-----

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_ERW_KAKWEYE', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MACHINEGUN'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,								NumMembers)
SELECT	'ART_DEF_UNIT_ERW_KAKWEYE', 	'ART_DEF_UNIT_MEMBER_ERW_KAKWEYE',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MACHINEGUN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_ERW_KAKWEYE',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MACHINEGUN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ERW_KAKWEYE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MACHINEGUN';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_ERW_KAKWEYE',	Scale, ZOffset, Domain, 'kakweye.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MACHINEGUN';

-----

INSERT INTO ArtDefine_LandmarkTypes 
		(Type,									LandmarkType,		FriendlyName) 
VALUES	('ART_DEF_RESOURCE_ERW_OPIUM',			'Resource',			'Opium');

-----

INSERT INTO ArtDefine_Landmarks 
		(Era,			State,					Scale,					ImprovementType,								LayoutHandler,	ResourceType,						Model,										TerrainContour, Tech)
VALUES	('Any',			'Any',					0.9399999976158142,		'ART_DEF_IMPROVEMENT_NONE',						'SNAPSHOT',		'ART_DEF_RESOURCE_ERW_OPIUM',		'resource_poppy.fxsxml',					1,				null);