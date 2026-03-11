SELECT
    table,
    zookeeper_name,
    count()
FROM
    `system`.replicas
INNER JOIN `system`.parts
    USING (database, table)
WHERE database = currentDatabase()
GROUP BY
    table,
    zookeeper_name
ORDER BY
    table ASC,
    zookeeper_name ASC
FORMAT CSV;