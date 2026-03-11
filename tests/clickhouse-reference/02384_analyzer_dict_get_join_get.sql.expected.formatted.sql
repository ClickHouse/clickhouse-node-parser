SELECT *
FROM test_dictionary;

SELECT dictGet('test_dictionary', 'value', toUInt64(0));

SELECT dictGet(test_dictionary, 'value', toUInt64(0));

SELECT *
FROM test_table_join;

SELECT joinGet('test_table_join', 'value', toUInt64(0));

SELECT joinGet(test_table_join, 'value', toUInt64(0));