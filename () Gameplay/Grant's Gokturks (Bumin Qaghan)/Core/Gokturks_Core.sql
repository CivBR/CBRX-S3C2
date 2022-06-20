--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 		TileType,	Asset)
VALUES		('ART_DEF_UNIT_GT_TOYGUNLAR', 	'Unit', 	'sv_Toygunlar.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 								DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GT_TOYGUNLAR'), 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,						UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GT_TOYGUNLAR'), 	('ART_DEF_UNIT_MEMBER_GT_TOYGUNLAR'), 	2
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOYGUNLAR'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOYGUNLAR'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT');
----------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 									Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GT_TOYGUNLAR'),	Scale,	ZOffset, Domain, ('Knight_Russia_v2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_KNIGHT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_GT_BUMIN_QAGHAN_PEACE', 		'GokturkPeace',				'DynamicResident'),
		('SND_LEADER_MUSIC_GT_BUMIN_QAGHAN_WAR', 		'GokturkWar', 				'DynamicResident');
--------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 										SoundID, 								SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_GT_BUMIN_QAGHAN_PEACE', 			'SND_LEADER_MUSIC_GT_BUMIN_QAGHAN_PEACE',	'GAME_MUSIC', 	-1.0,					45, 		45, 		1, 		 0),
		('AS2D_LEADER_MUSIC_GT_BUMIN_QAGHAN_WAR', 				'SND_LEADER_MUSIC_GT_BUMIN_QAGHAN_WAR', 		'GAME_MUSIC', 	-1.0,					45, 		45, 		1,		 0);
--==========================================================================================================================
-- COLOURS
--==========================================================================================================================	
-- Colors
--------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 										Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_GT_GOKTURKS_ICON', 			0.710,	0.769,	0.416,	1),													
		('COLOR_PLAYER_GT_GOKTURKS_BACKGROUND',	0.110,	0.286,	0.471,	1);		
--------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
--------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 								PrimaryColor, 								SecondaryColor, 								TextColor)
VALUES	('PLAYERCOLOR_GT_GOKTURKS',		'COLOR_PLAYER_GT_GOKTURKS_ICON', 		'COLOR_PLAYER_GT_GOKTURKS_BACKGROUND',		'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- Icon Atlases
--==========================================================================================================================	
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('GT_GOKTURKS_ATLAS', 						256, 		'Gokturks_Atlas256.dds',			2, 				2),
		('GT_GOKTURKS_ATLAS', 						128, 		'Gokturks_Atlas128.dds',			2, 				2),
		('GT_GOKTURKS_ATLAS', 						80, 		'Gokturks_Atlas80.dds',				2, 				2),
		('GT_GOKTURKS_ATLAS', 						64, 		'Gokturks_Atlas64.dds',				2, 				2),
		('GT_GOKTURKS_ATLAS', 						45, 		'Gokturks_Atlas45.dds',				2, 				2),
		('GT_GOKTURKS_ATLAS', 						32, 		'Gokturks_Atlas32.dds',				2, 				2),
		('GT_GOKTURKS_ATLAS', 						24, 		'Gokturks_Atlas24.dds',				2, 				2),
		('GT_GOKTURKS_ALPHA_ATLAS', 				128, 		'GokturkAlpha128.dds',		1,				1),
		('GT_GOKTURKS_ALPHA_ATLAS', 				80, 		'GokturkAlpha80.dds',			1, 				1),
		('GT_GOKTURKS_ALPHA_ATLAS', 				64, 		'GokturkAlpha64.dds',			1, 				1),
		('GT_GOKTURKS_ALPHA_ATLAS', 				48, 		'GokturkAlpha48.dds',			1, 				1),
		('GT_GOKTURKS_ALPHA_ATLAS', 				32, 		'GokturkAlpha32.dds',			1, 				1),
		('GT_GOKTURKS_ALPHA_ATLAS', 				24, 		'GokturkAlpha24.dds',			1, 				1),
		('GT_TOYGUNLAR_FLAG_ATLAS',						32,			'uu_Toygunlar_flag.dds',			1,				1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag, 	MapImage,				DawnOfManQuote,							DawnOfManImage)
SELECT	('CIVILIZATION_GT_GOKTURKS'), 	('TXT_KEY_CIVILIZATION_GT_GOKTURKS'), 	('TXT_KEY_CIVILIZATION_GT_GOKTURKS_SHORT'),	('TXT_KEY_CIVILIZATION_GT_GOKTURKS_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_GT_GOKTURKS'),	('PLAYERCOLOR_GT_GOKTURKS'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('GT_GOKTURKS_ATLAS'),	('GT_GOKTURKS_ALPHA_ATLAS'),	('Mongol'), 		('GokturkMap.dds'),	('TXT_KEY_CIV5_DAWN_GT_GOKTURKS_TEXT'),	('Gokturk_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_1'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_2'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_3'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_4'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_5'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_6'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_7'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_8'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_9'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_10'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_11'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_12'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_13'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_14'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_15'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_16'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_17'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_18'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_19'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_20'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_21'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_22'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_23'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_24'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_25'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_26'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_27'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_28'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_29'),
        ('CIVILIZATION_GT_GOKTURKS',   'TXT_KEY_CITY_NAME_CIVILIZATION_GT_GOKTURKS_30');		
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 					BuildingClassType)
SELECT	('CIVILIZATION_GT_GOKTURKS'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 					TechType)
SELECT	('CIVILIZATION_GT_GOKTURKS'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_GT_GOKTURKS'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_MONGOL');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_GT_GOKTURKS',	'LEADER_GT_BUMIN_QAGHAN');
--------------------------------	
-- Civilization_Religions
--------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_GT_GOKTURKS',	'RELIGION_TENGRIISM');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_GT_GOKTURKS', 	'BUILDINGCLASS_FORGE',			'BUILDING_GT_VASSAL_FORGE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_GT_GOKTURKS', 	'UNITCLASS_KNIGHT',			'UNIT_GT_TOYGUNLAR');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_0'),	
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_1'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_2'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_3'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_4'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_5'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_6'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_7'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_8'),
		('CIVILIZATION_GT_GOKTURKS', 	'TXT_KEY_SPY_NAME_GT_GOKTURKS_9');
