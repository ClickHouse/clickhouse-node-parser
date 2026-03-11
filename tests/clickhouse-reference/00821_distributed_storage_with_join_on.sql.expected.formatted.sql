SELECT 1
FROM
    table1 AS T1
INNER JOIN table2 AS T2
    ON T1.table = T2.name
LIMIT 1;

SELECT 1
FROM
    cluster('test_shard_localhost', `system`.`columns`) AS T1
INNER JOIN cluster('test_shard_localhost', `system`.tables) AS T2
    ON T1.table = T2.name
LIMIT 1;

SELECT 1
FROM
    (
        SELECT *
        FROM table1
    ) AS T1
INNER JOIN (
        SELECT *
        FROM table2
    ) AS T2
    ON T1.table = T2.name
LIMIT 1;