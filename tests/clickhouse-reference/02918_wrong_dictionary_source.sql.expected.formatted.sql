SELECT count()
FROM `system`.dictionaries
WHERE name == 'id_value_dictionary'
    AND database == currentDatabase();