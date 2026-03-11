SELECT
    sum(n),
    __unused_group_by_column
FROM t
GROUP BY __unused_group_by_column
ORDER BY __unused_group_by_column ASC;

SELECT
    sum(n),
    1 AS x
FROM t
GROUP BY x;

SELECT
    'processed' AS type,
    max(number) AS max_date,
    min(number) AS min_date
FROM numbers(100)
GROUP BY type;