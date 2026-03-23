CREATE TABLE column_modify_test (id UInt64, val String, other_col UInt64) engine=MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part=0;
INSERT INTO column_modify_test VALUES (1,'one',0);
INSERT INTO column_modify_test VALUES (2,'two',0);
INSERT INTO column_modify_test VALUES (3,Null,0);
-- till now everythings looks ok
SELECT * FROM column_modify_test order by id, val, other_col;
-- row 1 is damaged now the column file & columns.txt is out of sync!
SELECT *, throwIf(val <> 'one') as issue FROM column_modify_test WHERE id = 1;
