SELECT k1, k2, k3, sum(value) v FROM t_proj_external GROUP BY k1, k2, k3 ORDER BY k1, k2, k3 SETTINGS optimize_use_projections = 0;
SELECT k1, k2, k3, sum(value) v FROM t_proj_external GROUP BY k1, k2, k3 ORDER BY k1, k2, k3;
SELECT k1, k2, k3, sum(value) v FROM t_proj_external GROUP BY k1, k2, k3 ORDER BY k1, k2, k3 SETTINGS optimize_aggregation_in_order = 0, max_bytes_before_external_group_by = 1, max_bytes_ratio_before_external_group_by = 0, group_by_two_level_threshold = 1;
SELECT k1, k2, k3, sum(value) v FROM t_proj_external GROUP BY k1, k2, k3 ORDER BY k1, k2, k3 SETTINGS optimize_aggregation_in_order = 1, max_bytes_before_external_group_by = 1, max_bytes_ratio_before_external_group_by = 0, group_by_two_level_threshold = 1;
