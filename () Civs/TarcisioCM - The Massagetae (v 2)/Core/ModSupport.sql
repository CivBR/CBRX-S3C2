--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('tcm_MassagetaeDecisions.lua');
--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,			 TraitOne,               TraitTwo)
VALUES      ('LEADER_TCM_TOMYRIS',	 'POLICY_AGGRESSIVE_X',	 'POLICY_PROTECTIVE_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Tomyris [ICON_WAR][ICON_STRENGTH]'
	ELSE 'TXT_KEY_LEADER_TCM_TOMYRIS' END) 
WHERE Type = 'LEADER_TCM_TOMYRIS';

CREATE TRIGGER CivIVTraitsMassagetae
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_TOMYRIS' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Tomyris [ICON_WAR][ICON_STRENGTH]'
		ELSE 'TXT_KEY_LEADER_TCM_TOMYRIS' END) 
	WHERE Type = 'LEADER_TCM_TOMYRIS';
END;
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_PERSIA' )
	THEN '_PERSIA'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_TCM_MASSAGETAE';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition 
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_TCM_MASSAGETAE',			52,		65);
------------------------------
-- Civilizations_YahemStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_TCM_MASSAGETAE',			82,		56);
------------------------------
-- Civilizations_CordiformStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_TCM_MASSAGETAE',			52,		33);
------------------------------
-- Civilizations_GreatestEarthStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_TCM_MASSAGETAE',			71,		48);
------------------------------
-- Civilizations_AsiaStartPosition 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
		(Type,								X,		Y)
VALUES	('CIVILIZATION_TCM_MASSAGETAE',			7,		61);
------------------------------
-- Civilizations_YagemRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'),	Req1,	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
------------------------------
-- Civilizations_YahemRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 							Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'),	Req1,	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
------------------------------
-- Civilizations_GreatestEarthRequestedResource 
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 							Req1,				Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_MASSAGETAE'),	Req1,	1,		Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_PERSIA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_MASSAGETAE',		'ASIAN',		'ANY');
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,				CultureType,		SplashScreenTag,	SoundtrackTag)
VALUES		('CIVILIZATION_TCM_MASSAGETAE',		'JFD_Steppe',		'JFD_Steppe',		'JFD_Steppe');
------------------------------
-- Civilizations
------------------------------
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Steppe' )
	THEN 'JFD_Steppe'
	ELSE 'Persia' END) 
WHERE Type = 'CIVILIZATION_TCM_MASSAGETAE';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('LEADER_TCM_TOMYRIS', 			null,									'JFD_Indo_Iranian');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors	
			(LeaderType,			FlavorType,						Flavor)
VALUES		('LEADER_TCM_TOMYRIS',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	2);
--------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_SAIRIMAISM' )
	THEN 'RELIGION_SAIRIMAISM'
	ELSE 'RELIGION_TENGRIISM' END
) WHERE CivilizationType = 'CIVILIZATION_TCM_MASSAGETAE';

CREATE TRIGGER ReligionMassagetae
AFTER INSERT ON Religions WHEN 'RELIGION_SAIRIMAISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_SAIRIMAISM'
	WHERE CivilizationType = 'CIVILIZATION_TCM_MASSAGETAE';
END;

