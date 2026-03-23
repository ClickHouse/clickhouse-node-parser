-- Tags: no-parallel
SYSTEM DROP  TABLE IF EXISTS 02484_substitute_udf;

SYSTEM DROP  FUNCTION IF EXISTS 02484_plusone;

SYSTEM DROP  FUNCTION IF EXISTS 02484_plustwo;

SYSTEM DROP  FUNCTION IF EXISTS 02484_plusthree;

SYSTEM DROP  FUNCTION IF EXISTS 02484_plusthreemonths;

SYSTEM DROP  FUNCTION IF EXISTS 02484_plusthreedays;

CREATE FUNCTION `02484_plusone` AS a -> a + 1;

CREATE FUNCTION `02484_plustwo` AS a -> a + 2;

CREATE FUNCTION `02484_plusthreemonths` AS a -> a + toIntervalMonth(3);

-- { echo }
CREATE TABLE `02484_substitute_udf`
(
    id UInt32,
    dt DateTime,
    number UInt32
)
ENGINE = MergeTree()
ORDER BY `02484_plusone`(id)
PARTITION BY `02484_plustwo`(id)
SAMPLE BY `02484_plusone`(id)
TTL `02484_plusthreemonths`(dt);

CREATE FUNCTION `02484_plusthree` AS a -> a + 3;

CREATE FUNCTION `02484_plusthreedays` AS a -> a + toIntervalDay(3);

SYSTEM DROP  TABLE 02484_substitute_udf;

SYSTEM DROP  FUNCTION 02484_plusone;

SYSTEM DROP  FUNCTION 02484_plustwo;

SYSTEM DROP  FUNCTION 02484_plusthree;

SYSTEM DROP  FUNCTION 02484_plusthreemonths;

SYSTEM DROP  FUNCTION 02484_plusthreedays;