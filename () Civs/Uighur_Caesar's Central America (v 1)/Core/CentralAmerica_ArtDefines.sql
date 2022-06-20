--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES	('UC_CENTRAL_AMERICA_ATLAS', 						256, 		'CentroamericaAtlas256.dds',				2, 				2),
		('UC_CENTRAL_AMERICA_ATLAS', 						128, 		'CentroamericaAtlas128.dds',				2, 				2),
		('UC_CENTRAL_AMERICA_ATLAS', 						80, 		'CentroamericaAtlas80.dds',				 2, 				2),
		('UC_CENTRAL_AMERICA_ATLAS', 						64, 		'CentroamericaAtlas64.dds',				2, 				2),
		('UC_CENTRAL_AMERICA_ATLAS', 						45, 		'CentroamericaAtlas45.dds',					2, 				2),
		('UC_CENTRAL_AMERICA_ATLAS', 						32, 		'CentroamericaAtlas32.dds',					2, 				2),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				128, 		'CentroamericaAlpha128.dds',			1,				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				80, 		'CentroamericaAlpha80.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				64, 		'CentroamericaAlpha64.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				48, 		'CentroamericaAlpha48.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				45, 		'CentroamericaAlpha45.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				32, 		'CentroamericaAlpha32.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				24, 		'CentroamericaAlpha24.dds',			1, 				1),
		('UC_CENTRAL_AMERICA_ALPHA_ATLAS', 				16, 		'CentroamericaAlpha16.dds',			1, 				1),
		('UC_UNIT_FLAG_EAP_ATLAS',	32, 		'CentroamericaUnit32.dds',			1, 				1);
--==========================================================================================================================	
--==========================================================================================================================	
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 				TileType,	Asset)
			('ART_DEF_UNIT_UC_EAP', 		'Unit', 	'CentroamericaUnitSV.dds');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_UC_EAP', 		'ART_DEF_UNIT_MEMBER_UC_EAP',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MUSKETMAN';
------------------------
-- ArtDefine_UnitMemberCombats
------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_UC_EAP',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_UC_EAP',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
------------------------
-- ArtDefine_UnitMemberInfos
------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_UC_EAP',	Scale,	ZOffset, Domain, 'civ5_fremm3.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_MUSKETMAN';
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
--INSERT INTO Audio_Sounds 
--	(SoundID, 								Filename, 							LoadType)
--VALUES		('SND_LEADER_MUSIC_UC_Centroamerica_PEACE', 	'CentroamericaPeace', 						'DynamicResident'),
--		('SND_LEADER_MUSIC_UC_Centroamerica_WAR', 		'CentroamericaWar', 						'DynamicResident');			
