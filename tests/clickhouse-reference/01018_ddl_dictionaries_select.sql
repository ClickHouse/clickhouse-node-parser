SELECT dictGetUInt8({CLICKHOUSE_DATABASE:String} || '.dict1', 'second_column', toUInt64(11));
SELECT second_column FROM {CLICKHOUSE_DATABASE:Identifier}.dict1 WHERE key_column = 11;
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict1', 'third_column', toUInt64(12));
SELECT third_column FROM {CLICKHOUSE_DATABASE:Identifier}.dict1 WHERE key_column = 12;
SELECT dictGetFloat64({CLICKHOUSE_DATABASE:String} || '.dict1', 'fourth_column', toUInt64(14));
SELECT fourth_column FROM {CLICKHOUSE_DATABASE:Identifier}.dict1 WHERE key_column = 14;
SELECT count(distinct(dictGetUInt8({CLICKHOUSE_DATABASE:String} || '.dict1', 'second_column', toUInt64(number)))) from numbers(100);
SELECT dictGetUInt8({CLICKHOUSE_DATABASE:String} || '.dict1', 'second_column', tuple(toUInt64(11), '121'));
SELECT dictGetFloat64({CLICKHOUSE_DATABASE:String} || '.dict1', 'fourth_column', tuple(toUInt64(14), '196'));
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict2', 'some_column', toUInt64(12));
-- NOTE: database = currentDatabase() is not mandatory
SELECT name, engine FROM system.tables WHERE database = {CLICKHOUSE_DATABASE:String} ORDER BY name;
SELECT database, name, type FROM system.dictionaries WHERE database = {CLICKHOUSE_DATABASE:String} ORDER BY name;
SELECT dictGetString({CLICKHOUSE_DATABASE:String} || '.dict3', 'some_column', toUInt64(12));
SELECT dictGetString(dict3, 'some_column', toUInt64(12));
SELECT dictGetString({CLICKHOUSE_DATABASE:Identifier}.dict3, 'some_column', toUInt64(12));
SELECT dictGetString(default.dict3, 'some_column', toUInt64(12)); -- {serverError BAD_ARGUMENTS}
SELECT dictGet(dict3, 'some_column', toUInt64(12));
SELECT dictGet({CLICKHOUSE_DATABASE:Identifier}.dict3, 'some_column', toUInt64(12));
SELECT dictGet(default.dict3, 'some_column', toUInt64(12)); -- {serverError BAD_ARGUMENTS}
-- alias should be handled correctly
SELECT {CLICKHOUSE_DATABASE:String} || '.dict3' as n, dictGet(n, 'some_column', toUInt64(12));
