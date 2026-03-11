select count(*) from table_join;  -- Expecting 400000
select count(*) from src_table;             -- Expecting 2
select count(*) from table_join_mv_dst; -- Expecting 20000
select query, type, exception_code from system.query_log
where
    has(databases, currentDatabase())
    and has(tables, currentDatabase() || '.src_table')
    and type != 'QueryStart'
    and query_kind = 'AsyncInsertFlush'
order by all desc;
