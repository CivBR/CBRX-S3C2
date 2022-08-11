
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);

INSERT INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('Cooperative_DTP.lua');

CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 		REFERENCES Yields(Type) 		default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);

INSERT INTO JFD_TopPanelAdditions
		(CivilizationType,				YieldType,			YieldSourceFunction,	YieldSourceToolTip)
VALUES	('CIVILIZATION_CHILE_ALLENDE',	'YIELD_CULTURE',	'C15_GetCulture',		'TXT_KEY_C15_DTP_CULTURE_FACTORIES');