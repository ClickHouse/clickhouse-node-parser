SELECT count()
FROM `system`.parts
WHERE table = 't_index_agg_func'
    AND database = currentDatabase()
    AND active;

SELECT
    id,
    finalizeAggregation(v) AS vv
FROM t_index_agg_func FINAL
WHERE vv >= 10
ORDER BY id ASC;