SELECT
    cityHash64(number),
    sum(1)
FROM remote('127.0.0.{1,1}', currentDatabase(), merge_test_table)
GROUP BY 1
FORMAT Null
SETTINGS distributed_aggregation_memory_efficient = 1, max_threads = 4, optimize_aggregation_in_order = 0, prefer_localhost_replica = 1, async_socket_for_remote = 1, enable_analyzer = 0, enable_producing_buckets_out_of_order_in_aggregation = 0, enable_memory_bound_merging_of_aggregation_results = 0, max_memory_usage='500Mi', group_by_two_level_threshold=1e6, group_by_two_level_threshold_bytes='500Mi';
