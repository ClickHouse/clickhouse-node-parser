create table t (i int, j int) engine MergeTree order by i settings add_minmax_index_for_numeric_columns=0;
insert into t values (1, 2);
insert into t values (1, 4);
insert into t values (1, 5);
set optimize_use_projections = 1, force_optimize_projection = 1;
set parallel_replicas_local_plan = 1, parallel_replicas_support_projection = 1, optimize_aggregation_in_order = 0;
select i from t prewhere j = 4;
SELECT j = 2, i FROM t PREWHERE j = 2;
SELECT j = -1, j = NULL FROM t WHERE j = -1;
