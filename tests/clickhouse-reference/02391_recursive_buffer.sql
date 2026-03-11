SELECT * FROM test; -- { serverError INFINITE_LOOP }
SELECT * FROM system.tables WHERE table = 'test' AND database = currentDatabase() FORMAT Null;
