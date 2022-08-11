--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('DMS_BOTSWANA_ATLAS', 					256, 		'DMS_Botswana_IconAtlas_256.dds',		2, 				2),
		('DMS_BOTSWANA_ATLAS', 					128, 		'DMS_Botswana_IconAtlas_128.dds',		2, 				2),
		('DMS_BOTSWANA_ATLAS', 					80, 		'DMS_Botswana_IconAtlas_80.dds',		2, 				2),
		('DMS_BOTSWANA_ATLAS', 					64, 		'DMS_Botswana_IconAtlas_64.dds',		2, 				2),
		('DMS_BOTSWANA_ATLAS', 					45, 		'DMS_Botswana_IconAtlas_45.dds',		2, 				2),
		('DMS_BOTSWANA_ATLAS', 					32, 		'DMS_Botswana_IconAtlas_32.dds',		2, 				2),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			128, 		'DMS_Botswana_AlphaIcon_128.dds',		1,				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			80, 		'DMS_Botswana_AlphaIcon_80.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			64, 		'DMS_Botswana_AlphaIcon_64.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			48, 		'DMS_Botswana_AlphaIcon_48.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			45, 		'DMS_Botswana_AlphaIcon_45.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			32, 		'DMS_Botswana_AlphaIcon_32.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			24, 		'DMS_Botswana_AlphaIcon_24.dds',		1, 				1),
		('DMS_BOTSWANA_ALPHA_ATLAS', 			16, 		'DMS_Botswana_AlphaIcon_16.dds',		1, 				1),
		('DMS_UNIT_FLAG_MOPHATO_ATLAS', 		32, 		'UnitFlag_Mophato_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_DMS_BOTSWANA_ICON', 			0.075,	0.090,	0.235,	1),
		('COLOR_PLAYER_DMS_BOTSWANA_BACKGROUND',	0.361,	0.631,	0.816,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_DMS_BOTSWANA',		'COLOR_PLAYER_DMS_BOTSWANA_ICON', 	'COLOR_PLAYER_DMS_BOTSWANA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 								Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_DMS_KHAMA_PEACE', 	'DMS_Khama_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_DMS_KHAMA_WAR', 		'DMS_Khama_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_DMS_KHAMA_PEACE', 	'SND_LEADER_MUSIC_DMS_KHAMA_PEACE',		'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_DMS_KHAMA_WAR', 	'SND_LEADER_MUSIC_DMS_KHAMA_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_DMS_MOPHATO', 	'Unit', 	'sv_mophato.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_DMS_MOPHATO'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INFANTRY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,							NumMembers)
SELECT	('ART_DEF_UNIT_DMS_MOPHATO'),	('ART_DEF_UNIT_MEMBER_DMS_MOPHATO'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MOPHATO'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MOPHATO'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_INFANTRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_DMS_MOPHATO'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_INFANTRY');
--==========================================================================================================================	
--==========================================================================================================================