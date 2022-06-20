--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('DMS_Ireland_Collins_Decisions.lua');
------------------------------
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 					Type, 									Description)
VALUES	('BUILDING_US_TWELVE_APOSTLES',		'BUILDINGCLASS_US_TWELVE_APOSTLES', 	'TXT_KEY_BUILDING_US_TWELVE_APOSTLES');
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings
		(Type, 						 		BuildingClass, 						Cost,	FaithCost,	GreatWorkSlotType,	GreatWorkCount,	EspionageModifier,	MinAreaSize,	Description, 								Help,										ConquestProb,	IconAtlas,	PortraitIndex)
VALUES	('BUILDING_US_TWELVE_APOSTLES', 	'BUILDINGCLASS_US_TWELVE_APOSTLES',	-1,		-1,			NULL,				-1,				-25,				-1,				'TXT_KEY_BUILDING_US_TWELVE_APOSTLES',		'TXT_KEY_BUILDING_US_TWELVE_APOSTLES_HELP',	0,				NULL,		-1);
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type, 								Description)
VALUES	('POLICY_US_TWELVE_APOSTLES',		'TXT_KEY_POLICY_US_TWELVE_APOSTLES');
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers 
		(PolicyType,						BuildingClassType, 				YieldType, 			YieldMod)
VALUES	('POLICY_US_TWELVE_APOSTLES',		'BUILDINGCLASS_POLICE_STATION',	'YIELD_CULTURE', 	10);
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,	CultureEra)
SELECT	('CIVILIZATION_US_IRELAND'),			CultureType,	CultureEra
FROM ML_CivCultures WHERE (CivType = 'CIVILIZATION_ENGLAND');
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_ENGLAND'
WHERE Type = 'CIVILIZATION_US_IRELAND'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_ENGLAND');
--==========================================================================================================================
-- MASTER TABLES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--Below are the tables required for standard mod support.

CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType text, ColonyName text, LinguisticType text);
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType text, CultureType text, LegislatureName text, OfficeTitle text, GovernmentType text, Weight integer);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
CREATE TABLE IF NOT EXISTS MinorCivilizations_YnAEMP(MinorCivType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
CREATE TABLE IF NOT EXISTS JFD_Civilopedia_HideFromPedia(Type text);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--==========================================================================================================================
-- TOMATEKH'S HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
/*
Map Prefixes:
   
v22
	Cordiform 
    GreatestEarth 
    EuroLarge 
    Yagem
    Yahem 
     
v23
    Aegean 
    AfricaLarge 
    Americas
    Apennine 
    Asia 
    Caribbean
    BritishIsles
    EastAsia 
    EuroGiant 
    Mediterranean 
    Mesopotamia
    NileValley 
    NorthAtlantic
    NorthEastAsia 
    NorthWestEurope
    Pacific
    SouthPacific 
v24
    Adriatic 
    AfriAsiaAust
    AfriGiant 
    AfriSouthEuro 
    AmericasGiant 
    AsiaSmall 
    AsiaSteppeGiant 
    AustralasiaGiant 
    Caucasus 
    CentralAsia
    EuroEastern 
    EuroLargeNew
    IndiaGiant 
    MesopotamiaGiant 
    NorthAmericaGiant 
    NorthAmericaHuge 
    NorthSeaEurope 
    ScotlandIrelandHuge 
    SouthAmericaGiant 
    SouthAmericaLarge 
    SouthAmericaCentralHuge 
    SouthAmericaCentralGiant 
    SouthAsiaHuge 
    SouthPacificGiant 
    WestAfrica 
    IndianOcean 
v25
    AtlanticGiant 
    Australia 
    CaribbeanHuge 
    CentralAfricaLarge 
    Denmark
    EarthMk3
    GermanyHuge	
    Iberia 
    India 
    Indonesia 
    JapanHuge 
    MediterraneanHuge 
    Netherlands
    NorthSeaGiant 
    Orient 
    RussiaLarge
    Patagonia 
    SeaOfJapan
    SouthernAfrica
    Texcoco
    Vietnam 
    Wales 
*/
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,	Y)
VALUES	('CIVILIZATION_US_IRELAND',	'Cordiform',		20,	80),
		('CIVILIZATION_US_IRELAND',	'GreatestEarth',	20,	80),
		('CIVILIZATION_US_IRELAND',	'EuroLarge',		20,	80),
		('CIVILIZATION_US_IRELAND',	'Yagem',			20,	80),
		('CIVILIZATION_US_IRELAND',	'Yahem',			20,	80),
		('CIVILIZATION_US_IRELAND',	'BritishIsles',		20,	80),
		('CIVILIZATION_US_IRELAND',	'EuroGiant',		20,	80),
		('CIVILIZATION_US_IRELAND',	'NorthAtlantic',	20,	80),
		('CIVILIZATION_US_IRELAND',	'NorthWestEurope',	20,	80),
		('CIVILIZATION_US_IRELAND',	'EuroLargeNew',		20,	80),
		('CIVILIZATION_US_IRELAND',	'NorthSeaEurope',	20,	80),
		('CIVILIZATION_US_IRELAND',	'ScotlandIrelandHuge',20,	80),
		('CIVILIZATION_US_IRELAND',	'AtlanticGiant',	20,	80),
		('CIVILIZATION_US_IRELAND',	'EarthMk3',			20,	80),
		('CIVILIZATION_US_IRELAND',	'NorthSeaGiant',	20,	80);
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 					MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_US_IRELAND',			MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CELTS';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- CIVILOPEDIA
--------------------------------------------------------------------------------------------------------------------------
--Any items entered into this table will not show in the Civilopedia. There is no technical limitation as to what can be hidden (I think).
--Note that this mod's functonality requires either JFD's Rise to Power or JFD's Conflict Resolution Patch (no references necessary).
INSERT INTO JFD_Civilopedia_HideFromPedia
		(Type)
