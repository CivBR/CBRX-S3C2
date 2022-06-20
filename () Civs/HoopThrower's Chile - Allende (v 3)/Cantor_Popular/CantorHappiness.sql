--===================================================================================================
--If you ever want to use this for something else. Put this part of the code in it's own file. 
--===================================================================================================
ALTER TABLE GreatWorks ADD COLUMN 'HT_UnmoddedHappinessFromGreatWork' INTEGER DEFAULT 0;
ALTER TABLE GreatWorks ADD COLUMN 'HT_HappinessFromGreatWork' INTEGER DEFAULT 0;

INSERT OR REPLACE INTO BuildingClasses
		(Type,												DefaultBuilding,								NoLimit,	Description)
VALUES  ('BUILDINGCLASS_HT_GREAT_WORK_HAPPINESS',			'BUILDING_HT_GREAT_WORK_HAPPINESS',				1,			'TXT_KEY_BUILDING_HT_HAPPINESS_DUMMIES'),
		('BUILDINGCLASS_HT_GREAT_WORK_UNMODDED_HAPPINESS',	'BUILDING_HT_GREAT_WORK_UNMODDED_HAPPINESS',	1,			'TXT_KEY_BUILDING_HT_HAPPINESS_DUMMIES');
INSERT OR REPLACE INTO Buildings
		(Type,											BuildingClass,										Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	NeverCapture,	NukeImmune,	Description)
VALUES	('BUILDING_HT_GREAT_WORK_HAPPINESS',			'BUILDINGCLASS_HT_GREAT_WORK_HAPPINESS',			-1,		-1,			-1,				NULL,		1,				1,			'TXT_KEY_BUILDING_HT_HAPPINESS_DUMMIES'),
		('BUILDING_HT_GREAT_WORK_UNMODDED_HAPPINESS',	'BUILDINGCLASS_HT_GREAT_WORK_UNMODDED_HAPPINESS',	-1,		-1,			-1,				NULL,		1,				1,			'TXT_KEY_BUILDING_HT_HAPPINESS_DUMMIES');
UPDATE Buildings 
SET Happiness = 1
WHERE Type = 'BUILDING_HT_GREAT_WORK_HAPPINESS';
UPDATE Buildings 
SET UnmoddedHappiness = 1
WHERE Type = 'BUILDING_HT_GREAT_WORK_UNMODDED_HAPPINESS';
--===================================================================================================
--===================================================================================================


UPDATE GreatWorks 
SET 

HT_HappinessFromGreatWork			= 2,	--Gives this much local happiness per Great Work
HT_UnmoddedHappinessFromGreatWork	= 0		--Gives this much global happiness per Great Work

WHERE Type IN (SELECT GreatWorkType FROM Unit_UniqueNames 

WHERE UnitType = 'UNIT_CANTOR_POPULAR'	--Change the UNIT_MUSICIAN to whatever the unit is. 
); 