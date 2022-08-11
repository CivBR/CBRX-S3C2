--==========================================================================================================================
-- Units
--==========================================================================================================================	
INSERT INTO Units 	
			(Class, 	Type, 					Pillage, CivilianAttackPriority, Special, Cost,  WorkRate,	CombatLimit,	OneShotTourism, OneShotTourismPercentOthers,	Moves, CombatClass, Domain, DefaultUnitAI,	Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport,	MilitaryProduction, Pillage,	IgnoreBuildingDefense, AdvancedStartCost, ObsoleteTech, XPValueAttack,	XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 					MoveRate, UnitFlagIconOffset,	UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT		Class, 		('UNIT_THP_SEN_THROAT_SINGER'),	Pillage, CivilianAttackPriority, Special, Cost,  WorkRate,	CombatLimit,	OneShotTourism, OneShotTourismPercentOthers,	Moves+1, CombatClass, Domain, DefaultUnitAI,	('TXT_KEY_UNIT_THP_SEN_THROAT_SINGER'), 	('TXT_KEY_CIV5_UNIT_THP_SEN_THROAT_SINGER_TEXT'), 	('TXT_KEY_UNIT_THP_SEN_THROAT_SINGER_STRATEGY'), 	('TXT_KEY_UNIT_THP_SEN_THROAT_SINGER_HELP'),	MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense, AdvancedStartCost, ObsoleteTech, XPValueAttack,	XPValueDefense,	GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_THP_SEN_THROAT_SINGER'),	MoveRate, 0,					('THP_SEN_THROAT_SINGER_FLAG'),	2, 				('THP_SEN_TUVA_ATLAS')
FROM Units WHERE (Type = 'UNIT_MUSICIAN');
--==========================================================================================================================
-- UnitGameplay2DScripts
--==========================================================================================================================	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_THP_SEN_THROAT_SINGER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_MUSICIAN');
--==========================================================================================================================
-- Unit_AITypes
--==========================================================================================================================	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_THP_SEN_THROAT_SINGER'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_MUSICIAN');	
--==========================================================================================================================
-- Unit_Flavors
--==========================================================================================================================	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_THP_SEN_THROAT_SINGER'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_MUSICIAN');	
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT OR REPLACE INTO Unit_FreePromotions 
			(UnitType, 				PromotionType)
VALUES		('UNIT_THP_SEN_THROAT_SINGER', 	'PROMOTION_THP_SEN_THROAT_SINGER_BORDERS'),
			('UNIT_THP_SEN_THROAT_SINGER', 	'PROMOTION_EXTRA_SIGHT_I'); 
--==========================================================================================================================
-- Unit_UniqueNames
--==========================================================================================================================
INSERT INTO Unit_UniqueNames 	
			(UnitType, 			UniqueName,							GreatWorkType)
VALUES		('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_01',	'GREAT_WORK_THP_SEN_THROAT_SINGER_01'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_02',	'GREAT_WORK_THP_SEN_THROAT_SINGER_02'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_03',	'GREAT_WORK_THP_SEN_THROAT_SINGER_03'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_04',	'GREAT_WORK_THP_SEN_THROAT_SINGER_04'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_05',	'GREAT_WORK_THP_SEN_THROAT_SINGER_05'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_06',	'GREAT_WORK_THP_SEN_THROAT_SINGER_06'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_07',	'GREAT_WORK_THP_SEN_THROAT_SINGER_07'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_08',	'GREAT_WORK_THP_SEN_THROAT_SINGER_08'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_09',	'GREAT_WORK_THP_SEN_THROAT_SINGER_09'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_10',	'GREAT_WORK_THP_SEN_THROAT_SINGER_10'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_11',	'GREAT_WORK_THP_SEN_THROAT_SINGER_11'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_12',	'GREAT_WORK_THP_SEN_THROAT_SINGER_12'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_13',	'GREAT_WORK_THP_SEN_THROAT_SINGER_13'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_14',	'GREAT_WORK_THP_SEN_THROAT_SINGER_14'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_15',	'GREAT_WORK_THP_SEN_THROAT_SINGER_15'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_16',	'GREAT_WORK_THP_SEN_THROAT_SINGER_16'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_17',	'GREAT_WORK_THP_SEN_THROAT_SINGER_17'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_18',	'GREAT_WORK_THP_SEN_THROAT_SINGER_18'),
			('UNIT_THP_SEN_THROAT_SINGER',	'TXT_KEY_THP_SEN_THROAT_SINGER_UNIQUE_NAME_19',	'GREAT_WORK_THP_SEN_THROAT_SINGER_19');
--==========================================================================================================================	
-- GreatWorks
--==========================================================================================================================	
INSERT INTO GreatWorks 
			(Type, 						GreatWorkClassType,			Description,									Audio,							Image)
VALUES		('GREAT_WORK_THP_SEN_THROAT_SINGER_01', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_01',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_02', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_02',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_03', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_03',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_04', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_04',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_05', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_05',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_06', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_06',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_07', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_07',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_08', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_08',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_09', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_09',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_10', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_10',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_11', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_11',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_12', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_12',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_13', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_13',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_14', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_14',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_15', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_15',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_16', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_16',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_17', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_17',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_18', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_18',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_19', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_19',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_20', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_20',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_21', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_21',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_22', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_22',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_23', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_23',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_24', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_24',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_25', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_25',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_26', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_26',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_27', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_27',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_28', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_28',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_29', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_29',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds'),
			('GREAT_WORK_THP_SEN_THROAT_SINGER_30', 	'GREAT_WORK_MUSIC',	'TXT_KEY_GREAT_WORK_THP_SEN_THROAT_SINGER_GREAT_WORK_30',	'AS3D_UNIT_GREAT_PROPHET_ACTIVATE',	'ThroatSingerBackground.dds');
--==========================================================================================================================		
--==========================================================================================================================	