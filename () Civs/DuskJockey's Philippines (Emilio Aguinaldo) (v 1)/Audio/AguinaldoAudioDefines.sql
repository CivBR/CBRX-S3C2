--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 			LoadType)
VALUES		('SND_LEADER_MUSIC_DJ_AGUINALDO_PEACE', 'DJAguinaldoPeace',	'DynamicResident'),
			('SND_LEADER_MUSIC_DJ_AGUINALDO_WAR', 	'DJAguinaldoWar',	'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 									SoundID, 								SoundType,		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_DJ_AGUINALDO_PEACE', 	'SND_LEADER_MUSIC_DJ_AGUINALDO_PEACE',	'GAME_MUSIC', 	100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_DJ_AGUINALDO_WAR',		'SND_LEADER_MUSIC_DJ_AGUINALDO_WAR',	'GAME_MUSIC', 	100, 		100, 		1,		 0);