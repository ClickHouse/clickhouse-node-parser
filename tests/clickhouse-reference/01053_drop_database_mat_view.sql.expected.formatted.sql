SET send_logs_level = 'fatal';

SYSTEM DROP  DATABASE IF EXISTS {CLICKHOUSE_DATABASE:Identifier};

SET allow_deprecated_database_ordinary = 1;

-- Creation of a database with Ordinary engine emits a warning.
CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier}
ENGINE = Ordinary; -- Different inner table name with Atomic

SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.my_table
ENGINE = MergeTree(day, (day), 8192) AS
SELECT
    today() AS day,
    'mystring' AS str;

CREATE MATERIALIZED VIEW {CLICKHOUSE_DATABASE:Identifier}.my_materialized_view
ENGINE = MergeTree(day, (day), 8192)
AS
SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.my_table;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.my_materialized_view;

SYSTEM DROP  DATABASE {CLICKHOUSE_DATABASE:Identifier};