-- Insert SQL Rules Here --[[
CREATE TABLE IF NOT EXISTS JWW_Angola_ResourcePolicyLink (ResourceType TEXT UNIQUE NOT NULL, PolicyType TEXT UNIQUE NOT NULL, PRIMARY KEY(ResourceType, PolicyType), FOREIGN KEY (ResourceType) REFERENCES Resources (Type));
-- Defines a table which will link a Luxury with its corresponding Dummy Policy. A new table is used since that way triggers can be applied to it, allowing for mod support

INSERT INTO Policies
		(Type,								Description)
SELECT	'POLICY_JWW_ANGOLA_DUMMY_'||Type, 	Description
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';
-- || is SQL's concatentation operator; this lets us stick two strings together. This way we can create a unique Policy for each Luxury resource, through the use of a query. You checked Happiness before, but I prefer to check the ResourceClassType; probably an irrelevant difference

INSERT INTO JWW_Angola_ResourcePolicyLink
		(ResourceType,	PolicyType)
SELECT	Type,			'POLICY_JWW_ANGOLA_DUMMY_'||Type
FROM Resources WHERE ResourceClassType = 'RESOURCECLASS_LUXURY';
-- Make inserts into our table

CREATE TRIGGER IF NOT EXISTS C15_JWW_Angola_ResPol_Insert
AFTER INSERT ON Resources
WHEN NEW.ResourceClassType = 'RESOURCECLASS_LUXURY'
BEGIN
	INSERT OR REPLACE INTO Policies
			(Type,									Description)
	VALUES	('POLICY_JWW_ANGOLA_DUMMY_'||NEW.Type, 	NEW.Description);

	INSERT OR REPLACE INTO JWW_Angola_ResourcePolicyLink
			(ResourceType,	PolicyType)
	VALUES	(NEW.Type,		'POLICY_JWW_ANGOLA_DUMMY_'||NEW.Type);
END;
-- Will handle the addition of new Luxuries to the database

CREATE TRIGGER IF NOT EXISTS C15_JWW_Angola_ResPol_UpdateOn
AFTER UPDATE ON Resources
WHEN NEW.ResourceClassType = 'RESOURCECLASS_LUXURY' AND OLD.ResourceClassType != 'RESOURCECLASS_LUXURY'
BEGIN
	INSERT OR REPLACE INTO Policies
			(Type,									Description)
	VALUES	('POLICY_JWW_ANGOLA_DUMMY_'||NEW.Type, 	NEW.Description);

	INSERT OR REPLACE INTO JWW_Angola_ResourcePolicyLink
			(ResourceType,	PolicyType)
	VALUES	(NEW.Type,		'POLICY_JWW_ANGOLA_DUMMY_'||NEW.Type);
END;
-- Will handle the changing of a Resource to a Luxury from something else

CREATE TRIGGER IF NOT EXISTS C15_JWW_Angola_ResPol_UpdateOff
AFTER UPDATE ON Resources
WHEN NEW.ResourceClassType != 'RESOURCECLASS_LUXURY' AND NEW.ResourceClassType != 'RESOURCECLASS_LUXURY'
BEGIN
	DELETE FROM JWW_Angola_ResourcePolicyLink WHERE ResourceType = OLD.Type;
END;
-- Will handle the changing of a Luxury to something else

CREATE TRIGGER IF NOT EXISTS C15_JWW_Angola_ResPol_UpdateName
AFTER UPDATE ON Resources
WHEN NEW.ResourceClassType = 'RESOURCECLASS_LUXURY' AND NEW.Type != OLD.Type
BEGIN
	UPDATE JWW_Angola_ResourcePolicyLink
	SET ResourceType = NEW.Type
	WHERE ResourceType = OLD.Type;
END;
-- Should handle a Luxury having its Type changed, if some inhuman animal decided to do that for some fucked up reason :/

CREATE TRIGGER IF NOT EXISTS C15_JWW_Angola_ResPol_Delete
AFTER DELETE ON Resources
WHERE OLD.ResourceClassType = 'RESOURCECLASS_LUXURY'
BEGIN	
	DELETE FROM JWW_Angola_ResourcePolicyLink WHERE ResourceType = OLD.Type;
END;
-- Will handle the deletion of Luxuries from the database, in case someone hasn't read the explanations of why you shouldn't delete things...

]]