SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE test
(
    dt Date,
    id UInt32,
    val Nullable(UInt32)
)
ENGINE = MergeTree(dt, id, 8192);

SELECT count()
FROM test
WHERE val = 0;