SELECT partition_id, name FROM system.parts WHERE table = 'partitioned_table' AND database = currentDatabase() and active ORDER BY name;
SELECT substring(name, 1, 2), value FROM system.zookeeper WHERE path='/clickhouse/' || currentDatabase() || '/01650_drop_part_and_deduplication_partitioned_table/blocks/' ORDER BY value;
