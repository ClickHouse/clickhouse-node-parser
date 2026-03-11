SELECT `Settings`['distributed_ddl_task_timeout']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND type != 'QueryStart'
    AND like(query, 'CREATE DATABASE % SETTINGS %');