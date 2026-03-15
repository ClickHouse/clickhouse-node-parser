set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE test_00615
(
    dt Date,
    id Int32,
    key String,
    data Nullable(Int8)
) ENGINE = MergeTree(dt, (id, key, dt), 8192);
SELECT * FROM test_00615 ORDER BY data NULLS FIRST;
