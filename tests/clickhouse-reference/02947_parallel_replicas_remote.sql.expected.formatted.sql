SELECT
    count(),
    sum(id)
FROM remote('127.0.0.1|127.0.0.2|127.0.0.3|127.0.0.4', currentDatabase(), test)
SETTINGS
    enable_parallel_replicas = 1,
    max_parallel_replicas = 4,
    prefer_localhost_replica = 0,
    parallel_replicas_for_non_replicated_merge_tree = 1;