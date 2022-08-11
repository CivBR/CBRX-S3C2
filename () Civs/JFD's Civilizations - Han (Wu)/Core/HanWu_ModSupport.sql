--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 				LinguisticType)
SELECT	'CIVILIZATION_JFD_HAN_WU',		LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
DELETE FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,				MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_HAN_WU',	'AfriAsiaAust',			61,     65,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'AfriSouthEuro',		68,		59,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'Asia',					55,		45,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'Cordiform',			60,		33,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'EarthMk3',				83,		60,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'EastAsia',				34,		55,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'GreatestEarth',		83,		48,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_HAN_WU',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'Yagem',				79,		55,		null,	null,	null),
		('CIVILIZATION_JFD_HAN_WU',		'Yahem',				101,	49,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,				MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_HAN_WU',		MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,				ArtDefineTag, CultureType,	SubCultureType,	DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_HAN_WU',		ArtDefineTag, CultureType,	SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_HAN_WU')
WHERE Type = 'CIVILIZATION_JFD_HAN_WU'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_HAN_WU',		'GOVERNMENT_JFD_MANDATE',	 80),
		('CIVILIZATION_JFD_HAN_WU',		'GOVERNMENT_JFD_IMPERIAL',	 70);
--=======================================================================================================================
--=======================================================================================================================
