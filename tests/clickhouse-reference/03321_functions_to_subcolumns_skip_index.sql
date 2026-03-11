SELECT trim(explain) FROM
(
    EXPLAIN indexes = 1
    SELECT id          -- 'm' not in projection columns
    FROM bloom_filter_test
    WHERE mapContains(m, '1')
    ORDER BY id
) WHERE explain LIKE '%Granules:%';
SELECT id          -- 'm' not in projection columns
FROM bloom_filter_test
WHERE mapContains(m, '1')
ORDER BY id;
SELECT trim(explain) FROM
(
    EXPLAIN indexes = 1
    SELECT *           -- 'm' in projection columns
    FROM bloom_filter_test
    WHERE mapContains(m, '1')
    ORDER BY id
) WHERE explain LIKE '%Granules:%';
SELECT *           -- 'm' in projection columns
FROM bloom_filter_test
WHERE mapContains(m, '1')
ORDER BY id;
