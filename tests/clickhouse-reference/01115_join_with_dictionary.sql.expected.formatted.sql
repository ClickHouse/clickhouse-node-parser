SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_flat AS d
    ON s1.key = d.key
ORDER BY s1.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
INNER JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
INNER JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
INNER JOIN dict_flat AS d
    USING (key);

SELECT *
FROM
    (
        SELECT number AS k
        FROM numbers(100)
    ) AS s1
INNER JOIN dict_flat AS d
    ON k = key
ORDER BY k ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_hashed AS d
    ON s1.key = d.key
ORDER BY s1.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_hashed AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_hashed AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
INNER JOIN dict_hashed AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
INNER JOIN dict_hashed AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
INNER JOIN dict_hashed AS d
    USING (key);

SELECT *
FROM
    (
        SELECT number AS k
        FROM numbers(100)
    ) AS s1
INNER JOIN dict_hashed AS d
    ON k = key
ORDER BY k ASC;

SELECT *
FROM
    (
        SELECT if(number % 2 = 0, number, number * 1000) AS k
        FROM numbers(100)
    ) AS s1
INNER JOIN dict_flat AS d
    ON k = key
    OR k == 1000 * key
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC
SETTINGS any_join_distinct_right_table_keys = '1';

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(5)
    ) AS s1
LEFT JOIN dict_complex_cache AS d
    ON s1.key = d.key
ORDER BY s1.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
RIGHT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
RIGHT JOIN dict_flat AS d
    ON s1.key = d.key
ORDER BY d.key ASC;

SELECT *
FROM
    (
        SELECT number + 2 AS key
        FROM numbers(4)
    ) AS s1
FULL JOIN dict_flat AS d
    USING (key)
ORDER BY
    s1.key ASC,
    d.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
INNER JOIN dict_flat AS d
    USING (key)
ORDER BY s1.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
RIGHT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
RIGHT JOIN dict_flat AS d
    USING (key)
ORDER BY s1.key ASC;

SELECT *
FROM
    (
        SELECT number AS key
        FROM numbers(2)
    ) AS s1
RIGHT JOIN dict_flat AS d
    USING (key)
ORDER BY key ASC;