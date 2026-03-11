SELECT exists((
        SELECT 1
    ));

SELECT exists((
        SELECT 1
EXCEPT
        SELECT 1
    ));

SELECT exists((
        SELECT number
        FROM numbers(10)
        WHERE number > 0
    ));

SELECT exists((
        SELECT number
        FROM numbers(10)
        WHERE number < 0
    ));

SELECT count()
FROM numbers(10)
WHERE exists((
        SELECT 1
EXCEPT
        SELECT 1
    ));

SELECT count()
FROM numbers(10)
WHERE exists((
        SELECT 1
INTERSECT
        SELECT 1
    ));

SELECT count()
FROM numbers(10)
WHERE exists((
        SELECT number
        FROM numbers(10)
        WHERE number > 8
    ));

SELECT count()
FROM numbers(10)
WHERE exists((
        SELECT number
        FROM numbers(10)
        WHERE number > 9
    ));