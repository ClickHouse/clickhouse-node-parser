SELECT value FROM system.zookeeper WHERE path = '/clickhouse/' || currentDatabase() || '/versioned_collapsing_table/s1' and name = 'metadata';
SELECT COUNT() FROM versioned_collapsing_table;
