SELECT NewColumn
FROM
    test_a
INNER JOIN (
        SELECT
            OldColumn,
            NewColumn
        FROM test_b
    ) AS s
    USING (OldColumn)
PREWHERE NewColumn != '';