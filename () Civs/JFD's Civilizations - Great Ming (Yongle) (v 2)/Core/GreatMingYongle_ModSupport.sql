--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						ColonyName, LinguisticType)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE',	ColonyName, LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'Asia',					70,		45,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'Cordiform',			61,		36,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'EarthMk3',				87,		61,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'GreatestEarth',		87,		50,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'NorthAtlantic',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'NorthEastAsia',		27,		31,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'Yagem',				85,		57,		null,	null,	null),
		('CIVILIZATION_JFD_GREAT_MING_YONGLE',		'Yahem',				105,	49,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_GREAT_MING_YONGLE',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_GREAT_MING_YONGLE')
WHERE Type = 'CIVILIZATION_JFD_GREAT_MING_YONGLE';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_GREAT_MING_YONGLE',	'GOVERNMENT_JFD_IMPERIAL',	 80);
--=======================================================================================================================
--=======================================================================================================================

