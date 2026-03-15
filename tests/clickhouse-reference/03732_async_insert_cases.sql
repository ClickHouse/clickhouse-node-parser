set async_insert = 1;
set wait_for_async_insert = 0;
set async_insert_deduplicate = 1;
set deduplicate_blocks_in_dependent_materialized_views = 1;
-- turn off adaptive busy timeout to make test stable
set async_insert_use_adaptive_busy_timeout=0, async_insert_busy_timeout_min_ms=1000, async_insert_busy_timeout_max_ms=5000;
create table 03732_table
(
    id   UInt32,
    name String
)
engine = ReplicatedMergeTree('/clickhouse/tables/test/{database}/03732_table', 'replica1')
order by id;
create table 03732_table_mv_dst
(
    id   UInt32,
    name String
)
engine = ReplicatedMergeTree('/clickhouse/tables/test/{database}/03732_table_mv_dst', 'replica1')
order by id;
create materialized view 03732_table_mv
TO 03732_table_mv_dst
as select * from 03732_table;
select count(*) from 03732_table;        -- Expecting 3
select count(*) from 03732_table_mv_dst;     -- Expecting 3
create table 03732_table_join
(
    id   UInt32,
    surname String
)
engine = ReplicatedMergeTree('/clickhouse/tables/test/{database}/03732_table_join', 'replica1')
order by id;
create table 03732_table_join_mv_dst
(
    id      UInt32,
    name    String,
    surname String
)
engine = ReplicatedMergeTree('/clickhouse/tables/test/{database}/03732_table_join_mv_dst', 'replica1')
order by id;
create materialized view 03732_table_join_mv
TO 03732_table_join_mv_dst
as select t1.id as id, t1.name as name, t2.surname as surname from 03732_table as t1 join 03732_table_join as t2 using id;
select count(*) from 03732_table_join_mv;      -- Expecting 3
select * from 03732_table_join_mv order by id;
