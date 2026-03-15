SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier};

CREATE TABLE test_00571
(
    date Date,
    platform Enum8('a' = 0, 'b' = 1, 'c' = 2),
    app Enum8('a' = 0, 'b' = 1)
)
ENGINE = MergeTree(date, (platform, app), 8192);

CREATE MATERIALIZED VIEW test_materialized_00571
ENGINE = MergeTree(date, (platform, app), 8192)
POPULATE
AS
SELECT
    date,
    platform,
    app
FROM (
        SELECT *
        FROM test_00571
    );

USE {CLICKHOUSE_DATABASE_1:Identifier};

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.test_00571;

SELECT *
FROM {CLICKHOUSE_DATABASE:Identifier}.test_materialized_00571;