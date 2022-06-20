INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_TECHNICAL', 1, 'Vehicle');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_TECHNICAL', 'ART_DEF_UNIT_MEMBER_SAS_TECHNICAL', 3);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_TECHNICAL', 0.088, 'Art/Models/Hotchkiss_25mm_AA_Half-Track.fxsxml', 'METAL', 'METALSM');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, HasShortRangedAttack, HasStationaryMelee, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_TECHNICAL', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady', 1, 1, 0, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, VisKillStrengthMin, VisKillStrengthMax, HitEffect, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_TECHNICAL', 0, 0, 25.0, 50.0, 'ART_DEF_VEFFECT_SAS_TECHNICAL_IMPACT_$(TERRAIN)', 'EXPLOSIVE', 'EXPLOSION6POUND');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_TECHNICAL', 'Unit', 'SV_SasTechnical.dds');

INSERT INTO ArtDefine_UnitInfos(Type, DamageStates, Formation)
  VALUES ('ART_DEF_UNIT_SAS_FAP', 1, 'UnFormed');
INSERT INTO ArtDefine_UnitInfoMemberInfos(UnitInfoType, UnitMemberInfoType, NumMembers)
  VALUES ('ART_DEF_UNIT_SAS_FAP', 'ART_DEF_UNIT_MEMBER_SAS_FAP', 14);
INSERT INTO ArtDefine_UnitMemberInfos(Type, Scale, Model, MaterialTypeTag, MaterialTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_FAP', 0.12, 'Art/Models/SasFap.fxsxml', 'CLOTH', 'FLESH');
INSERT INTO ArtDefine_UnitMemberCombats(UnitMemberType, EnableActions, ShortMoveRadius, ShortMoveRate, TargetHeight, HasShortRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_FAP', 'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk AttackCharge', 12.0, 0.349999994039536, 8.0, 1, 1, 1);
INSERT INTO ArtDefine_UnitMemberCombatWeapons(UnitMemberType, "Index", SubIndex, WeaponTypeTag, WeaponTypeSoundOverrideTag)
  VALUES ('ART_DEF_UNIT_MEMBER_SAS_FAP', 0, 0, 'BULLET', 'BULLET');
INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_UNIT_SAS_FAP', 'Unit', 'SV_SasFap.dds');
