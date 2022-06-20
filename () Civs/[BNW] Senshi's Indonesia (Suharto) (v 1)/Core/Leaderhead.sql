--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_SUHARTO', 		'TXT_KEY_LEADER_SENSHI_SUHARTO', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_SUHARTO', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_SUHARTO', 	'Senshi_Suharto_Scene.xml',		6, 						3, 						3, 							6, 			6, 				2, 				4, 						3, 				7, 			7, 			4, 				3, 			8, 			'SENSHI_INDONESIA_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_AFRAID', 		5),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_SENSHI_SUHARTO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_SUHARTO', 	'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_SENSHI_SUHARTO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_SENSHI_SUHARTO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_SENSHI_SUHARTO', 	'MINOR_CIV_APPROACH_CONQUEST', 		8),
			('LEADER_SENSHI_SUHARTO', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_SUHARTO', 	'FLAVOR_OFFENSE', 					8),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_MILITARY_TRAINING', 		9),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_RANGED', 					5),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_MOBILE', 					4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_NAVAL', 					8),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_NAVAL_RECON', 				7),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_AIR', 						7),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_GROWTH', 					5),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_GOLD', 						4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_CULTURE', 					4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_GREAT_PEOPLE', 				3),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_WONDER', 					4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_RELIGION', 					2),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_DIPLOMACY', 				3),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_SPACESHIP', 				2),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_WATER_CONNECTION', 			7),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_NUKE', 						6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_USE_NUKE', 					6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_ESPIONAGE', 				8),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_AIRLIFT', 					6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_I_TRADE_DESTINATION', 		6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_I_TRADE_ORIGIN', 			6),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_SENSHI_SUHARTO', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_SUHARTO', 	'TRAIT_SENSHI_INDONESIA');
--==========================================================================================================================				
--==========================================================================================================================		