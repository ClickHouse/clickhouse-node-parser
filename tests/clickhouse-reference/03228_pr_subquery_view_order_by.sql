SELECT *
FROM
(
    SELECT *
    FROM view1
)
ORDER BY number DESC
LIMIT 20
SETTINGS cluster_for_parallel_replicas = 'parallel_replicas', allow_experimental_parallel_reading_from_replicas = 1, max_parallel_replicas = 3, parallel_replicas_for_non_replicated_merge_tree = 1, parallel_replicas_local_plan = 1;
