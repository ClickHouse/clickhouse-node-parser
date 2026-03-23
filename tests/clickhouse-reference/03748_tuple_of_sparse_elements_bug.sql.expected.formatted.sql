CREATE TABLE t0
(
    c0 String,
    c1 Tuple(Nullable(Int))
)
ENGINE = MergeTree()
ORDER BY tuple();

INSERT INTO t0 (c0) SELECT 'abc'
FROM numbers(142);

INSERT INTO t0 (c0);

INSERT INTO t0 (c0) SELECT 'abc'
FROM numbers(196);