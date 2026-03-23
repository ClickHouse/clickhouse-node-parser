DROP TABLE IF EXISTS test;
CREATE TABLE test (id UInt32, a UInt32) ENGINE = MergeTree ORDER BY id
SETTINGS enable_block_number_column = 1, enable_block_offset_column = 0;
INSERT INTO test(id,a) VALUES (1,1),(2,2),(3,3);
INSERT INTO test(id,a) VALUES (4,4),(5,5),(6,6);
SELECT id,a,_block_number,_part from test ORDER BY id;
set mutations_sync=1;
ALTER TABLE test UPDATE a=0 WHERE id<4;
SELECT *,_block_number,_part from test ORDER BY id;
INSERT INTO test(id,a) VALUES (7,7),(8,8),(9,9);
DROP TABLE test;
