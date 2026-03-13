SELECT 1
FROM
    (
        SELECT 1 AS x
    ) AS t0
LEFT JOIN VALUES(f1(1, 2)) AS t1
    USING (x); -- { serverError UNKNOWN_IDENTIFIER }