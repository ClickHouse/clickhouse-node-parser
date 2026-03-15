CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.dicttbl
(
    key Int64,
    value_default String,
    value_expression String
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE DICTIONARY {CLICKHOUSE_DATABASE:Identifier}.dict
(
    key Int64 DEFAULT -1,
    value_default String DEFAULT 'world',
    value_expression String DEFAULT 'xxx' EXPRESSION 'toString(127 * 172)'
)
PRIMARY KEY key
SOURCE(clickhouse(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'dicttbl' DB currentDatabase()))
LIFETIME(1)
LAYOUT(FLAT());

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.dict'), 'value_default', toUInt64(12));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.dict'), 'value_default', toUInt64(14));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.dict'), 'value_expression', toUInt64(12));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE:String}, '.dict'), 'value_expression', toUInt64(14));