-- Tags: no-parallel-replicas
-- add_minmax_index_for_numeric_columns=0: We are checking the size of secondary indices and we want to check only manually created indices
SET enable_full_text_index = 1;

SET enable_analyzer = 1;

SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    id UInt64,
    text String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, index_granularity = 1024, index_granularity_bytes = 10485760, merge_max_block_size = 8192, add_minmax_index_for_numeric_columns = 0;

INSERT INTO tab SELECT
    number,
    concat('v', toString(number))
FROM numbers(100000);

INSERT INTO tab SELECT
    number,
    concat('v', toString(number + 1000000))
FROM numbers(100000);

SELECT secondary_indices_compressed_bytes > 0
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'tab'
    AND active
ORDER BY name ASC;

SELECT count()
FROM tab
WHERE like(text, '%v322%');

SELECT trim(`explain`)
FROM (
        EXPLAIN actions = 1
        SELECT count()
        FROM tab
        WHERE like(text, '%v322%')
    )
WHERE ilike(`explain`, '%filter column%');

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT count()
        FROM tab
        WHERE like(text, '%v322%')
    )
WHERE ilike(`explain`, '%Granules%');

-- ------------------------------------------------------------
SET mutations_sync = 2;

SYSTEM DROP  TABLE tab;