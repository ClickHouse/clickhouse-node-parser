CREATE TABLE 01686_test (key UInt64, value String) Engine=EmbeddedRocksDB PRIMARY KEY(key) SETTINGS optimize_for_bulk_insert = 0;
SELECT value FROM system.rocksdb WHERE database = currentDatabase() and table = '01686_test' and name = 'number.keys.written';
INSERT INTO 01686_test SELECT number, format('Hello, world ({})', toString(number)) FROM numbers(10000);
SELECT * FROM 01686_test WHERE key = 123;
SELECT '--';
SELECT * FROM 01686_test WHERE key = -123;
SELECT * FROM 01686_test WHERE key = 123 OR key = 4567 ORDER BY key;
SELECT * FROM 01686_test WHERE key = NULL;
SELECT * FROM 01686_test WHERE key = NULL OR key = 0;
SELECT * FROM 01686_test WHERE key IN (123, 456, -123) ORDER BY key;
SELECT * FROM 01686_test WHERE key = 'Hello'; -- { serverError TYPE_MISMATCH }
SELECT * FROM 01686_test WHERE key IN (99, 999, 9999, -123) ORDER BY key;
