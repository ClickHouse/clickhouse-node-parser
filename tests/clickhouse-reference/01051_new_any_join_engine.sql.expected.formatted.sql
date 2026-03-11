SELECT *
FROM
    t1
LEFT JOIN any_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
INNER JOIN any_inner_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN any_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
LEFT JOIN semi_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN semi_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
LEFT JOIN anti_left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN anti_right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;