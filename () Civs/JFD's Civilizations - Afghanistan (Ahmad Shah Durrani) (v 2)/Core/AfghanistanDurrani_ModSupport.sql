--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						LinguisticType)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_PERSIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'AfriAsiaAust',			69,		65,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Asia',					17,		42,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Cordiform',			54,		23,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'EarthMk3',				57,		52,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'GreatestEarth',		71,		40,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'NorthWestEurope',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Orient',				89,		52,		null,	null,	null),
		-- ('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Yagem',				52,		52,		null,	null,	null),
		('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'Yahem',				85,		48,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_AFGHANISTAN_DURRANI')
WHERE Type = 'CIVILIZATION_JFD_AFGHANISTAN_DURRANI';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 							GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_AFGHANISTAN_DURRANI',	'GOVERNMENT_JFD_IMPERIAL',	 80);
--=======================================================================================================================
--=======================================================================================================================

