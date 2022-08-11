--==========================================================================================================================	
-- Leaders
--==========================================================================================================================				
INSERT INTO Leaders
			(Type, 								Description,									Civilopedia, 							CivilopediaTag, 						ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_MC_TUPAC_YUPANQUI',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI_DESC',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI',		'MC_INCA_Leaderscene.xml',		7,						7,						5,							9,			7,				6,				4,						5,				6,			6,			6,				5,			4,			'MC_INCA_ATLAS',		1);

--==========================================================================================================================	
-- Diplomacy_Responses
--==========================================================================================================================				
INSERT INTO Diplomacy_Responses
			(LeaderType,				ResponseType,				Response)
VALUES		('LEADER_MC_TUPAC_YUPANQUI',		'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI_FIRSTGREETING_%'),
			('LEADER_MC_TUPAC_YUPANQUI',		'RESPONSE_DEFEATED',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI_DEFEATED_%'),
			('LEADER_MC_TUPAC_YUPANQUI',		'RESPONSE_ATTACKED',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI_ATTACKED_%'),
			('LEADER_MC_TUPAC_YUPANQUI',		'RESPONSE_DOW_GENERIC',		'TXT_KEY_LEADER_MC_TUPAC_YUPANQUI_DOW_%');
			
--==========================================================================================================================	
-- Traits
--==========================================================================================================================				
INSERT INTO Traits
			(Type,										Description,										ShortDescription)
VALUES		('TRAIT_MC_MITIMAES_BEYOND_THE_MOUNTAINS',	'TXT_KEY_TRAIT_MC_MITIMAES_BEYOND_THE_MOUNTAINS',	'TXT_KEY_TRAIT_MC_MITIMAES_BEYOND_THE_MOUNTAINS_SHORT');

--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
		(Type,							BuildingClass,					Description,						Cost,	PrereqTech,	GreatWorkCount,	FaithCost,	NeverCapture)
VALUES	('BUILDING_MC_INCAN_UA',		'BUILDINGCLASS_MC_INCAN_UA',	'TXT_KEY_BUILDING_MC_INCAN_UA',		-1,		null,		-1,				-1,			1);

--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
		(Type,								DefaultBuilding,			Description)
VALUES	('BUILDINGCLASS_MC_INCAN_UA',		'BUILDING_MC_INCAN_UA',		'TXT_KEY_BUILDING_MC_INCAN_UA');

--==========================================================================================================================
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges 	
		(BuildingType, 					YieldType,			Yield)
VALUES	('BUILDING_MC_INCAN_UA',		'YIELD_CULTURE',	1),
		('BUILDING_MC_INCAN_UA',		'YIELD_PRODUCTION',	1);

--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================				
INSERT INTO Leader_Traits
			(LeaderType,					TraitType)
VALUES		('LEADER_MC_TUPAC_YUPANQUI',	'TRAIT_MC_MITIMAES_BEYOND_THE_MOUNTAINS');

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================				
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);

--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================							
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_TUPAC_YUPANQUI', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MINOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'MINOR_CIV_APPROACH_BULLY', 		6);

--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================	
INSERT INTO Leader_Flavors 
			(LeaderType, 					FlavorType, 						Flavor)
VALUES		('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_DEFENSE', 					5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_RECON', 					6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_RANGED', 					4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_MOBILE', 					3),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_NAVAL', 					8),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_NAVAL_RECON', 				9),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_AIR', 						5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_GROWTH', 					7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_GOLD', 						5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_CULTURE', 					5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_WONDER', 					7),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_RELIGION', 					6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_NUKE', 						6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_USE_NUKE', 					5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_ESPIONAGE', 				4),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_AIRLIFT', 					6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_ARCHAEOLOGY', 				6),
			('LEADER_MC_TUPAC_YUPANQUI', 	'FLAVOR_AIR_CARRIER', 				6);
--==========================================================================================================================