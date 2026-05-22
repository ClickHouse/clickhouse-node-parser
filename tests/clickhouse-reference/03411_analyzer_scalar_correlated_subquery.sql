set enable_analyzer = 1;
set allow_experimental_correlated_subqueries = 1;
SELECT *
FROM numbers(2)
WHERE (SELECT count() FROM system.one WHERE number = 2) is NULL
ORDER BY all;
