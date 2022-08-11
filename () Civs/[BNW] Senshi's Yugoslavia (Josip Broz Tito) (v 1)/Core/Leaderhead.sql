--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 				ArtDefineTag, 					VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_SENSHI_TITO', 		'TXT_KEY_LEADER_SENSHI_TITO', 	'TXT_KEY_CIVILOPEDIA_LEADER_SENSHI_TITO', 	'TXT_KEY_CIVILOPEDIA_LEADERS_SENSHI_TITO', 	'Senshi_Tito_Scene.xml',		6, 						3, 						6, 							7, 			8, 				3, 				4, 						8, 				5, 			6, 			3, 				6, 			5, 			'SENSHI_YUGOSLAVIA_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_AFRAID', 		2),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_SENSHI_TITO', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		10);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_SENSHI_TITO', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_SENSHI_TITO', 	'MINOR_CIV_APPROACH_FRIENDLY', 		7),
			('LEADER_SENSHI_TITO', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	9),
			('LEADER_SENSHI_TITO', 	'MINOR_CIV_APPROACH_CONQUEST', 		3),
			('LEADER_SENSHI_TITO', 	'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_SENSHI_TITO', 	'FLAVOR_OFFENSE', 					6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_DEFENSE', 					8),
			('LEADER_SENSHI_TITO', 	'FLAVOR_CITY_DEFENSE', 				6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_SENSHI_TITO', 	'FLAVOR_RECON', 					4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_RANGED', 					7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_MOBILE', 					6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_NAVAL', 					5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_AIR', 						7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_SENSHI_TITO', 	'FLAVOR_GROWTH', 					7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_TILE_IMPROVEMENT', 			6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_PRODUCTION', 				7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_GOLD', 						4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_SCIENCE', 					7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_CULTURE', 					8),
			('LEADER_SENSHI_TITO', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_SENSHI_TITO', 	'FLAVOR_GREAT_PEOPLE', 				5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_WONDER', 					4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_RELIGION', 					1),
			('LEADER_SENSHI_TITO', 	'FLAVOR_DIPLOMACY', 				8),
			('LEADER_SENSHI_TITO', 	'FLAVOR_SPACESHIP', 				6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_NUKE', 						5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_SENSHI_TITO', 	'FLAVOR_ESPIONAGE', 				6),
			('LEADER_SENSHI_TITO', 	'FLAVOR_AIRLIFT', 					5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_SENSHI_TITO', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_ARCHAEOLOGY', 				4),
			('LEADER_SENSHI_TITO', 	'FLAVOR_AIR_CARRIER', 				4);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_SENSHI_TITO', 	'TRAIT_SENSHI_YUGOSLAVIA');
--==========================================================================================================================				
--==========================================================================================================================		