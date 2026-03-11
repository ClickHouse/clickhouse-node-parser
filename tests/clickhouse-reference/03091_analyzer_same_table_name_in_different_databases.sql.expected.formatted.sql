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