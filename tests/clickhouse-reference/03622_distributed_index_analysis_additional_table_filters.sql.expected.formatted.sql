-- -min_bytes_for_wide_part -- wide parts are different (they respect index_granularity completely, unlike compact parts) -- FIXME
-- -merge_selector_base = 1000 -- disable merges
-- -index_granularity* -- test relies on number of granulas
CREATE TABLE test_1m
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS merge_selector_base = 1000, index_granularity = 8192, min_bytes_for_wide_part = 1e9, index_granularity_bytes = 10e6, distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = 0;

SELECT
    count(),
    sum(marks)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'test_1m'
    AND active;

SET cluster_for_parallel_replicas = 'test_cluster_one_shard_two_replicas';

SET distributed_index_analysis = 1;

SET max_parallel_replicas = 2;

SET use_query_condition_cache = 0;

SET additional_table_filters = map('test_1m', 'key > 10000');

-- Only with analyzer
SET allow_experimental_analyzer = 1;

-- Parallel replicas changes EXPLAIN output
SET allow_experimental_parallel_reading_from_replicas = 0;

-- { echo }
SELECT count()
FROM (
        SELECT *
        FROM test_1m
    );