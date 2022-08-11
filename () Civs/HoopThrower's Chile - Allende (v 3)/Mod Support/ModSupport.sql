--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------ 
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,                TraitOne,               TraitTwo)
VALUES  ('LEADER_ALLENDE',    'POLICY_INDUSTRIOUS_X',  'POLICY_CREATIVE_X');
------------------------------ 
-- Leaders
------------------------------ 
UPDATE Leaders
SET Description = 'Salvador Allende [ICON_PRODUCTION][ICON_CULTURE]'
WHERE TYPE = 'LEADER_ALLENDE'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_INDUSTRIOUSL_X');
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('AllendeDecisions.lua');
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------ 
UPDATE Civilizations
SET ArtStyleSuffix = '_BRAZIL'
WHERE TYPE = 'CIVILIZATION_CHILE_ALLENDE'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_BRAZIL');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    154,    15);
------------------------------------------------------------    
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    32,        16);
------------------------------------------------------------    
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    15,        7);
------------------------------------------------------------    
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    25,        8);
------------------------------------------------------------  
-- Civilizations_Americas_Giant (Americas Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_Americas_Giant(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_Americas_Giant
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    84,        27);
------------------------------------------------------------  
-- Civilizations_Americas_Standard (Americas Standard)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_Americas_Standard(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_Americas_Standard
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    48,        15);
------------------------------------------------------------  
-- Civilizations_SouthAmericaCentralHugeStartPosition (South Central America Huge)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS Civilizations_SouthAmericaCentralHugeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_SouthAmericaCentralHugeStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    69,        41);
------------------------------------------------------------  
--     Civilizations_SouthAmericaCentralGiantStartPosition (South Central America Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS     Civilizations_SouthAmericaCentralGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO     Civilizations_SouthAmericaCentralGiantStartPosition
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    53,        30);
------------------------------------------------------------  
--     Civilizations_South_America_Giant (South America Giant)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS     Civilizations_South_America_Giant(Type, X, Y, AltX, AltY);
INSERT INTO     Civilizations_South_America_Giant
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    45,        49);
------------------------------------------------------------  
--     Civilizations_South_America_Large (South America Large)
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS     Civilizations_South_America_Large(Type, X, Y, AltX, AltY);
INSERT INTO     Civilizations_South_America_Large
        (Type,                                X,        Y)
