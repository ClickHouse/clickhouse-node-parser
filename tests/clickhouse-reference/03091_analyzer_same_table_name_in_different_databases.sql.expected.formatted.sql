-- https://github.com/ClickHouse/ClickHouse/issues/61947
SET enable_analyzer = 1;

CREATE DATABASE {CLICKHOUSE_DATABASE:Identifier};

CREATE DATABASE {CLICKHOUSE_DATABASE_1:Identifier};

CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.`1-1`
(
    field Int8
)
ENGINE = Memory;

CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`
(
    field Int8
)
ENGINE = Memory;

CREATE TABLE {CLICKHOUSE_DATABASE_1:Identifier}.`2-1`
(
    field Int8
)
ENGINE = Memory;

SELECT *
FROM
    {CLICKHOUSE_DATABASE:Identifier}.`1-1`
LEFT JOIN {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`
    ON {CLICKHOUSE_DATABASE:Identifier}.`1-1`.field = {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`.field;

SELECT *
FROM (
        SELECT
            'using asterisk',
            {CLICKHOUSE_DATABASE:Identifier}.`1-1`.*,
            {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`.*
        FROM
            {CLICKHOUSE_DATABASE:Identifier}.`1-1`
        LEFT JOIN {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`
            USING (field)
        UNION ALL
        SELECT
            'using field name',
            {CLICKHOUSE_DATABASE:Identifier}.`1-1`.field,
            {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`.field
        FROM
            {CLICKHOUSE_DATABASE:Identifier}.`1-1`
        LEFT JOIN {CLICKHOUSE_DATABASE_1:Identifier}.`1-1`
            USING (field)
    )
ORDER BY `ALL` ASC;