SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT
            c1,
            sum(c3)
        FROM t0
        GROUP BY c1
    )
WHERE like(`explain`, '%ReadFromMergeTree%');

SELECT trimLeft(*)
FROM (
        EXPLAIN indexes = 1
        SELECT
            c1,
            sum(c3)
        FROM t0
        WHERE c1 = 100
        GROUP BY c1
    )
WHERE like(`explain`, '%Granules%');