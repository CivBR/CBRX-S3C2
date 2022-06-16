UPDATE ArtDefine_UnitMemberCombats SET MoveRate = 10*MoveRate;
UPDATE ArtDefine_UnitMemberCombats SET ShortMoveRate = 10*ShortMoveRate;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMin = 10*TurnRateMin WHERE MoveRate > 0;
UPDATE ArtDefine_UnitMemberCombats SET TurnRateMax = 10*TurnRateMax WHERE MoveRate > 0;

CREATE TRIGGER IF NOT EXISTS CBR_FasterAircraft_Insert
AFTER INSERT ON ArtDefine_UnitMemberCombats
BEGIN
UPDATE ArtDefine_UnitMemberCombats
SET MoveRate = (10 * MoveRate), ShortMoveRate = (10 * ShortMoveRate)
WHERE (UnitMemberType = NEW.UnitMemberType);

UPDATE ArtDefine_UnitMemberCombats
SET TurnRateMin = (10 * TurnRateMin), TurnRateMax = (10 * TurnRateMax)
WHERE (UnitMemberType = NEW.UnitMemberType) AND (MoveRate > 0);
END;
