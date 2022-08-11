--------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 								  		DefaultBuilding, 						 Description)
VALUES	('BUILDINGCLASS_SENSH_INDONESIA_SUHARTO',   'BUILDING_SENSH_PANCASILA_HAPPINESS',	 'TXT_KEY_BUILDING_JFD_SENSH_INDONESIA_SUHARTO');
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 
		(Type, 									BuildingClass, 								UnmoddedHappiness,  GreatWorkCount, Cost, 	FaithCost,	GoldMaintenance,	NeverCapture,	Description, 											Help)
VALUES	('BUILDING_SENSH_PANCASILA_HAPPINESS',  'BUILDINGCLASS_SENSH_INDONESIA_SUHARTO',	2,					-1,				-1, 	-1,			0,					1,				'TXT_KEY_BUILDING_SENSH_INDONESIA_SUHARTO_HAPPINESS', 	'TXT_KEY_BUILDING_SENSH_INDONESIA_SUHARTO_HAPPINESS_HELP');
--------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions 
		(Type, 											Description, 										Help, 													Sound, 				DropRange,	 EnemyHealChange,	FriendlyHealChange,   NeutralHealChange, CannotBeChosen, 	PortraitIndex,  IconAtlas, 			PediaType, 		  	 PediaEntry)
VALUES	('PROMOTION_SENSH_INDONESIA_SUHARTO',			'TXT_KEY_PROMOTION_SENSH_INDONESIA_SUHARTO',		'TXT_KEY_PROMOTION_SENSH_INDONESIA_SUHARTO_HELP',		'AS2D_IF_LEVELUP', 	0,			 10,				20,					  10,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_INDONESIA_SUHARTO'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_1',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	1,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_2',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	2,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_3',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	3,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_4',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	4,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_5',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	5,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_6',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	6,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_7',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	7,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_8',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	8,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_9',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	9,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_10',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	10,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_11',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	11,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_12',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	12,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_13',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	13,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_14',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	14,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'),
		('PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_15',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE',	'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE_HELP',	'AS2D_IF_LEVELUP', 	15,			 0,					0,					  0,				 1, 				59, 			'ABILITY_ATLAS',	'PEDIA_ATTRIBUTES',  'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE');
--------------------------------------------------------------------------------------------------------------------------
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia (Type text default null);
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
SELECT	Type
FROM UnitPromotions WHERE Description = 'TXT_KEY_PROMOTION_SENSH_KOPASSUS_PARADROP_RANGE'; 
--==========================================================================================================================
--==========================================================================================================================
