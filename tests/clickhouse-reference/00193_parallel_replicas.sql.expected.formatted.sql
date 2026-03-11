SELECT count() > 0
FROM parallel_replicas;

SELECT
    x,
    u,
    s
FROM parallel_replicas_backup
ORDER BY
    x ASC,
    u ASC,
    s ASC;