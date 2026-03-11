SELECT *
FROM (
        SELECT
            a,
            t1.val AS val1,
            t2.val AS val2
        FROM
            t AS t1
        LEFT JOIN t AS t2
            USING (a)
    )
ORDER BY val1 ASC;