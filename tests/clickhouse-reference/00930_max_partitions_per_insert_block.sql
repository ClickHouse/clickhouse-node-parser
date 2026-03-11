SELECT count() FROM system.parts WHERE database = currentDatabase() AND table = 'partitions';
