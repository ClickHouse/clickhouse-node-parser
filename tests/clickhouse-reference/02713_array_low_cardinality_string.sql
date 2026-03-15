CREATE TABLE tab
(
    foo Array(LowCardinality(String)),
    INDEX idx foo TYPE bloom_filter
)
ENGINE = MergeTree
PRIMARY KEY tuple();
SELECT '---';
SELECT table, name, type
FROM system.data_skipping_indices
WHERE database = currentDatabase() AND table = 'tab';