--------------------------------	
-- Civilization_Start_Region_Priority
--------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_GOKTURKS',	'REGION_PLAINS'),
		('CIVILIZATION_GT_GOKTURKS',	'REGION_HILLS');
--------------------------------	
-- Civilization_Start_Region_Avoid
--------------------------------	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType, 				RegionType)
VALUES	('CIVILIZATION_GT_GOKTURKS',	'REGION_JUNGLE');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 					Description, 					Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 								VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_GT_BUMIN_QAGHAN', 	'TXT_KEY_LEADER_GT_BUMIN_QAGHAN', 	'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_GT_BUMIN_QAGHAN',	'Gokturk_Diplo.xml',	8, 						1, 						8, 							7, 			7, 				5, 				5, 						6, 				3, 			1, 			5, 				6, 			6, 			'GT_GOKTURKS_ATLAS',		1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_WAR', 			10),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	9),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_GUARDED', 		6),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
		('LEADER_GT_BUMIN_QAGHAN', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		2);
--------------------------------	
-- Leader_MinorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_GT_BUMIN_QAGHAN', 		'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_GT_BUMIN_QAGHAN', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_GT_BUMIN_QAGHAN', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
		('LEADER_GT_BUMIN_QAGHAN', 		'MINOR_CIV_APPROACH_CONQUEST', 		10),
		('LEADER_GT_BUMIN_QAGHAN', 		'MINOR_CIV_APPROACH_BULLY', 		6);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_OFFENSE', 					9),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_DEFENSE', 					3),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_RECON', 					8),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_RANGED', 					6),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_MOBILE', 					10),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_NAVAL', 					3),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_AIR', 						9),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_EXPANSION', 				10),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_GROWTH', 					5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_TILE_IMPROVEMENT', 			6),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_PRODUCTION', 				7),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_GOLD', 						7),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_SCIENCE', 					3),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_CULTURE', 					5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_HAPPINESS', 				6),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_WONDER', 					1),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_RELIGION', 					3),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_DIPLOMACY', 				6),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_SPACESHIP', 				5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_NUKE', 						7),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_USE_NUKE', 					10),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_ESPIONAGE', 				10),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_AIRLIFT', 					8),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		1),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_ARCHAEOLOGY', 				4),
		('LEADER_GT_BUMIN_QAGHAN', 		'FLAVOR_AIR_CARRIER', 				3);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_GT_BUMIN_QAGHAN', 		'TRAIT_GT_GOKTURKS');
