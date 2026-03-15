-- Tags: no-parallel-replicas
-- add_minmax_index_for_numeric_columns=0: We are checking the size of secondary indices and we want to check only manually created indices

SET enable_full_text_index = 1;
SET enable_analyzer = 1;
CREATE TABLE tab
(
    id UInt64,
    text String
)
ENGINE = MergeTree ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 1024, index_granularity_bytes = 10485760, merge_max_block_size = 8192, add_minmax_index_for_numeric_columns=0;
SELECT secondary_indices_compressed_bytes > 0
FROM system.parts
WHERE database = currentDatabase() AND table = 'tab' AND active
ORDER BY name;
SELECT count() FROM tab WHERE text LIKE '%v322%';
SELECT trim(explain) FROM
(
    EXPLAIN actions = 1 SELECT count() FROM tab WHERE text LIKE '%v322%'
)
WHERE explain ILIKE '%filter column%';
SELECT trim(explain) FROM
(
    EXPLAIN indexes = 1 SELECT count() FROM tab WHERE text LIKE '%v322%'
)
WHERE explain ILIKE '%Granules%';
-- ------------------------------------------------------------
SET mutations_sync = 2;
