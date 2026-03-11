SELECT uniqExact(c0) OVER (ORDER BY c0 DESC)
FROM (
        SELECT number AS c0
        FROM numbers(10)
    ) AS t0
SETTINGS
    count_distinct_optimization = 1,
    enable_analyzer = 1;