--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_GT_BATYR', 	'Unit', 	'sv_Batyr.dds'),
			('ART_DEF_UNIT_GT_KREZH_MAGI', 	'Unit', 	'sv_Krezh.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GT_BATYR'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_HORSEMAN');

INSERT INTO ArtDefine_UnitInfos
        (Type,                      DamageStates,  Formation)
VALUES  ('ART_DEF_UNIT_GT_KREZH_MAGI', 1,            'EarlyGreatMusician');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GT_BATYR'), 	('ART_DEF_UNIT_MEMBER_GT_BATYR'), 	3
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_HORSEMAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos
        (UnitInfoType,               UnitMemberInfoType,                 NumMembers)
VALUES  ('ART_DEF_UNIT_GT_KREZH_MAGI', 'ART_DEF_UNIT_MEMBER_GT_KREZH_MAGI',    5);
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GT_BATYR'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');

INSERT INTO ArtDefine_UnitMemberCombats
       (UnitMemberType,                    EnableActions,                 HasRefaceAfterCombat)
VALUES ('ART_DEF_UNIT_MEMBER_GT_KREZH_MAGI', 'Idle Death BombardDefend Run', 1);
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_BATYR'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_HORSEMAN');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_BATYR'),	Scale,	ZOffset, Domain, ('Knight_Russia_v2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_HORSEMAN');

INSERT INTO ArtDefine_UnitMemberInfos
(Type,                                    Scale,             Model,                                MaterialTypeTag, MaterialTypeSoundOverrideTag)
VALUES ('ART_DEF_UNIT_MEMBER_GT_KREZH_MAGI', 0.119999997317791, 'u_anishinaabe_medicine_man.fxsxml', 'CLOTH', 'FLESH');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 				LoadType)
VALUES	('SND_LEADER_MUSIC_GT_AZYKAY_PEACE', 	'PermPeace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_GT_AZYKAY_WAR', 	'PermWar', 	'DynamicResident');	
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_AZYKAY_PEACE',	'SND_LEADER_MUSIC_GT_AZYKAY_PEACE',	'GAME_MUSIC', 	60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_AZYKAY_WAR', 	'SND_LEADER_MUSIC_GT_AZYKAY_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,		 0);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_PERM_ICON',				0.878,	0.404,	0.247,	1),
		('COLOR_PLAYER_GT_PERM_BACKGROUND',		0.153,	0.114,	0.051,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 						PrimaryColor, 					SecondaryColor, 					TextColor)
VALUES	('PLAYERCOLOR_GT_PERM',	'COLOR_PLAYER_GT_PERM_ICON', 	'COLOR_PLAYER_GT_PERM_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_PERM_ATLAS', 							256, 		'PermAtlas256.dds',				2, 				2),
		('GT_PERM_ATLAS', 							128, 		'PermAtlas128.dds',				2, 				2),
		('GT_PERM_ATLAS', 							80, 		'PermAtlas80.dds',					2, 				2),
		('GT_PERM_ATLAS', 							64, 		'PermAtlas64.dds',					2, 				2),
		('GT_PERM_ATLAS', 							45, 		'PermAtlas45.dds',					2, 				2),
		('GT_PERM_ATLAS', 							32, 		'PermAtlas32.dds',					2, 				2),
		('GT_PERM_ALPHA_ATLAS', 					128, 		'PermiansAlpha128.dds',			1,				1),
		('GT_PERM_ALPHA_ATLAS', 					80, 		'PermiansAlpha80.dds',				1, 				1),
		('GT_PERM_ALPHA_ATLAS', 					64, 		'PermiansAlpha64.dds',				1, 				1),
		('GT_PERM_ALPHA_ATLAS', 					48, 		'PermiansAlpha48.dds',				1, 				1),
		('GT_PERM_ALPHA_ATLAS', 					45, 		'PermiansAlpha45.dds',				1, 				1),
		('GT_PERM_ALPHA_ATLAS', 					32, 		'PermiansAlpha32.dds',				1, 				1),
		('GT_PERM_ALPHA_ATLAS', 					24, 		'PermiansAlpha24.dds',				1, 				1),
		('GT_BATYR_FLAG_ATLAS', 				32, 		'uu_Batyr_flag.dds',				1, 				1),
		('GT_KREZHI_MAGI_FLAG_ATLAS', 				32, 		'uu_Krezh_flag.dds',				1, 				1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 								Description, 						ShortDescription,						Adjective,									CivilopediaTag,									DefaultPlayerColor,			ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,			SoundtrackTag, 		MapImage,			DawnOfManQuote,						DawnOfManImage)
