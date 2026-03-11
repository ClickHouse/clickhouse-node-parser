SELECT *
FROM
    test_table_join_1 AS t1
INNER JOIN test_table_join_2 AS t2
    ON t1.id = t2.id
ORDER BY
    t1.id ASC,
    t1.value ASC;

SELECT '--';

SELECT *
FROM
    test_table_join_1 AS t1
LEFT JOIN test_table_join_2 AS t2
    ON t1.id = t2.id
ORDER BY
    t1.id ASC,
    t1.value ASC;

SELECT *
FROM
    test_table_join_1 AS t1
RIGHT JOIN test_table_join_2 AS t2
    ON t1.id = t2.id
ORDER BY
    t1.id ASC,
    t1.value ASC;

SELECT *
FROM
    test_table_join_1 AS t1
FULL JOIN test_table_join_2 AS t2
    ON t1.id = t2.id
ORDER BY
    t1.id ASC,
    t1.value ASC;