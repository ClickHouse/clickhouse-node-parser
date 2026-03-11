SELECT comment FROM system.tables WHERE database = currentDatabase() AND name = 'base';
SELECT comment FROM system.tables WHERE database = currentDatabase() AND name = 'copy_without_comment';
SELECT comment FROM system.tables WHERE database = currentDatabase() AND name = 'copy_with_comment';
