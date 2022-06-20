--==========================================================================================================================
-- COLORS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Colors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Colors
		(Type,								Red,				Green,				Blue,				Alpha)
VALUES	('COLOR_PLAYER_PB_MORI_ICON',		0.7764705882352941,	0.6549019607843137,	0.7411764705882353,	1),
		('COLOR_PLAYER_PB_MORI_BACKGROUND',	0.5294117647058824,	0.0784313725490196,	0.0784313725490196,	1);
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO PlayerColors
		(Type,					PrimaryColor,					SecondaryColor,						TextColor)
VALUES	('PLAYERCOLOR_PB_MORI',	'COLOR_PLAYER_PB_MORI_ICON',	'COLOR_PLAYER_PB_MORI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ICON ATLASES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases
		(Atlas,					IconSize,	Filename,				IconsPerRow,	IconsPerColumn)
VALUES	('PB_MORI_ICON_ATLAS',	256,		'Mori_Atlas_256.dds',	2,				2),
		('PB_MORI_ICON_ATLAS',	128,		'Mori_Atlas_128.dds',	2,				2),
		('PB_MORI_ICON_ATLAS',	80,			'Mori_Atlas_80.dds',	2,				2),
		('PB_MORI_ICON_ATLAS',	64,			'Mori_Atlas_64.dds',	2,				2),
		('PB_MORI_ICON_ATLAS',	45,			'Mori_Atlas_45.dds',	2,				2),
		('PB_MORI_ICON_ATLAS',	32,			'Mori_Atlas_32.dds',	2,				2),

		('MORI_ALPHA_ATLAS',	128,		'Mori_Alpha128.dds',	1,				1),
		('MORI_ALPHA_ATLAS',	80,			'Mori_Alpha80.dds',		1,				1),
		('MORI_ALPHA_ATLAS',	64,			'Mori_Alpha64.dds',		1,				1),
		('MORI_ALPHA_ATLAS',	48,			'Mori_Alpha48.dds',		1,				1),
		('MORI_ALPHA_ATLAS',	32,			'Mori_Alpha32.dds',		1,				1),
		('MORI_ALPHA_ATLAS',	24,			'Mori_Alpha24.dds',		1,				1),
		('MORI_ALPHA_ATLAS',	16,			'Mori_Alpha16.dds',		1,				1),

		('MORI_MURAKAMI_FLAG',	32,			'flag_murakami.dds',	1,				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_Sounds 
		(SoundID,									Filename,		LoadType)
VALUES	('SND_LEADER_MUSIC_PB_MORI_MOTONARI_PEACE',	'MoriPeace',	'DynamicResident'),
		('SND_LEADER_MUSIC_PB_MORI_MOTONARI_WAR',	'MoriWar',		'DynamicResident');		
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Audio_2DSounds 
		(ScriptID,										SoundID,									SoundType,		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_PB_MORI_MOTONARI_PEACE',	'SND_LEADER_MUSIC_PB_MORI_MOTONARI_PEACE',	'GAME_MUSIC',	-1.0,					80, 		80, 		1, 		 0),
		('AS2D_LEADER_MUSIC_PB_MORI_MOTONARI_WAR',		'SND_LEADER_MUSIC_PB_MORI_MOTONARI_WAR',	'GAME_MUSIC',	-1.0,					80, 		80, 		1,		 0);

--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,		Asset)
VALUES	('ART_DEF_UNIT_PB_MURAKAMI', 		'Unit', 		'murakami_sv.dds');
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_PB_MURAKAMI',			DamageStates, 	'UnFormed'
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,					NumMembers)
SELECT	'ART_DEF_UNIT_PB_MURAKAMI', 		'ART_DEF_UNIT_MEMBER_PB_MURAKAMI',	12
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_POLYNESIAN_WAR_CANOE';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_PB_MURAKAMI',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_MURAKAMI',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE';
--------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,	ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_PB_MURAKAMI',	Scale/2,	ZOffset, Domain, 'kobaya.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE';
--==========================================================================================================================
-- Update Mori Art
--==========================================================================================================================
UPDATE Civilizations SET ArtStyleSuffix = "_MORI_SAMURAI" WHERE Type = 'CIVILIZATION_PB_MORI';
INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	REPLACE("Type", '_ASIA', '_MORI_SAMURAI'), "DamageStates", "Formation"
	FROM "ArtDefine_UnitInfos" WHERE Type LIKE '%_ASIA';
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	REPLACE("UnitInfoType", '_ASIA', '_MORI_SAMURAI'), "UnitMemberInfoType", "NumMembers"
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE UnitInfoType LIKE '%_ASIA';

---------------
-- Longswordsman
---------------
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_LONGSWORDSMAN';

INSERT OR REPLACE INTO "ArtDefine_UnitInfos" ('Type','DamageStates','Formation')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_MORI_SAMURAI"), "DamageStates", "Samurai"
	FROM "ArtDefine_UnitInfos" WHERE (Type = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitInfoMemberInfos" ('UnitInfoType','UnitMemberInfoType','NumMembers')
	SELECT	("ART_DEF_UNIT_LONGSWORDSMAN_MORI_SAMURAI"), ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_MORI_SAMURAI"), 12
	FROM "ArtDefine_UnitInfoMemberInfos" WHERE (UnitInfoType = "ART_DEF_UNIT_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombats" ('UnitMemberType', 'EnableActions', 'DisableActions', 'MoveRadius', 'ShortMoveRadius', 'ChargeRadius', 'AttackRadius', 'RangedAttackRadius', 'MoveRate', 'ShortMoveRate', 'TurnRateMin', 'TurnRateMax', 'TurnFacingRateMin', 'TurnFacingRateMax', 'RollRateMin', 'RollRateMax', 'PitchRateMin', 'PitchRateMax', 'LOSRadiusScale', 'TargetRadius', 'TargetHeight', 'HasShortRangedAttack', 'HasLongRangedAttack', 'HasLeftRightAttack', 'HasStationaryMelee', 'HasStationaryRangedAttack', 'HasRefaceAfterCombat', 'ReformBeforeCombat', 'HasIndependentWeaponFacing', 'HasOpponentTracking', 'HasCollisionAttack', 'AttackAltitude', 'AltitudeDecelerationDistance', 'OnlyTurnInMovementActions', 'RushAttackFormation')
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_MORI_SAMURAI"), "EnableActions", "DisableActions", "MoveRadius", "ShortMoveRadius", "ChargeRadius", "AttackRadius", "RangedAttackRadius", 
			"MoveRate", "ShortMoveRate", "TurnRateMin", "TurnRateMax", "TurnFacingRateMin", "TurnFacingRateMax", "RollRateMin", "RollRateMax", "PitchRateMin", "PitchRateMax", "LOSRadiusScale", "TargetRadius", "TargetHeight", "HasShortRangedAttack", "HasLongRangedAttack", "HasLeftRightAttack", "HasStationaryMelee", "HasStationaryRangedAttack", "HasRefaceAfterCombat", "ReformBeforeCombat", "HasIndependentWeaponFacing", "HasOpponentTracking", "HasCollisionAttack", "AttackAltitude", "AltitudeDecelerationDistance", "OnlyTurnInMovementActions", "RushAttackFormation"
	FROM "ArtDefine_UnitMemberCombats" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberCombatWeapons" ('UnitMemberType', 'Index', 'SubIndex', 'ID', 'VisKillStrengthMin', 'VisKillStrengthMax', 'ProjectileSpeed', 'ProjectileTurnRateMin', 'ProjectileTurnRateMax', 'HitEffect', 'HitEffectScale', 'HitRadius', 'ProjectileChildEffectScale', 'AreaDamageDelay', 'ContinuousFire', 'WaitForEffectCompletion', 'TargetGround', 'IsDropped', 'WeaponTypeTag', 'WeaponTypeSoundOverrideTag')
	SELECT ("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_MORI_SAMURAI"), "Index", "SubIndex", "ID", "VisKillStrengthMin", "VisKillStrengthMax", "ProjectileSpeed", "ProjectileTurnRateMin", "ProjectileTurnRateMax", "HitEffect", "HitEffectScale", "HitRadius", "ProjectileChildEffectScale", "AreaDamageDelay", "ContinuousFire", "WaitForEffectCompletion", "TargetGround", "IsDropped", "WeaponTypeTag", "WeaponTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberCombatWeapons" WHERE (UnitMemberType = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");
INSERT OR REPLACE INTO "ArtDefine_UnitMemberInfos" ("Type", "Scale", "ZOffset", "Domain", "Model", "MaterialTypeTag", "MaterialTypeSoundOverrideTag")
	SELECT	("ART_DEF_UNIT_MEMBER_LONGSWORDSMAN_MORI_SAMURAI"), 0.140000000596046, "ZOffset", "Domain", 
			("Art/u_mori_samurai.fxsxml"), "MaterialTypeTag", "MaterialTypeSoundOverrideTag"
	FROM "ArtDefine_UnitMemberInfos" WHERE (Type = "ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI");