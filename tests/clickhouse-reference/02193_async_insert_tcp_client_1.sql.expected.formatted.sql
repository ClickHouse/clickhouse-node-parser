-- Tags: no-fasttest
SET log_queries = 1;

CREATE TABLE t_async_insert_02193_1
(
    id UInt32,
    s String
)
ENGINE = Memory;

SET async_insert = 1;

SELECT *
FROM t_async_insert_02193_1
ORDER BY id ASC;

SELECT
    count(),
    sum(ProfileEvents['AsyncInsertQuery'])
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND ilike(query, 'INSERT INTO t_async_insert_02193_1%');