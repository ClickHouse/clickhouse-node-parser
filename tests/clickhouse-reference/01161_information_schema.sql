SELECT '-- information_schema.schemata';
SELECT * FROM information_schema.schemata WHERE schema_name ilike 'information_schema' ORDER BY schema_name;
SELECT * FROM information_schema.tables WHERE table_schema = currentDatabase() AND table_name NOT LIKE '%inner%' ORDER BY table_name;
SELECT * FROM information_schema.views WHERE table_schema = currentDatabase() ORDER BY table_name;
SELECT * FROM information_schema.columns WHERE table_schema = currentDatabase() AND table_name NOT LIKE '%inner%' ORDER BY table_name, column_name;
SELECT * FROM information_schema.key_column_usage WHERE table_schema = currentDatabase() AND table_name = 'kcu1' ORDER BY table_schema, column_name;
SELECT * FROM information_schema.key_column_usage WHERE table_schema = currentDatabase() AND table_name = 'kcu2' ORDER BY table_schema, column_name;
SELECT * FROM information_schema.referential_constraints;
SELECT * FROM information_schema.statistics;
--
-- mixed upper/lowercase schema and table name:
SELECT count() FROM information_schema.TABLES WHERE table_schema = currentDatabase() AND table_name = 't';
SELECT count() FROM information_schema.taBLES WHERE table_schema  =currentDatabase() AND table_name = 't'; -- { serverError UNKNOWN_TABLE }
