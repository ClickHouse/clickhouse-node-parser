CREATE TABLE test_projection_deduplicate
(
    `id` Int32,
    `string` String,
    PROJECTION test_projection
    (
        SELECT id
        GROUP BY id
    )
)
ENGINE = MergeTree
PRIMARY KEY id;
SELECT * FROM test_projection_deduplicate;
