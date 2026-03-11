SELECT x + 1e10
FROM test
ORDER BY
    1e10 ASC,
    x ASC;

SELECT x + ((1e10 + 1e20))
FROM test
ORDER BY
    (1e10 + 1e20) ASC,
    x ASC;

SELECT x + ((pow(2, 2) + pow(3, 2)))
FROM test
ORDER BY
    (pow(2, 2) + pow(3, 2)) ASC,
    x ASC;