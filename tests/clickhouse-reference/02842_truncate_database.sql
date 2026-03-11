SELECT * FROM dest_view_memory ORDER BY x LIMIT 1;
SELECT * FROM dest_view_log ORDER BY x LIMIT 1;
SELECT * FROM dest_view_tiny_log ORDER BY x LIMIT 1;
SELECT * FROM dest_view_stripe_log ORDER BY x LIMIT 1;
SELECT * FROM dest_view_merge_tree ORDER BY x LIMIT 1;
SELECT name, database, element_count FROM system.dictionaries WHERE database = 'test_truncate_database' AND name = 'dest_dictionary';
SELECT * FROM dest_dictionary;
SELECT * FROM dest_view_set ORDER BY x LIMIT 1; -- {serverError UNKNOWN_TABLE}
