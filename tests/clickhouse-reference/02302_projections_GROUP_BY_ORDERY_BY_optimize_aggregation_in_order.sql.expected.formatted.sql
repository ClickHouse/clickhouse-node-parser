SELECT
    x + y,
    sum(x - y) AS s
FROM test_agg_proj_02302
GROUP BY x + y
ORDER BY s DESC
LIMIT 5
SETTINGS
    optimize_aggregation_in_order = 0,
    optimize_read_in_order = 0;

SELECT
    x + y,
    sum(x - y) AS s
FROM test_agg_proj_02302
GROUP BY x + y
ORDER BY s DESC
LIMIT 5
SETTINGS
    optimize_aggregation_in_order = 1,
    optimize_read_in_order = 1;