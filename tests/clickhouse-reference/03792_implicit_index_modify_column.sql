SELECT name, type_full, expr, creation, data_compressed_bytes > 0 FROM system.data_skipping_indices where database = current_database() and table = 'test_alter' ORDER BY name;
