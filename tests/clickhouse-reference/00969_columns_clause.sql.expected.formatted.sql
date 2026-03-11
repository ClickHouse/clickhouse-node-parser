SELECT COLUMNS('product.*')
FROM ColumnsClauseTest
ORDER BY product_price ASC;

SELECT
    number,
    COLUMNS('')
FROM numbers(2);

SELECT
    number,
    COLUMNS('ber')
FROM numbers(2);

SELECT
    number,
    COLUMNS('x')
FROM numbers(2);

SELECT COLUMNS('')
FROM numbers(2);

SELECT COLUMNS('x')
FROM numbers(10)
WHERE number > 5;

SELECT *
FROM numbers(2)
WHERE NOT ignore();

SELECT *
FROM numbers(2)
WHERE NOT ignore(*);

SELECT *
FROM numbers(2)
WHERE NOT ignore(COLUMNS('.+'));

SELECT *
FROM numbers(2)
WHERE NOT ignore(COLUMNS('x'));

SELECT COLUMNS('n') + COLUMNS('u')
FROM `system`.numbers
LIMIT 2;

SELECT COLUMNS('n') + COLUMNS('u')
FROM (
        SELECT
            1 AS a,
            2 AS b
    );

SELECT COLUMNS('a') + COLUMNS('b')
FROM (
        SELECT
            1 AS a,
            2 AS b
    );

SELECT COLUMNS('a') + COLUMNS('a')
FROM (
        SELECT
            1 AS a,
            2 AS b
    );

SELECT COLUMNS('b') + COLUMNS('b')
FROM (
        SELECT
            1 AS a,
            2 AS b
    );

SELECT COLUMNS('a|b') + COLUMNS('b')
FROM (
        SELECT
            1 AS a,
            2 AS b
    );

SELECT plus(COLUMNS('^(a|b)$'))
FROM (
        SELECT
            1 AS a,
            2 AS b
    );