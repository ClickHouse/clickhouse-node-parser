

SELECT * FROM test_table AS test_table_alias;
SELECT test_table_alias.* FROM test_table AS test_table_alias;
SELECT * FROM test_table AS test_table_alias SETTINGS asterisk_include_alias_columns = 1;
SELECT test_table_alias.* FROM test_table AS test_table_alias SETTINGS asterisk_include_alias_columns = 1;
SELECT * FROM test_table AS test_table_alias SETTINGS asterisk_include_materialized_columns = 1;
SELECT test_table_alias.* FROM test_table AS test_table_alias SETTINGS asterisk_include_materialized_columns = 1;
SELECT * FROM test_table AS test_table_alias SETTINGS asterisk_include_alias_columns = 1, asterisk_include_materialized_columns = 1;
SELECT test_table_alias.* FROM test_table AS test_table_alias SETTINGS asterisk_include_alias_columns = 1, asterisk_include_materialized_columns = 1;
