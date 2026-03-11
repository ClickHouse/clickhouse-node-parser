-- whole aggregation state of local aggregation uncompressed is 5.8G
-- it is hard to provide an accurate estimation for memory usage, so 5G is just the actual value taken from the logs + delta
-- also avoid using localhost, so the queries will go over separate connections
-- (otherwise the memory usage for merge will be counted together with the localhost query)
select a, b, c, sum(a) as s
from remote('127.0.0.{2,3}', currentDatabase(), t_2354_dist_with_external_aggr)
group by a, b, c
format Null
settings max_memory_usage = '5Gi', max_result_rows = 0, max_result_bytes = 0;
