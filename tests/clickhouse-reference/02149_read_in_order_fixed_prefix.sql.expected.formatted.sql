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

SELECT *
FROM (
        SELECT
            toStartOfDay(dt) AS date,
            d
        FROM t_read_in_order
        ORDER BY
            date ASC,
            round(d) ASC
        LIMIT 50000000000
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
        LIMIT 50000000000
    )
ORDER BY d ASC
LIMIT 5;