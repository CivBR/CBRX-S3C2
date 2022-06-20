--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('PG_RIODELAPLATA_ATLAS', 					256, 		'RiodelaPlataIocons256.dds',			4, 				2),
		('PG_RIODELAPLATA_ATLAS', 					128, 		'RiodelaPlataIocons128.dds',			4, 				2),
		('PG_RIODELAPLATA_ATLAS', 					80, 		'RiodelaPlataIocons80.dds',				4, 				2),
		('PG_RIODELAPLATA_ATLAS', 					64, 		'RiodelaPlataIocons64.dds',				4, 				2),
		('PG_RIODELAPLATA_ATLAS', 					45, 		'RiodelaPlataIocons45.dds',				4, 				4),
		('PG_RIODELAPLATA_ATLAS', 					32, 		'RiodelaPlataIocons32.dds',				4, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			128, 		'RiodelaPlataIocons128.dds',			1,				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			80, 		'RiodelaPlataIocons80.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			64, 		'RiodelaPlataIocons64.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			48, 		'RiodelaPlataIocons48.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			45, 		'RiodelaPlataIocons45.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			32, 		'RiodelaPlataIocons32.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			24, 		'RiodelaPlataIocons24.dds',				1, 				2),
		('PG_RIODELAPLATA_ALPHA_ATLAS', 			16, 		'RiodelaPlataIocons16.dds',				1, 				2),
		('PG_RIODELAPLATA_GRANADEROS_FLAG_ATLAS',	32, 		'flag_granaderos.dds',					1, 				1),
		('PG_SANMARTIN_PATRICIOS_FLAG_ATLAS',		32, 		'flag_patricios.dds',					1, 				1);

------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_PG_RIODELAPLATA_ICON', 		1,		1,		1,		1),
		('COLOR_PLAYER_PG_RIODELAPLATA_BACKGROUND',	0.161,	0.725,	1,		1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 										PrimaryColor, 						SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_PG_RIODELAPLATA',				'COLOR_PLAYER_PG_RIODELAPLATA_ICON', 	'COLOR_PLAYER_PG_RIODELAPLATA_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');

--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_PG_SANMARTIN_PEACE', 	'SanMartinPeace',		'DynamicResident'),
		('SND_LEADER_MUSIC_PG_SANMARTIN_WAR', 		'SanMartinWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_PG_SANMARTIN_PEACE', 		'SND_LEADER_MUSIC_PG_SANMARTIN_PEACE',		'GAME_MUSIC', 		45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_PG_SANMARTIN_WAR',			'SND_LEADER_MUSIC_PG_SANMARTIN_WAR', 		'GAME_MUSIC', 		45, 		45, 		1,		 0),
		('AS2D_AMBIENCE_LEADER_PG_SANMARTIN_AMBIENCE',	'SND_AMBIENCE_GRASSLANDS_BED',				'GAME_SFX',			85,			85,			0,		 1),
		('AS2D_DOM_MUSIC_PG_SANMARTIN', 				'SND_LEADER_MUSIC_PG_SANMARTIN_PEACE',		'GAME_SPEECH',		45, 		100, 		0, 		 0);

--==========================================================================================================================
-- UNIT/RESOURCE GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 							TileType,		Asset)
VALUES	('ART_DEF_UNIT_PG_GRANADEROS',					'Unit', 		'sv_granaderos.dds'),
		('ART_DEF_UNIT_PG_SANMARTIN_PATRICIOS',			'Unit', 		'sv_patricios.dds'),
		('ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'Improvement',	'sv_yerbamate_plantation.dds'),
		('ART_DEF_RESOURCE_PG_YERBAMATE',				'Resource',		'sv_MATE.dds');

------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PG_GRANADEROS',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CAVALRY';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PG_SANMARTIN_PATRICIOS',		DamageStates, 	'UnFormed'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_RIFLEMAN';

------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_PG_GRANADEROS', 		'ART_DEF_UNIT_MEMBER_PG_GRANADEROS',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CAVALRY';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
VALUES	('ART_DEF_UNIT_PG_SANMARTIN_PATRICIOS', 		'ART_DEF_UNIT_MEMBER_PG_SANMARTIN_PATRICIOS',	9);


------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PG_GRANADEROS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PG_SANMARTIN_PATRICIOS',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PG_GRANADEROS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PG_SANMARTIN_PATRICIOS',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PG_GRANADEROS',	Scale,	ZOffset, Domain, 'granaderos.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CAVALRY';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PG_SANMARTIN_PATRICIOS',	Scale,	ZOffset, Domain, 'patricios.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN';

------------------------
-- ArtDefine_LandmarkTypes
------------------------

INSERT INTO ArtDefine_LandmarkTypes
		(Type,											LandmarkType,	FriendlyName)
VALUES	('ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'Improvement',	'YerbamatePlantation');

------------------------
-- ArtDefine_Landmarks
------------------------

INSERT INTO ArtDefine_Landmarks
		(Era,	State,					Scale,	ImprovementType,								LayoutHandler,	ResourceType,			Model,					TerrainContour)
VALUES	('Any',	'UnderConstruction',	0.001,	'ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',	'yerbamate_hb.fxsxml',	1),
		('Any',	'Constructed',			0.001,	'ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',	'yerbamate.fxsxml',		1),
		('Any',	'Pillaged',				0.001,	'ART_DEF_IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'SNAPSHOT',		'ART_DEF_RESOURCE_ALL',	'yerbamate_pl.fxsxml',	1);
		
--==========================================================================================================================	
--==========================================================================================================================	

