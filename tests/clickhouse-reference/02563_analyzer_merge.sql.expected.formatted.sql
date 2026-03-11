SELECT
    id,
    value,
    _database,
    _table
FROM `02563_db`.test_merge_table
ORDER BY id ASC;

SELECT
    '91138316-5127-45ac-9c25-4ad8779777b4',
    count()
FROM `02563_db`.m;