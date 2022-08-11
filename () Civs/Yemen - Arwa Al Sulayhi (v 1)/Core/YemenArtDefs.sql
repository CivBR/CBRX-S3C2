--==========================================================================================================================
-- COLORS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 				Green, 					Blue, 				Alpha)
VALUES	('COLOR_PLAYER_URD_YEMEN_ICON', 		round(169.0/255, 3),	round(80.0/255, 3),		round(38.0/255, 3), 1),
		('COLOR_PLAYER_URD_YEMEN_BACKGROUND',	round(184.0/255, 3),	round(171.0/255, 3),	round(162.0/255, 3), 1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 							PrimaryColor, 					SecondaryColor, 						TextColor)
VALUES	('PLAYERCOLOR_URD_YEMEN','COLOR_PLAYER_URD_YEMEN_ICON',   'COLOR_PLAYER_URD_YEMEN_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');	
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
/*INSERT INTO Audio_Sounds 
		(SoundID, 										Filename, 					LoadType)
VALUES	('SND_LEADER_MUSIC_URD_ARWA_PEACE', 		'Urd_Arwa_Peace',		'DynamicResident'),
		('SND_LEADER_MUSIC_URD_ARWA_WAR', 			'Urd_Arwa_War', 		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_URD_ARWA_AMBIENCE', 	'SND_AMBIENCE_COAST_BED', 					'GAME_SFX', 	0.0,					50, 		50, 		0, 		 1),
		('AS2D_LEADER_MUSIC_URD_ARWA_PEACE',		'SND_LEADER_MUSIC_URD_ARWA_PEACE', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_URD_ARWA_WAR', 		'SND_LEADER_MUSIC_URD_ARWA_WAR', 	'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);*/
--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
SELECT	'ART_DEF_UNIT_URD_BAKIL',	TileType, 	'SV_Bakil.dds'
FROM ArtDefine_StrategicView WHERE StrategicViewType = 'ART_DEF_UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_URD_BAKIL',		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_URD_BAKIL', 	'ART_DEF_UNIT_MEMBER_URD_BAKIL',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_URD_BAKIL',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_URD_BAKIL',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,	ZOffset, Domain, Model, 		MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_URD_BAKIL',	Scale,	ZOffset, Domain, Model,			MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_SWORDSMAN';
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================	
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES	('URD_YEMEN_ALPHA_ATLAS', 		64, 		'Yemen_Alpha64.dds',		1, 				1),
		('URD_YEMEN_ALPHA_ATLAS', 		48, 		'Yemen_Alpha48.dds',		1, 				1),
		('URD_YEMEN_ALPHA_ATLAS', 		32, 		'Yemen_Alpha32.dds',		1, 				1),
		('URD_YEMEN_ALPHA_ATLAS', 		24, 		'Yemen_Alpha24.dds',		1, 				1),
		('URD_YEMEN_ICON_ATLAS', 		256, 		'YemenAtlas256.dds',	4, 				2),
		('URD_YEMEN_ICON_ATLAS', 		128, 		'YemenAtlas128.dds',	4, 				2),
		('URD_YEMEN_ICON_ATLAS', 		80, 		'YemenAtlas80.dds',		4, 				2),
		('URD_YEMEN_ICON_ATLAS', 		64, 		'YemenAtlas64.dds',		4, 				2),
		('URD_YEMEN_ICON_ATLAS', 		45, 		'YemenAtlas45.dds',		4, 				2),
		('URD_YEMEN_ICON_ATLAS', 		32, 		'YemenAtlas32.dds',		4, 				2),
		('URD_YEMEN_UNIT_FLAG_ATLAS',	32, 		'Bakir32.dds',			1, 				1);