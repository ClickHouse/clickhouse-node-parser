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