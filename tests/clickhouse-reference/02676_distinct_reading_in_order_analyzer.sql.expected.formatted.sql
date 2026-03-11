SELECT trimBoth(`explain`)
FROM (
        EXPLAIN PIPELINE
        SELECT DISTINCT a
        FROM t
    )
WHERE like(`explain`, '%InOrder%');