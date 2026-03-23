set use_statistics=1;
CREATE TABLE column_modify_test (id UInt64, val String, other_col UInt64) engine=MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part=0, auto_statistics_types='uniq,countmin';
INSERT INTO column_modify_test VALUES (1,'one',0);
SELECT *, throwIf(val <> 'one') as issue FROM column_modify_test WHERE id = 1 FORMAT NULL;
CREATE TABLE column_modify_test (id UInt64, val Nullable(String), other_col UInt64) engine=MergeTree ORDER BY id SETTINGS min_bytes_for_wide_part=0, auto_statistics_types='uniq,countmin';
