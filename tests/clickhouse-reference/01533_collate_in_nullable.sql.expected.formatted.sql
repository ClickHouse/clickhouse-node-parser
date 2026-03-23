-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS test_collate;

CREATE TABLE test_collate
(
    x UInt32,
    s Nullable(String)
)
ENGINE = Memory();

INSERT INTO test_collate;

SELECT *
FROM test_collate
ORDER BY
    s ASC,
    x ASC;

SELECT *
FROM test_collate
ORDER BY
    s ASC COLLATE 'ru',
    x ASC;

SELECT *
FROM test_collate
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM test_collate
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

SYSTEM DROP  TABLE test_collate;