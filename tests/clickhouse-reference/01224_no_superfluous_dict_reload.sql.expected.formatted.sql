SELECT status
FROM `system`.dictionaries
WHERE database = 'dict_db_01224'
    AND name = 'dict';

SELECT *
FROM `system`.tables
FORMAT Null;

SELECT
    engine,
    like(metadata_path, '%metadata/dict\\_db\\_01224/dict.sql'),
    create_table_query
FROM `system`.tables
WHERE database = 'dict_db_01224'
    AND name = 'dict';

SELECT
    name,
    type
FROM `system`.`columns`
WHERE database = 'dict_db_01224'
    AND table = 'dict';