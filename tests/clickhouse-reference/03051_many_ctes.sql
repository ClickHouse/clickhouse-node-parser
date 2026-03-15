-- https://github.com/ClickHouse/ClickHouse/issues/40955
SET enable_analyzer=1;
SELECT 2 AS x FROM (SELECT 1 AS x) t;
SELECT * replace(2 as x)  FROM (SELECT 1 AS x) t;
