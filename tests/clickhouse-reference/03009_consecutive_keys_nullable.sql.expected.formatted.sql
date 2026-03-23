SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_1;

CREATE TABLE t_nullable_keys_1
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_1;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_1
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_1;

SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_2;

CREATE TABLE t_nullable_keys_2
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_2;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_2
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_2;

SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_3;

CREATE TABLE t_nullable_keys_3
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_3;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_3
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_3;

SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_4;

CREATE TABLE t_nullable_keys_4
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_4;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_4
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_4;

SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_5;

CREATE TABLE t_nullable_keys_5
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_5;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_5
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_5;

SYSTEM DROP  TABLE IF EXISTS t_nullable_keys_6;

CREATE TABLE t_nullable_keys_6
(
    x Nullable(Int64)
)
ENGINE = Memory;

INSERT INTO t_nullable_keys_6;

SELECT
    x,
    count(),
    countIf(isNull(x))
FROM t_nullable_keys_6
GROUP BY x
ORDER BY x ASC;

SYSTEM DROP  TABLE t_nullable_keys_6;

SELECT
    splitByChar('.', tables[1])[2] AS table,
    ProfileEvents['AggregationOptimizedEqualRangesOfKeys'] > 0
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND like(query, '%SELECT%FROM%t_nullable_keys_%')
ORDER BY table ASC;