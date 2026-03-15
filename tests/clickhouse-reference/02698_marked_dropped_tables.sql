-- Tags: no-ordinary-database

SET database_atomic_wait_for_drop_and_detach_synchronously = 0;
CREATE TABLE 25400_dropped_tables (id Int32) Engine=MergeTree() ORDER BY id;
SELECT table, engine FROM system.dropped_tables WHERE database = currentDatabase() LIMIT 1;
SELECT database, table, name FROM system.dropped_tables_parts WHERE database = currentDatabase() and table = '25400_dropped_tables';
