SET optimize_on_insert = 0;

CREATE TABLE tt_01373
(
    a Int64,
    d Int64,
    val Int64
)
ENGINE = SummingMergeTree
ORDER BY (d)
PARTITION BY (a)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT '---';

SELECT count(*)
FROM tt_01373;

SELECT count(*)
FROM tt_01373 FINAL;

SELECT
    a,
    count()
FROM tt_01373 FINAL
GROUP BY a
ORDER BY a ASC;

SELECT
    a,
    count()
FROM tt_01373
GROUP BY a
ORDER BY a ASC;

CREATE TABLE tt_01373_expr
(
    a Int64,
    d Int64,
    val Int64
)
ENGINE = SummingMergeTree
ORDER BY (d + 0)
PARTITION BY (a % 2);

SELECT
    *,
    _partition_id
FROM tt_01373_expr
ORDER BY (a, d, val) ASC;