VALUES    ('CIVILIZATION_CHILE_ALLENDE',    38,        28);
--------------------------------------------------
------------------------------------------------------------   
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CHILE_ALLENDE', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CHILE_ALLENDE', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CHILE_ALLENDE', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_EastAsiaRequestedResource (East Asia)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CHILE_ALLENDE', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------   
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(TYPE, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
        (TYPE,                      Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT  'CIVILIZATION_CHILE_ALLENDE', Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE TYPE = 'CIVILIZATION_BRAZIL';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------ 
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
        (CivType,                       CultureType,                CultureEra)
VALUES  ('CIVILIZATION_CHILE_ALLENDE',    'MOD_SOUTH_AMERICA',   'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS
JFD_GlobalUserSettings (
    TYPE                                            text                                        DEFAULT NULL,
    VALUE                                           INTEGER                                     DEFAULT 1);
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------ 
CREATE TABLE IF NOT EXISTS
Civilization_JFD_CultureTypes(
    CivilizationType                            text    REFERENCES Civilizations(TYPE)          DEFAULT NULL,
    CultureType                                 text                                            DEFAULT NULL,
    ArtDefineTag                                text                                            DEFAULT NULL,
    IdealsTag                                   text                                            DEFAULT NULL,
    SplashScreenTag                             text                                            DEFAULT NULL,
    SoundtrackTag                               text                                            DEFAULT NULL,
    UnitDialogueTag                             text                                            DEFAULT NULL);
 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,          ArtDefineTag, CultureType,   IdealsTag,     SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_CHILE_ALLENDE', ArtDefineTag, CultureType,   IdealsTag,     SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_LATINO'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------ 
-- Civilizations
------------------------------ 
UPDATE Civilizations
SET SoundtrackTag = 'JFD_ColonialLatin'
WHERE TYPE = 'CIVILIZATION_CHILE_ALLENDE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE TYPE = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND VALUE = 1);
--==========================================================================================================================   
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------   
INSERT INTO Leader_Flavors
        (LeaderType,                        FlavorType,                 Flavor)
VALUES  ('LEADER_ALLENDE',    'FLAVOR_JFD_MERCENARY',     4);
--==========================================================================================================================   
-- JFD PIETY & SOVEREIGNTY
--==========================================================================================================================   
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    LegislatureName                 text                                                        DEFAULT NULL,
    OfficeTitle                     text                                                        DEFAULT NULL,
    GovernmentType                  text                                                        DEFAULT NULL,
    Weight                          INTEGER                                                     DEFAULT 0);
 
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName,                                            OfficeTitle,                                                        GovernmentType,             Weight)
SELECT  'CIVILIZATION_CHILE_ALLENDE', 'TXT_KEY_JFD_LEGISLATURE_NAME_CIVILIZATION_CHILE_ALLENDE',    'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE',    'GOVERNMENT_JFD_REPUBLIC',  100
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_BRAZIL';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, 				UniqueName)
VALUES	('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_CONSERVATIVE',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_LIBERAL',	'TXT_KEY_JFD_PARTY_JFD_LIBERAL_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_COMMUNIST',	'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_CLERGY',	'TXT_KEY_JFD_PARTY_JFD_CLERGY_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE',	'PARTY_JFD_FASCIST',	'TXT_KEY_JFD_PARTY_JFD_FASCIST_CHILE_ALLENDE'),
		('CIVILIZATION_CHILE_ALLENDE', 'PARTY_JFD_SOCIALIST', 'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_CHILE_ALLENDE');
------------------------------------------------------------   
-- Civilization_JFD_HeadsOfGovernment  
------------------------------------------------------------   
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (   
    CivilizationType                text        REFERENCES Civilizations(TYPE)                  DEFAULT NULL,
    CultureType                     text                                                        DEFAULT NULL,
    HeadOfGovernmentName            text                                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,              	HeadOfGovernmentName)
VALUES  ('CIVILIZATION_CHILE_ALLENDE',    	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_1'),
        ('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_2'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_3'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_4'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_5'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_6'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_7'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_8'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_9'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_10'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_11'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_12'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_13'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_14'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_15'),
		('CIVILIZATION_CHILE_ALLENDE',		'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_16');
------------------------------------------------------------           
-- Flavors
------------------------------------------------------------   
INSERT OR REPLACE INTO Flavors
        (TYPE)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION'),
        ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
        (LeaderType,                FlavorType,                         Flavor)
VALUES  ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_GOVERNMENT',     10),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_CULTURE',        8),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_ECONOMIC',       6),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_FOREIGN',        4),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_INDUSTRY',       9),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_MILITARY',       3),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_REFORM_RELIGION',       4),
        ('LEADER_ALLENDE',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE', 2);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(TYPE)  DEFAULT NULL,
    CurrencyType                    text                                        DEFAULT NULL);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,          CurrencyType)
VALUES  ('CIVILIZATION_CHILE_ALLENDE',    'TXT_KEY_JFD_CURRENCY_CIVILIZATION_CHILE_ALLENDE_1');

--Language_en_US

insert into Language_en_US (Tag, Text)
values 

('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_1', 'Pablo Neruda'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_2', 'Alberto Baltra'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_3', 'Rafael Tarud'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_4', 'Jacques Chonchol'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_5', 'Jorge Alessandri Rodriguez'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_6', 'Radomiro Tomic Romero'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_7', 'Eduardo Frei Montalva'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_8', 'Julio Duran Neumann'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_9', 'Jorge Prat Echaurren'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_10', 'Luis Bossay Leiva'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_11', 'Antonio Zamorano Herrera'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_12', 'Mamerto Figeroa'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_13', 'Rudecindo Ortega'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_14', 'Humberto Mewes'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_15', 'Guillermo del Pedregal'),
('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_CHILE_ALLENDE_16', 'Francisco Cuevas Mackenna'),
('TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_CHILE_ALLENDE', 'Democracia Cristiana'),
('TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_CHILE_ALLENDE', 'Movimiento de Acción Popular Unitaria'),
('TXT_KEY_JFD_PARTY_JFD_LIBERAL_CHILE_ALLENDE', 'Confederación de la Democracia'),
('TXT_KEY_JFD_PARTY_JFD_COMMUNIST_CHILE_ALLENDE', 'Unidad Popular'),
('TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_CHILE_ALLENDE', 'Democracia Radical'),
('TXT_KEY_JFD_PARTY_JFD_CLERGY_CHILE_ALLENDE', 'Izquierda Cristiana'),
('TXT_KEY_JFD_PARTY_JFD_FASCIST_CHILE_ALLENDE', 'Movimiento Revolucionario Nacional Sindicalista'),
('TXT_KEY_JFD_CURRENCY_CIVILIZATION_CHILE_ALLENDE_1', 'Peso'),
('TXT_KEY_JFD_PARTY_JFD_SOCIALIST_CHILE_ALLENDE', 'Union Socialista Popular');

