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