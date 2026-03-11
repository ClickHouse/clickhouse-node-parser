SELECT
    id,
    minArgMin(agg_time, value),
    maxArgMax(agg_time, value)
FROM combinator_argMin_table_r1
GROUP BY id
ORDER BY id
SETTINGS force_optimize_projection=1;
SELECT
    id,
    minArgMin(agg_time, value),
    maxArgMax(agg_time, value)
FROM combinator_argMin_table_r2
GROUP BY id
ORDER BY id
SETTINGS force_optimize_projection=1;
