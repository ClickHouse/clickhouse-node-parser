SELECT name, status FROM system.dictionaries WHERE database='test_01191';
SELECT name, engine FROM system.tables WHERE database='test_01191' ORDER BY name;
SELECT dictGet(test_01191.t, 's', toUInt64(42));
SELECT dictGet(test_01191.dict1, 's', toUInt64(42));
SELECT dictGet(test_01191.dict2, 's', toUInt64(42));
