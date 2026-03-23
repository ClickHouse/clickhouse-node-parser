CREATE TABLE collate_test1
(
    x UInt32,
    s Array(String)
)
ENGINE = Memory();

CREATE TABLE collate_test2
(
    x UInt32,
    s Array(LowCardinality(Nullable(String)))
)
ENGINE = Memory();

CREATE TABLE collate_test3
(
    x UInt32,
    s Array(Array(String))
)
ENGINE = Memory();

INSERT INTO collate_test1;

INSERT INTO collate_test2;

INSERT INTO collate_test3;

SELECT *
FROM collate_test1
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test1
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test2
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test2
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SELECT *
FROM collate_test3
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM collate_test3
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';