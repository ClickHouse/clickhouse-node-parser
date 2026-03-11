SELECT 1
FROM test2 AS test2
ARRAY JOIN arrayFilter(t -> (t GLOBAL IN
    (
        SELECT DISTINCT now() AS `ym:a`
        WHERE 1
    )), test2.b) AS test2_b
WHERE 1;
