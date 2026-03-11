SELECT
    column,
    (
        SELECT d
        FROM (
                SELECT [1, 2, 3, 4] AS d
            )
    ) AS d
FROM TestTable
WHERE column == 'test'
GROUP BY column;