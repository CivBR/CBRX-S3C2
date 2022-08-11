
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 					TileType,		Asset)
VALUES	('ART_DEF_UNIT_CANTOR_POPULAR',			'Unit', 		'sv_CantorPopular.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------
INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_CANTOR_POPULAR',			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType, 							UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_CANTOR_POPULAR',			'ART_DEF_UNIT_MEMBER_CANTOR_POPULAR',	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,  ZOffset, Domain, Model, 				  MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_CANTOR_POPULAR',	Scale,	ZOffset, Domain, 'caravan_andes.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_EUROMALE35';

INSERT INTO ArtDefine_UnitMemberCombats
		(UnitMemberType, EnableActions, HasRefaceAfterCombat)
SELECT	'ART_DEF_UNIT_MEMBER_CANTOR_POPULAR',	EnableActions,	HasRefaceAfterCombat
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';