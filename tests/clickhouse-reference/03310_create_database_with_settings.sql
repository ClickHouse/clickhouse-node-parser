SELECT Settings['distributed_ddl_task_timeout'] FROM system.query_log where
    current_database = currentDatabase() and
    type != 'QueryStart' and
    query like 'CREATE DATABASE % SETTINGS %';
