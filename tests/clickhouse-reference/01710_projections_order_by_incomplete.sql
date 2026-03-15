create table data_proj_order_by_incomp (t UInt64) ENGINE MergeTree() order by tuple();
-- { echoOn }
select t from data_proj_order_by_incomp where t > 0 order by t settings optimize_read_in_order=1;
select t from data_proj_order_by_incomp where t > 0 order by t settings optimize_read_in_order=0;
select t from data_proj_order_by_incomp where t > 0 order by t settings max_threads=1;
