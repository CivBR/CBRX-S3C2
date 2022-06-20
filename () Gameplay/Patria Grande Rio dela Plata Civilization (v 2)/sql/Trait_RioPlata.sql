--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_PG_SANMARTIN', 	'TRAIT_PG_RIODELAPLATA');

--------------------------------
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_PG_RIODELAPLATA', 		'TXT_KEY_TRAIT_PG_RIODELAPLATA',		'TXT_KEY_TRAIT_PG_RIODELAPLATA_SHORT');

--------------------------------
-- Trait_FreePromotionUnitCombats
--------------------------------
INSERT INTO Trait_FreePromotionUnitCombats
		(TraitType,					UnitCombatType,			PromotionType)
VALUES	('TRAIT_PG_RIODELAPLATA',	'UNITCOMBAT_MOUNTED',	'PROMOTION_PG_SANMARTIN_TRAIT');

--==========================================================================================================================
--==========================================================================================================================