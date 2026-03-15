create table data_proj_order_by_comp (t UInt64, projection tSort (select * order by t)) ENGINE MergeTree() order by tuple();
-- { echoOn }
select t from data_proj_order_by_comp where t > 0 order by t settings optimize_read_in_order=1;
select t from data_proj_order_by_comp where t > 0 order by t settings optimize_read_in_order=0;
select t from data_proj_order_by_comp where t > 0 order by t settings max_threads=1;
