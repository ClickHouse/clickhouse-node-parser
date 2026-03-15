-- https://github.com/ClickHouse/ClickHouse/issues/40955
SET enable_analyzer = 1;

SELECT 2 AS x
FROM (
        SELECT 1 AS x
    ) AS t;

SELECT * REPLACE (2 AS x)
FROM (
        SELECT 1 AS x
    ) AS t;