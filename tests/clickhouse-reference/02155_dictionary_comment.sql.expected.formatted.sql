SELECT
    name,
    comment
FROM `system`.dictionaries
WHERE name == '02155_test_dictionary'
    AND database == currentDatabase();

SELECT
    name,
    comment
FROM `system`.tables
WHERE name == '02155_test_dictionary'
    AND database == currentDatabase();

SELECT *
FROM `02155_test_dictionary`;

SELECT *
FROM `02155_test_dictionary_view`;

SELECT
    name,
    comment
FROM `system`.tables
WHERE name == '02155_test_dictionary_view'
    AND database == currentDatabase();