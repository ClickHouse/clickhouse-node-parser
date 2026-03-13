SELECT
    test_table_join_1.id,
    test_table_join_1.value,
    test_table_join_2.id,
    test_table_join_2.value
FROM
    test_table_join_1
CROSS JOIN test_table_join_2
ORDER BY `ALL` ASC;

SELECT '--';

SELECT
    t1.id,
    t1.value,
    t2.id,
    t2.value
FROM
    test_table_join_1 AS t1
CROSS JOIN test_table_join_2 AS t2
ORDER BY `ALL` ASC;

SELECT
    t1.id,
    test_table_join_1.id,
    t1.value,
    test_table_join_1.value,
    t2.id,
    test_table_join_2.id,
    t2.value,
    test_table_join_2.value
FROM
    test_table_join_1 AS t1
CROSS JOIN test_table_join_2 AS t2
ORDER BY `ALL` ASC;

SELECT
    test_table_join_1.id,
    test_table_join_1.value,
    test_table_join_2.id,
    test_table_join_2.value,
    test_table_join_3.id,
    test_table_join_3.value
FROM
    test_table_join_1
CROSS JOIN test_table_join_2
CROSS JOIN test_table_join_3
ORDER BY `ALL` ASC;

SELECT
    t1.id,
    t1.value,
    t2.id,
    t2.value,
    t3.id,
    t3.value
FROM
    test_table_join_1 AS t1
CROSS JOIN test_table_join_2 AS t2
CROSS JOIN test_table_join_3 AS t3
ORDER BY `ALL` ASC;

SELECT
    t1.id,
    test_table_join_1.id,
    t1.value,
    test_table_join_1.value,
    t2.id,
    test_table_join_2.id,
    t2.value,
    test_table_join_2.value,
    t3.id,
    test_table_join_3.id,
    t3.value,
    test_table_join_3.value
FROM
    test_table_join_1 AS t1
CROSS JOIN test_table_join_2 AS t2
CROSS JOIN test_table_join_3 AS t3
ORDER BY `ALL` ASC;

SELECT id
FROM
    test_table_join_1
CROSS JOIN test_table_join_2; -- { serverError AMBIGUOUS_IDENTIFIER }

SELECT value
FROM
    test_table_join_1
CROSS JOIN test_table_join_2; -- { serverError AMBIGUOUS_IDENTIFIER }