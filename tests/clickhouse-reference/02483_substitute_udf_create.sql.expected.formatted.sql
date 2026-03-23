-- Tags: no-parallel
DROP TABLE IF EXISTS `02483_substitute_udf`;

DROP FUNCTION IF EXISTS `02483_plusone`;

DROP FUNCTION IF EXISTS `02483_plustwo`;

DROP FUNCTION IF EXISTS `02483_plusthree`;

-- { echo }
CREATE FUNCTION `02483_plusone` AS a -> a + 1;

CREATE TABLE `02483_substitute_udf`
(
    id UInt32,
    number UInt32 DEFAULT `02483_plusone`(id)
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO `02483_substitute_udf` (id, number);

SELECT *
FROM `02483_substitute_udf`
ORDER BY id ASC;

CREATE FUNCTION `02483_plustwo` AS a -> a + 2;

INSERT INTO `02483_substitute_udf` (id, number);

CREATE FUNCTION `02483_plusthree` AS a -> a + 3;

INSERT INTO `02483_substitute_udf` (id, new_number);

DROP TABLE `02483_substitute_udf`;

DROP FUNCTION `02483_plusone`;

DROP FUNCTION `02483_plustwo`;

DROP FUNCTION `02483_plusthree`;