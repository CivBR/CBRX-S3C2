--==========================================================================================================================	
-- COLOR
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors (Type,						Red,  Green, Blue,  Alpha)
VALUES ('COLOR_PLAYER_ER_BENGAL_BACKGROUND',	0.95294, 0.79216, 0.56863, 1.0), --Background is the main colour
	   ('COLOR_PLAYER_ER_BENGAL_ICON',		0.11765, 0.29020, 0.13333, 1.0); --Icon is the colour of the borders and the image in the middle of your icon.

INSERT INTO PlayerColors (Type,			PrimaryColor,					SecondaryColor,							TextColor)
VALUES ('PLAYERCOLOR_ERJAR_BENGAL', 	'COLOR_PLAYER_ER_BENGAL_ICON',	'COLOR_PLAYER_ER_BENGAL_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================	
-- Atlas Defines
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 					IconSize, 		Filename, 				IconsPerRow, 	IconsPerColumn)
VALUES 	('ERJAR_BENGAL_ALPHA_ATLAS', 	128, 		'BengalIconAtlas128.dds',		1,				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	80, 		'BengalIconAtlas80.dds',		1, 				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	64, 		'BengalIconAtlas64.dds',		1, 				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	48, 		'BengalIconAtlas48.dds',		1, 				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	45, 		'BengalIconAtlas45.dds',		1, 				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	32, 		'BengalIconAtlas32.dds',		1, 				2),
		('ERJAR_BENGAL_ALPHA_ATLAS', 	24, 		'BengalIconAtlas24.dds',		1, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	256, 		'BengalIconAtlas256.dds',		4, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	128, 		'BengalIconAtlas128.dds',		4, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	80, 		'BengalIconAtlas80.dds',		4, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	64, 		'BengalIconAtlas64.dds',		4, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	45, 		'BengalIconAtlas45.dds',		4, 				2),
		('ERJAR_BENGAL_ICON_ATLAS', 	32, 		'BengalIconAtlas32.dds',		4, 				2),
		('ERJAR_UNIT_FLAG_PAIK',		32,			'unitflag_er_paik.dds',			1,				1);
--==========================================================================================================================	
-- Sound Defines
--==========================================================================================================================	
INSERT INTO Audio_Sounds
		(SoundID,									Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_ERJAR_BENGAL_PEACE',		'Bengal_peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_ERJAR_BENGAL_WAR',		'Bengal_war',	'DynamicResident'),
		('SND_DOM_SPEECH_BENGAL',					'Bengal_DoM',	'DynamicResident');

INSERT INTO Audio_2DSounds
		(ScriptID, 									SoundID,								SoundType,	TaperSoundtrackVolume,	MinVolume,	MaxVolume, 	IsMusic,	Looping)
VALUES 	('AS2D_LEADER_MUSIC_ERJAR_BENGAL_PEACE',	'SND_LEADER_MUSIC_ERJAR_BENGAL_PEACE',	'GAME_MUSIC',	-1.0,					80,			80,		1,			0),
		('AS2D_LEADER_MUSIC_ERJAR_BENGAL_WAR',		'SND_LEADER_MUSIC_ERJAR_BENGAL_WAR',	'GAME_MUSIC',	-1.0,					90,			90,		1,			0),
		('AS2D_DOM_SPEECH_ERJAR_BENGAL',			'SND_DOM_SPEECH_BENGAL',				'GAME_SPEECH',	-1.0,					110,		110,	1,			0);
--==========================================================================================================================	
-- Unit Defines
--==========================================================================================================================
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_ERJAR_PAIK'),	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CROSSBOWMAN');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_ERJAR_PAIK'),	('ART_DEF_UNIT_MEMBER_ERJAR_PAIK'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CROSSBOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_ERJAR_PAIK'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ERJAR_PAIK'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	 --this is where you add fxsml
		(Type, 								Scale,  ZOffset, Domain, Model,					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_ERJAR_PAIK'),	Scale,	ZOffset, Domain, 'erjar_paik.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
-- Strat View not reloaded yet
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_ERJAR_PAIK',		'Unit', 	'SV_er_paik.dds');
