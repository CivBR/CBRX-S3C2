INSERT INTO Policies
                            (TYPE,                                                  Description,                                                    Civilopedia,                                                            Help,
                            CultureCost,PortraitIndex,      IconAtlas,      IconAtlasAchieved)
    SELECT          ('POLICY_SAS_THANKYOUSLAVES'),   ('TXT_KEY_POLICY_SAS_THANKYOUSLAVES'),   ('TXT_KEY_POLICY_SAS_THANKYOUSLAVES_TEXT'),      ('TXT_KEY_POLICY_SAS_THANKYOUSLAVES_TEXT'),
                            -1,                     PortraitIndex,  IconAtlas,      IconAtlasAchieved
    FROM Policies WHERE TYPE='POLICY_MONARCHY';
     
     
INSERT INTO Policies
                            (TYPE,                                                  Description,                                                    Civilopedia,                                                            Help,
                            CultureCost,PortraitIndex,      IconAtlas,      IconAtlasAchieved)
    SELECT          ('POLICY_SAS_VSCIENCE'),   ('TXT_KEY_POLICY_SAS_VSCIENCE'),   ('TXT_KEY_POLICY_SAS_VSCIENCE_TEXT'),      ('TXT_KEY_POLICY_SAS_VSCIENCE_TEXT'),
                            -1,                     PortraitIndex,  IconAtlas,      IconAtlasAchieved
    FROM Policies WHERE TYPE='POLICY_MONARCHY';
