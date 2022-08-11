--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_DRAKKER',	'Unit', 	'sv_Drakker.dds'),
		('ART_DEF_UNIT_JFD_TINGLID',	'Unit', 	'sv_Tinglid.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_DRAKKER',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GALLEASS';

INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_TINGLID',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_DRAKKER', 	'ART_DEF_UNIT_MEMBER_JFD_DRAKKER',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GALLEASS';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_JFD_TINGLID', 	'ART_DEF_UNIT_MEMBER_JFD_TINGLID',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_DRAKKER',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TINGLID',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_DRAKKER',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TINGLID',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_DRAKKER',	0.125,	ZOffset, Domain, 'Skeid.fxsxml',			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GALLEASS';

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_TINGLID',	Scale,	ZOffset, Domain, 'Pikeman_Viking.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			  LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_CANUTE_PEACE', 		'JFD_Canute_Peace',	  'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_CANUTE_WAR', 		'JFD_Canute_War', 	  'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_CANUTE_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 				'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_CANUTE_PEACE',		'SND_LEADER_MUSIC_JFD_CANUTE_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_CANUTE_WAR', 		'SND_LEADER_MUSIC_JFD_CANUTE_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_ANGLO_NORSE_ICON', 		0.890,	0.768,	0.419,	1),
		('COLOR_PLAYER_JFD_ANGLO_NORSE_BACKGROUND',	0.396,	0.133,	0.075,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 							 PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES	('PLAYERCOLOR_JFD_ANGLO_NORSE',	 'COLOR_PLAYER_JFD_ANGLO_NORSE_ICON',   'COLOR_PLAYER_JFD_ANGLO_NORSE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS', 	256, 		'JFD_AngloNorse_AchievementAtlas_256.dds',	1, 				1),
		('JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS', 	128, 		'JFD_AngloNorse_AchievementAtlas_128.dds',	1, 				1),
		('JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS', 	80, 		'JFD_AngloNorse_AchievementAtlas_80.dds',	1, 				1),
		('JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS', 	64, 		'JFD_AngloNorse_AchievementAtlas_64.dds',	1, 				1),
		('JFD_ANGLO_NORSE_ACHIEVEMENT_ATLAS', 	45, 		'JFD_AngloNorse_AchievementAtlas_45.dds',	1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		128, 		'JFD_AngloNorse_AlphaAtlas_128.dds',		1,				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		80, 		'JFD_AngloNorse_AlphaAtlas_80.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		64, 		'JFD_AngloNorse_AlphaAtlas_64.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		48, 		'JFD_AngloNorse_AlphaAtlas_48.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		45, 		'JFD_AngloNorse_AlphaAtlas_45.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		32, 		'JFD_AngloNorse_AlphaAtlas_32.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		24, 		'JFD_AngloNorse_AlphaAtlas_24.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ALPHA_ATLAS', 		16, 		'JFD_AngloNorse_AlphaAtlas_16.dds',			1, 				1),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			256, 		'JFD_AngloNorse_IconAtlas_256.dds',			2, 				2),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			128, 		'JFD_AngloNorse_IconAtlas_128.dds',			2, 				2),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			80, 		'JFD_AngloNorse_IconAtlas_80.dds',			2, 				2),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			64, 		'JFD_AngloNorse_IconAtlas_64.dds',			2, 				2),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			45, 		'JFD_AngloNorse_IconAtlas_45.dds',			2, 				2),
		('JFD_ANGLO_NORSE_ICON_ATLAS', 			32, 		'JFD_AngloNorse_IconAtlas_32.dds',			2, 				2),
		('JFD_ANGLO_NORSE_PROMOTION_ATLAS',		256, 	    'Tomatekh_PromotionAtlas_256.dds',			2, 				1),
		('JFD_ANGLO_NORSE_PROMOTION_ATLAS',		64, 	    'Tomatekh_PromotionAtlas_64.dds',			2, 				1),
		('JFD_ANGLO_NORSE_PROMOTION_ATLAS',		45, 	    'Tomatekh_PromotionAtlas_45.dds',			2, 				1),
		('JFD_ANGLO_NORSE_PROMOTION_ATLAS',		32, 	    'Tomatekh_PromotionAtlas_32.dds',			2, 				1),
		('JFD_ANGLO_NORSE_UNIT_FLAG_ATLAS',		32, 		'JFD_AngloNorse_UnitFlagAtlas_32.dds',		2, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
