SET max_threads = 0;

SET optimize_read_in_order = 1;

SET optimize_trivial_insert_select = 1;

SET read_in_order_two_level_merge_threshold = 100;

SET read_in_order_use_virtual_row = 1;

CREATE TABLE t_read_in_order
(
    date Date,
    i UInt64,
    v UInt64
)
ENGINE = MergeTree
ORDER BY (date, i)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT
    toStartOfMonth(date) AS d,
    i
FROM t_read_in_order
ORDER BY
    d ASC,
    i ASC
LIMIT 5;

SELECT
    toStartOfMonth(date) AS d,
    i
FROM t_read_in_order
ORDER BY
    d DESC,
    negate(i) ASC
LIMIT 5;

-- Here FinishSorting is used, because directions don't match.
SELECT
    toStartOfMonth(date) AS d,
    i
FROM t_read_in_order
ORDER BY
    d ASC,
    negate(i) ASC
LIMIT 5;

SELECT
    date,
    i
FROM t_read_in_order
WHERE date = '2020-10-11'
ORDER BY i ASC
LIMIT 5;

SELECT *
FROM t_read_in_order
WHERE date = '2020-10-11'
ORDER BY
    i ASC,
    v ASC
LIMIT 5;

SELECT
    date,
    i
FROM t_read_in_order
WHERE date = '2020-10-12'
ORDER BY i ASC
LIMIT 5;

SELECT
    date,
    i
FROM t_read_in_order
WHERE date = '2020-10-12'
ORDER BY i DESC
LIMIT 5;

CREATE TABLE t_read_in_order
(
    a UInt32,
    b UInt32
)
ENGINE = MergeTree
ORDER BY (a, b)
SETTINGS index_granularity = 3, index_granularity_bytes = '10Mi';

SELECT
    a,
    b
FROM t_read_in_order
WHERE a = 1
ORDER BY b ASC
SETTINGS read_in_order_two_level_merge_threshold = 1;

SELECT
    a,
    b
FROM t_read_in_order
WHERE a = 1
ORDER BY b DESC
SETTINGS read_in_order_two_level_merge_threshold = 1;

CREATE TABLE t_read_in_order
(
    dt DateTime,
    d Decimal64(5),
    v UInt64
)
ENGINE = MergeTree
ORDER BY (toStartOfDay(dt), d)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT *
FROM (
        SELECT
            toStartOfDay(dt) AS date,
            d
        FROM t_read_in_order
        ORDER BY
            date ASC,
            round(d) ASC
        LIMIT 50000000000 -- subquery with limit 50000000 to stabilize a test result and prevent order by d pushdown
    )
ORDER BY d ASC
LIMIT 5;

SELECT *
FROM (
        SELECT
            toStartOfDay(dt) AS date,
            d
        FROM t_read_in_order
        WHERE date = '2020-10-10'
        ORDER BY round(d) ASC
        LIMIT 50000000000 -- subquery with limit 50000000 to stabilize a test result and prevent order by d pushdown
    )
ORDER BY d ASC
LIMIT 5;