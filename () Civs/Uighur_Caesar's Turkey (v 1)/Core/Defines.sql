--==========================================================================================================================
-- ART_DEF
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_UC_KUVA', 1, 'UnFormed');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_UC_KUVA', 'ART_DEF_UNIT_MEMBER_UC_KUVA', 14);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KUVA', 0.140000000596046, 'ottgw1.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KUVA', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KUVA', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_UC_KUVA', 'Unit', 'SV_KUVA.dds');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 										IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('UC_TURKEY_ATLAS', 						256, 		'TurkeyAtlas256.dds',				2,				2),
			('UC_TURKEY_ATLAS', 						128, 		'TurkeyAtlas128.dds',				2, 				2),
			('UC_TURKEY_ATLAS', 						80, 		'TurkeyAtlas80.dds',					2, 				2),
			('UC_TURKEY_ATLAS', 						64, 		'TurkeyAtlas64.dds',					2, 				2),
			('UC_TURKEY_ATLAS', 						45, 		'TurkeyAtlas45.dds',					2, 				2),
			('UC_TURKEY_ATLAS', 						32, 		'TurkeyAtlas32.dds',					2, 				2),
			('UC_TURKEY_ALPHA_ATLAS',					128, 		'TurkeyAlpha128.dds',			1,				1),
			('UC_TURKEY_ALPHA_ATLAS',					80, 		'TurkeyAlpha80.dds',			1, 				1),
			('UC_TURKEY_ALPHA_ATLAS',					64, 		'TurkeyAlpha64.dds',			1, 				1),
			('UC_TURKEY_ALPHA_ATLAS',					48, 		'TurkeyAlpha48.dds',			1, 				1),
			('UC_TURKEY_ALPHA_ATLAS',					32, 		'TurkeyAlpha32.dds',			1, 				1),
			('UC_TURKEY_ALPHA_ATLAS',					24, 		'TurkeyAlpha24.dds',			1, 				1),
			('UC_TURKEY_ALPHA_ATLAS',	 				16, 		'TurkeyAlpha16.dds',			1, 				1),
			('UC_KUVA_FLAG_ATLAS',				32,			'KuvaFlag.dds',			1, 				1);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_UC_ATATURK_PEACE', 	'AtaturkPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_UC_ATATURK_WAR',		'AtaturkWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_UC_ATATURK_PEACE', 	'SND_LEADER_MUSIC_UC_ATATURK_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_UC_ATATURK_WAR', 		'SND_LEADER_MUSIC_UC_ATATURK_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
