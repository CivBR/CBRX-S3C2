--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView
            (StrategicViewType,				TileType,   Asset)
VALUES      ('ART_DEF_UNIT_GPUZ_BENADIORO',	'Unit',     'KayapoFlagSV.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_GPUZ_BENADIORO'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_MERCHANT';	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,	NumMembers)
SELECT	'ART_DEF_UNIT_GPUZ_BENADIORO', 	UnitMemberInfoType, NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MERCHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,				EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_GPUZ_BENADIORO',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MERCHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,				"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_GPUZ_BENADIORO',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MERCHANT';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 							Scale,	ZOffset, Domain, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_GPUZ_BENADIORO',	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MERCHANT';	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 		LoadType)
VALUES	('SND_LEADER_MUSIC_GPUZ_RAONI_PEACE',	'GPuz_Raoni_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_GPUZ_RAONI_WAR',		'GPuz_Raoni_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 								SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GPUZ_RAONI_PEACE',	'SND_LEADER_MUSIC_GPUZ_RAONI_PEACE',	'GAME_MUSIC', 	-1.0,					100, 		100, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GPUZ_RAONI_WAR', 	'SND_LEADER_MUSIC_GPUZ_RAONI_WAR', 		'GAME_MUSIC', 	-1.0,					100, 		100, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 									Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GPUZ_RAONI_ICON', 		0.945,  0.698,  0.267,	1),
		('COLOR_PLAYER_GPUZ_RAONI_BACKGROUND',	0.231,  0.369,  0.255,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 							SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_GPUZ_RAONI',	'COLOR_PLAYER_GPUZ_RAONI_ICON',	'COLOR_PLAYER_GPUZ_RAONI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 		Filename, 					IconsPerRow, 	IconsPerColumn)
VALUES	('GPUZ_RAONI_ALPHA_ATLAS', 	 	64, 		'KayapoAlpha_64.dds',	1, 				1),
		('GPUZ_RAONI_ALPHA_ATLAS', 	  	48, 		'KayapoAlpha_48.dds',	1, 				1),
		('GPUZ_RAONI_ALPHA_ATLAS', 	  	32, 		'KayapoAlpha_32.dds',	1, 				1),
		('GPUZ_RAONI_ALPHA_ATLAS', 	  	24, 		'KayapoAlpha_24.dds',	1, 				1),
		('GPUZ_RAONI_ICON_ATLAS', 	  	256, 		'KayapoAtlas_256.dds',	2, 				2),
		('GPUZ_RAONI_ICON_ATLAS', 	  	128, 		'KayapoAtlas_128.dds',	2, 				2),
		('GPUZ_RAONI_ICON_ATLAS',	  	80, 		'KayapoAtlas_80.dds',	2, 				2),
		('GPUZ_RAONI_ICON_ATLAS', 	  	64, 		'KayapoAtlas_64.dds',	2, 				2),
		('GPUZ_RAONI_ICON_ATLAS', 	  	45, 		'KayapoAtlas_45.dds',	2, 				2),
		('GPUZ_RAONI_ICON_ATLAS', 	  	32, 		'KayapoAtlas_32.dds',	2, 				2),
		('GPUZ_RAONI_UNIT_FLAG_ATLAS', 	32, 		'KayapoFlag32.dds',				1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	