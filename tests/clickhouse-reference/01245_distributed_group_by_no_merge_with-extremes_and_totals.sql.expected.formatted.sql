-- Tags: distributed
SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', `system`.numbers)
        LIMIT 5
        SETTINGS distributed_group_by_no_merge = 1
    );

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.{1,2}', `system`.numbers)
        LIMIT 5
        SETTINGS distributed_group_by_no_merge = 1
    )
WITH TOTALS;

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 5
    );

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 5
    );

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.1', `system`.numbers)
        LIMIT 5
    )
WITH TOTALS;

SELECT sum(number)
FROM (
        SELECT *
        FROM remote('127.0.0.2', `system`.numbers)
        LIMIT 5
    )
WITH TOTALS;

SELECT '------';

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.1', numbers(5))
        WITH TOTALS
    );

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.2', numbers(5))
        WITH TOTALS
    );

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.{1,2}', numbers(5))
        WITH TOTALS
    );

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.{2,3}', numbers(5))
        WITH TOTALS
    );

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.1', numbers(5))
    )
WITH TOTALS;

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.2', numbers(5))
    )
WITH TOTALS;

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.{1,2}', numbers(5))
    )
WITH TOTALS;

SELECT sum(s)
FROM (
        SELECT sum(number) AS s
        FROM remote('127.0.0.{2,3}', numbers(5))
    )
WITH TOTALS;