CREATE TABLE test_log (x UInt8, s String, a Array(Nullable(String))) ENGINE = Log;
CREATE TABLE test_tiny_log (x UInt8, s String, a Array(Nullable(String))) ENGINE = TinyLog;
SELECT data_compressed_bytes FROM system.columns WHERE table = 'test_log' AND database = currentDatabase();
SELECT data_compressed_bytes FROM system.columns WHERE table = 'test_tiny_log' AND database = currentDatabase();