SELECT	('CIVILIZATION_GT_PERM'), 	('TXT_KEY_CIVILIZATION_GT_PERM'), 	('TXT_KEY_CIVILIZATION_GT_PERM_SHORT'),	('TXT_KEY_CIVILIZATION_GT_PERM_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_GT_PERM'),	('PLAYERCOLOR_GT_PERM'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('GT_PERM_ATLAS'),	('GT_PERM_ALPHA_ATLAS'),	('Russia'), 		('PermMap.dds'),	('TXT_KEY_CIV5_DAWN_GT_PERM_TEXT'),	('Perm_DoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_1'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_2'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_3'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_4'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_5'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_6'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_7'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_8'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_9'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_10'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_11'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_12'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_13'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_14'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_15'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_16'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_17'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_18'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_19'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_20'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_21'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_22'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_23'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_24'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_25'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_26'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_27'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_28'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_29'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_30'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_31'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_32'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_33'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_34'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_35'),
        ('CIVILIZATION_GT_PERM',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_PERM_36');		
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_GT_PERM'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_GT_PERM'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 			UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_PERM'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_RUSSIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GT_PERM',	'LEADER_GT_AZYKAY');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_GT_PERM',	'RELIGION_TENGRIISM');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_GT_PERM', 	'UNITCLASS_KNIGHT',			'UNIT_GT_BATYR'),
		('CIVILIZATION_GT_PERM', 	'UNITCLASS_GREAT_MUSICIAN',		'UNIT_GT_KREZH_MAGI');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_0'),	
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_1'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_2'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_3'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_4'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_5'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_6'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_7'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_8'),
		('CIVILIZATION_GT_PERM', 	'TXT_KEY_SPY_NAME_GT_PERM_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_GT_PERM',	'REGION_TUNDRA'),
		('CIVILIZATION_GT_PERM',	'REGION_FOREST');
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType,					StartAlongOcean)
VALUES	('CIVILIZATION_GT_PERM',	0);
--------------------------------	
-- Civilization_Start_Along_River
--------------------------------	
INSERT INTO Civilization_Start_Along_River
		(CivilizationType,					StartAlongRiver)
