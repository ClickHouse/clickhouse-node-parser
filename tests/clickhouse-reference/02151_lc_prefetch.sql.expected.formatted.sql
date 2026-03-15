CREATE TABLE tab_lc
(
    x UInt64,
    y LowCardinality(String)
)
ENGINE = MergeTree
ORDER BY x
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SET max_rows_to_read = '21M';

SELECT count()
FROM tab_lc
WHERE y == '0'
SETTINGS local_filesystem_read_prefetch = 1;