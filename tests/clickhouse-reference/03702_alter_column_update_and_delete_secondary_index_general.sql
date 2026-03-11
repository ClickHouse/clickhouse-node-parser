SELECT 'COMPACT BEFORE', * from test_compact;
SELECT 'WIDE BEFORE', * from test_wide;
SELECT 'COMPACT AFTER UPDATE', * from test_compact;
SELECT 'WIDE AFTER UPDATE', * from test_wide;
SELECT table, name, 'Emtpy : ' || if(marks_bytes == 0, 'true', 'false') FROM system.data_skipping_indices WHERE table = 'test_compact' AND database = currentDatabase() AND name = 'idx_minmax';
SELECT table, name, 'Emtpy : ' || if(marks_bytes == 0, 'true', 'false') FROM system.data_skipping_indices WHERE table = 'test_wide' AND database = currentDatabase() AND name = 'idx_minmax';
SELECT 'COMPACT AFTER DELETE', * from test_compact;
SELECT 'WIDE AFTER DELETE', * from test_wide;
