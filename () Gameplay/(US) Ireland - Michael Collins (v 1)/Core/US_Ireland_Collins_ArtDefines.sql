--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('US_IRELAND_ATLAS', 						256, 		'US_IrelandAtlas_256.dds',				2, 				2),
		('US_IRELAND_ATLAS', 						128, 		'US_IrelandAtlas_128.dds',				2, 				2),
		('US_IRELAND_ATLAS', 						80, 		'US_IrelandAtlas_80.dds',				2, 				2),
		('US_IRELAND_ATLAS', 						64, 		'US_IrelandAtlas_64.dds',				2, 				2),
		('US_IRELAND_ATLAS', 						45, 		'US_IrelandAtlas_45.dds',				2, 				2),
		('US_IRELAND_ATLAS', 						32, 		'US_IrelandAtlas_32.dds',				2, 				2),
		('US_IRELAND_ALPHA_ATLAS', 					128, 		'US_IrelandAlphaAtlas_128.dds',			1,				1),
		('US_IRELAND_ALPHA_ATLAS', 					80, 		'US_IrelandAlphaAtlas_80.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					64, 		'US_IrelandAlphaAtlas_64.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					48, 		'US_IrelandAlphaAtlas_48.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					45, 		'US_IrelandAlphaAtlas_45.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					32, 		'US_IrelandAlphaAtlas_32.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					24, 		'US_IrelandAlphaAtlas_24.dds',			1, 				1),
		('US_IRELAND_ALPHA_ATLAS', 					16, 		'US_IrelandAlphaAtlas_16.dds',			1, 				1),
		('US_FENIAN_FLAG_ART_ATLAS', 				32, 		'UnitFlag_Fenian_32.dds',				1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_US_IRELAND_ICON',					0.839,	0.522,	0.133,	1),
		('COLOR_PLAYER_US_IRELAND_BACKGROUND',				0.027,	0.345,	0.184,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_US_IRELAND',		'COLOR_PLAYER_US_IRELAND_ICON', 	'COLOR_PLAYER_US_IRELAND_BACKGROUND', 		'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_US_MICHAEL_COLLINS_PEACE', 	'MichaelCollins_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_US_MICHAEL_COLLINS_WAR', 	'MichaelCollins_War', 	'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 										SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_US_MICHAEL_COLLINS_PEACE',	'SND_LEADER_MUSIC_US_MICHAEL_COLLINS_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_US_MICHAEL_COLLINS_WAR', 	'SND_LEADER_MUSIC_US_MICHAEL_COLLINS_WAR', 		'GAME_MUSIC', 	60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_US_FENIAN', 	'Unit', 	'sv_u_ireland_fenian.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_US_FENIAN'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	('ART_DEF_UNIT_US_FENIAN'),		('ART_DEF_UNIT_MEMBER_US_FENIAN'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_US_FENIAN'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_US_FENIAN'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,  ZOffset, Domain, Model,						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_US_FENIAN'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================	
--==========================================================================================================================	
