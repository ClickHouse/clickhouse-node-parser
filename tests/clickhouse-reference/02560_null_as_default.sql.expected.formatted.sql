CREATE TABLE test
(
    x UInt64
)
ENGINE = Memory();

SET insert_null_as_default = 1;

SELECT *
FROM test
ORDER BY x ASC;

CREATE TABLE test
(
    x LowCardinality(String) DEFAULT 'Hello'
)
ENGINE = Memory();