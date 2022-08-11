--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('SPLATDAY_DUTCH_ATLAS', 					256, 		'Vanadius_Splatday_IconAtlas_256.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					128, 		'Vanadius_Splatday_IconAtlas_128.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					80, 		'Vanadius_Splatday_IconAtlas_80.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					64, 		'Vanadius_Splatday_IconAtlas_64.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					45, 		'Vanadius_Splatday_IconAtlas_45.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					32, 		'Vanadius_Splatday_IconAtlas_32.dds',		2, 				2),
		('SPLATDAY_DUTCH_ATLAS', 					24, 		'Vanadius_Splatday_IconAtlas_24.dds',		2, 				2),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				256, 		'Vanadius_Splatday_AlphaAtlas_256.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				128, 		'Vanadius_Splatday_AlphaAtlas_128.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				64, 		'Vanadius_Splatday_AlphaAtlas_64.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				48, 		'Vanadius_Splatday_AlphaAtlas_48.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				45, 		'Vanadius_Splatday_AlphaAtlas_45.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				32, 		'Vanadius_Splatday_AlphaAtlas_32.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				24, 		'Vanadius_Splatday_AlphaAtlas_24.dds',		1, 				1),
		('SPLATDAY_DUTCH_ALPHA_ATLAS', 				16, 		'Vanadius_Splatday_AlphaAtlas_16.dds',		1, 				1),
		('VANA_BLUE_GUARD_FLAG', 					32, 		'sv_BlueGuard.dds',							1, 				1),
		('VANA_MAN_OF_WAR_FLAG', 					32, 		'sv_ManOfWar.dds',							1, 				1);
------------------------------
-- Colours
------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_SPLATDAY_DUTCH_ICON', 			0.969,	0.839,	0.616,	1),
		('COLOR_PLAYER_SPLATDAY_DUTCH_BACKGROUND',		0.686,	0.333,	0.019,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 								SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_SPLATDAY_DUTCH',				'COLOR_PLAYER_SPLATDAY_DUTCH_ICON', 			'COLOR_PLAYER_SPLATDAY_DUTCH_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_SPLATDAY_WILLIAM_PEACE', 	'WilliamIII_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_SPLATDAY_WILLIAM_WAR', 	'WilliamIII_War', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_SPLATDAY_WILLIAM_PEACE',	'SND_LEADER_MUSIC_SPLATDAY_WILLIAM_PEACE',	'GAME_MUSIC', 	50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_SPLATDAY_WILLIAM_WAR', 		'SND_LEADER_MUSIC_SPLATDAY_WILLIAM_WAR', 	'GAME_MUSIC', 	50, 		50, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_VANA_BLUE_GUARD',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN';

	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_VANA_BLUE_GUARD', 	'ART_DEF_UNIT_MEMBER_VANA_BLUE_GUARD',		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_AMERICAN_MINUTEMAN';


--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_VANA_BLUE_GUARD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_VANA_BLUE_GUARD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			   MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_VANA_BLUE_GUARD',	Scale,	ZOffset, Domain, ('vana_blue_guard.fxsxml'),  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_AMERICAN_MINUTEMAN';	

--
--==========================================================================================================================	
--==========================================================================================================================	
