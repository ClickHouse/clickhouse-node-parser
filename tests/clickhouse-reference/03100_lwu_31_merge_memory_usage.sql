SELECT count() FROM system.parts WHERE database = currentDatabase() AND table = 't_lwu_memory' AND active = 1;
SELECT sum(id), sum(toUInt64(value)) FROM t_lwu_memory SETTINGS max_memory_usage = '150M', max_threads = 4;
