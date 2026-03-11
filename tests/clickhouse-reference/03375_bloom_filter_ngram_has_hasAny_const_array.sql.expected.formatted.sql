SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT bf
        FROM bloom_filter_has_const_array
        WHERE hasAny(['a','c','d'], abf)
    )
WHERE like(`explain`, 'Description%')
    OR like(`explain`, 'Granules%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT bf
        FROM bloom_filter_has_const_array
        WHERE has(['a','d'], bf)
    )
WHERE like(`explain`, 'Description%')
    OR like(`explain`, 'Granules%');

SELECT bf
FROM bloom_filter_has_const_array
WHERE hasAny(['a','c','d'], abf)
    AND has(['a','d'], bf)
    AND hasAll(['d','e'], abf);