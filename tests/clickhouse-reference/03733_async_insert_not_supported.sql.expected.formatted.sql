SELECT count(*)
FROM table_join;

SELECT count(*)
FROM src_table;

SELECT count(*)
FROM table_join_mv_dst;

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