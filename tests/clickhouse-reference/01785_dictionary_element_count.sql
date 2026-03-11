SELECT * FROM 01785_db.simple_key_flat_dictionary;
SELECT name, database, element_count FROM system.dictionaries WHERE database = '01785_db' AND name = 'simple_key_flat_dictionary';
SELECT * FROM 01785_db.simple_key_hashed_dictionary;
SELECT name, database, element_count FROM system.dictionaries WHERE database = '01785_db' AND name = 'simple_key_hashed_dictionary';
SELECT toUInt64(1) as key, dictGet('01785_db.simple_key_cache_dictionary', 'value', key);
SELECT name, database, element_count FROM system.dictionaries WHERE database = '01785_db' AND name = 'simple_key_cache_dictionary';
SELECT * FROM 01785_db.complex_key_hashed_dictionary;
SELECT name, database, element_count FROM system.dictionaries WHERE database = '01785_db' AND name = 'complex_key_hashed_dictionary';
