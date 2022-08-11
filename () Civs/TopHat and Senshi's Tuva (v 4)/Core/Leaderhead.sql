--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 							Description, 						Civilopedia, 									CivilopediaTag, 								ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness,	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_THP_SEN_DONDUK', 		'TXT_KEY_LEADER_THP_SEN_DONDUK', 	'TXT_KEY_CIVILOPEDIA_LEADER_THP_SEN_DONDUK', 	'TXT_KEY_CIVILOPEDIA_LEADERS_THP_SEN_DONDUK', 	'TopHat_Senshi_Kuular_Scene.xml',	3, 						4, 						3, 							7, 			5, 				2, 				3, 						7, 				4, 			8, 			6, 				3, 			4, 			'THP_SEN_TUVA_ATLAS',		1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_WAR', 			4),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	6),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_GUARDED', 		8),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_AFRAID', 		7),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_THP_SEN_DONDUK', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		8);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_THP_SEN_DONDUK', 	'MINOR_CIV_APPROACH_IGNORE', 		7),
			('LEADER_THP_SEN_DONDUK', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_THP_SEN_DONDUK', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	2),
			('LEADER_THP_SEN_DONDUK', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_THP_SEN_DONDUK', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_THP_SEN_DONDUK', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_DEFENSE', 					6),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_MILITARY_TRAINING', 		4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_RECON', 					5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_RANGED', 					7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_MOBILE', 					7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_NAVAL', 					3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_NAVAL_RECON', 				3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_NAVAL_GROWTH', 				3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_AIR', 						6),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_EXPANSION', 				6),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_GROWTH', 					4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_PRODUCTION', 				5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_GOLD', 						2),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_CULTURE', 					7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_HAPPINESS', 				7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_WONDER', 					4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_RELIGION', 					8),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_DIPLOMACY', 				5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_SPACESHIP', 				4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_WATER_CONNECTION', 			2),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_NUKE', 						3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_USE_NUKE', 					3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_ESPIONAGE', 				7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_AIRLIFT', 					4),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		3),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_ARCHAEOLOGY', 				2),
			('LEADER_THP_SEN_DONDUK', 	'FLAVOR_AIR_CARRIER', 				2);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_THP_SEN_DONDUK', 	'TRAIT_THP_SEN_TUVA');
--==========================================================================================================================				
--==========================================================================================================================		