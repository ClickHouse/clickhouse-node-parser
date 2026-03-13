-- Sanitizer
SELECT count()
FROM
    pr_2
INNER JOIN numbers(10) AS pr_1
    ON pr_2.a = pr_1.number
SETTINGS
    enable_parallel_replicas = 1,
    parallel_replicas_for_non_replicated_merge_tree = 1,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    max_parallel_replicas = 3;

-- Parallel replicas detection should work inside subqueries
SELECT *
FROM (
        WITH filtered_groups AS (
            SELECT a
            FROM pr_1
            WHERE a >= 100
        )

        SELECT count()
        FROM
            pr_2
        INNER JOIN filtered_groups
            ON pr_2.a = filtered_groups.a
    )
SETTINGS
    enable_parallel_replicas = 1,
    parallel_replicas_for_non_replicated_merge_tree = 1,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    max_parallel_replicas = 3;

-- Subquery + subquery
SELECT count()
FROM (
        SELECT c + 1
        FROM (
                WITH filtered_groups AS (
                    SELECT a
                    FROM pr_1
                    WHERE a >= 100
                )

                SELECT count() AS c
                FROM
                    pr_2
                INNER JOIN filtered_groups
                    ON pr_2.a = filtered_groups.a
            )
    )
SETTINGS
    enable_parallel_replicas = 1,
    parallel_replicas_for_non_replicated_merge_tree = 1,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    max_parallel_replicas = 3;