--==========================================================================================================================
-- STANDARD MOD SUPPORT
--==========================================================================================================================
--The following mod supports have been preserved:
---Cultural Diversity. This is the most important one to support (at a minimum, the Culture Type) because other supports will draw from it.
---YnAEMP v25. Recommend only bother with AltXY/AltCapital when your civ's Capital is the exact same as another's (e.g. _CHINA and Constantinople).
---JFDLC Leader Flavours.
---Colony names (where applicable). Linguistic type should be omitted.

--Please note these are the STANDARD mod supports, that is, they are supported by every custom civ.
--This list does not include mod support for mods like Enlightenment Era. The support required for these are case-sensitive.
--------------------------------------------------------------------------------------------------------------------------
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
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings(Type text, Value integer default 1);
--------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GEDEMON's YNAEMP (+JFD's v23 / 24 / 25)
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
/*
Map Prefixes:
   
v22
	Cordiform 
    GreatestEarth 
    Yagem
    Yahem 
     
v23
    Asia 
    EastAsia 
    Pacific
v24
    AfriAsiaAust
    AsiaSmall 
    SouthAsiaHuge 
    IndianOcean 
v25
    EarthMk3
    India 
*/

INSERT INTO Civilizations_YnAEMP
		(CivilizationType,			MapPrefix,			X,	Y,		AltX,	AltY,	AltCapitalName)
VALUES	('CIVILIZATION_ERW_KOKANG',	'Cordiform',		61,	28,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'GreatestEarth',	82,	40,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'Yagem',			72,	47,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'Yahem',			98,	43,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'Asia',				53,	37,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'EastAsia',			23,	48,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'Pacific',			23,	47,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'AfriAsiaAust',		92,	57,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'AsiaSmall',		 6,	18,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'SouthAsiaHuge',	84,	76,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'IndianOcean',		68,	67,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'EarthMk3',			78,	50,		null,	null,	null),
		('CIVILIZATION_ERW_KOKANG',	'India',			84,	76,		null,	null,	null);

--CapitalName and AltCapitalName set a custom City Name on settlement at XY/AltXY coordinates, if needed. Should be TXT_KEY that refers to a string defined elsewhere.
--------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YagemRequestedResource
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType, 		   MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_ERW_KOKANG', MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- JFDLC
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 			LinguisticType)
SELECT	'CIVILIZATION_ERW_KOKANG',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CHINA';
--------------------------------------------------------------------------------------------------------------------------
-- GOVERNMENTS
--------------------------------------------------------------------------------------------------------------------------	
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_Governments
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 				GovernmentType,					Weight)
VALUES	('CIVILIZATION_ERW_KOKANG', 	'GOVERNMENT_JFD_PRINCIPALITY',	60),
		('CIVILIZATION_ERW_KOKANG', 	'GOVERNMENT_JFD_MERCHANT',		40);

--Note that multiple entries are valid.

------------------------------------------------------------------------------------
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
		(LeaderType,				FlavorType,							 Flavor)
VALUES	('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_DECOLONIZATION',		 4),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_MERCENARY',				 9),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 1),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_GOVERNMENT',		 8), 
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_LEGAL',			 9), 	
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_CULTURE',		 2),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_ECONOMIC',		 9),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_EDUCATION',	 	 8),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_FOREIGN',		 9),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_INDUSTRY',		 2),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_MILITARY',		 4),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_REFORM_RELIGION',		 5),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_SLAVERY',				 3),
		('LEADER_ERW_OLIVE_YANG',	'FLAVOR_JFD_STATE_RELIGION',		 2);
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
  CULTURE_JFD_ABORIGINAL, CULTURE_JFD_ANDEAN, CULTURE_JFD_BANTU, CULTURE_JFD_BHARATA, CULTURE_JFD_CENTRAL, CULTURE_JFD_CLASSICAL, CULTURE_JFD_COLONIAL, CULTURE_JFD_EASTERN, CULTURE_JFD_EAST_INDIES, CULTURE_JFD_GREAT_PLAINS, CULTURE_JFD_HIMALAYAN, CULTURE_JFD_IRANIAN, CULTURE_JFD_ISLAMIC, CULTURE_JFD_KATUJE, CULTURE_JFD_MANDALA, CULTURE_JFD_MESOAMERICAN, CULTURE_JFD_MESOPOTAMIC, CULTURE_JFD_NORTHERN, CULTURE_JFD_OCEANIC, CULTURE_JFD_ORIENTAL, CULTURE_JFD_PACIFIC, CULTURE_JFD_POLAR, CULTURE_JFD_SAHARAN, CULTURE_JFD_SEMITIC, CULTURE_JFD_STEPPE, CULTURE_JFD_SOUTHERN, CULTURE_JFD_TOTALITARIAN, CULTURE_JFD_WEST_AFRICAN, CULTURE_JFD_WESTERN, CULTURE_JFD_WOODLANDS

 SubCultureType:
  CULTURE_SUB_JFD_CLASSICAL_ROMAN, CULTURE_SUB_JFD_COLONIAL_LATIN, CULTURE_SUB_JFD_EASTERN_BYZANTINE, CULTURE_SUB_JFD_ISLAMIC_TURKIC, CULTURE_SUB_JFD_MESOPOTAMIC_EGYPTIAN, CULTURE_SUB_JFD_NORTHERN_CELTIC, CULTURE_SUB_JFD_ORIENTAL_JAPANESE, CULTURE_SUB_JFD_SEMITIC_ETHIOPIC, CULTURE_SUB_JFD_SOUTHERN_PAPAL, CULTURE_SUB_JFD_WESTERN_BRITISH
  
SplashScreenTags (As above, unless otherwise specified):
   As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
   JFD_ClassicalRoman, JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
  JFD_ClassicalRoman, JFD_ColonialLatin, JFD_EasternByzantine, JFD_IslamicTurkic, JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal, JFD_WesternBritish
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_LATINO, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAPUDUNGUN, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MOHAWK, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SIOUX, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Not recommended as these have few tracks.
*/

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_ERW_KOKANG',	ArtDefineTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CHINA';
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag)
SELECT	'CIVILIZATION_ERW_KOKANG',	CultureType, SubCultureType, DecisionsTag, IdealsTag, SplashScreenTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SIAM';

UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ERW_KOKANG')
WHERE Type = 'CIVILIZATION_ERW_KOKANG';
--==========================================================================================================================		
--==========================================================================================================================		
--==========================================================================================================================
-- UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT INTO Diplomacy_Responses
		(LeaderType,				ResponseType,					Response,												Bias)
VALUES	('LEADER_ERW_OLIVE_YANG',		'RESPONSE_INFLUENTIAL_ON_AI',	'TXT_KEY_LEADER_ERW_OLIVE_YANG_INFLUENTIAL_ON_AI_1',		1),
		('LEADER_ERW_OLIVE_YANG',		'RESPONSE_INFLUENTIAL_ON_HUMAN','TXT_KEY_LEADER_ERW_OLIVE_YANG_INFLUENTIAL_ON_HUMAN_1',	1);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_CHINA'
WHERE Type = 'CIVILIZATION_ERW_KOKANG'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_CHINA');