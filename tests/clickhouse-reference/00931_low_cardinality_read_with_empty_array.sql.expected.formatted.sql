CREATE TABLE lc_00931
(
    key UInt64,
    value Array(LowCardinality(String))
)
ENGINE = MergeTree
ORDER BY key;

SELECT *
FROM lc_00931
WHERE ((key < 100
    OR key > 50000))
    AND NOT has(value, toString(key))
    AND length(value) == 1
LIMIT 10
SETTINGS
    max_block_size = 8192,
    max_threads = 1;