---SettingFieldNumber
SELECT changed from system.settings where name = 'mysql_max_rows_to_insert';
SET mysql_max_rows_to_insert = 123123;
set mysql_max_rows_to_insert = 65536;
---SettingAutoWrapper 

select changed from system.settings where name = 'insert_quorum';
set insert_quorum = 123123;
set insert_quorum = 0;
---SettingFieldMaxThreads 

select changed from system.settings where name = 'max_alter_threads';
set max_alter_threads = 123123;
set max_alter_threads = 0;
---SettingFieldTimespanUnit

select changed from system.settings where name = 'drain_timeout';
set drain_timeout = 123123;
set drain_timeout = 3;
---SettingFieldChar

select changed from system.settings where name = 'format_csv_delimiter';
set format_csv_delimiter = ',';
---SettingFieldURI

select changed from system.settings where name = 'format_avro_schema_registry_url';
set format_avro_schema_registry_url = 'https://github.com/ClickHouse/ClickHouse/tree/master/src/Core';
set format_avro_schema_registry_url = '';
--- SettingFieldEnum

select changed from system.settings where name = 'output_format_orc_compression_method';
set output_format_orc_compression_method = 'none';
set output_format_orc_compression_method = 'lz4';
--- SettingFieldMultiEnum

select changed from system.settings where name = 'join_algorithm';
set join_algorithm = 'auto,direct';
set join_algorithm = 'default';
