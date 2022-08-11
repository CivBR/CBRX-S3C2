INSERT INTO Civilization_Religions
                (CivilizationType,    ReligionType)
SELECT        Type,            ('RELIGION_CHRISTIANITY')
FROM Civilizations WHERE Type = 'CIVILIZATION_MUISCA';

UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_CHIMINAGUA" )
		THEN "RELIGION_CHIMINAGUA"
		ELSE "RELIGION_CHRISTIANITY" END
	) WHERE CivilizationType = "CIVILIZATION_MUISCA";