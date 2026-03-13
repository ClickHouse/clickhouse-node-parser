SELECT
    1 AS value,
    1 AS value;

SELECT
    id AS value,
    id AS value
FROM test_table;

SELECT
    (
        SELECT 1
    ) AS subquery,
    (
        SELECT 1
    ) AS subquery;

SELECT
    1 AS value,
    2 AS value; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }

SELECT
    plus(1, 1) AS value,
    2 AS value; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }

SELECT
    (
        SELECT 1
    ) AS subquery,
    1 AS subquery; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }

SELECT
    id AS value,
    value AS value
FROM test_table; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }

SELECT
    id AS value_1,
    value AS value_1
FROM test_table; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }

SELECT
    id AS value,
    (id + 1) AS value
FROM test_table; -- { serverError MULTIPLE_EXPRESSIONS_FOR_ALIAS }