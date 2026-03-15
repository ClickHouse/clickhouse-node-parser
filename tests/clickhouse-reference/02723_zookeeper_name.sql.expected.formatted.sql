CREATE TABLE t1
(
    k UInt32,
    v UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02723/zookeeper_name/t1', '1')
ORDER BY k;

CREATE TABLE t2
(
    k UInt32,
    v UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/test_02723/zookeeper_name/t2', '1')
ORDER BY k;

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