--==========================================================================================================================
-- CIVILOPEDIA
--==========================================================================================================================
-- DMS_Civilopedia_HideFromPedia
----------------------------------------------------------------------------------------------------------------------------
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('BUILDING_LITE_POROTO_KOTAN'),
		('BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY');
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('LITE_Ainu_Decisions.lua');
------------------------------
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
			(Type, 													DefaultBuilding, 								Description, 											MaxGlobalInstances)													
VALUES	    ('BUILDINGCLASS_LITE_POROTO_KOTAN',						'BUILDING_LITE_POROTO_KOTAN', 					'TXT_KEY_BUILDING_LITE_POROTO_KOTAN', 					-1),
			('BUILDINGCLASS_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY',	'BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY', 'TXT_KEY_BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY', -1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings
 			(Type,												BuildingClass,											Cost, 	FaithCost,	GreatWorkCount, GoldMaintenance,	GreatWorksTourismModifier,	CultureRateModifier,	PrereqTech, 	Description,											Help,															Civilopedia,													Strategy,															MinAreaSize) 
VALUES		('BUILDING_LITE_POROTO_KOTAN',						'BUILDINGCLASS_LITE_POROTO_KOTAN',						-1, 	-1,			-1, 			0,  				15,							15,						null,			'TXT_KEY_BUILDING_LITE_POROTO_KOTAN',					'TXT_KEY_BUILDING_LITE_POROTO_KOTAN_HELP',						'TXT_KEY_BUILDING_LITE_POROTO_KOTAN_PEDIA',						'TXT_KEY_BUILDING_LITE_POROTO_KOTAN_STRATEGY',						-1),
			('BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY',	'BUILDINGCLASS_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY',	-1, 	-1,			-1, 			0,  				0,							5,						null,			'TXT_KEY_BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY',	'TXT_KEY_BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY_HELP',	'TXT_KEY_BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY_PEDIA',	'TXT_KEY_BUILDING_LITE_ITAOMACHIP_TRADERS_COUNT_DUMMY_STRATEGY',	-1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('LITE_Ainu_Events.lua');
------------------------------
-- Units
------------------------------
INSERT INTO Units
		(Class, Type, 						Cost,	Moves,	CivilianAttackPriority,	Special,	Domain,	DefaultUnitAI,	Description,	Civilopedia,	Strategy,	AdvancedStartCost,	WorkRate,	CombatLimit,	BaseCultureTurnsToCount,	UnitArtInfo,	UnitArtInfoEraVariation,	UnitFlagAtlas,	UnitFlagIconOffset,	IconAtlas,	PortraitIndex,	MoveRate)
SELECT	Class,	('UNIT_DMS_POET_IMENKANU'),	-1,		Moves,	CivilianAttackPriority,	Special,	Domain,	DefaultUnitAI,	Description,	Civilopedia,	Strategy,	AdvancedStartCost,	WorkRate,	CombatLimit,	BaseCultureTurnsToCount,	UnitArtInfo,	UnitArtInfoEraVariation,	UnitFlagAtlas,	UnitFlagIconOffset,	IconAtlas,	PortraitIndex,	MoveRate
FROM Units WHERE (Type = 'UNIT_WRITER');
------------------------------
-- UnitGameplay2DScripts
------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 					SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_POET_IMENKANU'),	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WRITER');
------------------------------
-- Unit_AITypes
------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 					UnitAIType)
SELECT	('UNIT_DMS_POET_IMENKANU'),	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WRITER');
------------------------------
-- Unit_Flavors
------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 					FlavorType, Flavor)
SELECT	('UNIT_DMS_POET_IMENKANU'),	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WRITER');
------------------------------
-- Unit_UniqueNames
------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 					UniqueName,							GreatWorkType)
VALUES	('UNIT_DMS_POET_IMENKANU',	'TXT_KEY_UNIT_DMS_POET_IMENKANU',	'GREAT_WORK_DMS_POET_IMENKANU');
------------------------------	
-- GreatWorks
------------------------------	
INSERT INTO GreatWorks 
		(Type, 								GreatWorkClassType,			Description,								Quote,											Audio,							Image)
VALUES	('GREAT_WORK_DMS_POET_IMENKANU', 	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_DMS_POET_IMENKANU',		'TXT_KEY_GREAT_WORK_QUOTE_DMS_POET_IMENKANU',	'AS2D_GREAT_ARTIST_ARTWORK',	'GreatWriter_Background.dds');
--==========================================================================================================================
--==========================================================================================================================