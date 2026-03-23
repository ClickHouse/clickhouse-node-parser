SET allow_suspicious_low_cardinality_types = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    x LowCardinality(Int32)
)
ENGINE = Memory;

INSERT INTO test SELECT 1;

INSERT INTO test SELECT 2;

SELECT x + 1e10
FROM test
ORDER BY
    1e10 ASC,
    x ASC;

SELECT x + ((1e10 + 1e20))
FROM test
ORDER BY
    (1e10 + 1e20) ASC,
    x ASC;

SELECT x + ((pow(2, 2) + pow(3, 2)))
FROM test
ORDER BY
    (pow(2, 2) + pow(3, 2)) ASC,
    x ASC;

SYSTEM drop  table test;