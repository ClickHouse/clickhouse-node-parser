CREATE TABLE test_dictionary_source (key String, value String) ENGINE=TinyLog;
CREATE DICTIONARY test_dictionary(key String, value String)
PRIMARY KEY key
LAYOUT(COMPLEX_KEY_HASHED())
SOURCE(CLICKHOUSE(TABLE 'test_dictionary_source'))
LIFETIME(0);
SELECT dictGet('test_dictionary', 'value', tuple('Key'));
SELECT dictGet('test_dictionary', 'value', tuple(materialize('Key')));
SELECT dictGet('test_dictionary', 'value', 'Key');
SELECT dictGet('test_dictionary', 'value', materialize('Key'));
SELECT dictHas('test_dictionary', tuple('Key'));
SELECT dictHas('test_dictionary', tuple(materialize('Key')));
SELECT dictHas('test_dictionary', 'Key');
SELECT dictHas('test_dictionary', materialize('Key'));
