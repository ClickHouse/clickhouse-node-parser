SELECT '--';

SELECT *
FROM
    test_table_1 AS lhs
LEFT JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE rhs.id != 0;

SELECT *
FROM
    test_table_1 AS lhs
RIGHT JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE lhs.id != 0;

SELECT *
FROM
    test_table_1 AS lhs
FULL JOIN test_table_2 AS rhs
    ON lhs.id = rhs.id
WHERE lhs.id != 0
    AND rhs.id != 0;