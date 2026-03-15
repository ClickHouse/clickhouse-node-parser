CREATE TABLE `cube`
(
    a String,
    b Int32,
    s Int32
)
ENGINE = Memory;

SELECT
    a,
    b,
    sum(s),
    count()
FROM `cube`
GROUP BY CUBE(a, b)
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b,
    sum(s),
    count()
FROM `cube`
GROUP BY CUBE(a, b)
WITH TOTALS
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b,
    sum(s),
    count()
FROM `cube`
GROUP BY
    a,
    b
WITH CUBE
ORDER BY
    a ASC,
    b ASC;

SELECT
    a,
    b,
    sum(s),
    count()
FROM `cube`
GROUP BY
    a,
    b
WITH CUBE
WITH TOTALS
ORDER BY
    a ASC,
    b ASC;

SET group_by_two_level_threshold = 1;