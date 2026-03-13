-- DISTINCT has to be removed since the view already has DISTINCT on the same column
SELECT count()
FROM (
        EXPLAIN
        SELECT DISTINCT x
        FROM tab_v
    )
WHERE ilike(`explain`, '%distinct%');

SELECT DISTINCT x
FROM tab_v
ORDER BY x ASC;

-- explicitly checking that materialize() doesn't affect the result, - redundant DISTINCT is still removed
SELECT count()
FROM (
        EXPLAIN
        SELECT DISTINCT x
        FROM (
                SELECT materialize(x) AS x
                FROM (
                        SELECT DISTINCT x
                        FROM tab
                    )
            )
    )
WHERE ilike(`explain`, '%distinct%');