VALUES	('BUILDING_US_AUGUST_DESTINY_DEFENSE'),
		('BUILDING_US_PUBLIC_HOUSE_GREAT_WORK_HAPPINESS'),
		('BUILDING_US_PUBLIC_HOUSE_HAPPINESS_IRELAND'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_1'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_2'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_3'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_4'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_5'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_6'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_7'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_8'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_9'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_10'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_11'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_12'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_13'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_14'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_15'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_16'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_17'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_18'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_19'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_20'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_21'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_22'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_23'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_24'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_25'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_26'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_27'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_28'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_29'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_30'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_31'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_32'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_33'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_34'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_35'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_36'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_37'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_38'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_39'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_40'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_41'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_42'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_43'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_44'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_45'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_46'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_47'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_48'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_49'),
		('BUILDING_US_PUBLIC_HOUSE_TOURISM_FOREIGN_CIVS_50'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_1'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_2'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_3'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_4'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_5'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_6'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_7'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_8'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_9'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_10'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_11'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_12'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_13'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_14'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_15'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_16'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_17'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_18'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_19'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_20'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_21'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_22'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_23'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_24'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_25'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_26'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_27'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_28'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_29'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_30'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_31'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_32'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_33'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_34'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_35'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_36'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_37'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_38'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_39'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_40'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_41'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_42'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_43'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_44'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_45'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_46'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_47'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_48'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_49'),
		('BUILDING_US_AUGUST_DESTINY_TOURISM_50'),
		('BUILDING_US_TWELVE_APOSTLES');

--The Civilopedia can also support Leaders be linked under a shared Civilization (e.g. Napoleon and Louis are linked to the France article).
--To do this, specify the shared Civilization as the 'DerivativeCiv' for your Civilization.

--Thanks to Sukritact, you can also fill 'DerivativeCiv' with a text string, which will group this civ with others that also have this text string.
UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_DMS_IRELADS'
WHERE Type = 'CIVILIZATION_US_IRELAND';
--------------------------------------------------------------------------------------------------------------------------
-- LEADER FLAVOURS
--------------------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION'), --0-10. Determines likelihood for annexing a colony, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_MERCENARY'), --0-10. Determines likelihood of taking out Mercenary Contracts, where 0 means never, and 10 means as soon as possible.
		('FLAVOR_JFD_REFORM_GOVERNMENT'), --0-10. Determines Reform preference; corresponding to Left>Centre>Right/Liberal to Authoritarian continuum. 1-4=Left, 5-6=Centre, 7-10=Right. For government issues.
		('FLAVOR_JFD_REFORM_LEGAL'), --same as above for legal issues. 
		('FLAVOR_JFD_REFORM_CULTURE'), --same as above for cultural issues.
		('FLAVOR_JFD_REFORM_ECONOMIC'), --same as above for economic issues. 
		('FLAVOR_JFD_REFORM_EDUCATION'), --same as above for educational issues.
		('FLAVOR_JFD_REFORM_FOREIGN'), --same as above for diplomatic/international issues.
		('FLAVOR_JFD_REFORM_INDUSTRY'), --same as above for industrial/labour issues.
		('FLAVOR_JFD_REFORM_MILITARY'), --same as above for military issues.
		('FLAVOR_JFD_REFORM_RELIGION'), --same as above for religious issues.
		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'), --0-12. Determines the diplomatic penalty/bonus with leaders of a different/same state religion
		('FLAVOR_JFD_SLAVERY'), --0-10. Determines likelihood of enslaving Cities and spending Shackles on Slave Units, where 0 means never, and 10 as much as possible.
		('FLAVOR_JFD_STATE_RELIGION'); --0-12. Determines chance to adopt a State Religion, where 0 means never. 9+ also means this leader will never secularize.

INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,							 Flavor)
VALUES	('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_DECOLONIZATION',		 4),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_MERCENARY',				 6),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 4),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 5), --Scale of Liberal to Authoritarian.
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_LEGAL',			 6), 	
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_CULTURE',		 5),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_ECONOMIC',		 5),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 4),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_FOREIGN',		 7),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_INDUSTRY',		 5),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_MILITARY',		 6),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_REFORM_RELIGION',		 5),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_SLAVERY',				 0),
		('LEADER_DMS_DANIEL_O_CONNELL',	'FLAVOR_JFD_STATE_RELIGION',		 3);
