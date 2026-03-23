-- Tags: shard
-- NOTE: this test cannot use 'current_database = currentDatabase()',
-- because it does not propagated via remote queries,
-- hence it uses 'with (select currentDatabase()) as X'
-- (with subquery to expand it on the initiator).
SYSTEM drop  table if exists dist_01756;

SYSTEM drop  table if exists dist_01756_str;

SYSTEM drop  table if exists dist_01756_column;

SYSTEM drop  table if exists data_01756_str;

SYSTEM drop  table if exists data_01756_signed;

-- separate log entry for localhost queries
SET prefer_localhost_replica = 0;

SET force_optimize_skip_unused_shards = 2;

SET optimize_skip_unused_shards = 1;

SET optimize_skip_unused_shards_rewrite_in = 0;

SET log_queries = 1;

-- { echoOn }
-- SELECT
--     intHash64(0) % 2,
--     intHash64(2) % 2
-- ┌─modulo(intHash64(0), 2)─┬─modulo(intHash64(2), 2)─┐
-- │                       0 │                       1 │
-- └─────────────────────────┴─────────────────────────┘
CREATE TABLE dist_01756 AS `system`.one
ENGINE = Distributed(test_cluster_two_shards, `system`, one, intHash64(dummy));

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%id_no%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

--
-- w/ optimize_skip_unused_shards_rewrite_in=1
--
SET optimize_skip_unused_shards_rewrite_in = 1;

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%id_02%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%id_2%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%id_00%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

CREATE TABLE data_01756_signed
(
    key Int
)
ENGINE = Null;

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%key_signed%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

-- not tuple
SELECT *
FROM dist_01756
WHERE dummy IN (0);

SELECT *
FROM dist_01756
WHERE dummy IN ('0');

-- optimize_skip_unused_shards does not support non-constants
SELECT *
FROM dist_01756
WHERE dummy IN (
        SELECT *
        FROM `system`.one
    ); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

-- this is a constant for analyzer
SELECT *
FROM dist_01756
WHERE dummy IN (toUInt8(0))
SETTINGS enable_analyzer = 0; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

-- NOT IN does not supported
SELECT *
FROM dist_01756
WHERE dummy NOT IN (0, 2); -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

SELECT *
FROM dist_01756
WHERE dummy NOT IN (2, 3)
    AND dummy IN (0, 2);

SELECT *
FROM dist_01756
WHERE dummy IN (tuple(0, 2));

SELECT *
FROM dist_01756
WHERE dummy IN (tuple(0));

SELECT *
FROM dist_01756
WHERE dummy IN (tuple(2));

-- Identifier is NULL
SELECT
    (2 IN (tuple(2))),
    *
FROM dist_01756
WHERE dummy IN (0, 2)
FORMAT Null;

-- Literal is NULL
SELECT
    (dummy IN (tuple(toUInt8(2)))),
    *
FROM dist_01756
WHERE dummy IN (0, 2)
FORMAT Null;

-- different type
SELECT 'different types -- prohibited';

CREATE TABLE data_01756_str
(
    key String
)
ENGINE = Memory();

INSERT INTO data_01756_str;

-- SELECT
--     cityHash64(0) % 2,
--     cityHash64(2) % 2
--
-- ┌─modulo(cityHash64(0), 2)─┬─modulo(cityHash64(2), 2)─┐
-- │                        0 │                        1 │
-- └──────────────────────────┴──────────────────────────┘
CREATE TABLE dist_01756_str AS data_01756_str
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01756_str, cityHash64(key));

SELECT *
FROM dist_01756_str
WHERE key IN ('0', '2');

SELECT *
FROM dist_01756_str
WHERE key IN (0, 2);

-- analyzer does support this
SELECT *
FROM dist_01756_str
WHERE key IN ('0', NULL)
SETTINGS enable_analyzer = 0; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

CREATE TABLE dist_01756_column AS `system`.one
ENGINE = Distributed(test_cluster_two_shards, `system`, one, dummy);

SELECT *
FROM dist_01756_column
WHERE dummy IN (0, '255');

SELECT *
FROM dist_01756_column
WHERE dummy IN (0, '255foo'); -- { serverError TYPE_MISMATCH }

-- intHash64 does not accept string, but implicit conversion should be done
SELECT *
FROM dist_01756
WHERE dummy IN ('0', '2');

SELECT *
FROM dist_01756
WHERE dummy IN (0, 2)
SETTINGS optimize_skip_unused_shards_limit = 1; -- { serverError UNABLE_TO_SKIP_UNUSED_SHARDS }

SELECT *
FROM dist_01756
WHERE dummy IN (0, 2)
SETTINGS
    optimize_skip_unused_shards_limit = 1,
    force_optimize_skip_unused_shards = 0;

-- { echoOff }
SYSTEM drop  table dist_01756;

SYSTEM drop  table dist_01756_str;

SYSTEM drop  table dist_01756_column;

SYSTEM drop  table data_01756_str;

SYSTEM drop  table data_01756_signed;