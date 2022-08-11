--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 						 TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_CANHONEIRA',				 'Unit', 	'sv_Canhoneira.dds'),
		('ART_DEF_UNIT_JFD_INDEPENDENCE_DRAGOON',	 'Unit', 	'sv_IndependenceDragoon.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_CANHONEIRA',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_IRONCLAD';	
	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 										DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_INDEPENDENCE_DRAGOON',	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_CANHONEIRA', 		'ART_DEF_UNIT_MEMBER_JFD_CANHONEIRA',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_IRONCLAD';

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,								UnitMemberInfoType,								 NumMembers)
SELECT	'ART_DEF_UNIT_JFD_INDEPENDENCE_DRAGOON', 	'ART_DEF_UNIT_MEMBER_JFD_INDEPENDENCE_DRAGOON',	 NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitMemberInfoType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CANHONEIRA',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_IRONCLAD';

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,								EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_INDEPENDENCE_DRAGOON',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CANHONEIRA',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_IRONCLAD';

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,								"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_INDEPENDENCE_DRAGOON',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_CANHONEIRA',	Scale,	ZOffset, Domain, 'Canhoneira.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_IRONCLAD';	

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_INDEPENDENCE_DRAGOON',	Scale,	ZOffset, Domain, 'IndependenceDragoon.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_CAVALRY';	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_PEACE',	'JFD_BrazilPedroI_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_WAR', 	'JFD_BrazilPedroI_War', 	'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds	
		(ScriptID, 												SoundID, 										SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_AMBIENCE_LEADER_JFD_BRAZIL_PEDRO_I_AMBIENCE',	'SND_AMBIENCE_NAPOLEON_AMBIENCE', 				'GAME_SFX', 	50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_PEACE',			'SND_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_PEACE', 	'GAME_MUSIC', 	45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_WAR', 			'SND_LEADER_MUSIC_JFD_BRAZIL_PEDRO_I_WAR', 		'GAME_MUSIC', 	45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_BRAZIL_PEDRO_I_ICON', 		0.835,	0.6,	0.031,	1),
		('COLOR_PLAYER_JFD_BRAZIL_PEDRO_I_BACKGROUND',	0.039,	0.188,	0.062,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 							SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_JFD_BRAZIL_PEDRO_I',	'COLOR_PLAYER_JFD_BRAZIL_PEDRO_I_ICON',	'COLOR_PLAYER_JFD_BRAZIL_PEDRO_I_BACKGROUND',   'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		128, 		'JFD_BrazilPedroI_AlphaAtlas_128.dds',		1,				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		80, 		'JFD_BrazilPedroI_AlphaAtlas_80.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		64, 		'JFD_BrazilPedroI_AlphaAtlas_64.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		48, 		'JFD_BrazilPedroI_AlphaAtlas_48.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		45, 		'JFD_BrazilPedroI_AlphaAtlas_45.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		32, 		'JFD_BrazilPedroI_AlphaAtlas_32.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		24, 		'JFD_BrazilPedroI_AlphaAtlas_24.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ALPHA_ATLAS', 		16, 		'JFD_BrazilPedroI_AlphaAtlas_16.dds',		1, 				1),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		256, 		'JFD_BrazilPedroI_IconAtlas_256.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		128, 		'JFD_BrazilPedroI_IconAtlas_128.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		80, 		'JFD_BrazilPedroI_IconAtlas_80.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		64, 		'JFD_BrazilPedroI_IconAtlas_64.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		45, 		'JFD_BrazilPedroI_IconAtlas_45.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_ICON_ATLAS', 		32, 		'JFD_BrazilPedroI_IconAtlas_32.dds',		2, 				2),
		('JFD_BRAZIL_PEDRO_I_PROMOTION_ATLAS',	256, 	    'Tomatekh_PromotionAtlas_256.dds',			2, 				1),
		('JFD_BRAZIL_PEDRO_I_PROMOTION_ATLAS',	64, 	    'Tomatekh_PromotionAtlas_64.dds',			2, 				1),
		('JFD_BRAZIL_PEDRO_I_PROMOTION_ATLAS',	45, 	    'Tomatekh_PromotionAtlas_45.dds',			2, 				1),
		('JFD_BRAZIL_PEDRO_I_PROMOTION_ATLAS',	32, 	    'Tomatekh_PromotionAtlas_32.dds',			2, 				1),
		('JFD_BRAZIL_PEDRO_I_UNIT_FLAG_ATLAS',	32, 		'JFD_BrazilPedroI_UnitFlagAtlas_32.dds',	2, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
