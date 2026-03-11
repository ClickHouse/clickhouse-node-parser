select id, array from test_lazy where id = 42 order by id limit 10 settings query_plan_optimize_lazy_materialization = 1;
