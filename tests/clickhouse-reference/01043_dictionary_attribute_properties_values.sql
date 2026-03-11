SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict', 'value_default', toUInt64(12));
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict', 'value_default', toUInt64(14));
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict', 'value_expression', toUInt64(12));
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict', 'value_expression', toUInt64(14));
