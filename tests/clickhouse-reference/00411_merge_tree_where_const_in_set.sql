set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE const_in_const (id UInt64, date Date, uid UInt32, name String, Sign Int8) ENGINE = CollapsingMergeTree(date, intHash32(uid), (id, date, intHash32(uid)), 8192, Sign);
SELECT 1 from const_in_const where 42 in (225);
SELECT name FROM const_in_const WHERE 1 IN (125, 1, 2) ORDER BY name LIMIT 1;
