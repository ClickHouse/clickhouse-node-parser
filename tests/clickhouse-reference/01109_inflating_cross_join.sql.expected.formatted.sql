SELECT count(*)
FROM
    numbers(10000) AS n1
CROSS JOIN numbers(1000) AS n2;