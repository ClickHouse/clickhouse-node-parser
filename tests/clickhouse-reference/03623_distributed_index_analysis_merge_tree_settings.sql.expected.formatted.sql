-- Tags: long, no-parallel
SET allow_experimental_parallel_reading_from_replicas = 0;

SET cluster_for_parallel_replicas = 'test_cluster_one_shard_two_replicas';

CREATE TABLE dist_idx
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = 0;

SELECT sum(key)
FROM dist_idx
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE no_dist_idx_not_enough_indexes
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = 1e12;

SELECT sum(key)
FROM no_dist_idx_not_enough_indexes
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE no_dist_idx_min_not_enough_parts
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS distributed_index_analysis_min_parts_to_activate = 1e9, distributed_index_analysis_min_indexes_size_to_activate = 0;

SELECT sum(key)
FROM no_dist_idx_min_not_enough_parts
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE no_dist_idx
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS distributed_index_analysis_min_parts_to_activate = 1e9, distributed_index_analysis_min_indexes_size_to_activate = 1e12;

SELECT sum(key)
FROM no_dist_idx
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE dist_idx_parts
(
    key Int,
    value Int
)
ENGINE = MergeTree()
ORDER BY key
SETTINGS merge_selector_base = 1000, index_granularity = 8192, min_bytes_for_wide_part = 1e9, index_granularity_bytes = 10e6, distributed_index_analysis_min_parts_to_activate = 10, distributed_index_analysis_min_indexes_size_to_activate = 0;

SELECT sum(key)
FROM dist_idx_parts
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE dist_idx_pk_size
(
    key String,
    value String
)
ENGINE = MergeTree()
ORDER BY (key, value)
SETTINGS index_granularity = 200, min_bytes_for_wide_part = 0, index_granularity_bytes = 10e6, distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = 500e3, compress_primary_key = 0;

SELECT
    table,
    sum(primary_key_size)
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'dist_idx_pk_size'
GROUP BY 1;

SELECT key
FROM dist_idx_pk_size
SETTINGS distributed_index_analysis = 1
FORMAT Null;

CREATE TABLE dist_idx_skipping_idx_size
(
    key String,
    value String,
    INDEX key_val_idx (key, value) TYPE set(100000)
)
ENGINE = MergeTree()
SETTINGS index_granularity = 100000, min_bytes_for_wide_part = 0, index_granularity_bytes = 10e6, distributed_index_analysis_min_parts_to_activate = 0, distributed_index_analysis_min_indexes_size_to_activate = '10M';

SELECT
    table,
    sum(data_uncompressed_bytes)
FROM `system`.data_skipping_indices
WHERE database = currentDatabase()
    AND table = 'dist_idx_skipping_idx_size'
GROUP BY 1;

SELECT key
FROM dist_idx_skipping_idx_size
SETTINGS distributed_index_analysis = 1
FORMAT Null;

SELECT
    tables,
    ProfileEvents['DistributedIndexAnalysisMicroseconds'] > 0
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND event_date >= yesterday()
    AND type = 'QueryFinish'
    AND query_kind = 'Select'
    AND is_initial_query
    AND has(`Settings`, 'distributed_index_analysis')
    AND endsWith(log_comment, concat('-', currentDatabase()))
ORDER BY event_time_microseconds ASC;