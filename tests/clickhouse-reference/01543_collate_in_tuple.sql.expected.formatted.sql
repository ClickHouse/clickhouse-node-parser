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