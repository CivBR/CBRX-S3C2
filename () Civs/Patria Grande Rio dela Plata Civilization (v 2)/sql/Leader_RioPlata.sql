--==========================================================================================================================	
-- LEADER
--==========================================================================================================================	

--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	'LEADER_PG_SANMARTIN');

--------------------------------
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES	('LEADER_PG_SANMARTIN', 	'TXT_KEY_LEADER_PG_SANMARTIN',		'TXT_KEY_LEADER_PG_SANMARTIN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_PG_SANMARTIN', 	'Scene_SanMartin.xml',		8, 						4, 						7, 							9, 			4, 				7, 				7, 						8, 				9, 			2, 			1, 				10,			6, 			'PG_RIODELAPLATA_ATLAS', 	0);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_WAR', 			8),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		3),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_GUARDED', 		8),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_AFRAID', 		1),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		9),
		('LEADER_PG_SANMARTIN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		1);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_PG_SANMARTIN', 	'MINOR_CIV_APPROACH_IGNORE', 		1),
		('LEADER_PG_SANMARTIN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
		('LEADER_PG_SANMARTIN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	10),
		('LEADER_PG_SANMARTIN', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
		('LEADER_PG_SANMARTIN', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_PG_SANMARTIN', 	'FLAVOR_OFFENSE', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_DEFENSE', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_CITY_DEFENSE', 				2),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_MILITARY_TRAINING', 		10),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_RECON', 					10),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_RANGED', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_MOBILE', 					1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_NAVAL', 					6),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_NAVAL_GROWTH', 				9),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_AIR', 						1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_EXPANSION', 				10),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_GROWTH', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_TILE_IMPROVEMENT', 			8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_PRODUCTION', 				5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_GOLD', 						5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_SCIENCE', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_CULTURE', 					8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_HAPPINESS', 				2),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_GREAT_PEOPLE', 				10),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_WONDER', 					6),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_RELIGION', 					1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_DIPLOMACY', 				9),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_SPACESHIP', 				1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_WATER_CONNECTION', 			1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_NUKE', 						10),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_USE_NUKE', 					3),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_ESPIONAGE', 				8),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_AIRLIFT', 					1),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_PG_SANMARTIN', 	'FLAVOR_AIR_CARRIER', 				5);

		
--==========================================================================================================================
--==========================================================================================================================