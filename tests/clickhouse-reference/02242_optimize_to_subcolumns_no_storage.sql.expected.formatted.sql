SELECT count(*)
FROM
    numbers(2) AS n1
CROSS JOIN numbers(3) AS n2
CROSS JOIN numbers(4) AS n3
WHERE (n1.number = n2.number)
    AND (n2.number = n3.number);