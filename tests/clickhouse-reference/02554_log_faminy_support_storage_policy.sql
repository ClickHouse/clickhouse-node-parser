CREATE TABLE test_2554_log (n UInt32) ENGINE = Log SETTINGS storage_policy = 'default';
SELECT * FROM test_2554_log;
CREATE TABLE test_2554_tinylog (n UInt32) ENGINE = Log SETTINGS storage_policy = 'default';
SELECT * FROM test_2554_tinylog;
CREATE TABLE test_2554_stripelog (n UInt32) ENGINE = StripeLog SETTINGS storage_policy = 's3_cache';
SELECT * FROM test_2554_stripelog;
CREATE TABLE test_2554_error (n UInt32) ENGINE = Log SETTINGS disk = 'default', storage_policy = 'default'; -- { serverError INVALID_SETTING_VALUE }
