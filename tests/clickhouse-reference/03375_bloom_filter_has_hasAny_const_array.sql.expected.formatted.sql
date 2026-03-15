SET parallel_replicas_local_plan = 1;

CREATE TABLE bloom_filter_has_const_array
(
    bf String,
    abf Array(String),
    INDEX idx_bf bf TYPE bloom_filter(0.01) GRANULARITY 1,
    INDEX idx_abf abf TYPE bloom_filter(0.01) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

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