select count(*) from 03732_table;        -- Expecting 3
select count(*) from 03732_table_mv_dst;     -- Expecting 3
select count(*) from 03732_table_join_mv;      -- Expecting 3
select * from 03732_table_join_mv order by id;
