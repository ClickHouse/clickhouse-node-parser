SELECT 1025 == count(n)
FROM
    foo_lc AS t1
LEFT JOIN foo_lc AS t2
    ON t1.n == t2.n;

SELECT 1025 == count(n)
FROM
    foo AS t1
LEFT JOIN foo_lc AS t2
    ON t1.n == t2.n;

SELECT 1025 == count(n)
FROM
    foo_lc AS t1
LEFT JOIN foo AS t2
    ON t1.n == t2.n;

SELECT 1025 == count(n)
FROM
    foo_lc AS t1
LEFT JOIN foo_lc AS t2
    ON t1.n == t2.n;