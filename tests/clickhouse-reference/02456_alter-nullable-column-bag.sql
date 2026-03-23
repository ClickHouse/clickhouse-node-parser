DROP TABLE IF EXISTS column_modify_test;
CREATE TABLE column_modify_test (id UInt64, val String, other_col UInt64) engine=MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part=0;
INSERT INTO column_modify_test VALUES (1,'one',0);
INSERT INTO column_modify_test VALUES (2,'two',0);
-- but since 21.10 it only applies that to new part, so old parts keep the old schema
--SELECT * FROM system.mutations;

INSERT INTO column_modify_test VALUES (3,Null,0);
-- row 1 is damaged now: the column files of val columns & columns.txt is out of sync!
SELECT *, throwIf(val <> 'one') FROM column_modify_test WHERE id = 1 FORMAT CSV;
