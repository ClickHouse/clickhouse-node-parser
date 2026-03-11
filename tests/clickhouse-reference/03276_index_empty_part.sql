SELECT rows, primary_key_bytes_in_memory FROM system.parts WHERE database = currentDatabase() AND table = 't_index_empty_part';
