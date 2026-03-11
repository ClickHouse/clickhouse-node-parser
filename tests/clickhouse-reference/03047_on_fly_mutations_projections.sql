SELECT sum(v) FROM t_update_projections SETTINGS force_optimize_projection = 1;
SELECT sum(v) FROM t_update_projections;
