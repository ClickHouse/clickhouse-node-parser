SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1
    SELECT bf
    FROM bloom_filter_has_const_array
    WHERE hasAny(['a','c','d'], abf)
)
WHERE explain LIKE 'Description%' or explain LIKE 'Granules%';
SELECT trimLeft(explain) AS explain FROM (
    EXPLAIN indexes = 1
    SELECT bf
    FROM bloom_filter_has_const_array
    WHERE has(['a','d'], bf)
)
WHERE explain LIKE 'Description%' or explain LIKE 'Granules%';
SELECT bf
FROM bloom_filter_has_const_array
WHERE hasAny(['a','c','d'], abf) and has(['a','d'], bf) and hasAll(['d','e'], abf);
