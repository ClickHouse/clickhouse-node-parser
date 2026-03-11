SELECT *
FROM
    t1
LEFT JOIN left_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
INNER JOIN inner_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
RIGHT JOIN right_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;

SELECT *
FROM
    t1
FULL JOIN full_join AS j
    USING (x)
ORDER BY
    x ASC,
    str ASC,
    s ASC;