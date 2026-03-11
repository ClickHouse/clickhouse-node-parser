---SettingFieldNumber
SELECT changed from system.settings where name = 'mysql_max_rows_to_insert';
---SettingAutoWrapper 

select changed from system.settings where name = 'insert_quorum';
---SettingFieldMaxThreads 

select changed from system.settings where name = 'max_alter_threads';
---SettingFieldTimespanUnit

select changed from system.settings where name = 'drain_timeout';
---SettingFieldChar

select changed from system.settings where name = 'format_csv_delimiter';
---SettingFieldURI

select changed from system.settings where name = 'format_avro_schema_registry_url';
--- SettingFieldEnum

select changed from system.settings where name = 'output_format_orc_compression_method';
--- SettingFieldMultiEnum

select changed from system.settings where name = 'join_algorithm';
