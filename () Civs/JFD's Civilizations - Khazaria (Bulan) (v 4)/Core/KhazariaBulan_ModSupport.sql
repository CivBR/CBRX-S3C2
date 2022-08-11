--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 					LinguisticType)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'JFD_Semitic');
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',		'AfriAsiaAust',			69,		65,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'Asia',					17,		42,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'Cordiform',			49,		30,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'EarthMk3',				45,		65,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'GreatestEarth',		67,		49,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'Orient',				59,		73,		null,	null,	null),
		-- ('CIVILIZATION_JFD_KHAZARIA_BULAN',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'Yagem',				43,		65,		null,	null,	null),
		('CIVILIZATION_JFD_KHAZARIA_BULAN',		'Yahem',				77,		58,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_KHAZARIA_BULAN',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					CultureType,			DecisionsTag,  IdealsTag,	  SplashScreenTag, SoundtrackTag)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'CULTURE_JFD_STEPPE',   'JFD_Steppe',  'JFD_Semitic', 'JFD_Steppe',	   'JFD_Semitic');
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_KHAZARIA_BULAN')
WHERE Type = 'CIVILIZATION_JFD_KHAZARIA_BULAN';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 					GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_KHAZARIA_BULAN',	'GOVERNMENT_JFD_NOMADIC',	 80);
--=======================================================================================================================
--=======================================================================================================================

