SELECT
    a,
    b,
    c,
    sum(a) AS s
FROM remote('127.0.0.{2,3}', currentDatabase(), t_2354_dist_with_external_aggr)
GROUP BY
    a,
    b,
    c
FORMAT Null
SETTINGS max_memory_usage = '5Gi', max_result_rows = 0, max_result_bytes = 0;