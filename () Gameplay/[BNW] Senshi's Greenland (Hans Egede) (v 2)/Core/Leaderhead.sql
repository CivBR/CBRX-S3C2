--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_EGEDE', 		'TXT_KEY_LEADER_SENSHI_EGEDE', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_EGEDE', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_EGEDE', 	'Senshi_Egede_Scene.xml',	4, 						5, 						3, 							7, 			5, 				5, 				4, 						6, 				5, 			9, 			5, 				4, 			4, 			'SENSHI_GREENLAND_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_EGEDE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_EGEDE', 	'MINOR_CIV_APPROACH_IGNORE', 		6),
			('LEADER_SENSHI_EGEDE', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_SENSHI_EGEDE', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_SENSHI_EGEDE', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_SENSHI_EGEDE', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_EGEDE', 	'FLAVOR_OFFENSE', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_MILITARY_TRAINING', 		3),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_RECON', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_RANGED', 					8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_MOBILE', 					6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_NAVAL', 					8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_NAVAL_RECON', 				9),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_NAVAL_GROWTH', 				10),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_AIR', 						8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_EXPANSION', 				7),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_GROWTH', 					4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_GOLD', 						4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_CULTURE', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_GREAT_PEOPLE', 				9),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_RELIGION', 					10),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_NUKE', 						4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_I_TRADE_DESTINATION', 		8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		9),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_ARCHAEOLOGY', 				7),
			('LEADER_SENSHI_EGEDE', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_EGEDE', 	'TRAIT_SENSHI_GREENLAND');
--==========================================================================================================================				
--==========================================================================================================================		