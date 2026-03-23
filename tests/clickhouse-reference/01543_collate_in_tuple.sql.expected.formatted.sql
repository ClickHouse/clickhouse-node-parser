-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS collate_test1;

SYSTEM DROP  TABLE IF EXISTS collate_test2;

SYSTEM DROP  TABLE IF EXISTS collate_test3;

CREATE TABLE collate_test1
(
    x UInt32,
    s Tuple(UInt32, String)
)
ENGINE = Memory();

CREATE TABLE collate_test2
(
    x UInt32,
    s Tuple(UInt32, LowCardinality(Nullable(String)))
)
ENGINE = Memory();

CREATE TABLE collate_test3
(
    x UInt32,
    s Tuple(UInt32, Tuple(UInt32, Array(String)))
)
ENGINE = Memory();

INSERT INTO collate_test1;

INSERT INTO collate_test2;

INSERT INTO collate_test3;

SELECT *
FROM collate_test1
ORDER BY
    s ASC COLLATE 'ru',
    x ASC;

SELECT *
FROM collate_test1
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test2
ORDER BY
    s ASC COLLATE 'ru',
    x ASC;

SELECT *
FROM collate_test2
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test3
ORDER BY
    s ASC COLLATE 'ru',
    x ASC;

SELECT *
FROM collate_test3
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SYSTEM DROP  TABLE collate_test1;

SYSTEM DROP  TABLE collate_test2;

SYSTEM DROP  TABLE collate_test3;