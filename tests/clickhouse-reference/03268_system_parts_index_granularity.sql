SELECT index_granularity_bytes_in_memory, index_granularity_bytes_in_memory_allocated FROM system.parts where table = 't' and database = currentDatabase() ORDER BY name;