--==========================================================================================================================	
-- DIPLOMACY
--==========================================================================================================================	
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 			ResponseType, 									Response, 															Bias)
VALUES 	('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_ATTACKED_HOSTILE', 					'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_ATTACKED_GENERIC%', 					500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_DEFEATED', 							'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_DEFEATED%', 							500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_DOW_GENERIC', 						'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_DOW_GENERIC%', 							500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_DENOUNCE', 						'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_DENOUNCE%', 							500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_DENOUNCE_FRIEND', 						'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_DENOUNCE_FRIEND%', 							500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_FIRST_GREETING', 						'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_FIRSTGREETING%', 						500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_TO_BEING_DENOUNCED', 'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_RESPONSE_TO_BEING_DENOUNCED%', 	500),
		('LEADER_GT_BUMIN_QAGHAN', 	'RESPONSE_DEC_FRIENDSHIP', 						'TXT_KEY_LEADER_GT_BUMIN_QAGHAN_DEC_FRIENDSHIP%', 						500);
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 					Description, 					ShortDescription)
VALUES	('TRAIT_GT_GOKTURKS', 	'TXT_KEY_TRAIT_GT_GOKTURKS',	'TXT_KEY_TRAIT_GT_GOKTURKS_SHORT');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 					CannotBeChosen, MovesChange, 	LostWithUpgrade, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_GT_SILVER_SOLDIERS', 	'TXT_KEY_PROMOTION_GT_SILVER_SOLDIERS',			'TXT_KEY_PROMOTION_GT_SILVER_SOLDIERS_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_SILVER_SOLDIERS'),
		('PROMOTION_GT_GOLD_GUARDIANS', 	'TXT_KEY_PROMOTION_GT_GOLD_GUARDIANS',			'TXT_KEY_PROMOTION_GT_GOLD_GUARDIANS_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_GOLD_GUARDIANS'),
		('PROMOTION_GT_COPPER_CAVALRY', 	'TXT_KEY_PROMOTION_GT_COPPER_CAVALRY',			'TXT_KEY_PROMOTION_GT_COPPER_CAVALRY_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_COPPER_CAVALRY'),
		('PROMOTION_GT_IRON_WOLVES', 	'TXT_KEY_PROMOTION_GT_IRON_WOLVES',			'TXT_KEY_PROMOTION_GT_IRON_WOLVES_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_IRON_WOLVES'),
		('PROMOTION_GT_ALUMINIUM_VALKYRIES', 	'TXT_KEY_PROMOTION_GT_ALUMINIUM_VALKYRIES',			'TXT_KEY_PROMOTION_GT_ALUMINIUM_VALKYRIES_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_ALUMINIUM_VALKYRIES'),
		('PROMOTION_GT_URANIUM_SENTRIES', 	'TXT_KEY_PROMOTION_GT_URANIUM_SENTRIES',			'TXT_KEY_PROMOTION_GT_URANIUM_SENTRIES_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_URANIUM_SENTRIES'),
		('PROMOTION_GT_DIVINE_MIST', 	'TXT_KEY_PROMOTION_GT_DIVINE_MIST',			'TXT_KEY_PROMOTION_GT_DIVINE_MIST_HELP',		'AS2D_IF_LEVELUP', 		1, 				0,				0, 				 59, 				'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_GT_DIVINE_MIST');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
		(Type, 						Class, PrereqTech, Combat, 	Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, Description, 					Civilopedia, 					Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 					UnitArtInfo, 					UnitFlagAtlas, 			UnitFlagIconOffset, PortraitIndex, 	IconAtlas, 				MoveRate)
SELECT	'UNIT_GT_TOYGUNLAR',	Class, PrereqTech, 	Combat, Cost, 	FaithCost, 	RequiresFaithPurchaseEnabled, 	Moves+1, HurryCostModifier,	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_GT_TOYGUNLAR_DESC',	'TXT_KEY_GT_TOYGUNLAR_TEXT',	'TXT_KEY_GT_TOYGUNLAR_STRATEGY',	'TXT_KEY_GT_TOYGUNLAR_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 'ART_DEF_UNIT_GT_TOYGUNLAR',	'GT_TOYGUNLAR_FLAG_ATLAS', 	0,					2, 				'GT_GOKTURKS_ATLAS',	MoveRate
FROM Units WHERE (Type = 'UNIT_KNIGHT');
--------------------------------	
-- UnitGameplay2DScripts
--------------------------------		
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_GT_TOYGUNLAR',		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------	
-- Unit_AITypes
--------------------------------		
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_GT_TOYGUNLAR',		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------	
-- Unit_Flavors
--------------------------------		
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,	Flavor)
SELECT	'UNIT_GT_TOYGUNLAR',		FlavorType,	Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 					ResourceType, 		Cost)
VALUES	('UNIT_GT_TOYGUNLAR',	'RESOURCE_IRON', 	1);
--------------------------------	
-- Unit_FreePromotions
--------------------------------		
INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
SELECT	'UNIT_GT_TOYGUNLAR',		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_KNIGHT';
--------------------------------	
-- Unit_ClassUpgrades
--------------------------------		
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	'UNIT_GT_TOYGUNLAR',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_KNIGHT';	
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 							DefaultBuilding, 			Description)
VALUES	('BUILDINGCLASS_GT_GOKTURKS', 	'BUILDING_GT_TOYGUNLAR_COURTHOUSE', 	'TXT_KEY_BUILDING_GT_GOKTURKS_DESC');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------			
INSERT INTO Buildings		
		(Type, 										BuildingClass, 			  		NoOccupiedUnhappiness,	Cost, 	FaithCost,	GreatWorkCount,  	Description, 										Help,													NeverCapture)
