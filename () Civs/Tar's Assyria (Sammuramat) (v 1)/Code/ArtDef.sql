--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_ASSYRIA_ATLAS', 					256, 		'tcm_assyrian_icons_256.dds',		2,				2),
			('TCM_ASSYRIA_ATLAS', 					128, 		'tcm_assyrian_icons_128.dds',		2, 				2),
			('TCM_ASSYRIA_ATLAS', 					80, 		'tcm_assyrian_icons_80.dds',		2, 				2),
			('TCM_ASSYRIA_ATLAS', 					64, 		'tcm_assyrian_icons_64.dds',		2, 				2),
			('TCM_ASSYRIA_ATLAS', 					45, 		'tcm_assyrian_icons_45.dds',		2, 				2),
			('TCM_ASSYRIA_ATLAS', 					32, 		'tcm_assyrian_icons_32.dds',		2, 				2),
			('TCM_ASSYRIA_ALPHA_ATLAS',				128, 		'tcm_assyrian_alpha_128.dds',		1,				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',				80, 		'tcm_assyrian_alpha_80.dds',		1, 				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',				64, 		'tcm_assyrian_alpha_64.dds',		1, 				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',				48, 		'tcm_assyrian_alpha_48.dds',		1, 				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',				32, 		'tcm_assyrian_alpha_32.dds',		1, 				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',				24, 		'tcm_assyrian_alpha_24.dds',		1, 				1),
			('TCM_ASSYRIA_ALPHA_ATLAS',		 		16, 		'tcm_assyrian_alpha_16.dds',		1, 				1),
			('TCM_UNIT_FLAG_SAPPER_ATLAS',			32,			'tcm_sapper_flag_alpha_32.dds',		1, 				1);
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_SAPPER', 1, 'Phalanx');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_SAPPER', 'ART_DEF_UNIT_MEMBER_TCM_SAPPER', 8);
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_SAPPER', 'ART_DEF_UNIT_MEMBER_TCM_SAPPER_2', 4);

INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER', 0.140000000596046, 'Spearman_Babylon.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER_2', 0.140000000596046, 'Mesopotamic_warrior.fxsxml', 'CLOTH', 'FLESH');

INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER_2', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1);
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1);

INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER', 0, 0, 'METAL', 'SPEAR');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER_2', 0, 0, 'BLUNT', 'BLUNT');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_SAPPER_2', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_SAPPER', 'Unit', 'tcm_sapper_flag_alpha_sv.dds');