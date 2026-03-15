CREATE TABLE dictionary_non_nullable_source_table (id UInt64, value String) ENGINE=TinyLog;
CREATE DICTIONARY test_dictionary_non_nullable (id UInt64, value String) PRIMARY KEY id LAYOUT(DIRECT()) SOURCE(CLICKHOUSE(TABLE 'dictionary_non_nullable_source_table'));
SELECT dictGet('test_dictionary_non_nullable', 'value', NULL);
SELECT dictGet('test_dictionary_non_nullable', 'value', arrayJoin([toUInt64(0), NULL, 1]));
CREATE TABLE dictionary_nullable_source_table (id UInt64, value Nullable(String)) ENGINE=TinyLog;
CREATE DICTIONARY test_dictionary_nullable (id UInt64, value Nullable(String)) PRIMARY KEY id LAYOUT(DIRECT()) SOURCE(CLICKHOUSE(TABLE 'dictionary_nullable_source_table'));
SELECT dictGet('test_dictionary_nullable', 'value', NULL);
SELECT dictGet('test_dictionary_nullable', 'value', arrayJoin([toUInt64(0), NULL, 1, 2]));
