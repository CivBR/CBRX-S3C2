--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_PLAYER_LITE_AINU_ICON', 		0.027,	0.454,	0.654,	1),
		('COLOR_PLAYER_LITE_AINU_BACKGROUND', 	0.721,	0.721,	0.721,	1);
--------------------------------------------------------------------------------------------------------------------------	
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------				
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_LITE_AINU',	'COLOR_PLAYER_LITE_AINU_ICON',	'COLOR_PLAYER_LITE_AINU_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES	('LITE_AINU_ATLAS', 					256, 		'LITE_Ainu_Atlas_256.dds',		3, 				2),
		('LITE_AINU_ATLAS', 					128, 		'LITE_Ainu_Atlas_128.dds',		3, 				2),
		('LITE_AINU_ATLAS', 					80, 		'LITE_Ainu_Atlas_80.dds',		3, 				2),
		('LITE_AINU_ATLAS', 					64, 		'LITE_Ainu_Atlas_64.dds',		3, 				2),
		('LITE_AINU_ATLAS', 					45, 		'LITE_Ainu_Atlas_45.dds',		3, 				2),
		('LITE_AINU_ATLAS', 					32, 		'LITE_Ainu_Atlas_32.dds',		3, 				2),
		('LITE_AINU_ALPHA_ATLAS', 				128, 		'LITE_Ainu_Alpha_128.dds',		1,				1),
		('LITE_AINU_ALPHA_ATLAS', 				80, 		'LITE_Ainu_Alpha_80.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				64, 		'LITE_Ainu_Alpha_64.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				48, 		'LITE_Ainu_Alpha_48.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				45, 		'LITE_Ainu_Alpha_45.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				32, 		'LITE_Ainu_Alpha_32.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				24, 		'LITE_Ainu_Alpha_24.dds',		1, 				1),
		('LITE_AINU_ALPHA_ATLAS', 				16, 		'LITE_Ainu_Alpha_16.dds',		1, 				1),
		('LITE_AINU_MATAGI_FLAG', 				32, 		'LITE_Matagi_Ainu_Flag.dds',	1, 				1);
--==========================================================================================================================
-- IconFontTextures
--==========================================================================================================================
INSERT INTO IconFontTextures 
			(IconFontTexture, 						IconFontTextureFile)
VALUES		('ICON_FONT_TEXTURE_AINU_BEAR', 		'LITE_Bear_Ainu_fonticon');
--==========================================================================================================================
-- IconFontMapping
--==========================================================================================================================
INSERT INTO IconFontMapping 
			(IconName, 								IconFontTexture,				IconMapping)
VALUES		('ICON_RES_LITE_AINU_BEAR', 			'ICON_FONT_TEXTURE_AINU_BEAR',	1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_LITE_SHAKUSHAIN_PEACE', 	'LITE_Ainu_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_LITE_SHAKUSHAIN_WAR', 	'LITE_Ainu_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_LITE_SHAKUSHAIN_PEACE',	'SND_LEADER_MUSIC_LITE_SHAKUSHAIN_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_LITE_SHAKUSHAIN_WAR', 	'SND_LEADER_MUSIC_LITE_SHAKUSHAIN_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_LITE_MATAGI', 	'Unit', 	'LITE_sv_Matagi_Ainu.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_LITE_MATAGI'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_LITE_MATAGI'),		('ART_DEF_UNIT_MEMBER_LITE_MATAGI'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_LITE_MATAGI'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_LITE_MATAGI'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model,									MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_LITE_MATAGI'),	Scale,	ZOffset, Domain, ('Composite_Bowman_China_v2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN');
--==========================================================================================================================	
--==========================================================================================================================	
