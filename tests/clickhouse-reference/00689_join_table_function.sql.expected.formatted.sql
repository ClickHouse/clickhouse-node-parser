SELECT *
FROM
    numbers(3) AS a
LEFT JOIN numbers(3) AS b
    ON a.number = b.number
ORDER BY a.number ASC;