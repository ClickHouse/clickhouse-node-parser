-- { echo }
-- create table
SYSTEM drop  table if exists test;

CREATE TABLE test
(
    a Nullable(Int32),
    b Nullable(Int32)
)
ENGINE = Memory;

INSERT INTO test (a, b);

-- first value
SELECT first_value(b)
FROM test;

SELECT first_value(b)
FROM test;

SELECT first_value(b)
FROM test;

-- last value
SELECT last_value(b)
FROM test;

SELECT last_value(b)
FROM test;

SELECT last_value(b)
FROM test;

SET enable_analyzer = 1;