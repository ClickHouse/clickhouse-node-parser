SELECT count()
FROM (
        SELECT *
        FROM table1
    );

SELECT count()
FROM (
        SELECT *
        FROM table1
    )
SETTINGS
    cluster_for_parallel_replicas = 'parallel_replicas',
    enable_parallel_replicas = 1,
    max_parallel_replicas = 2;