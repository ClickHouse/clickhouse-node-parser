SELECT trimLeft(`explain`)
FROM (
        EXPLAIN
        SELECT count(1)
        FROM checks
        WHERE isNotNull(test_name)
    )
WHERE like(`explain`, '%ReadFromPreparedSource%')
SETTINGS
    enable_analyzer = 1,
    enable_parallel_replicas = 0;