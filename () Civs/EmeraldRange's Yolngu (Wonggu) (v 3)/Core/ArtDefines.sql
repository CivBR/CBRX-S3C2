--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 				IconSize, 		Filename, 			  IconsPerRow, 	IconsPerColumn)
VALUES 	('ER_YOLNGU_ATLAS',			256, 		'YolnguIconAtlas256.dds',		2,				2),
		('ER_YOLNGU_ATLAS',			128, 		'YolnguIconAtlas128.dds',		2,				2),
		('ER_YOLNGU_ATLAS',			80, 		'YolnguIconAtlas80.dds',		2,				2),
		('ER_YOLNGU_ATLAS',			64, 		'YolnguIconAtlas64.dds',		2,				2),
		('ER_YOLNGU_ATLAS',			45, 		'YolnguIconAtlas45.dds',		2,				2),
		('ER_YOLNGU_ATLAS',			32, 		'YolnguIconAtlas32.dds',		2,				2),
		('ER_ALPHA_YOLNGU_ATLAS',   256,		'YolnguAlphaAtlas256.dds',		1,				1),
		('ER_ALPHA_YOLNGU_ATLAS',	64,			'YolnguAlphaAtlas64.dds',		1,				1),
		('ER_ALPHA_YOLNGU_ATLAS',	48,			'YolnguAlphaAtlas48.dds',		1,				1),
		('ER_ALPHA_YOLNGU_ATLAS',	32,			'YolnguAlphaAtlas32.dds',		1,				1),
		('ER_ALPHA_YOLNGU_ATLAS',	24,			'YolnguAlphaAtlas24.dds',		1,				1),
		('ER_LIPPA_FLAG',			32,			'er_lippa_flag.dds',			1,				1);
--==========================================================================================================================	
-- Sound Defines
--==========================================================================================================================	
INSERT INTO Audio_Sounds
		(SoundID,								Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_ER_WONGGU_PEACE',	'YolnguPeace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ER_WONGGU_WAR',		'YolnguWar',	'DynamicResident'),
		('SND_DOM_SPEECH_ER_WONGGU',			'YolnguDom',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID, 								SoundID,							SoundType,	TaperSoundtrackVolume,	MinVolume,	MaxVolume, 	IsMusic,	Looping)
VALUES 	('AS2D_LEADER_MUSIC_ER_WONGGU_PEACE',	'SND_LEADER_MUSIC_ER_WONGGU_PEACE',	'GAME_MUSIC',	-1.0,					  100,	100,		1,			0),
		('AS2D_LEADER_MUSIC_ER_WONGGU_WAR',		'SND_LEADER_MUSIC_ER_WONGGU_WAR',	'GAME_MUSIC',	-1.0,				       85,	85,			1,			0),
		('AS2D_DOM_SPEECH_ER_WONGGU',			'SND_DOM_SPEECH_ER_WONGGU',			'GAME_SPEECH',	-1.0,					  100,	100,		1,			0);
--==========================================================================================================================	
-- Unit Defines
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
VALUES	('ART_DEF_UNIT_ER_LIPPA', 	1,		  	 'TwoBigGuns');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,					NumMembers)
VALUES	('ART_DEF_UNIT_ER_LIPPA',	'ART_DEF_UNIT_MEMBER_ER_LIPPA',		2);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ER_LIPPA'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_LIPPA'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, 1,				 WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_TRIREME');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 										--this is where you add fxsml
		(Type, 								Scale,				ZOffset, Domain, Model,				MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ER_LIPPA'),	0.0750000029802322,	ZOffset, Domain, 'er_lippa.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_TRIREME');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_ER_LIPPA',	'Unit', 	'sv_er_lippa.dds');
