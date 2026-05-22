-- { echo }
SELECT 1 == any((
        SELECT number
        FROM numbers(10)
    ));

SELECT 1 == any((
        SELECT number
        FROM numbers(2, 10)
    ));

SELECT 1 != all((
        SELECT 1
        FROM numbers(10)
    ));

SELECT 1 != all((
        SELECT number
        FROM numbers(10)
    ));

SELECT 1 == all((
        SELECT 1
        FROM numbers(10)
    ));

SELECT 1 == all((
        SELECT number
        FROM numbers(10)
    ));

SELECT 1 != any((
        SELECT 1
        FROM numbers(10)
    ));

SELECT 1 != any((
        SELECT number
        FROM numbers(10)
    ));

SELECT number AS a
FROM numbers(10)
WHERE a == any((
        SELECT number
        FROM numbers(3, 3)
    ));

SELECT number AS a
FROM numbers(10)
WHERE a != any((
        SELECT 5
        FROM numbers(3, 3)
    ));

SELECT 1 < any((
        SELECT 1
        FROM numbers(10)
    ));

SELECT 1 <= any((
        SELECT 1
        FROM numbers(10)
    ));

SELECT 1 < any((
        SELECT number
        FROM numbers(10)
    ));

SELECT 1 > any((
        SELECT number
        FROM numbers(10)
    ));

SELECT 1 >= any((
        SELECT number
        FROM numbers(10)
    ));

SELECT 11 > all((
        SELECT number
        FROM numbers(10)
    ));

SELECT 11 <= all((
        SELECT number
        FROM numbers(11)
    ));

SELECT 11 < all((
        SELECT 11
        FROM numbers(10)
    ));

SELECT 11 > all((
        SELECT 11
        FROM numbers(10)
    ));

SELECT 11 >= all((
        SELECT 11
        FROM numbers(10)
    ));

SELECT sum(number) = any(number)
FROM numbers(1)
GROUP BY number;

SELECT 1 == any(1);