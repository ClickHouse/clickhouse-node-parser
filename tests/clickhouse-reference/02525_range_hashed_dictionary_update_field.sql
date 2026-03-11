SELECT * FROM test_dictionary;
SELECT dictGet('test_dictionary', 'insert_time', toUInt64(1), 10);
SELECT sleep(3) format Null;
SELECT '--';
