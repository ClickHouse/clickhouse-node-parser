SELECT count()
FROM
    first_table AS s
INNER JOIN second_table AS f
    USING (id)
WHERE f.id2 GLOBAL IN (
        SELECT id2
        FROM second_table
        GROUP BY id2
    );

SELECT count()
FROM
    two_tables AS s
INNER JOIN second_table AS f
    USING (id)
WHERE f.id2 GLOBAL IN (
        SELECT id2
        FROM second_table
        GROUP BY id2
    );