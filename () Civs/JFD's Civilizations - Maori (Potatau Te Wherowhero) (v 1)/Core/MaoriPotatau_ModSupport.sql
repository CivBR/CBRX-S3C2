--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 					 LinguisticType)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU',	 LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Asia',					0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Cordiform',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_MAORI_POTATAU',		'EarthMk3',				117,	13,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_MAORI_POTATAU',		'GreatestEarth',		3,		10,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_MAORI_POTATAU',	'Orient',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_MAORI_POTATAU',		'SouthPacific',			20,		18,		null,	null,	null),
		('CIVILIZATION_JFD_MAORI_POTATAU',		'Yagem',				1,		12,		null,	null,	null),
		('CIVILIZATION_JFD_MAORI_POTATAU',		'Yahem',				112,	12,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_MAORI_POTATAU',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_POLYNESIA';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_MAORI_POTATAU')
WHERE Type = 'CIVILIZATION_JFD_MAORI_POTATAU';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 					 GovernmentType,			 Weight)
VALUES	('CIVILIZATION_JFD_MAORI_POTATAU',   'GOVERNMENT_JFD_MONARCHY',	 100);
--=======================================================================================================================
--=======================================================================================================================
