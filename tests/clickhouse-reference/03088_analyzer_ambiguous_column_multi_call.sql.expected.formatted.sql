-- https://github.com/ClickHouse/ClickHouse/issues/61014
SET enable_analyzer = 1;

CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier};

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.a
(
    i int
)
ENGINE = Log();

SELECT {CLICKHOUSE_DATABASE:Identifier}.a.i
FROM
    {CLICKHOUSE_DATABASE:Identifier}.a
CROSS JOIN {CLICKHOUSE_DATABASE:Identifier}.a AS x;