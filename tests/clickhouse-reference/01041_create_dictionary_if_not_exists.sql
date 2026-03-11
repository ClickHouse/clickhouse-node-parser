SELECT dictGetFloat64({CLICKHOUSE_DATABASE:String} || '.dict_exists', 'value', toUInt64(1));