VALUES	('CIVILIZATION_GT_PERM',	1);
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 					RegionType)
VALUES	('CIVILIZATION_GT_PERM',	'REGION_JUNGLE');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 		DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_GT_AZYKAY', 	'TXT_KEY_LEADER_GT_AZYKAY', 	'TXT_KEY_LEADER_GT_AZYKAY_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_AZYKAY',	'PermDiplo.xml',	5, 						3, 						12, 							10, 			2, 				2, 				4, 					5, 				3, 			0, 			9, 				3, 			7, 			'GT_PERM_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_WAR', 			11),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	10),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_GT_AZYKAY', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 			Bias)
VALUES	('LEADER_GT_AZYKAY', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_AZYKAY', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_GT_AZYKAY', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_GT_AZYKAY', 		'MINOR_CIV_APPROACH_CONQUEST', 		9),
		('LEADER_GT_AZYKAY', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GT_AZYKAY', 		'FLAVOR_OFFENSE', 					11),
		('LEADER_GT_AZYKAY', 		'FLAVOR_DEFENSE', 					6),
		('LEADER_GT_AZYKAY', 		'FLAVOR_CITY_DEFENSE', 				8),
		('LEADER_GT_AZYKAY', 		'FLAVOR_MILITARY_TRAINING', 		6),
		('LEADER_GT_AZYKAY', 		'FLAVOR_RECON', 					8),
		('LEADER_GT_AZYKAY', 		'FLAVOR_RANGED', 					5),
		('LEADER_GT_AZYKAY', 		'FLAVOR_MOBILE', 					7),
		('LEADER_GT_AZYKAY', 		'FLAVOR_NAVAL', 					3),
		('LEADER_GT_AZYKAY', 		'FLAVOR_NAVAL_RECON', 				5),
		('LEADER_GT_AZYKAY', 		'FLAVOR_NAVAL_GROWTH', 				2),
		('LEADER_GT_AZYKAY', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	2),
		('LEADER_GT_AZYKAY', 		'FLAVOR_AIR', 						6),
		('LEADER_GT_AZYKAY', 		'FLAVOR_EXPANSION', 				9),
		('LEADER_GT_AZYKAY', 		'FLAVOR_GROWTH', 					6),
		('LEADER_GT_AZYKAY', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_PRODUCTION', 				5),
		('LEADER_GT_AZYKAY', 		'FLAVOR_GOLD', 						7),
		('LEADER_GT_AZYKAY', 		'FLAVOR_SCIENCE', 					4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_CULTURE', 					8),
		('LEADER_GT_AZYKAY', 		'FLAVOR_HAPPINESS', 				1),
		('LEADER_GT_AZYKAY', 		'FLAVOR_GREAT_PEOPLE', 				3),
		('LEADER_GT_AZYKAY', 		'FLAVOR_WONDER', 					2),
		('LEADER_GT_AZYKAY', 		'FLAVOR_RELIGION', 					2),
		('LEADER_GT_AZYKAY', 		'FLAVOR_DIPLOMACY', 				1),
		('LEADER_GT_AZYKAY', 		'FLAVOR_SPACESHIP', 				12),
		('LEADER_GT_AZYKAY', 		'FLAVOR_WATER_CONNECTION', 			12),
		('LEADER_GT_AZYKAY', 		'FLAVOR_NUKE', 						4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_USE_NUKE', 					1),
		('LEADER_GT_AZYKAY', 		'FLAVOR_ESPIONAGE', 				2),
		('LEADER_GT_AZYKAY', 		'FLAVOR_AIRLIFT', 					3),
		('LEADER_GT_AZYKAY', 		'FLAVOR_I_TRADE_DESTINATION', 		9),
		('LEADER_GT_AZYKAY', 		'FLAVOR_I_TRADE_ORIGIN', 			4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
		('LEADER_GT_AZYKAY', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		9),
		('LEADER_GT_AZYKAY', 		'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_GT_AZYKAY', 		'FLAVOR_AIR_CARRIER', 				4);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 					TraitType)
VALUES	('LEADER_GT_AZYKAY', 		'TRAIT_GT_PERM');
--==========================================================================================================================    
-- DIPLOMACY
--==========================================================================================================================    
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
        (LeaderType,                 ResponseType,                              Response,                                                     	Bias)
VALUES  ('LEADER_GT_AZYKAY',     'RESPONSE_AI_DOF_BACKSTAB',                'TXT_KEY_LEADER_GT_AZYKAY_DENOUNCE_FRIEND%',                500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_ATTACKED_HOSTILE',               'TXT_KEY_LEADER_GT_AZYKAY_ATTACKED_HOSTILE%',               500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_DEFEATED',                       'TXT_KEY_LEADER_GT_AZYKAY_DEFEATED%',                       500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_DOW_GENERIC',                    'TXT_KEY_LEADER_GT_AZYKAY_DOW_GENERIC%',                    500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_FIRST_GREETING',                 'TXT_KEY_LEADER_GT_AZYKAY_FIRSTGREETING%',                  500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',    'TXT_KEY_LEADER_GT_AZYKAY_RESPONSE_TO_BEING_DENOUNCED%',    500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_WORK_AGAINST_SOMEONE',           'TXT_KEY_LEADER_GT_AZYKAY_DENOUNCE%',                       500),
        ('LEADER_GT_AZYKAY',     'RESPONSE_WORK_WITH_US',                   'TXT_KEY_LEADER_GT_AZYKAY_DEC_FRIENDSHIP%',                 500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 				Description, 				ShortDescription)
VALUES	('TRAIT_GT_PERM', 	'TXT_KEY_TRAIT_GT_PERM',	'TXT_KEY_TRAIT_GT_PERM_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 										Description, 									Help, 													Sound, 					CannotBeChosen, MovesChange, 	LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_CAPTURED_RELIGIOUS', 					'TXT_KEY_PROMOTION_GT_CAPTURED_RELIGIOUS',					'TXT_KEY_PROMOTION_GT_CAPTURED_RELIGIOUS_HELP',					'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_CAPTURED_RELIGIOUS'),
		('PROMOTION_GT_BATYR', 					'TXT_KEY_PROMOTION_GT_BATYR',					'TXT_KEY_PROMOTION_GT_BATYR_HELP',					'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_BATYR');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class, PrereqTech, Combat, 	Cost, 	FaithCost, 		RequiresFaithPurchaseEnabled, 	Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	UnitArtInfo, 				UnitFlagAtlas, 			UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT	'UNIT_GT_BATYR',	Class, PrereqTech, 	Combat, 		Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_GT_BATYR',	'TXT_KEY_GT_BATYR_TEXT',	'TXT_KEY_GT_BATYR_STRATEGY',	'TXT_KEY_GT_BATYR_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,'ART_DEF_UNIT_GT_BATYR',	'GT_BATYR_FLAG_ATLAS', 	0,					2, 				'GT_PERM_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');

INSERT INTO Units 	
		(Type, 					Class, PrereqTech,	Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves,  CombatClass, Domain, DefaultUnitAI,	Description, 				Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, DontShowYields, OneShotTourism, OneShotTourismPercentOthers, UnitArtInfoEraVariation,	UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,				PortraitIndex, 	IconAtlas,				MoveRate)
SELECT	'UNIT_GT_KREZH_MAGI',	Class, PrereqTech,	Special, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, CivilianAttackPriority, Moves, CombatClass, Domain, DefaultUnitAI,	'TXT_KEY_UNIT_GT_KREZH_MAGI',	'TXT_KEY_CIV5_GT_KREZH_MAGI_TEXT', 	'TXT_KEY_UNIT_GT_KREZH_MAGI_STRATEGY', 	'TXT_KEY_UNIT_GT_KREZH_MAGI_HELP', 	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, ObsoleteTech, XPValueDefense, OneShotTourism, OneShotTourismPercentOthers, DontShowYields, 0,							'ART_DEF_UNIT_GT_KREZH_MAGI',		0,					'GT_KREZH_MAGI_FLAG_ATLAS',	3, 				'GT_PERM_ATLAS',	MoveRate
FROM Units WHERE Type = 'UNIT_MUSICIAN';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_BATYR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_KREZH_MAGI', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_MUSICIAN';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GT_BATYR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	'UNIT_GT_KREZH_MAGI', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_MUSICIAN';
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType)
SELECT	'UNIT_GT_BATYR',		ResourceType
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	'UNIT_GT_BATYR', 	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_GT_KREZH_MAGI', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_MUSICIAN';

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType, Flavor)
SELECT	'UNIT_GT_BATYR', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_KREZH_MAGI', 			PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_MUSICIAN';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_BATYR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_HORSEMAN';
--------------------------------
-- Unit_GreatWorks
--------------------------------
INSERT INTO GreatWorks
        (Type, GreatWorkClassType, Description, Audio, Image)
VALUES  ('GREAT_WORK_KOMI_FOLK_1', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_1', 'AS2D_GREAT_WORK_KOMI_FOLK_1', 'MagiBackground.dds'),
		('GREAT_WORK_KOMI_FOLK_2', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_2', 'AS2D_GREAT_WORK_KOMI_FOLK_2', 'MagiBackground2.dds'),
		('GREAT_WORK_KOMI_FOLK_3', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_3', 'AS2D_GREAT_WORK_KOMI_FOLK_3', 'MagiBackground3.dds'),
		('GREAT_WORK_KOMI_FOLK_4', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_4', 'AS2D_GREAT_WORK_KOMI_FOLK_4', 'MagiBackground4.dds'),
		('GREAT_WORK_KOMI_FOLK_5', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_5', 'AS2D_GREAT_WORK_KOMI_FOLK_5', 'MagiBackground.dds'),
		('GREAT_WORK_KOMI_FOLK_6', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_6', 'AS2D_GREAT_WORK_KOMI_FOLK_6', 'MagiBackground2.dds'),
		('GREAT_WORK_KOMI_FOLK_7', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_7', 'AS2D_GREAT_WORK_KOMI_FOLK_7', 'MagiBackground3.dds'),
		('GREAT_WORK_KOMI_FOLK_8', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_8', 'AS2D_GREAT_WORK_KOMI_FOLK_8', 'MagiBackground4.dds'),
		('GREAT_WORK_KOMI_FOLK_9', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_9', 'AS2D_GREAT_WORK_KOMI_FOLK_9', 'MagiBackground.dds'),
		('GREAT_WORK_KOMI_FOLK_10', 'GREAT_WORK_MUSIC', 'TXT_KEY_GREAT_WORK_KOMI_FOLK_10', 'AS2D_GREAT_WORK_KOMI_FOLK_10', 'MagiBackground2.dds');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames
        (UnitType,			UniqueName,				GreatWorkType)
VALUES  ('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_1', 'GREAT_WORK_KOMI_FOLK_1'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_2', 'GREAT_WORK_KOMI_FOLK_2'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_3', 'GREAT_WORK_KOMI_FOLK_3'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_4', 'GREAT_WORK_KOMI_FOLK_4'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_5', 'GREAT_WORK_KOMI_FOLK_5'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_6', 'GREAT_WORK_KOMI_FOLK_6'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_7', 'GREAT_WORK_KOMI_FOLK_7'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_8', 'GREAT_WORK_KOMI_FOLK_8'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_9', 'GREAT_WORK_KOMI_FOLK_9'),
		('UNIT_GT_KREZH_MAGI', 'TXT_KEY_GT_KREZH_MAGI_10', 'GREAT_WORK_KOMI_FOLK_10');
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GT_BATYR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_GT_PERM', 	'BUILDING_GT_PERM', 	'TXT_KEY_BUILDING_GT_PERM_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings		
		(Type, 									BuildingClass, 			  				BorderObstacle,		Cost, 	FaithCost,	GreatWorkCount,	Defense, 	Description, 								Help,											NeverCapture)
VALUES	('BUILDING_GT_PERM', 				'BUILDINGCLASS_GT_PERM', 			0,					-1, 	-1,			-1,				0,			'TXT_KEY_BUILDING_GT_PERM', 			'TXT_KEY_BUILDING_GT_PERM_HELP',			1);--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
-- Flavors
--------------------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'),
		('FLAVOR_JFD_MERCENARY'),
		('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION'),
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_SLAVERY'),
		('FLAVOR_JFD_STATE_RELIGION');
--------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,							Flavor)
VALUES	('LEADER_GT_AZYKAY',	'FLAVOR_JFD_DECOLONIZATION',			0),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_MERCENARY',					9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		10),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_GOVERNMENT',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_LEGAL',				9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_CULTURE',			9),		
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_ECONOMIC',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_FOREIGN',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_INDUSTRY',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_MILITARY',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_REFORM_RELIGION',			9),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_SLAVERY',					2),
		('LEADER_GT_AZYKAY',	'FLAVOR_JFD_STATE_RELIGION',			9);
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
--Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_SAMANISM' )
		THEN 'RELIGION_SAMANISM'
		ELSE 'RELIGION_TENGRIISM' END
	) WHERE CivilizationType = 'CIVILIZATION_GT_PERM';

CREATE TRIGGER ReligionTestTrigger_Haush
AFTER INSERT ON Religions WHEN 'RELIGION_SAMANISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_SAMANISM'
	WHERE CivilizationType IN ('CIVILIZATION_GT_PERM');
END;
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,			     Weight)
VALUES  ('CIVILIZATION_GT_PERM',	'GOVERNMENT_JFD_MONARCHY',	 60);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,  		AltY,  	AltCapitalName)
VALUES	('CIVILIZATION_GT_PERM',	'EuroLargeNew',			81,		67, 	null,	null,	null),
		('CIVILIZATION_GT_PERM',	'EuroLarge',			75,		64,     null,	null,	null),
		('CIVILIZATION_GT_PERM',	'EuroGiant',			142,	103,	null,	null,	null),
		('CIVILIZATION_GT_PERM',	'EarthMk3',				48,		80,		null,	null,	null),
		('CIVILIZATION_GT_PERM',	'GreatestEarth',		78,		63,		null,	null,	null),							
		('CIVILIZATION_GT_PERM',	'RussiaLarge',			29,		27,		null,	null,	null),
		('CIVILIZATION_GT_PERM',	'Cordiform',			46,		42,		null,	null,	null),
		('CIVILIZATION_GT_PERM',	'Yagem',				80,		69,		null,	null,	null),
		('CIVILIZATION_GT_PERM',	'Yahem',				80,		67,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_PERM',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_RUSSIA';
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_CultureTypes(
	CivilizationType 					text 		REFERENCES Civilizations(Type) 		default null,
	CultureType 						text											default null,
	SubCultureType 						text											default null,
	ArtDefineTag						text											default	null,
	DecisionsTag						text											default	null,
	DefeatScreenEarlyTag				text											default	null,
	DefeatScreenMidTag					text											default	null,
	DefeatScreenLateTag					text											default	null,
	IdealsTag							text											default	null,
	SplashScreenTag						text											default	null,
	SoundtrackTag						text											default	null,
	UnitDialogueTag						text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_GT_PERM',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_RUSSIA';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Northern'
WHERE Type = 'CIVILIZATION_GT_PERM'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Northern')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
-- TROLLER Additional ACHIEVEMENTS
--==========================================================================================================================
-- Achievopedia_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Achievopedia_Tabs (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Header					text							default null,
	Description				text							default	null);

INSERT OR REPLACE INTO Achievopedia_Tabs
		(Type,				Header,								Description)
VALUES	('TAB_AA_GT',	'TXT_KEY_TAB_AA_GT_HEADER',		'TXT_KEY_TAB_AA_GT_DESC');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Mods
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Mods (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	ModName					text							default null,
	ModID					text							default	null,	
	Authors					text							default	null);

INSERT INTO AdditionalAchievements_Mods
		(Type,						ModName,								ModID,									Authors)
VALUES	('MOD_GT_PERM',	'TXT_KEY_MOD_GT_PERM_NAME',	'TXT_KEY_MOD_GT_PERM_MODID',	'TXT_KEY_MOD_GT_PERM_AUTHORS');
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements (
	ID  					integer 		PRIMARY KEY		AUTOINCREMENT,
	Type					text							default	null,
	Achievopedia			text							default null,
	Header					text							default	null,	
	IconAtlas				text						default	null,	
	PortraitIndex			integer							default	0,
	ModType					text							default	null,	
	ModVersion				integer							default	0,
	Unlocked				boolean							default	0,
	LockedIconAtlas			text					default	'CIV_COLOR_ATLAS',
	LockedPortraitIndex		integer							default	23,
	UnlockSound				text							default	'AS2D_INTERFACE_ANCIENT_RUINS',
	PopupDuration			integer							default	-1,
	Hidden					boolean							default	0,
	HiddenBorder			boolean							default	0,
	RequiredCivWin			text							default	null,
	RequiredCivLoss			text							default	null,
	RequiredCivKill			text							default	null);

INSERT INTO AdditionalAchievements
		(Type,							Header,											Achievopedia,								ModType,				ModVersion,		RequiredCivWin,						IconAtlas,					PortraitIndex)
VALUES	('AA_GT_PERM_SPECIAL',	'TXT_KEY_AA_GT_PERM_SPECIAL_HEADER',	'TXT_KEY_AA_GT_PERM_SPECIAL_TEXT',	'MOD_GT_PERM',	1,				null,								'GT_PERM_ATLAS',	 0),
		('AA_GT_PERM_VICTORY',	'TXT_KEY_AA_GT_PERM_VICTORY_HEADER',	'TXT_KEY_AA_GT_PERM_VICTORY_TEXT',	'MOD_GT_PERM',	1,				'CIVILIZATION_GT_PERM',	'GT_PERM_ATLAS',	 0);
--------------------------------------------------------------------------------------------------------------------------
-- AdditionalAchievements_Tabs
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	AdditionalAchievements_Tabs (
	AchievementType			text		default	null,
	TabType					text		default	null);

INSERT OR REPLACE INTO AdditionalAchievements_Tabs
		(AchievementType,				TabType)
VALUES	('AA_GT_PERM_SPECIAL',	'TAB_AA_GT'),
		('AA_GT_PERM_VICTORY',	'TAB_AA_GT');
--==========================================================================================================================	
--==========================================================================================================================