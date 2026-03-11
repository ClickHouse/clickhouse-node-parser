SELECT *
FROM
    (
        SELECT 1 AS id
    ) AS t1
INNER JOIN (
        SELECT 1 AS id
    ) AS t2
    ON t1.id = t2.id
INNER JOIN (
        SELECT 1 AS id
    ) AS t3
    ON t1.id = t3.id
WHERE t1.id IN (temp_table3);

SELECT *
FROM
    (
        SELECT 1 AS id
    ) AS t1
INNER JOIN (
        SELECT 1 AS id
    ) AS t2
    ON t1.id = t2.id
WHERE t1.id IN (temp_table3);