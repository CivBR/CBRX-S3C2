-- Aggresive & Expansive Biases

/* UPDATE [leaders] SET [VictoryCompetitiveness] = [VictoryCompetitiveness] + 4;
UPDATE [leaders] SET [Boldness] = [Boldness] + 2;

UPDATE [Leader_MajorCivApproachBiases] SET [Bias] = [Bias] + 1 WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE';

UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 3 WHERE [FlavorType] = 'FLAVOR_OFFENSE';
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 2 WHERE [FlavorType] = 'FLAVOR_DEFENSE';
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 2 WHERE [FlavorType] = 'FLAVOR_RANGED';
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 2 WHERE [FlavorType] = 'FLAVOR_MOBILE';
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 2 WHERE [FlavorType] = 'FLAVOR_EXPANSION'; */


UPDATE [leaders] SET [WonderCompetitiveness] = [WonderCompetitiveness] + 2 WHERE Type NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [leaders] SET [MinorCivCompetitiveness] = [MinorCivCompetitiveness] + 2 WHERE Type NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [leaders] SET [VictoryCompetitiveness] = [VictoryCompetitiveness] + 5 WHERE Type NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [leaders] SET [Boldness] = [Boldness] + 5 WHERE Type NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');

UPDATE [Leader_MajorCivApproachBiases] SET [Bias] = [Bias] + 4 WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [Leader_MajorCivApproachBiases] SET [Bias] = [Bias] + 4 WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_WAR' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');


UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 4 WHERE [FlavorType] = 'FLAVOR_OFFENSE' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 1 WHERE [FlavorType] = 'FLAVOR_DEFENSE' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 1 WHERE [FlavorType] = 'FLAVOR_RANGED' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 1 WHERE [FlavorType] = 'FLAVOR_MOBILE' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');
UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 5 WHERE [FlavorType] = 'FLAVOR_EXPANSION' AND LeaderType NOT IN ('LEADER_SENSHI_TITO', 'LEADER_PB_MORI_MOTONARI', 'LEADER_SPLATDAY_WILLIAM', 'LEADER_ERW_OLIVE_YANG');

UPDATE HandicapInfos SET AIDeclareWarProb = 200 WHERE Type = 'HANDICAP_DEITY';


-- Chrisy Version

/* UPDATE [leaders] SET [VictoryCompetitiveness] = [VictoryCompetitiveness] + 4 WHERE Type NOT IN ('LEADER_', 'LEADER_');

UPDATE [Leader_MajorCivApproachBiases] SET [Bias] = [Bias] + 1 WHERE MajorCivApproachType = 'MAJOR_CIV_APPROACH_HOSTILE' AND LeaderType NOT IN ('LEADER_', 'LEADER_');

UPDATE [Leader_Flavors] SET [Flavor] = [Flavor] + 3 WHERE [FlavorType] = 'FLAVOR_OFFENSE' AND LeaderType NOT IN ('LEADER_', 'LEADER_'); */
