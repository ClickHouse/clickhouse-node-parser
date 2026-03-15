CREATE TABLE t0
(
    c0 Time64(3),
    c1 Int
)
ENGINE = MergeTree()
ORDER BY tuple();