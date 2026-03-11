SELECT
    a2,
    b2
FROM
    tab2
LEFT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a2 ASC,
    b2 ASC;

SELECT
    a3 == 5
    OR a3 == 100,
    b3
FROM
    tab2
LEFT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a3 ASC,
    b3 ASC;

SELECT
    a2,
    b2,
    a3 == 5
    OR a3 == 100,
    b3
FROM
    tab2
LEFT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a2 ASC,
    b2 ASC,
    b3 ASC;

SELECT a1
FROM
    tab1
LEFT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY a1 ASC;

SELECT
    a1,
    b2
FROM
    tab1
LEFT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a1 ASC,
    b2 ASC;

SELECT
    a1,
    b1,
    a2,
    b2
FROM
    tab1
LEFT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a1 ASC,
    b1 ASC,
    a2 ASC,
    b2 ASC;

SELECT
    a2,
    b2 + 1
FROM
    tab1
LEFT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a2 ASC,
    b2 + 1 ASC;

SELECT
    a2,
    b2
FROM
    tab2
RIGHT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a2 ASC,
    b2 ASC;

SELECT
    a3,
    b3
FROM
    tab2
RIGHT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a3 ASC,
    b3 ASC;

SELECT
    a2,
    b2,
    a3,
    b3
FROM
    tab2
RIGHT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a2 ASC,
    b2 ASC,
    a3 ASC,
    b3 ASC;

SELECT a1
FROM
    tab1
RIGHT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY a1 ASC;

SELECT
    a1,
    b2
FROM
    tab1
RIGHT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a1 ASC,
    b2 ASC;

SELECT
    a1,
    b1,
    a2,
    b2
FROM
    tab1
RIGHT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a1 ASC,
    b1 ASC,
    a2 ASC,
    b2 ASC;

SELECT
    a2,
    b2 + 1
FROM
    tab1
RIGHT JOIN tab2
    ON b1 + 1 = a2 + 1
    OR a1 + 4 = b2 + 2
ORDER BY
    a2 ASC,
    b2 + 1 ASC;

SELECT b3
FROM
    tab2
RIGHT JOIN tab3
    ON a2 = a3
    OR b2 = b3
ORDER BY
    a3 ASC,
    b3 ASC;