SELECT name, type, position FROM system.columns WHERE database = currentDatabase() AND table = 'test';
SELECT column, type, column_position FROM system.parts_columns WHERE database = currentDatabase() AND table = 'test';
