SELECT database, table, name FROM system.parts WHERE database = currentDatabase() AND startsWith(table, '02947_table_');
select * from system.dropped_tables_parts format Null;
