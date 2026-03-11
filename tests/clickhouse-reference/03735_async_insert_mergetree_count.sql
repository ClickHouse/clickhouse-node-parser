-- Expecting 8
select 'src_table', count(*) from src_table;
select * from src_table order by all;
-- Expecting 2
select 'dst_1_0', count(*) from dst_1_0;
select * from dst_1_0 order by all;
-- Expecting 4
select 'dst_1_1', count(*) from dst_1_1;
select * from dst_1_1 order by all;
-- Expecting 6
select 'dst_1_2', count(*) from dst_1_2;
select * from dst_1_2 order by all;
-- Expecting 6
select 'dst_2_01', count(*) from dst_2_01;
select * from dst_2_01 order by all;
select query, query_kind, exception_code from system.query_log
where
    has(databases, currentDatabase())
    and has(tables, currentDatabase() || '.src_table')
    and type != 'QueryStart'
    and query_kind = 'AsyncInsertFlush'
order by all desc;
