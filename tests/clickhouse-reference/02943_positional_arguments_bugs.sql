SELECT
    sum(n),
    __unused_group_by_column 
FROM t
GROUP BY __unused_group_by_column ORDER BY __unused_group_by_column;
SELECT sum(n), 1 as x from t group by x;
SELECT
    'processed' AS type,
    max(number) AS max_date,
    min(number) AS min_date
FROM numbers(100)
GROUP BY type;
