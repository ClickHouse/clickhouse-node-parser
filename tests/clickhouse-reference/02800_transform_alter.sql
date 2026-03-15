CREATE TABLE test_xy
(
    `x` Int32,
    `y` String
)
ENGINE = MergeTree
ORDER BY x;
CREATE TABLE updates
(
    `x` Int32,
    `y` String
)
ENGINE = MergeTree
ORDER BY x;
SELECT x, y,
    transform(x,
        (select groupArray(x) from (select x, y from updates order by x) t1),
        (select groupArray(y) from (select x, y from updates order by x) t2),
        y)
FROM test_xy
WHERE 1 ORDER BY x, y;
SET mutations_sync = 1;
SELECT * FROM test_xy ORDER BY x, y;
