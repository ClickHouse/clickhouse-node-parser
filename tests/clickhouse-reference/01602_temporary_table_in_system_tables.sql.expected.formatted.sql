SELECT
    database,
    name,
    create_table_query,
    engine,
    engine_full,
    is_temporary
FROM `system`.tables
WHERE like(name, 'test_01602%')
ORDER BY name ASC;

SELECT *
FROM `system`.`columns`
WHERE like(table, 'test_01602%')
ORDER BY
    table ASC,
    name ASC;

SELECT COUNT()
FROM `system`.databases
WHERE name = '_temporary_and_external_tables';

SELECT COUNT()
FROM `system`.tables
WHERE database = '_temporary_and_external_tables';

SELECT COUNT()
FROM `system`.`columns`
WHERE database = '_temporary_and_external_tables';