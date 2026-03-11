SELECT count()
FROM test1
WHERE NOT has([1,2,3], i);

SELECT count()
FROM test1
WHERE i NOT IN (1, 2, 3);

SELECT *
FROM test1
WHERE NOT has([1,2,3,4,5], i)
ORDER BY i ASC;

SELECT *
FROM test1
WHERE i NOT IN (1, 2, 3, 4, 5)
ORDER BY i ASC;

SELECT
    date,
    a,
    b
FROM t1
WHERE NOT has((
        SELECT groupUniqArray(tuple(date, a, b))
        FROM t2
    ), tuple(date, a, b));

SELECT
    date,
    a,
    b
FROM t2
WHERE NOT has((
        SELECT groupUniqArray(tuple(date, a, b))
        FROM t1
    ), tuple(date, a, b));

SELECT
    date,
    a,
    b
FROM t1
WHERE (date, a, b) NOT IN (
        SELECT
            date,
            a,
            b
        FROM t2
    );

SELECT
    date,
    a,
    b
FROM t2
WHERE (date, a, b) NOT IN (
        SELECT
            date,
            a,
            b
        FROM t1
    );