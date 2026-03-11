SELECT UserID FROM test_bloom_filter_index WHERE (CounterID, EventTime) IN (SELECT toUInt32(25703952), toDateTime('2014-03-19 23:59:58'));
SELECT * FROM test_bloom_filter_index WHERE (`uint16`, `index_column`) IN (SELECT toUInt16(2), toUInt64(2));
