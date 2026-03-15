CREATE TABLE {CLICKHOUSE_DATABASE:Identifier}.table_for_dict
(
  key_column UInt64,
  value Float64
)
ENGINE = MergeTree()
ORDER BY key_column;
CREATE DICTIONARY IF NOT EXISTS {CLICKHOUSE_DATABASE:Identifier}.dict_exists
(
  key_column UInt64,
  value Float64 DEFAULT 77.77
)
PRIMARY KEY key_column
SOURCE(CLICKHOUSE(HOST 'localhost' PORT tcpPort() USER 'default' TABLE 'table_for_dict' DB currentDatabase()))
LIFETIME(1)
LAYOUT(FLAT());
SELECT dictGetFloat64({CLICKHOUSE_DATABASE:String} || '.dict_exists', 'value', toUInt64(1));
