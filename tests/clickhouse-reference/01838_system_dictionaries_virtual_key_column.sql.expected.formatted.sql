SELECT
    name,
    key
FROM `system`.dictionaries
WHERE name = 'example_simple_key_dictionary'
    AND database = currentDatabase();

SELECT
    name,
    key
FROM `system`.dictionaries
WHERE name = 'example_complex_key_dictionary'
    AND database = currentDatabase();