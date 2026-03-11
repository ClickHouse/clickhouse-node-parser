SELECT *
FROM hierarchy_flat_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_flat_dictionary_index'
    AND database = currentDatabase();

SELECT *
FROM hierarchy_hashed_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_hashed_dictionary_index'
    AND database = currentDatabase();

SELECT *
FROM hierarchy_hashed_array_dictionary_index;

SELECT hierarchical_index_bytes_allocated > 0
FROM `system`.dictionaries
WHERE name = 'hierarchy_hashed_array_dictionary_index'
    AND database = currentDatabase();