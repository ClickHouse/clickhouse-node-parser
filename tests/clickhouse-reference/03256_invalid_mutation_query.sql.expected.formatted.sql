CREATE TABLE t
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();

CREATE TABLE t2
(
    x int
)
ENGINE = MergeTree()
ORDER BY tuple();