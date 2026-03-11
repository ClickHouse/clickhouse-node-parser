SELECT COUNT() FROM recompression_table;
SELECT substring(name, 1, length(name) - 2), default_compression_codec FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
SELECT substring(name, 1, length(name) - 4), default_compression_codec FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
SELECT substring(name, 1, length(name) - 4), recompression_ttl_info.expression FROM system.parts WHERE table = 'recompression_table' and active = 1 and database = currentDatabase() ORDER BY name;
SELECT substring(name, 1, length(name) - 2), default_compression_codec FROM system.parts WHERE table = 'recompression_table_compact' and active = 1 and database = currentDatabase() ORDER BY name;
-- merge level and mutation in part name is not important
SELECT substring(name, 1, length(name) - 4), default_compression_codec FROM system.parts WHERE table = 'recompression_table_compact' and active = 1 and database = currentDatabase() ORDER BY name;
