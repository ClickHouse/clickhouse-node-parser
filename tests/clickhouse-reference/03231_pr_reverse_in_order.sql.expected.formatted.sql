SELECT trimBoth(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT
            check_start_time,
            check_name,
            test_name,
            test_status,
            check_status
        FROM checks
        WHERE 1
            AND (test_status != 'SKIPPED')
            AND (test_status != 'OK')
            AND (check_status != 'success')
            AND (ilike(test_name, '%parallel_replicas%'))
        ORDER BY
            check_start_time DESC,
            check_name ASC,
            test_name ASC
        SETTINGS
            query_plan_read_in_order = 1,
            optimize_read_in_order = 1,
            max_parallel_replicas = 1
    )
WHERE like(`explain`, '%InReverseOrder%');

SELECT
    check_start_time,
    check_name,
    test_name,
    test_status,
    check_status
FROM checks
WHERE 1
    AND test_status != 'SKIPPED'
    AND test_status != 'OK'
    AND check_status != 'success'
    AND ilike(test_name, '%parallel_replicas%')
ORDER BY
    check_start_time DESC,
    check_name ASC,
    test_name ASC
SETTINGS
    query_plan_read_in_order = 1,
    optimize_read_in_order = 1,
    allow_experimental_parallel_reading_from_replicas = 1,
    cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost',
    max_parallel_replicas = 3;