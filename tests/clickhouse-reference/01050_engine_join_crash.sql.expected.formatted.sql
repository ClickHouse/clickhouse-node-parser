SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN testJoinTable
    USING (number);

SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN (
        SELECT *
        FROM testJoinTable
    ) AS js2
    USING (number)
ORDER BY number ASC;

SELECT *
FROM
    (
        SELECT *
        FROM numbers(10)
    ) AS js1
INNER JOIN testJoinTable
    USING (number)
ORDER BY number ASC;

SELECT *
FROM testJoinTable
ORDER BY number ASC;

SELECT
    tx.id,
    tx.value,
    m.name
FROM
    transaction AS tx
LEFT JOIN master AS m
    ON m.id = tx.master_id
ORDER BY tx.id ASC;

SELECT *
FROM
    tbl AS t
LEFT JOIN some_join
    USING (id)
ORDER BY id ASC;

SELECT *
FROM
    tbl AS t
LEFT JOIN some_join AS d
    USING (id)
ORDER BY id ASC;