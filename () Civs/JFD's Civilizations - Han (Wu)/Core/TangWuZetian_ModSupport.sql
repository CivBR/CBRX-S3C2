--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
DELETE FROM Civilizations_YnAEMP WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_CHINA',	'AfriAsiaAust',			61,     65,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'AfriSouthEuro',		68,		59,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'Americas',				0,		0,		null,	null,	null),
		('CIVILIZATION_CHINA',		'Asia',					70,		45,		null,	null,	null),
		('CIVILIZATION_CHINA',		'Cordiform',			61,		36,		null,	null,	null),
		('CIVILIZATION_CHINA',		'EarthMk3',				87,		61,		null,	null,	null),
		('CIVILIZATION_CHINA',		'EastAsia',				36,		56,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'EuroLargeNew',			0,		0,		null,	null,	null),
		('CIVILIZATION_CHINA',		'GreatestEarth',		87,		50,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'Mesopotamia',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'NorthAtlantic',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'NorthEastAsia',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'NorthWestEurope',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_CHINA',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_CHINA',		'Yagem',				85,		57,		null,	null,	null),
		('CIVILIZATION_CHINA',		'Yahem',				105,	49,		null,	null,	null);
--=======================================================================================================================
--=======================================================================================================================
