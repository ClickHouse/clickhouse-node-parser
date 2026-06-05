-- Tags: long
-- https://github.com/ClickHouse/ClickHouse/issues/21557
EXPLAIN SYNTAX
WITH x AS (
    SELECT number
    FROM numbers(10)
),

cross_sales AS (
    SELECT 1 AS xx
    FROM
        x
    CROSS JOIN x AS d1
    CROSS JOIN x AS d2
    CROSS JOIN x AS d3
    CROSS JOIN x AS d4
    CROSS JOIN x AS d5
    CROSS JOIN x AS d6
    CROSS JOIN x AS d7
    CROSS JOIN x AS d8
    CROSS JOIN x AS d9
    WHERE x.number = d9.number
)

SELECT xx
FROM cross_sales
WHERE xx = 2000
FORMAT Null;

SET max_analyze_depth = 1;

EXPLAIN SYNTAX
WITH x AS (
    SELECT number
    FROM numbers(10)
),

cross_sales AS (
    SELECT 1 AS xx
    FROM
        x
    CROSS JOIN x AS d1
    CROSS JOIN x AS d2
    CROSS JOIN x AS d3
    CROSS JOIN x AS d4
    CROSS JOIN x AS d5
    CROSS JOIN x AS d6
    CROSS JOIN x AS d7
    CROSS JOIN x AS d8
    CROSS JOIN x AS d9
    WHERE x.number = d9.number
)

SELECT xx
FROM cross_sales
WHERE xx = 2000;