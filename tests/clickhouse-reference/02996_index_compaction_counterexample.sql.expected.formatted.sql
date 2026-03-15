CREATE TABLE b
(
    x Int64,
    y String
)
ENGINE = MergeTree
ORDER BY (x, y)
SETTINGS index_granularity = 2;

SELECT count()
FROM b
WHERE x = 1
    AND y = 'b';