SELECT count()
FROM
    t
ARRAY JOIN (
        SELECT a
        FROM t1
    ) AS _a
SETTINGS optimize_trivial_count_query = 1;