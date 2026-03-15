CREATE TABLE order_by_nulls_first
(
    diff Nullable(Int16),
    traf UInt64
)
ENGINE = MergeTree
ORDER BY tuple();

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC,
    traf ASC
LIMIT 1, 4;

SELECT '--- DESC NULLS FIRST, ASC';

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC,
    traf ASC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC,
    traf ASC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC,
    traf ASC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC,
    traf ASC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC,
    traf DESC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff DESC,
    traf DESC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC,
    traf DESC;

SELECT
    diff,
    traf
FROM order_by_nulls_first
ORDER BY
    diff ASC,
    traf DESC;