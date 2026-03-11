SELECT
    partition_id,
    name
FROM `system`.parts
WHERE table = 'partitioned_table'
    AND database = currentDatabase()
    AND active
ORDER BY name ASC;

SELECT
    substring(name, 1, 2),
    value
FROM `system`.zookeeper
WHERE path = concat('/clickhouse/', currentDatabase(), '/01650_drop_part_and_deduplication_partitioned_table/blocks/')
ORDER BY value ASC;