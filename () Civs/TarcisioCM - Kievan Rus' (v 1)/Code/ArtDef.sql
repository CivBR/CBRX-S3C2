--=========================================================================================================================
-- IconTextureAtlases
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 						IconsPerRow, 	IconsPerColumn)
VALUES		('TCM_KIEV_ATLAS', 						256, 		'tcm_kiev_icons_256.dds',		2,				2),
			('TCM_KIEV_ATLAS', 						128, 		'tcm_kiev_icons_128.dds',		2, 				2),
			('TCM_KIEV_ATLAS', 						80, 		'tcm_kiev_icons_80.dds',		2, 				2),
			('TCM_KIEV_ATLAS', 						64, 		'tcm_kiev_icons_64.dds',		2, 				2),
			('TCM_KIEV_ATLAS', 						45, 		'tcm_kiev_icons_45.dds',		2, 				2),
			('TCM_KIEV_ATLAS', 						32, 		'tcm_kiev_icons_32.dds',		2, 				2),
			('TCM_KIEV_ALPHA_ATLAS',				128, 		'tcm_kiev_alpha_128.dds',		1,				1),
			('TCM_KIEV_ALPHA_ATLAS',				80, 		'tcm_kiev_alpha_80.dds',		1, 				1),
			('TCM_KIEV_ALPHA_ATLAS',				64, 		'tcm_kiev_alpha_64.dds',		1, 				1),
			('TCM_KIEV_ALPHA_ATLAS',				48, 		'tcm_kiev_alpha_48.dds',		1, 				1),
			('TCM_KIEV_ALPHA_ATLAS',				32, 		'tcm_kiev_alpha_32.dds',		1, 				1),
			('TCM_KIEV_ALPHA_ATLAS',				24, 		'tcm_kiev_alpha_24.dds',		1, 				1),
			('TCM_KIEV_ALPHA_ATLAS',		 		16, 		'tcm_kiev_alpha_16.dds',		1, 				1),
			('TCM_UNIT_FLAG_GOST_CONVOY_ATLAS',		32,			'tcm_gost_convoy_alpha_32.dds',	1, 				1);
--==========================================================================================================================
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_TCM_GOST_CONVOY', 1, 'Pikeman');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_TCM_GOST_CONVOY', 'ART_DEF_UNIT_MEMBER_TCM_GOST_CONVOY', 12);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_GOST_CONVOY', 0.140000000596046, 'tcm_gost.fxsxml', 'ARMOR', 'ARMOR');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_GOST_CONVOY', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_GOST_CONVOY', 0, 0, 'METAL', 'SPEAR');
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, WeaponTypeTag, MissTargetSlopRadius)
  VALUES ('ART_DEF_UNIT_MEMBER_TCM_GOST_CONVOY', 1, 0, 10.0, 20.0, 'FLAMING_ARROW', 10.0);
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_TCM_GOST_CONVOY', 'Unit', 'tcm_gost_convoy_sv.dds');
--==========================================================================================================================
--==========================================================================================================================