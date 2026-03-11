select count() from t_delete_skip_index where y in (4, 5);
select sum(y) from t_delete_projection settings optimize_use_projections = 0;
select sum(y) from t_delete_projection settings optimize_use_projections = 0, force_optimize_projection = 1;
