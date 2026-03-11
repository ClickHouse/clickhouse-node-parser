SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict1'), 'Tax', toUInt64(1), toDate('2019-05-15'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict1'), 'Tax', toUInt64(1), toDate('2019-05-29'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict1'), 'Tax', toUInt64(2), toDate('2019-05-29'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict1'), 'Tax', toUInt64(2), toDate('2019-05-31'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict2'), 'Tax', toUInt64(1), toDateTime('2019-05-15 00:00:00'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict2'), 'Tax', toUInt64(1), toDateTime('2019-05-29 00:00:00'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict2'), 'Tax', toUInt64(2), toDateTime('2019-05-29 00:00:00'));

SELECT dictGetFloat64(concat({CLICKHOUSE_DATABASE: String}, '.dict2'), 'Tax', toUInt64(2), toDateTime('2019-05-31 00:00:00'));

SELECT dictGetString(concat({CLICKHOUSE_DATABASE: String}, '.dictionary_with_hierarchy'), 'RegionName', toUInt64(2));

SELECT dictGetHierarchy(concat({CLICKHOUSE_DATABASE: String}, '.dictionary_with_hierarchy'), toUInt64(3));

SELECT dictIsIn(concat({CLICKHOUSE_DATABASE: String}, '.dictionary_with_hierarchy'), toUInt64(3), toUInt64(2));

SELECT dictIsIn(concat({CLICKHOUSE_DATABASE: String}, '.dictionary_with_hierarchy'), toUInt64(7), toUInt64(10000));

SELECT dictIsIn(concat({CLICKHOUSE_DATABASE: String}, '.dictionary_with_hierarchy'), toUInt64(1), toUInt64(5));