-- whole aggregation state of local aggregation uncompressed is 5.8G
-- it is hard to provide an accurate estimation for memory usage, so 5G is just the actual value taken from the logs + delta
-- also avoid using localhost, so the queries will go over separate connections
-- (otherwise the memory usage for merge will be counted together with the localhost query)
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