--------------------------------------------------------------------------------------------------------------------------
-- JFD'S CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 					text 			default null,
	CultureType 						text			default null,
	SubCultureType 						text			default null,
	ArtDefineTag						text			default	null,
	DecisionsTag						text			default null,
	DefeatScreenEarlyTag				text			default	null,
	DefeatScreenMidTag					text			default	null,
	DefeatScreenLateTag					text			default	null,
	IdealsTag							text			default	null,
	SplashScreenTag						text			default	null,
	SoundtrackTag						text			default	null,
	UnitDialogueTag						text			default null);
/*
CultureTypes:
  CULTURE_JFD_ABORIGINAL, CULTURE_JFD_ANDEAN, CULTURE_JFD_BANTU, CULTURE_JFD_BHARATA, CULTURE_JFD_CENTRAL, CULTURE_JFD_CLASSICAL, CULTURE_JFD_COLONIAL, CULTURE_JFD_EASTERN, CULTURE_JFD_EAST_INDIES, CULTURE_JFD_GREAT_PLAINS, CULTURE_JFD_HIMALAYAN, CULTURE_JFD_ISLAMIC, CULTURE_JFD_KATUJE, CULTURE_JFD_MANDALA, CULTURE_JFD_MESOAMERICAN, CULTURE_JFD_MESOPOTAMIC, CULTURE_JFD_NORTHERN, CULTURE_JFD_OCEANIC, CULTURE_JFD_ORIENTAL, CULTURE_JFD_PACIFIC, CULTURE_JFD_POLAR, CULTURE_JFD_SAHARAN, CULTURE_JFD_SEMITIC, CULTURE_JFD_STEPPE, CULTURE_JFD_SOUTHERN, CULTURE_JFD_TOTALITARIAN, CULTURE_JFD_WEST_AFRICAN, CULTURE_JFD_WESTERN, CULTURE_JFD_WOODLANDS

 SubCultureType:
  CULTURE_SUB_JFD_CLASSICAL_ROMAN, CULTURE_SUB_JFD_COLONIAL_LATIN, CULTURE_SUB_JFD_EASTERN_BYZANTINE, CULTURE_SUB_JFD_ISLAMIC_TURKIC, CULTURE_SUB_JFD_MESOPOTAMIC_EGYPTIAN, CULTURE_SUB_JFD_NORTHERN_CELTIC, CULTURE_SUB_JFD_ORIENTAL_JAPANESE, CULTURE_SUB_JFD_SEMITIC_ETHIOPIC, CULTURE_SUB_JFD_SOUTHERN_PAPAL, CULTURE_SUB_JFD_WESTERN_BRITISH
  
SplashScreenTags (As above, unless otherwise specified):
   As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
   JFD_ClassicalRoman, JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
  JFD_ClassicalRoman, JFD_ColonialLatin, JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_LATINO, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAPUDUNGUN, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MOHAWK, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SIOUX, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Not recommended as these have few tracks.
*/

--This is an example of support which copies all attributes from an existing civ. 
--For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_SCOTLAND' to the tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_US_IRELAND',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ENGLAND';
--==========================================================================================================================		
--==========================================================================================================================	