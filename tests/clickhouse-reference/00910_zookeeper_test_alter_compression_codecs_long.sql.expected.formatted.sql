SELECT *
FROM alter_compression_codec1
ORDER BY id ASC;

SELECT *
FROM alter_compression_codec2
ORDER BY id ASC;

SELECT compression_codec
FROM `system`.`columns`
WHERE table = 'alter_compression_codec1'
    AND name = 'alter_column'
    AND database = currentDatabase();

SELECT compression_codec
FROM `system`.`columns`
WHERE table = 'alter_compression_codec2'
    AND name = 'alter_column'
    AND database = currentDatabase();