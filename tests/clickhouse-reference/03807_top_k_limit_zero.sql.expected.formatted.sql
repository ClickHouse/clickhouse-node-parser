CREATE TABLE tab
(
    id UInt32,
    v1 UInt32,
    INDEX v1idx v1 TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY id
SETTINGS index_granularity = 64;

SELECT
    id,
    v1
FROM tab
ORDER BY v1 DESC
LIMIT 0
SETTINGS use_skip_indexes_for_top_k = 1;

SELECT
    id,
    v1
FROM tab
ORDER BY v1 ASC
LIMIT 0
SETTINGS use_skip_indexes_for_top_k = 1;