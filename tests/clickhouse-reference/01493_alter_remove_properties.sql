SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table;
SELECT column_default, column_materialized, column_alias, column_codec, column_comment, column_ttl FROM prop_table ORDER BY column_ttl;
SELECT COUNT() FROM prop_table;
