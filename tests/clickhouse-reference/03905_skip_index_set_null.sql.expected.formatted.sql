CREATE TABLE t_skip_index_null
(
    id UInt64,
    val Nullable(String),
    INDEX idx_val val TYPE set(0) GRANULARITY 1
)
ENGINE = MergeTree()
ORDER BY id;

INSERT INTO t_skip_index_null;

SELECT
    id,
    val
FROM t_skip_index_null
WHERE val = 'a'
ORDER BY id ASC;

SELECT
    id,
    val
FROM t_skip_index_null
WHERE isNull(val)
ORDER BY id ASC;

SELECT count()
FROM t_skip_index_null
WHERE val = 'nonexistent';