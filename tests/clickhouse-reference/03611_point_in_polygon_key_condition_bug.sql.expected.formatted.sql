CREATE TABLE p3
(
    x Int64,
    y Int64
)
ENGINE = MergeTree
ORDER BY (x, y);