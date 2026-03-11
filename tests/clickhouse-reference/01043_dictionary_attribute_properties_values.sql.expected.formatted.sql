SELECT dictGetString(concat({CLICKHOUSE_DATABASE: String}, '.dict'), 'value_default', toUInt64(12));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE: String}, '.dict'), 'value_default', toUInt64(14));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE: String}, '.dict'), 'value_expression', toUInt64(12));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE: String}, '.dict'), 'value_expression', toUInt64(14));