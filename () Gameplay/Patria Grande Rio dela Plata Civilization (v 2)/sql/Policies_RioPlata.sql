--================================================================================================================
-- Rio dela Plata Dummy Policies
--================================================================================================================
-- Policies
--------------------
INSERT INTO Policies
		(Type,							GridX,	GridY,	GoldenAgeTurns,	WonderProductionModifier,	BuildingProductionModifier, GreatPeopleRateModifier,	MinorFriendshipMinimum,		MilitaryProductionModifier)
VALUES	('POLICY_PG_CONGRESOTUCUMAN',	1000,	1000,	10,				25,							10,							25,							0,							0),
		('POLICY_PG_LOGIALAUTARO',		1000,	1000,	0,				0,							0,							0,							-10,						15),
		('POLICY_PG_NO_LOGIALAUTARO',	1000,	1000,	0,				0,							0,							0,							15,							-15),
		('POLICY_PG_NO_LOGIALAUTARO_2',	1000,	1000,	0,				0,							0,							0,							15,							0),
		('POLICY_PG_GOLDENAGE_MATE',	1000,	1000,	0,				0,							0,							0,							0,							0),
		('POLICY_PG_NO_GOLDENAGE_MATE',	1000,	1000,	0,				0,							0,							0,							0,							0);


--------------------
-- Policy_ImprovementYieldChanges
--------------------
INSERT INTO Policy_ImprovementYieldChanges
		(PolicyType,					ImprovementType,						YieldType,		Yield)
VALUES	('POLICY_PG_GOLDENAGE_MATE',	'IMPROVEMENT_PG_YERBAMATE_PLANTATION',	'YIELD_FOOD',	1);

--================================================================================================================