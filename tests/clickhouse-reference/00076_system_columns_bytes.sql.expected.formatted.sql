SELECT
    sum(data_compressed_bytes) > 0,
    sum(data_uncompressed_bytes) > 0,
    sum(marks_bytes) > 0
FROM `system`.`columns`
WHERE (database, `table`) IN (
        SELECT
            database,
            table
        FROM `system`.tables
        WHERE engine != 'Merge'
            AND ((engine != 'StorageProxy'
            OR notILike(create_table_query, '%merge%')))
    );