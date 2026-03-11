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