-- Tags: no-fasttest
DROP TABLE IF EXISTS test_collate;

DROP TABLE IF EXISTS test_collate_null;

CREATE TABLE test_collate
(
    x UInt32,
    s LowCardinality(String)
)
ENGINE = Memory();

CREATE TABLE test_collate_null
(
    x UInt32,
    s LowCardinality(Nullable(String))
)
ENGINE = Memory();

INSERT INTO test_collate;

INSERT INTO test_collate_null;

SELECT *
FROM test_collate
ORDER BY s ASC;

SELECT *
FROM test_collate
ORDER BY s ASC COLLATE 'ru';

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

SELECT *
FROM test_collate_null
ORDER BY s ASC;

SELECT *
FROM test_collate_null
ORDER BY s ASC COLLATE 'ru';

SELECT *
FROM test_collate_null
ORDER BY
    x ASC,
    s ASC;

SELECT *
FROM test_collate_null
ORDER BY
    x ASC,
    s ASC COLLATE 'ru';

DROP TABLE test_collate;

DROP TABLE test_collate_null;