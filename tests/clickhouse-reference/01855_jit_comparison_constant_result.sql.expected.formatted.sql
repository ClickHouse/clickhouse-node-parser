SET compile_expressions = 1;

SET min_count_to_compile_expression = 0;

CREATE TABLE test_table
(
    a UInt64
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a > test_table.a)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a >= test_table.a)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a < test_table.a)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a <= test_table.a)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a == test_table.a)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a != test_table.a)) + 1 ASC;

CREATE TABLE test_table
(
    a UInt64,
    b ALIAS a,
    c ALIAS b
)
ENGINE = MergeTree()
ORDER BY tuple();

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a > test_table.b)) + 1
    AND ((test_table.a > test_table.c)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a >= test_table.b)) + 1
    AND ((test_table.a >= test_table.c)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a < test_table.b)) + 1
    AND ((test_table.a < test_table.c)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a <= test_table.b)) + 1
    AND ((test_table.a <= test_table.c)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a == test_table.b)) + 1
    AND ((test_table.a == test_table.c)) + 1 ASC;

SELECT test_table.a
FROM test_table
ORDER BY ((test_table.a != test_table.b)) + 1
    AND ((test_table.a != test_table.c)) + 1 ASC;