SELECT toTypeName(json.c0)
FROM test;

SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS tx
FULL JOIN test
    ON test.json.Float32 = tx.c0;