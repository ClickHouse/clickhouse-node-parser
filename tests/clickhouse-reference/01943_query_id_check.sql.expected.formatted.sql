SELECT query
FROM `system`.query_log
WHERE query_id = (
        SELECT *
        FROM tmp
    )
    AND current_database = currentDatabase()
LIMIT 1;

SELECT query
FROM `system`.query_log
WHERE initial_query_id = (
        SELECT *
        FROM tmp
    )
    AND current_database = currentDatabase()
LIMIT 1;

SELECT count()
FROM (
        SELECT initialQueryID()
        FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp')
        GROUP BY queryID()
    );

SELECT count()
FROM (
        SELECT queryID()
        FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp')
        GROUP BY queryID()
    );

SELECT count()
FROM (
        SELECT queryID() AS t
        FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp')
        GROUP BY queryID()
        HAVING t == initialQueryID()
    );

SELECT countDistinct(t)
FROM (
        SELECT initialQueryID() AS t
        FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp')
        GROUP BY queryID()
    );

SELECT countDistinct(t)
FROM (
        SELECT queryID() AS t
        FROM remote('127.0.0.{1..3}', currentDatabase(), 'tmp')
        GROUP BY queryID()
    );