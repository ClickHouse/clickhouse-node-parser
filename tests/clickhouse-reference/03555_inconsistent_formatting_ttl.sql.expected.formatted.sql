CREATE TABLE t0
(
    c0 Date
)
ENGINE = MergeTree()
ORDER BY tuple()
TTL (materialize(c0));