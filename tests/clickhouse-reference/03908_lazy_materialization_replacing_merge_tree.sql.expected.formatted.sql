SELECT count()
FROM (
        SELECT *
        FROM t_lm_replacing
        WHERE domain = '172.16.96.212:5432'
        ORDER BY timestamp DESC
        LIMIT 10
    );