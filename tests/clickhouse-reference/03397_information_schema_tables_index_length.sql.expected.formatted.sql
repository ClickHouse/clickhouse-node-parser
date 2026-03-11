SELECT if(index_length > 0, 'OK', 'FAIL')
FROM information_schema.tables
WHERE like(table_name, 'tab_with_primary_key_index%')
    AND table_schema = currentDatabase();

SELECT count(*)
FROM information_schema.tables
WHERE like(table_name, 'tab_with_primary_key_index%')
    AND table_schema = currentDatabase();

SELECT if(index_length = 0, 'OK', 'FAIL')
FROM information_schema.tables
WHERE table_name = 'tables'
    AND table_schema = 'system';