SELECT *
FROM test
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_assume
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_coalesce
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM view_ifnull
WHERE ts >= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY id ASC;

SELECT *
FROM test_non_null
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_non_null
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_non_null
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null_rev
WHERE assumeNotNull(ts) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null_rev
WHERE coalesce(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_null_rev
WHERE ifNull(ts, toDateTime64('1970-01-01 00:00:00', 3)) <= toDateTime64('2025-01-01 00:00:00', 3)
ORDER BY `ALL` ASC;

SELECT *
FROM test_lc_left_inf
WHERE assumeNotNull(ts) >= 1000
ORDER BY `ALL` ASC;