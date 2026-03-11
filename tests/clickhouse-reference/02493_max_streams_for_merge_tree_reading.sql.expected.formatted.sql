SELECT sum(x)
FROM t
SETTINGS
    max_threads = 32,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 0;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM t
        SETTINGS
            max_threads = 32,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 0
    )
WHERE like(`explain`, '%Resize%')
    OR like(`explain`, '%MergeTreeSelect%');

SELECT sum(x)
FROM t
SETTINGS
    max_threads = 4,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 0,
    max_streams_to_max_threads_ratio = 8;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM t
        SETTINGS
            max_threads = 4,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 0,
            max_streams_to_max_threads_ratio = 8
    )
WHERE like(`explain`, '%Resize%')
    OR like(`explain`, '%MergeTreeSelect%');

SELECT sum(x)
FROM t
SETTINGS
    max_threads = 4,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 1;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM t
        SETTINGS
            max_threads = 4,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 1
    )
WHERE like(`explain`, '%Resize%')
    OR like(`explain`, '%MergeTreeSelect%');

SELECT sum(x)
FROM t
SETTINGS
    max_threads = 4,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
    max_streams_to_max_threads_ratio = 8;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM t
        SETTINGS
            max_threads = 4,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
            max_streams_to_max_threads_ratio = 8
    )
WHERE like(`explain`, '%Resize%')
    OR like(`explain`, '%MergeTreeSelect%');

SELECT sum(x)
FROM (
        SELECT x
        FROM t
        ORDER BY x ASC
    )
SETTINGS
    max_threads = 4,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
    optimize_read_in_order = 1,
    query_plan_read_in_order = 1;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM (
                SELECT x
                FROM t
                ORDER BY x ASC
            )
        SETTINGS
            max_threads = 4,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
            optimize_read_in_order = 1,
            query_plan_read_in_order = 1
    )
WHERE like(`explain`, '%Resize%');

SELECT sum(x)
FROM (
        SELECT x
        FROM t
        ORDER BY x ASC
    )
SETTINGS
    max_threads = 4,
    max_streams_for_merge_tree_reading = 16,
    allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
    max_streams_to_max_threads_ratio = 8,
    optimize_read_in_order = 1,
    query_plan_read_in_order = 1;

SELECT *
FROM (
        EXPLAIN PIPELINE
        SELECT sum(x)
        FROM (
                SELECT x
                FROM t
                ORDER BY x ASC
            )
        SETTINGS
            max_threads = 4,
            max_streams_for_merge_tree_reading = 16,
            allow_asynchronous_read_from_io_pool_for_merge_tree = 1,
            max_streams_to_max_threads_ratio = 8,
            optimize_read_in_order = 1,
            query_plan_read_in_order = 1
    )
WHERE like(`explain`, '%Resize%');