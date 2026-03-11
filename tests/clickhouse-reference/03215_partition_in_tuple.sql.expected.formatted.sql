SELECT *
FROM t
WHERE tuple(a, b) IN (
        SELECT tuple(a, b)
        FROM t1
    );

SELECT *
FROM t
WHERE tuple(a, b) NOT IN (
        SELECT tuple(a, b)
        FROM t1
    );

SELECT *
FROM t
WHERE (a, b) IN (
        SELECT
            a,
            b
        FROM t1
    );

SELECT *
FROM t
WHERE (a, b) NOT IN (
        SELECT
            a,
            b
        FROM t1
    );