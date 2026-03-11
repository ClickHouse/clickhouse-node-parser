SELECT n
FROM
    (
        SELECT number % 2 AS n
        FROM numbers(6)
        GROUP BY n
        WITH TOTALS
    ) AS `left`
INNER JOIN (
        SELECT number % 3 AS n
        FROM numbers(6)
        GROUP BY n
        WITH TOTALS
    ) AS `right`
    USING (n)
ORDER BY n ASC;