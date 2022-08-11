-- ================================================================
-- INTEGERS
-- ================================================================
-- stole this format from DMS
CREATE TABLE IF NOT EXISTS THP_TuvaIntegers(num INTEGER DEFAULT 0);
INSERT INTO THP_TuvaIntegers(num)
VALUES (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12), (13), (14), (15), (16), (17), (18);
-- ================================================================
-- BUILDINGS
-- ================================================================
INSERT INTO BuildingClasses
(Type, DefaultBuilding, Description)
SELECT 'BUILDINGCLASS_THP_SEN_TUVA_SLOT_'||num, 'BUILDING_THP_SEN_TUVA_SLOT_'||num, 'TXT_KEY_BLDG_THP_SEN_TUVA_SLOT_'||num
FROM THP_TuvaIntegers;

INSERT INTO BuildingClasses
(Type, DefaultBuilding, Description)
VALUES  ('BUILDINGCLASS_THP_SEN_TUVA_PRESSURE', 'BUILDING_THP_SEN_TUVA_PRESSURE', 'TXT_KEY_BLDG_THP_SEN_TUVA_PRESSURE');

INSERT INTO Buildings
(Type,                                    BuildingClass, SpecialistCount, GreatWorkSlotType, GreatWorkCount, Cost, FaithCost, Description,                                Help,              PortraitIndex, IconAtlas, NukeImmune, NeverCapture)
SELECT 'BUILDING_THP_SEN_TUVA_SLOT_'||num, 'BUILDINGCLASS_THP_SEN_TUVA_SLOT_'||num,  0, 'GREAT_WORK_SLOT_MUSIC',  1,             -1,   -1,        'TXT_KEY_TRAIT_THP_SEN_TUVA_SHORT',    'TXT_KEY_BLDG_THP_SEN_TUVA_SLOT_'||num, 8, 'EXPANSION_BW_ATLAS_2', 1,   1
FROM THP_TuvaIntegers;

INSERT INTO Buildings
(Type,                                    BuildingClass,            ReligiousPressureModifier,    SpecialistCount, GreatWorkCount, Cost, FaithCost, Description,                                Help,                                    NukeImmune, NeverCapture)
VALUES    ('BUILDING_THP_SEN_TUVA_PRESSURE', 'BUILDINGCLASS_THP_SEN_TUVA_PRESSURE',     10,                             0,               -1,             -1,   -1,        'TXT_KEY_BLDG_THP_SEN_TUVA_PRESSURE',    'TXT_KEY_BLDG_THP_SEN_TUVA_PRESSURE', 1, 1);
