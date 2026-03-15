-- Tags: no-parallel-replicas
SET enable_analyzer = 1;

CREATE TABLE test
(
    arr Array(UInt64),
    t Tuple(a Array(UInt32), b Array(UInt32))
)
ENGINE = Memory;

SELECT t.a
FROM
    test
ARRAY JOIN arr;

SELECT t.a
FROM
    test
ARRAY JOIN t.b;