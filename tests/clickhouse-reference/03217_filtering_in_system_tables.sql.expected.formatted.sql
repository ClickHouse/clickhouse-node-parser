SELECT
    database,
    table
FROM `system`.tables
WHERE database = 'information_schema'
    AND table = 'tables';

SELECT
    'both',
    database,
    table,
    left(replica_name, 2)
FROM `system`.replicas
WHERE database = currentDatabase();

SELECT
    database,
    table,
    left(replica_name, 2)
FROM `system`.replicas
WHERE database = currentDatabase()
    AND table = 'test_03217_system_tables_replica_1'
    AND like(replica_name, 'r1%');

SELECT argMax(read_rows, event_time_microseconds)
FROM `system`.query_log
WHERE 1
    AND current_database = currentDatabase()
    AND like(query, '%SELECT database, table FROM system.tables WHERE database = ''information_schema'' AND table = ''tables'';')
    AND type = 'QueryFinish';

SELECT argMax(read_rows, event_time_microseconds)
FROM `system`.query_log
WHERE 1
    AND current_database = currentDatabase()
    AND like(query, '%SELECT database, table, left(replica_name, 2) FROM system.replicas WHERE database = currentDatabase() AND table = ''test_03217_system_tables_replica_1'' AND replica_name LIKE ''r1\\%'';')
    AND type = 'QueryFinish';