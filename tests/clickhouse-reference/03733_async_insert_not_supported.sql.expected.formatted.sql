SELECT count(*)
FROM table_join; -- Expecting 400000

SELECT count(*)
FROM src_table; -- Expecting 2

SELECT count(*)
FROM table_join_mv_dst; -- Expecting 20000

SELECT
    query,
    type,
    exception_code
FROM `system`.query_log
WHERE has(databases, currentDatabase())
    AND has(tables, concat(currentDatabase(), '.src_table'))
    AND type != 'QueryStart'
    AND query_kind = 'AsyncInsertFlush'
ORDER BY `all` DESC;