--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView
		(StrategicViewType,				TileType,	Asset)
VALUES	('ART_DEF_UNIT_DJ_KATIPUNERO', 'Unit',		'KatipuneroSV.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 							DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_DJ_KATIPUNERO'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_DJ_KATIPUNERO'),	('ART_DEF_UNIT_MEMBER_DJ_KATIPUNERO'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_DJ_KATIPUNERO'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_DJ_KATIPUNERO'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_DJ_KATIPUNERO'),	Scale,	ZOffset, Domain, ('u_katipunero.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 									IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	256, 		'AguinaldoColorAtlas256.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	128, 		'AguinaldoColorAtlas128.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	80, 		'AguinaldoColorAtlas80.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	64, 		'AguinaldoColorAtlas64.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	45, 		'AguinaldoColorAtlas45.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_COLOR_ATLAS', 	32, 		'AguinaldoColorAtlas32.dds',	2, 				2),
			('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS', 	128, 		'AguinaldoAlphaAtlas128.dds',	1, 				1),
			('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS', 	64, 		'AguinaldoAlphaAtlas64.dds',	1, 				1),
			('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS', 	48, 		'AguinaldoAlphaAtlas48.dds',	1, 				1),
			('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS', 	32, 		'AguinaldoAlphaAtlas32.dds',	1, 				1),
			('DJ_PHILIPPINES_AGUINALDO_ALPHA_ATLAS', 	24, 		'AguinaldoAlphaAtlas24.dds',	1, 				1),
			('UNIT_FLAG_DJ_KATIPUNERO_ATLAS', 			32, 		'KatipuneroAlphaAtlas32.dds',	1, 				1);