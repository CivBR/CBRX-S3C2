--==========================================================================================================================
--This SQL file handles most of the mod support.
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_MediterraneanStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			42,		54,		null,	null);
--==========================================================================================================================
-- Civilizations_MesopotamiaStartPosition
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_MesopotamiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MesopotamiaStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			102,	28,		null,	null);
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			42,		54,		null,	null);
--==========================================================================================================================
-- Civilizations_YahemStartPosition (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			77,		50,		null,	null);
--==========================================================================================================================
-- Civilizations_CordiformStartPosition (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			69,		22,		null,	null);
--==========================================================================================================================
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			65,		41,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroLargeStartPosition (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			69,		22,		null,	null);
--==========================================================================================================================
-- Civilizations_EuroGiantStartPosition (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
			(Type,									X,		Y,		AltX,	AltY)
VALUES		('CIVILIZATION_TCM_ASSYRIA',			153,	24,		null,	null);
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Civilizations_YagemRequestedResource (Earth Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_YahemRequestedResource (Earth Huge)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_CordiformRequestedResource (Earth Standard)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_CordiformRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_CordiformRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_CordiformRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_EuroLargeRequestedResource (Europe Large)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_EuroGiantRequestedResource (Europe Giant)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 										Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_TCM_ASSYRIA'),			Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ASSYRIA';
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Bingle's Civ IV Traits
--==========================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,		TraitOne,					TraitTwo)
VALUES      ('LEADER_TCM_SAMMURAMAT',	'POLICY_AGGRESSIVE_X',		'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Sammuramat [POLICY_AGGRESSIVE_X][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_TCM_SAMMURAMAT' END) 
WHERE Type = 'LEADER_TCM_SAMMURAMAT';

CREATE TRIGGER CivIVTraitsTCMSammuramat
AFTER INSERT ON Leaders WHEN 'LEADER_TCM_SAMMURAMAT' = NEW.Type
BEGIN
	UPDATE Leaders
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Sammuramat [POLICY_AGGRESSIVE_X][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_TCM_SAMMURAMAT' END) 
	WHERE Type = 'LEADER_TCM_SAMMURAMAT';
END;		
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ASSYRIA' )
	THEN '_ASSYRIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_TCM_ASSYRIA';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_TCM_ASSYRIA',	'ARABIAN ',		'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
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
			(CivilizationType, 				ColonyName,		LinguisticType)
VALUES		('CIVILIZATION_TCM_ASSYRIA',	null,			'JFD_Mesopotamian');
--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================			
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,				FlavorType,								Flavor)
VALUES		('LEADER_TCM_SAMMURAMAT',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		0);
--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,				 FlavorType,                 Flavor)
VALUES  ('LEADER_TCM_SAMMURAMAT',    'FLAVOR_JFD_MERCENARY',     4);
--==========================================================================================================================
UPDATE Buildings SET PrereqTech = 
	( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
		THEN 'TECH_CALENDAR'
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
		THEN 'TECH_JFD_PRIESTHOOD'
		ELSE 'TECH_PHILOSOPHY' END ) END
	) WHERE Type = 'BUILDING_TCM_EKALLU';

CREATE TRIGGER SammuramatPriesthoodTrigger
AFTER INSERT ON Technologies WHEN 'TECH_JFD_PRIESTHOOD' = NEW.Type
BEGIN
	UPDATE Buildings SET PrereqTech = 
		( CASE WHEN NOT EXISTS(SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_ASSYRIA' )
			THEN 'TECH_CALENDAR'
			ELSE ( CASE WHEN EXISTS(SELECT Type FROM Technologies WHERE Type = 'TECH_JFD_PRIESTHOOD' )
			THEN 'TECH_JFD_PRIESTHOOD'
			ELSE 'TECH_PHILOSOPHY' END ) END
		) WHERE Type = 'BUILDING_TCM_EKALLU';
END;
--------------------------------	
-- Historical Religions Support
--------------------------------	
UPDATE Civilization_Religions SET ReligionType = 
( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type='RELIGION_ASHURISM' )
	THEN 'RELIGION_ASHURISM'
	ELSE 'RELIGION_ORTHODOXY' END
) WHERE CivilizationType = 'CIVILIZATION_TCM_ASSYRIA';

CREATE TRIGGER ReligionTCMassyria
AFTER INSERT ON Religions WHEN 'RELIGION_ASHURISM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_ASHURISM'
	WHERE CivilizationType = 'CIVILIZATION_TCM_ASSYRIA';
END;
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('SammuramatDecisions.lua');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('SammuramatEvents.lua');
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_TCM_ASSYRIA',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ASSYRIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mesopotamic'
WHERE Type = 'CIVILIZATION_TCM_ASSYRIA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mesopotamic')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1)
--==========================================================================================================================
--==========================================================================================================================