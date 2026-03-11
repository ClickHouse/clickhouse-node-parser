SELECT changed
FROM `system`.`settings`
WHERE name = 'mysql_max_rows_to_insert';

SELECT changed
FROM `system`.`settings`
WHERE name = 'insert_quorum';

SELECT changed
FROM `system`.`settings`
WHERE name = 'max_alter_threads';

SELECT changed
FROM `system`.`settings`
WHERE name = 'drain_timeout';

SELECT changed
FROM `system`.`settings`
WHERE name = 'format_csv_delimiter';

SELECT changed
FROM `system`.`settings`
WHERE name = 'format_avro_schema_registry_url';

SELECT changed
FROM `system`.`settings`
WHERE name = 'output_format_orc_compression_method';

SELECT changed
FROM `system`.`settings`
WHERE name = 'join_algorithm';