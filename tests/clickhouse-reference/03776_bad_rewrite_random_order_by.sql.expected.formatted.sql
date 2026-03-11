SELECT number
FROM join_inner_table__fuzz_146_replicated
SETTINGS
    enable_analyzer = 1,
    max_parallel_replicas = 2,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    enable_parallel_replicas = 1,
    inject_random_order_for_select_without_order_by = 1;