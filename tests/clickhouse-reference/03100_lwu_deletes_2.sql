DROP TABLE IF EXISTS lwd_test;
SET enable_lightweight_update = 1;
SET lightweight_delete_mode = 'lightweight_update_force';
CREATE TABLE lwd_test (id UInt64 , value String) ENGINE MergeTree() ORDER BY id
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi', enable_block_number_column = 1, enable_block_offset_column = 1;
INSERT INTO lwd_test SELECT number, randomString(10) FROM system.numbers LIMIT 1000000;
SET mutations_sync = 2;
SELECT 'Count', count() FROM lwd_test;
SELECT 'First row', id, length(value) FROM lwd_test ORDER BY id LIMIT 1;
ALTER TABLE lwd_test UPDATE value = 'v' WHERE id % 2 == 0;
ALTER TABLE lwd_test DELETE WHERE id % 3 == 0;
DROP TABLE lwd_test;
