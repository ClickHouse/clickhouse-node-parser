SELECT sleep(1)
FORMAT Null;

SELECT
    `format`,
    length(entries.query_id)
FROM `system`.asynchronous_inserts
WHERE database = currentDatabase()
    AND table = 't_async_inserts_flush'
ORDER BY `format` ASC;

SELECT count()
FROM t_async_inserts_flush;

SELECT count()
FROM `system`.asynchronous_inserts
WHERE database = currentDatabase()
    AND table = 't_async_inserts_flush';

SELECT *
FROM t_async_inserts_flush
ORDER BY a ASC;