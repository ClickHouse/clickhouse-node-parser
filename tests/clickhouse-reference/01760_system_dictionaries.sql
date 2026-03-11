SELECT name, database, key.names, key.types, attribute.names, attribute.types, status FROM system.dictionaries WHERE database='01760_db';
SELECT * FROM 01760_db.example_simple_key_dictionary;
SELECT * FROM 01760_db.example_complex_key_dictionary;
