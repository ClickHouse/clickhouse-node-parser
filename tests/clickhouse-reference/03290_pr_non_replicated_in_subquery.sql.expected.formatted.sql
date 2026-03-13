SELECT count()
FROM (
        SELECT *
        FROM table1
    );

-- check that parallel_replicas_for_non_replicated_merge_tree(off by default) is respected in subquery
SELECT count()
FROM (
        SELECT *
        FROM table1
    )
SETTINGS
    cluster_for_parallel_replicas = 'parallel_replicas',
    enable_parallel_replicas = 1,
    max_parallel_replicas = 2;