SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM tab FINAL
        WHERE v = 222
    )
WHERE ilike(`explain`, '%PrimaryKeyExpand%');

SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT count(*)
        FROM tab FINAL
        WHERE id2 = 222
    )
WHERE ilike(`explain`, '%PrimaryKeyExpand%');

SELECT rank() OVER ()
FROM t0 FINAL
WHERE t0.c0 > 0.1
FORMAT null;