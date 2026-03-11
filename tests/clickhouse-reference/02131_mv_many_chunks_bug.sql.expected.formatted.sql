SELECT count()
FROM (
        SELECT y
        FROM t_mv
        GROUP BY y
    );