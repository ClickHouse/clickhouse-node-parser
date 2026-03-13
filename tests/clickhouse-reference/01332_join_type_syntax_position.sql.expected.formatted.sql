SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
INNER JOIN numbers(1) AS t2
    USING (number); -- { serverError NOT_IMPLEMENTED }

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number); -- { serverError NOT_IMPLEMENTED }

-- legacy
SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
RIGHT JOIN numbers(1) AS t2
    USING (number);

SELECT *
FROM
    numbers(1) AS t1
LEFT JOIN numbers(1) AS t2
    USING (number); -- { serverError NOT_IMPLEMENTED }