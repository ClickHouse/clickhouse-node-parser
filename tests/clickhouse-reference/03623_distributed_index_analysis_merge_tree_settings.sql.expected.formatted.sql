SELECT sum(key)
FROM dist_idx
SETTINGS distributed_index_analysis = 1
FORMAT Null;

SELECT sum(key)
FROM no_dist_idx_not_enough_indexes
SETTINGS distributed_index_analysis = 1
FORMAT Null;

SELECT sum(key)
FROM no_dist_idx_min_not_enough_parts
SETTINGS distributed_index_analysis = 1
FORMAT Null;

SELECT sum(key)
FROM no_dist_idx
SETTINGS distributed_index_analysis = 1
FORMAT Null;

SELECT sum(key)
FROM dist_idx_parts
SETTINGS distributed_index_analysis = 1
FORMAT Null;

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