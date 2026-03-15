CREATE TABLE test_collation
(
    `v` String,
    `v2` String
)
ENGINE = MergeTree
ORDER BY v
SETTINGS index_granularity = 8192;
SELECT * FROM test_collation ORDER BY v ASC COLLATE 'en';
