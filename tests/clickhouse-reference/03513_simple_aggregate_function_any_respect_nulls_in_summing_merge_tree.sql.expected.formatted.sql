SELECT
    a,
    any_respect_nulls(any_simple),
    any_respect_nullsMerge(any_agg),
    anyLast_respect_nulls(anyLast_simple),
    anyLast_respect_nullsMerge(anyLast_agg)
FROM simple_agf_any_summing_mt
GROUP BY a
ORDER BY a ASC;