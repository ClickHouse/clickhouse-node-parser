SELECT
    count()
FROM first_table as s
GLOBAL ANY JOIN second_table as f USING (id)
WHERE
    f.id2 GLOBAL IN (
        SELECT
            id2
        FROM second_table
        GROUP BY id2
    );
SELECT
    count()
FROM two_tables as s
GLOBAL ANY JOIN second_table as f USING (id)
WHERE
    f.id2 GLOBAL IN (
        SELECT
            id2
        FROM second_table
        GROUP BY id2
    );
