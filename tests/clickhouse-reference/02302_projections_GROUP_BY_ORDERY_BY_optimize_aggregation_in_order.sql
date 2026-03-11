
select x + y, sum(x - y) as s from test_agg_proj_02302 group by x + y order by s desc limit 5 settings optimize_aggregation_in_order=0, optimize_read_in_order=0;
select x + y, sum(x - y) as s from test_agg_proj_02302 group by x + y order by s desc limit 5 settings optimize_aggregation_in_order=1, optimize_read_in_order=1;
