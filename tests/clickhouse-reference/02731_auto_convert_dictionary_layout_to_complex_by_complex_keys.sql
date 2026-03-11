SELECT name, type FROM system.dictionaries WHERE database = currentDatabase() AND name = 'dict_flat_simple';
SELECT name, type FROM system.dictionaries WHERE database = currentDatabase() AND name = 'dict_hashed_simple_Decimal128';
SELECT name, type FROM system.dictionaries WHERE database = currentDatabase() AND name = 'dict_hashed_simple_Float32';
SELECT name, type FROM system.dictionaries WHERE database = currentDatabase() AND name = 'dict_hashed_simple_String';
SELECT name, type FROM system.dictionaries WHERE database = currentDatabase() AND name = 'dict_hashed_simple_auto_convert';
