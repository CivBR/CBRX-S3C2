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
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);


INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag,		CultureType,				DefeatScreenEarlyTag,			DefeatScreenMidTag,				DefeatScreenLateTag,				IdealsTag,			SplashScreenTag,		SoundtrackTag,			UnitDialogueTag)
VALUES	('CIVILIZATION_PG_RIODELAPLATA',	'_JFD_WESTERN',		'CULTURE_JFD_COLONIAL',		'DefeatScreenEarlyAndean.dds',	'DefeatScreenMidAndean.dds',	'DefeatScreenLateBrazil.dds',		'JFD_Colonial',		'JFD_ColonialLatin',	'Brazil',				'AS2D_SOUND_JFD_LATINO');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_ColonialLatin'
WHERE Type = 'CIVILIZATION_PG_RIODELAPLATA'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_ColonialLatin')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
---------------------------------------