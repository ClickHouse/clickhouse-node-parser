SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%id_no%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

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

SELECT splitByString('IN', query)[-1]
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND event_time > now() - toIntervalHour(1)
    AND NOT is_initial_query
    AND notLike(query, '%system%query_log%')
    AND like(query, concat('%', currentDatabase(), '%AS%key_signed%'))
    AND type = 'QueryFinish'
ORDER BY query ASC;

SELECT *
FROM dist_01756
WHERE dummy IN (0);

SELECT *
FROM dist_01756
WHERE dummy IN ('0');

SELECT *
FROM dist_01756
WHERE dummy IN (
        SELECT *
        FROM `system`.one
    );

SELECT *
FROM dist_01756
WHERE dummy IN (toUInt8(0))
SETTINGS enable_analyzer = 0;

SELECT *
FROM dist_01756
WHERE dummy NOT IN (0, 2);

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

SELECT
    (2 IN (tuple(2))),
    *
FROM dist_01756
WHERE dummy IN (0, 2)
FORMAT Null;

SELECT
    (dummy IN (tuple(toUInt8(2)))),
    *
FROM dist_01756
WHERE dummy IN (0, 2)
FORMAT Null;

SELECT 'different types -- prohibited';

SELECT *
FROM dist_01756_str
WHERE key IN ('0', '2');

SELECT *
FROM dist_01756_str
WHERE key IN (0, 2);

SELECT *
FROM dist_01756_str
WHERE key IN ('0', NULL)
SETTINGS enable_analyzer = 0;

SELECT *
FROM dist_01756_column
WHERE dummy IN (0, '255');

SELECT *
FROM dist_01756_column
WHERE dummy IN (0, '255foo');

SELECT *
FROM dist_01756
WHERE dummy IN ('0', '2');

SELECT *
FROM dist_01756
WHERE dummy IN (0, 2)
SETTINGS optimize_skip_unused_shards_limit = 1;

SELECT *
FROM dist_01756
WHERE dummy IN (0, 2)
SETTINGS
    optimize_skip_unused_shards_limit = 1,
    force_optimize_skip_unused_shards = 0;