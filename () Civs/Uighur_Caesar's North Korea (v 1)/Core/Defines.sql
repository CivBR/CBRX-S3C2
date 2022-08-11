--=========================================================================================================================
--=========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_UC_KOKSAN', 1, 'TwoBigGuns');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_UC_KOKSAN', 'ART_DEF_UNIT_MEMBER_UC_KOKSAN', 2);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KOKSAN', 0.119999997317791, 'M12_King_Kong.fxsxml', 'METAL', 'METALSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasLongRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KOKSAN', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady', 1, 1, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_UC_KOKSAN', 0, 0, 25.0, 50.0, 7.0, 'ART_DEF_VEFFECT_ARTILLERY_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION20POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_UC_KOKSAN', 'Unit', 'KoksanSV.dds');
--==========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 										IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES		('UC_BEST_KOREA_ATLAS', 						256, 		'NKAtlas256.dds',				2,				2),
			('UC_BEST_KOREA_ATLAS', 						128, 		'NKAtlas128.dds',				2, 				2),
			('UC_BEST_KOREA_ATLAS', 						80, 		'NKAtlas80.dds',					2, 				2),
			('UC_BEST_KOREA_ATLAS', 						64, 		'NKAtlas64.dds',					2, 				2),
			('UC_BEST_KOREA_ATLAS', 						45, 		'NKAtlas45.dds',					2, 				2),
			('UC_BEST_KOREA_ATLAS', 						32, 		'NKAtlas32.dds',					2, 				2),
			('UC_BEST_KOREA_ALPHA_ATLAS',					128, 		'NKAlpha128.dds',			1,				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',					80, 		'NKAlpha80.dds',			1, 				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',					64, 		'NKAlpha64.dds',			1, 				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',					48, 		'NKAlpha48.dds',			1, 				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',					32, 		'NKAlpha32.dds',			1, 				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',					24, 		'NKAlpha24.dds',			1, 				1),
			('UC_BEST_KOREA_ALPHA_ATLAS',	 				16, 		'NKAlpha16.dds',			1, 				1),
			('UC_KOKSAN_FLAG_ATLAS',				32,			'KoksanFlag.dds',			1, 				1);
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 									Filename, 					LoadType)
VALUES		('SND_LEADER_MUSIC_UC_KIM_PEACE', 	'KimPeace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_UC_KIM_WAR',		'KimWar', 		'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_UC_KIM_PEACE', 	'SND_LEADER_MUSIC_UC_KIM_PEACE', 	'GAME_MUSIC', 	80, 		80, 		1, 			0),
			('AS2D_LEADER_MUSIC_UC_KIM_WAR', 		'SND_LEADER_MUSIC_UC_KIM_WAR', 	'GAME_MUSIC', 	80, 		80, 		1,			0);
