CREATE TABLE tab_with_primary_key_index
(
    id UInt32,
    a UInt32
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE tab_with_primary_key_index_and_skipping_index
(
    id UInt32,
    a UInt32,
    INDEX idx a TYPE set(0)
)
ENGINE = MergeTree
ORDER BY id;

-- Check that information_schema.tables.index_length is larger than 0 for both tables
SELECT if(index_length > 0, 'OK', 'FAIL')
FROM information_schema.tables
WHERE like(table_name, 'tab_with_primary_key_index%')
    AND table_schema = currentDatabase();

-- A very crude check that information_schema.tables.index_length is different for both tables
SELECT count(*)
FROM information_schema.tables
WHERE like(table_name, 'tab_with_primary_key_index%')
    AND table_schema = currentDatabase();

-- Check that information_schema.tables.index_length is 0 for non-MergeTree tables
SELECT if(index_length = 0, 'OK', 'FAIL')
FROM information_schema.tables
WHERE table_name = 'tables'
    AND table_schema = 'system'; -- table engine is 'SystemTables'