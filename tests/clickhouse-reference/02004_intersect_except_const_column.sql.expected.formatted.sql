SELECT 'fooooo'
INTERSECT
SELECT 'fooooo';

SELECT 'fooooo'
EXCEPT
SELECT 'fooooo';

SELECT 1
FROM numbers(10)
INTERSECT
SELECT 1
FROM numbers(10);

SELECT toString(1)
FROM numbers(10)
INTERSECT
SELECT toString(1)
FROM numbers(10);

SELECT '1'
FROM numbers(10)
INTERSECT
SELECT '1'
FROM numbers(10);

SELECT 1
FROM numbers(10)
INTERSECT
SELECT 1
FROM numbers(10);

SELECT toString(1)
FROM numbers(10)
INTERSECT
SELECT toString(1)
FROM numbers(10);

SELECT '1'
FROM numbers(10)
INTERSECT
SELECT '1'
FROM numbers(10);

SELECT 2
FROM numbers(10)
EXCEPT
SELECT 1
FROM numbers(5);

SELECT toString(2)
FROM numbers(10)
EXCEPT
SELECT toString(1)
FROM numbers(5);

SELECT '2'
FROM numbers(10)
EXCEPT
SELECT '1'
FROM numbers(5);

SELECT 2
FROM numbers(10)
EXCEPT
SELECT 1
FROM numbers(5);

SELECT toString(2)
FROM numbers(10)
EXCEPT
SELECT toString(1)
FROM numbers(5);

SELECT '2'
FROM numbers(10)
EXCEPT
SELECT '1'
FROM numbers(5);