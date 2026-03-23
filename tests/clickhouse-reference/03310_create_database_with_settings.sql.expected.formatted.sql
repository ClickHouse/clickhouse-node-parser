DROP DATABASE IF EXISTS {CLICKHOUSE_DATABASE_1:Identifier};

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier}
SETTINGS distributed_ddl_task_timeout = 42;

SELECT `Settings`['distributed_ddl_task_timeout']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type != 'QueryStart'
    AND like(query, 'CREATE DATABASE % SETTINGS %');