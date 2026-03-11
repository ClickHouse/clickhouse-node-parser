SELECT count() FROM t_patch_join_cache WHERE s = 'foo' SETTINGS max_threads = 8, max_memory_usage = '1Gi';
