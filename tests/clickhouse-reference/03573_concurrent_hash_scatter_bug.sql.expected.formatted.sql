SELECT i
FROM
    t0
INNER JOIN (
        SELECT 3 AS k
    ) AS x
    ON x.k = j;

SELECT *
FROM
    test_table_join_1 AS t1
INNER JOIN test_table_join_2 AS t2
    USING (id)
ORDER BY
    id ASC,
    t1.value ASC;