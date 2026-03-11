SELECT 1
FROM test AS t1
WHERE EXISTS((
        SELECT *
        FROM test AS t2
        WHERE t1.i1 = t2.i2
    ));