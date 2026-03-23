CREATE TABLE t_skip_index_null
(
    id UInt64,
    val Nullable(String),
    INDEX idx_val val TYPE set(0) GRANULARITY 1
) ENGINE = MergeTree()
ORDER BY id;
INSERT INTO t_skip_index_null VALUES (1, 'a'), (2, NULL), (3, 'b'), (4, NULL), (5, 'c');
SELECT id, val FROM t_skip_index_null WHERE val = 'a' ORDER BY id;
SELECT id, val FROM t_skip_index_null WHERE val IS NULL ORDER BY id;
SELECT count() FROM t_skip_index_null WHERE val = 'nonexistent';
