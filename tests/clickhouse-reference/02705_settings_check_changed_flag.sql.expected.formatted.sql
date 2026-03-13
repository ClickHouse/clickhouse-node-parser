---SettingFieldNumber
SELECT changed
FROM `system`.`settings`
WHERE name = 'mysql_max_rows_to_insert';

---SettingAutoWrapper 
SELECT changed
FROM `system`.`settings`
WHERE name = 'insert_quorum';

---SettingFieldMaxThreads 
SELECT changed
FROM `system`.`settings`
WHERE name = 'max_alter_threads';

---SettingFieldTimespanUnit
SELECT changed
FROM `system`.`settings`
WHERE name = 'drain_timeout';

---SettingFieldChar
SELECT changed
FROM `system`.`settings`
WHERE name = 'format_csv_delimiter';

---SettingFieldURI
SELECT changed
FROM `system`.`settings`
WHERE name = 'format_avro_schema_registry_url';

--- SettingFieldEnum
SELECT changed
FROM `system`.`settings`
WHERE name = 'output_format_orc_compression_method';

--- SettingFieldMultiEnum
SELECT changed
FROM `system`.`settings`
WHERE name = 'join_algorithm';