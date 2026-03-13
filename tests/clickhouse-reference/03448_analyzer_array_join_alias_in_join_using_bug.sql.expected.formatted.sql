SELECT arr
FROM
    remote('127.0.0.2', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS dummy
INNER JOIN `system`.one AS foo
    USING (dummy);

SELECT arr
FROM
    remote('127.0.0.{1,2}', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS dummy
INNER JOIN `system`.one AS foo
    USING (dummy);

SELECT arr
FROM
    remote('127.0.0.2', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS arr_item
INNER JOIN (
        SELECT 1 AS arr_item
    ) AS foo
    USING (arr_item);

SELECT arr
FROM
    remote('127.0.0.{1,2}', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS arr_item
INNER JOIN (
        SELECT 1 AS arr_item
    ) AS foo
    USING (arr_item);

SELECT
    arr,
    arr_item
FROM
    remote('127.0.0.2', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS arr_item
INNER JOIN (
        SELECT 1 + number AS arr_item
        FROM numbers(2)
    ) AS foo
    USING (arr_item);

SELECT
    arr,
    arr_item
FROM
    remote('127.0.0.{1,2}', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS arr_item
INNER JOIN (
        SELECT 1 + number AS arr_item
        FROM numbers(2)
    ) AS foo
    USING (arr_item);

-- Fuzzed
SELECT arr
FROM
    remote('127.0.0.2', currentDatabase(), local_table) AS r
ARRAY JOIN arr AS arr_item
RIGHT JOIN (
        SELECT 1 AS arr_item
    ) AS foo
    USING (arr_item);