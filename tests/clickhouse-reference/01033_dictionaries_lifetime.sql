SELECT dictGetUInt8({CLICKHOUSE_DATABASE_1:String}||'.dict1', 'second_column', toUInt64(100500));
SELECT lifetime_min, lifetime_max FROM system.dictionaries WHERE database={CLICKHOUSE_DATABASE_1:String} AND name = 'dict1';
