SELECT
    k1,
    k2,
    k3,
    sum(value) AS v
FROM t_proj_external_agg
GROUP BY
    k1,
    k2,
    k3
ORDER BY
    k1 ASC,
    k2 ASC,
    k3 ASC
SETTINGS
    optimize_aggregation_in_order = 0,
    max_bytes_before_external_group_by = 1,
    max_bytes_ratio_before_external_group_by = 0,
    group_by_two_level_threshold = 1;