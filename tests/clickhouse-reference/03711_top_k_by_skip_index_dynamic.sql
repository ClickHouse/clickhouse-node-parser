CREATE TABLE tab1
(
    id UInt32,
    v1 DateTime,
    v2 UInt32,
    INDEX v1idx v1 TYPE minmax GRANULARITY 1
) Engine = MergeTree ORDER BY id SETTINGS index_granularity = 64, min_bytes_for_wide_part = 0, min_bytes_for_full_part_storage = 0, max_bytes_to_merge_at_max_space_in_pool = 1, use_const_adaptive_granularity = 1, index_granularity_bytes = 0;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 DESC LIMIT 5 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 DESC LIMIT 20 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 WHERE v2 > 100000 ORDER BY v1 DESC LIMIT 10 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 ASC LIMIT 5 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 ORDER BY v1 ASC LIMIT 20 SETTINGS use_top_k_dynamic_filtering=1;
SELECT toUnixTimestamp(v1), v2 FROM tab1 WHERE v2 > 100000 ORDER BY v1 ASC LIMIT 10 SETTINGS use_top_k_dynamic_filtering=1;
