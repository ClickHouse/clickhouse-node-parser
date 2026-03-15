CREATE TABLE test_max_insert_bytes(
    id UInt64
)
Engine = MergeTree()
Order by id;
CREATE TABLE test_min_insert_rows_bytes(
    id UInt64
)
Engine = MergeTree()
Order by id;
CREATE TABLE test_min_insert_rows(
    id UInt64
)
Engine = MergeTree()
Order by id;
CREATE TABLE test_min_insert_bytes(
    id UInt64
)
Engine = MergeTree()
Order by id;
-- Set max_insert_block_size_bytes smaller than max_insert_block_size (rows)
SET max_insert_block_size_rows = 100000000;
SET max_insert_block_size_bytes = 8;
-- Turn off squashing
SET min_insert_block_size_rows = 0;
SET min_insert_block_size_bytes = 0;
-- Set min_insert_block_size_rows and min_insert_block_size_bytes to 2 and 16 so that blocks are formed by 2
SET min_insert_block_size_rows = 2;
SET min_insert_block_size_bytes = 16;
SET min_insert_block_size_bytes = 32;
-- We expect to see 8 parts inserted
SELECT count()  
FROM system.part_log 
WHERE table = 'test_max_insert_bytes' 
AND event_type = 'NewPart' 
AND (query_id = (
    SELECT argMax(query_id, event_time) 
    FROM system.query_log 
    WHERE query LIKE '%INSERT INTO test_max_insert_bytes FORMAT CSV%' 
    AND type = 'QueryFinish'
    AND current_database = currentDatabase() 
));
-- We expect to see 4 parts inserted
SELECT count()  
FROM system.part_log 
WHERE table = 'test_min_insert_rows_bytes' 
AND event_type = 'NewPart' 
AND (query_id = (
    SELECT argMax(query_id, event_time)  
    FROM system.query_log 
    WHERE query LIKE '%INSERT INTO test_min_insert_rows_bytes FORMAT CSV%' 
    AND type = 'QueryFinish'
    AND current_database = currentDatabase() 
));
-- We expect to see 2 parts inserted
SELECT count()  
FROM system.part_log 
WHERE table = 'test_min_insert_rows' 
AND event_type = 'NewPart' 
AND (query_id = (
    SELECT argMax(query_id, event_time)  
    FROM system.query_log 
    WHERE query LIKE '%INSERT INTO test_min_insert_rows FORMAT CSV%' 
    AND type = 'QueryFinish'
    AND current_database = currentDatabase() 
));
-- We expect to see 2 parts inserted
SELECT count()  
FROM system.part_log 
WHERE table = 'test_min_insert_bytes' 
AND event_type = 'NewPart' 
AND (query_id = (
    SELECT argMax(query_id, event_time)  
    FROM system.query_log 
    WHERE query LIKE '%INSERT INTO test_min_insert_bytes FORMAT CSV%' 
    AND type = 'QueryFinish'
    AND current_database = currentDatabase() 
));
