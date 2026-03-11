SELECT zero + 1 AS x
FROM `system`.zeros
LIMIT 10
SETTINGS
    max_block_size = 9223372036854775806,
    max_rows_to_read = 20,
    read_overflow_mode = 'break';

SELECT value
FROM `system`.`settings`
WHERE name = 'max_block_size';