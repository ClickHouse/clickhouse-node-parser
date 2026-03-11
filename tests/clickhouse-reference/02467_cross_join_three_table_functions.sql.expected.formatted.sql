SELECT count(*)
FROM
    numbers(10) AS a
CROSS JOIN numbers(11) AS b
CROSS JOIN numbers(12) AS c;