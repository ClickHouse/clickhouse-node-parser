SELECT
    count(),
    sum(id)
FROM test_d
SETTINGS
    enable_parallel_replicas = 2,
    max_parallel_replicas = 3,
    parallel_replicas_for_non_replicated_merge_tree = 1;