VALUES	('BUILDING_GT_TOYGUNLAR_BUILD', 				'BUILDINGCLASS_GT_GOKTURKS', 		1,						-1, 	-1,			-1,				 	'TXT_KEY_BUILDING_GT_TOYGUNLAR_COURTHOUSE', 						'TXT_KEY_BUILDING_GT_TOYGUNLAR_COURTHOUSE_HELP',						1);

INSERT INTO Buildings
		(Type,                  		BuildingClass,  Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance, PrereqTech,     Description,                  Help,                                         Civilopedia,                        Strategy,                             ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, PortraitIndex, IconAtlas)
SELECT  'BUILDING_GT_VASSAL_FORGE',  	BuildingClass,  Cost, Espionage, EspionageModifier, SpecialistType, SpecialistCount, GoldMaintenance,  PrereqTech,   'TXT_KEY_BUILDING_GT_VASSAL_FORGE',    'TXT_KEY_BUILDING_GT_VASSAL_FORGE_HELP',    'TXT_KEY_BUILDING_GT_VASSAL_FORGE_TEXT',    'TXT_KEY_BUILDING_GT_VASSAL_FORGE_STRATEGY',    ArtDefineTag, MinAreaSize, NeverCapture, HurryCostModifier, 3,            'GT_GOKTURKS_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_FORGE';

INSERT INTO Buildings 	
		(Type, 								BuildingClass, 				Cost, 	FreeBuildingThisCity,		GoldMaintenance, 	PrereqTech, 	Description, 										Help, 									Civilopedia, 						Strategy,	ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_GT_TOYGUNLAR_COURTHOUSE',	'BUILDINGCLASS_GT_GOKTURKS', Cost, 'BUILDING_GT_TOYGUNLAR_BUILD', 				GoldMaintenance,	PrereqTech, 			'TXT_KEY_BUILDING_GT_TOYGUNLAR_COURTHOUSE', 	'TXT_KEY_BUILDING_GT_TOYGUNLAR_COURTHOUSE_HELP',		null,								null, 		ArtDefineTag, MinAreaSize, NeverCapture, Espionage, EspionageModifier, HurryCostModifier, 0, 				'GT_GOKTURKS_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_COURTHOUSE';
-------------------
-- Building_Flavors
-------------------
INSERT INTO Building_Flavors
          (BuildingType,            FlavorType,    Flavor)
SELECT    'BUILDING_GT_VASSAL_FORGE',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_FORGE';

INSERT INTO Building_Flavors
          (BuildingType,            FlavorType,    Flavor)
SELECT    'BUILDING_GT_TOYGUNLAR_COURTHOUSE',    FlavorType,    Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_COURTHOUSE';

INSERT INTO Building_Flavors
          (BuildingType,             FlavorType,           Flavor)
VALUES    ('BUILDING_GT_VASSAL_FORGE',   'FLAVOR_EXPANSION',   10);
--------------------------
-- Building_YieldChanges
--------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,                  YieldType,          Yield)
VALUES    ('BUILDING_GT_VASSAL_FORGE', 'YIELD_PRODUCTION',  1);
--==========================================================================================================================
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
VALUES	('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_DECOLONIZATION',			2),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_MERCENARY',					8),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_GOVERNMENT',			5),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_LEGAL',				8),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_CULTURE',			10),		
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_ECONOMIC',			2),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_FOREIGN',			10),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_INDUSTRY',			10),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_MILITARY',			7),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_REFORM_RELIGION',			7),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_SLAVERY',					10),
		('LEADER_GT_BUMIN_QAGHAN',	'FLAVOR_JFD_STATE_RELIGION',			8);
--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					GovernmentType,			     Weight)
VALUES  ('CIVILIZATION_GT_GOKTURKS',	'GOVERNMENT_JFD_MONARCHY',	 90);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,					MapPrefix,				X,		Y,		AltX,  		AltY,  	AltCapitalName)
VALUES	('CIVILIZATION_GT_GOKTURKS',	'AfriAsiaAust',			124,	31, 	null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'Asia',					46,		62,     null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'AsiaSmall',			14,		47,		null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'EastAsia',				23,		78,		null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'GreatestEarth',		100,	22,		null,	null,	null),							
		('CIVILIZATION_GT_GOKTURKS',	'Steppe',				127,	47,		null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'Cordiform',			52,		41,		null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'Yagem',				47,		71,		null,	null,	null),
		('CIVILIZATION_GT_GOKTURKS',	'Yahem',				102,	61,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GT_GOKTURKS',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
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
SELECT	'CIVILIZATION_GT_GOKTURKS',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_HUNS';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Steppe'
WHERE Type = 'CIVILIZATION_GT_GOKTURKS'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Steppe')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================