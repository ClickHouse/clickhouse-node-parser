SELECT data_compressed_bytes FROM system.columns WHERE table = 'test_log' AND database = currentDatabase();
SELECT data_compressed_bytes FROM system.columns WHERE table = 'test_tiny_log' AND database = currentDatabase();
