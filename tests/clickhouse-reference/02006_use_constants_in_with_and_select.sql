SELECT
    1 AS max_size,
    groupArray(max_size)(col)
FROM
    (SELECT col FROM (
        SELECT 1 AS col
        UNION ALL
        SELECT 2
    ) ORDER BY col);
SELECT 0.1 AS level, quantile(level)(number)
FROM numbers(1000);
