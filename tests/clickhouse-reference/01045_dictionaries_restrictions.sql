-- because of lazy load we can check only in dictGet query
select dictGetString({CLICKHOUSE_DATABASE:String} || '.restricted_dict', 'value', toUInt64(1));  -- {serverError DICTIONARY_ACCESS_DENIED}
