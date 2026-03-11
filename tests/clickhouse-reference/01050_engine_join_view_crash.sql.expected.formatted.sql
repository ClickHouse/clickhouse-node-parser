SELECT *
FROM
    (
        SELECT *
        FROM
            a
        LEFT JOIN id1
            USING (id1)
    ) AS js1
LEFT JOIN id2
    USING (id2);

SELECT *
FROM b;