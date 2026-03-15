CREATE TABLE column_modify_test (id UInt64, val String, other_col UInt64) engine=MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part=0;
-- row 1 is damaged now: the column files of val columns & columns.txt is out of sync!
SELECT *, throwIf(val <> 'one') FROM column_modify_test WHERE id = 1 FORMAT CSV;
