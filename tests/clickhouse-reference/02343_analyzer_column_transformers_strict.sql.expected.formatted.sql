SET enable_analyzer = 1;

CREATE TABLE test_table
(
    id UInt64,
    value String
)
ENGINE = TinyLog;

SELECT * EXCEPT (id)
FROM test_table;

SELECT * EXCEPT STRICT (id, value1)
FROM test_table; -- { serverError BAD_ARGUMENTS }

SELECT * REPLACE STRICT (1 AS id, 2 AS value)
FROM test_table;

SELECT * REPLACE STRICT (1 AS id, 2 AS value_1)
FROM test_table; -- { serverError BAD_ARGUMENTS }