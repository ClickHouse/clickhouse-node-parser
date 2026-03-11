SELECT max_time FROM system.parts WHERE database = currentDatabase() AND table = 'test' AND active;
