CREATE TABLE t0
(
    c0 Int
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (EXISTS((
    SELECT 1
)));