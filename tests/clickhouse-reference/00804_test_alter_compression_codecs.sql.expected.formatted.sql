SELECT *
FROM alter_compression_codec
ORDER BY id ASC;

SELECT compression_codec
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'alter_compression_codec'
    AND name = 'alter_column';

SELECT compression_codec
FROM `system`.`columns`
WHERE database = currentDatabase()
    AND table = 'large_alter_table_00804'
    AND name = 'data';

SELECT COUNT(hash)
FROM store_of_hash_00804;

SELECT COUNTDistinct(hash)
FROM store_of_hash_00804;