SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT id
        FROM bloom_filter_test
        WHERE mapContains(m, '1')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules:%');

SELECT id
FROM bloom_filter_test
WHERE mapContains(m, '1')
ORDER BY id ASC;

SELECT trim(`explain`)
FROM (
        EXPLAIN indexes = 1
        SELECT *
        FROM bloom_filter_test
        WHERE mapContains(m, '1')
        ORDER BY id ASC
    )
WHERE like(`explain`, '%Granules:%');

SELECT *
FROM bloom_filter_test
WHERE mapContains(m, '1')
ORDER BY id ASC;