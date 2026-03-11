SELECT *
FROM alias_1
ORDER BY id ASC;

SELECT *
FROM alias_2
ORDER BY id ASC;

SELECT *
FROM source_table
ORDER BY id ASC;

SELECT
    id,
    value,
    status
FROM source_table
ORDER BY id ASC;

SELECT count()
FROM source_table;

SELECT *
FROM alias_3
ORDER BY id ASC;

SELECT *
FROM alias_4
ORDER BY id ASC;

SELECT count() AS parts_after
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'source_table'
    AND active;

SELECT count()
FROM alias_4;

SELECT
    id,
    value,
    status
FROM source_table
WHERE id = 1;

SELECT count()
FROM source_table
WHERE id = 2;

SELECT count()
FROM alias_part;

SELECT count()
FROM source_table
WHERE id > 100;

SELECT *
FROM alias_a_exchange
ORDER BY value ASC;

SELECT *
FROM alias_b_exchange
ORDER BY value ASC;

SELECT *
FROM alias_attach
ORDER BY id ASC;

SELECT *
FROM source_attach
ORDER BY id ASC;

SELECT *
FROM metadata_alias
ORDER BY id ASC;

SELECT name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'metadata_alias'
ORDER BY name ASC;

SELECT
    id,
    value,
    extra,
    num
FROM metadata_alias
WHERE id = 4;

SELECT
    id,
    value,
    extra
FROM metadata_alias
WHERE id = 5;

SELECT *
FROM alias_with_missing_target
ORDER BY id ASC;

SELECT
    name,
    engine
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'alias_with_missing_target';

SELECT arraySort(groupUniqArray(name))
FROM `system`.tables
WHERE database = currentDatabase();

SELECT arraySort(groupUniqArray(name))
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alias_with_missing_target';

SELECT
    database,
    table,
    name
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alias_with_missing_target'
ORDER BY name ASC;

SELECT
    name,
    engine,
    total_rows,
    total_bytes,
    data_paths
FROM `system`.tables
WHERE database = currentDatabase()
    AND name = 'alias_with_missing_target';

SELECT *
FROM mv_test_alias_dest
ORDER BY id ASC;

SELECT *
FROM mv_test_target_dest
ORDER BY id ASC;