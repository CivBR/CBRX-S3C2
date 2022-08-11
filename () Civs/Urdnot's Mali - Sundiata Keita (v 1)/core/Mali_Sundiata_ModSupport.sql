--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,								LinguisticType)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'JFD_Niger_Congo');
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,								MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	--('CIVILIZATION_US_MALI_SUNDIATA',	'AfriAsiaAust',			30,  	41,		28,		37,		null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'AfricaLarge',			9,  	49,		27,		37,		null),
		--('CIVILIZATION_US_MALI_SUNDIATA',	'AfriSouthEuro',		38, 	35,		37,	    31,		null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'Cordiform',			30,  	14,		36,		11,		null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'EarthMk3',				28,  	28,		26,		25,		null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_US_MALI_SUNDIATA','EuroLargeNew',			13,		2,		null,	null,	null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'GreatestEarth',		42,  	26,		51,		19,		null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','Mesopotamia',			68,		35,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_US_MALI_SUNDIATA','SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'Yagem',				9,  	40,		22,		31,		null),
		('CIVILIZATION_US_MALI_SUNDIATA',	'Yahem',				55,  	38,		63,		31,		null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,								MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_US_MALI_SUNDIATA',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_SONGHAI';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,								ArtDefineTag, 		CultureType, 				DecisionsTag, 		IdealsTag, 			SplashScreenTag, 	SoundtrackTag, 		UnitDialogueTag)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'JFD_WEST_AFRICAN', 'CULTURE_JFD_WEST_AFRICAN', 'JFD_WestAfrican', 	'JFD_WestAfrican', 	'JFD_WestAfrican', 	'JFD_WestAfrican', 	'AS2D_SOUND_JFD_FRENCH');
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_US_MALI_SUNDIATA')
WHERE Type = 'CIVILIZATION_US_MALI_SUNDIATA';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 								GovernmentType,				 Weight)
VALUES	('CIVILIZATION_US_MALI_SUNDIATA',	'GOVERNMENT_JFD_IMPERIAL',	 100);
--=======================================================================================================================
--=======================================================================================================================

