--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 					 LinguisticType)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	 LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,						MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_GPUZ_KAYAPO',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'Americas',				55,		28,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'Cordiform',			18,		14,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'EarthMk3',				160,	31,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'EastAsia',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'EuroLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'GreatestEarth',		29,		17,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'Mesopotamia',			0,		0,		null,	null,	null),
		--('CIVILIZATION_GPUZ_KAYAPO',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_GPUZ_KAYAPO',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'Yagem',				164,	29,		null,	null,	null),
		('CIVILIZATION_GPUZ_KAYAPO',	'Yahem',				39,		28,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType,				  SubCultureType,	DecisionsTag,		DefeatScreenEarlyTag,				  DefeatScreenMidTag,				  DefeatScreenLateTag,					IdealsTag,			SplashScreenTag,	SoundtrackTag,		 UnitDialogueTag)
SELECT	'CIVILIZATION_GPUZ_KAYAPO',	ArtDefineTag, 'CULTURE_JFD_AMAZONIAN', null,				'JFD_Amazonian', 'DefeatScreenEarlyAmazonian.dds',  'DefeatScreenMidAmazonian.dds',  'DefeatScreenLateAmazonian.dds',	'JFD_Amazonian', 'JFD_Amazonian', 'JFD_Amazonian',  UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_GPUZ_KAYAPO')
WHERE Type = 'CIVILIZATION_GPUZ_KAYAPO'
AND EXISTS (SELECT SoundID FROM Audio_Sounds WHERE SoundID = 'SND_JFD_ABORIGINAL_PEACE_01');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,			 Weight)
VALUES	('CIVILIZATION_GPUZ_KAYAPO',	'GOVERNMENT_JFD_TRIBAL',	 100);	
--=======================================================================================================================
--=======================================================================================================================