SELECT
    x,
    t1.y - t2.y
FROM
    byte_identical_r1 AS t1
LEFT JOIN byte_identical_r2 AS t2
    USING (x)
ORDER BY x ASC;