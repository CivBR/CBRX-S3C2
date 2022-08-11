--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 				Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_SIHANOUK', 		'TXT_KEY_LEADER_SENSHI_SIHANOUK', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_SIHANOUK', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_SIHANOUK', 	'Senshi_Sihanouk_Scene.xml',					3, 						5, 						3, 							8, 			3, 				3, 				3, 						7, 				3, 			8, 			5, 				6, 			5, 			'SENSHI_CAMBODIA_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_HOSTILE', 		4),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_AFRAID', 		7),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_SIHANOUK', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_SIHANOUK', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_SENSHI_SIHANOUK', 	'MINOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_SENSHI_SIHANOUK', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_SENSHI_SIHANOUK', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_SENSHI_SIHANOUK', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_OFFENSE', 					7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_CITY_DEFENSE', 				4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_RECON', 					5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_RANGED', 					7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_MOBILE', 					4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_NAVAL', 					4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_AIR', 						6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_GROWTH', 					7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_PRODUCTION', 				6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_GOLD', 						4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_SCIENCE', 					6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_CULTURE', 					7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_HAPPINESS', 				8),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_GREAT_PEOPLE', 				8),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_WONDER', 					5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_RELIGION', 					5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_DIPLOMACY', 				7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_NUKE', 						4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_I_TRADE_DESTINATION', 		4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_I_TRADE_ORIGIN', 			4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		6),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_ARCHAEOLOGY', 				7),
			('LEADER_SENSHI_SIHANOUK', 	'FLAVOR_AIR_CARRIER', 				3);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_SIHANOUK', 	'TRAIT_SENSHI_CAMBODIA');
--==========================================================================================================================				
--==========================================================================================================================		