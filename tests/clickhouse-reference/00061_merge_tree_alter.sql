DROP TABLE IF EXISTS alter_00061;
set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE alter_00061 (d Date, k UInt64, i32 Int32) ENGINE=MergeTree(d, k, 8192);
INSERT INTO alter_00061 VALUES ('2015-01-01', 10, 42);
SELECT * FROM alter_00061 ORDER BY k;
INSERT INTO alter_00061 VALUES ('2015-01-01', 8, 40, [1,2,3], ['12','13','14']);
INSERT INTO alter_00061 VALUES ('2015-01-01', 7, 39, [10,20,30], ['120','130','140'],['2000-01-01','2000-01-01','2000-01-03']);
INSERT INTO alter_00061 VALUES ('2015-01-01', 6,38,[10,20,30],['asd','qwe','qwe'],['2000-01-01','2000-01-01','2000-01-03'],'100500');
DROP TABLE alter_00061;
