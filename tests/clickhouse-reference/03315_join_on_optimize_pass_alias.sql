SELECT e2 FROM t1 FULL OUTER JOIN t2
ON (
    (((t1.y = t2.y) OR ((t1.y IS NULL) AND (t2.y IS NULL))) AND (COALESCE(t1.x, 0) != 2))
    OR (((t1.x = t2.x)) AND ((t2.x IS NOT NULL) AND (t1.x IS NOT NULL)))
    AS e2
)
ORDER BY ALL;
SELECT *, e2 FROM t1 FULL OUTER JOIN t2
ON (
    (((t1.y = t2.y) OR ((t1.y IS NULL) AND (t2.y IS NULL))) AND (COALESCE(t1.x, 0) != 2))
    OR (((t1.x = t2.x)) AND ((t2.x IS NOT NULL) AND (t1.x IS NOT NULL)))
    AS e2
) AND (t1.x = 1) AND (t2.x = 1)
ORDER BY ALL;
