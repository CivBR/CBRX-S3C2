DELETE FROM Civilization_UnitClassOverrides WHERE (UnitClassType = 'UNITCLASS_GALLEY');

-----

UPDATE UnitClasses
SET DefaultUnit = 'UNIT_GALLEY'
WHERE Type = 'UNITCLASS_GALLEY';

-----

-- DELETE FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GALLEY');