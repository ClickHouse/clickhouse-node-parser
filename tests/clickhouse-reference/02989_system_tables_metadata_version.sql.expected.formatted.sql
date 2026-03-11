SELECT
    name,
    metadata_version
FROM `system`.tables
WHERE name = 'test_temporary_table_02989'
    AND is_temporary;

SELECT '--';

SELECT
    name,
    metadata_version
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'test_table';

SELECT
    name,
    metadata_version
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'test_table_replicated';