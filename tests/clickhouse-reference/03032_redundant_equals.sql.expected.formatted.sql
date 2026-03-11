SELECT *
FROM test_table
WHERE k IN (100) = 1;

SELECT *
FROM test_table
WHERE k = (100) = 1;

SELECT *
FROM test_table
WHERE k NOT IN (100) = 0;

SELECT *
FROM test_table
WHERE k != (100) = 0;

SELECT *
FROM test_table
WHERE 1 = ((k = 100));

SELECT *
FROM test_table
WHERE 0 = (k NOT IN (100));

SELECT *
FROM test_table
WHERE k < 1 = 1;

SELECT *
FROM test_table
WHERE k >= 1 = 0;

SELECT *
FROM test_table
WHERE k > 1 = 0;

SELECT *
FROM test_table
WHERE (((k NOT IN (101) = 0)
    OR (k IN (100) = 1))) = 1;

SELECT *
FROM test_table
WHERE (NOT((k NOT IN (100) = 0)
    OR (k IN (100) = 1))) = 0;

SELECT *
FROM test_table
WHERE (NOT((k IN (101) = 0)
    OR (k IN (100) = 1))) = 1;

SELECT *
FROM test_table
WHERE (((k NOT IN (99) = 1)
    AND (k IN (100) = 1))) = 1;

SELECT *
FROM test_table
WHERE (k = 101) = toLowCardinality(toNullable(1));

SELECT *
FROM test_table
WHERE (k = 101) = toNullable(1);

SELECT *
FROM test_table
WHERE (k = 101) = toLowCardinality(1);

SELECT *
FROM test_table
WHERE (((k NOT IN (101) = toNullable(0))
    OR (k IN (100) = toNullable(1)))) = toNullable(1);

SELECT *
FROM test_table
WHERE (((k NOT IN (toLowCardinality(toNullable(101)))) = toLowCardinality(toNullable(0)))
    OR ((k IN (toLowCardinality(100))) = toNullable(1)));

SELECT *
FROM test_table
WHERE ((((k IN (toLowCardinality(toNullable(101)))) = toLowCardinality(toNullable(0)))
    AND ((k NOT IN (toLowCardinality(100))) = toNullable(1)))) = toNullable(toLowCardinality(0));

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE k IN (100) = 1
    )
WHERE like(`explain`, '%Granules: 1/%');

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE k >= 1 = 0
    )
WHERE like(`explain`, '%Granules: 1/%');

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE k NOT IN (100) = 0
    )
WHERE like(`explain`, '%Granules: 1/%');

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE k > 1 = 0
    )
WHERE like(`explain`, '%Granules: 1/%');

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE (NOT((k NOT IN (100) = 0)
            OR (k IN (100) = 1))) = 0
    )
WHERE like(`explain`, '%Granules: 1/%');

SELECT count()
FROM (
        EXPLAIN PLAN indexes = 1
        SELECT *
        FROM test_table
        WHERE (NOT((k IN (101) = 0)
            OR (k IN (100) = 1))) = 1
    )
WHERE like(`explain`, '%Granules: 1/%');