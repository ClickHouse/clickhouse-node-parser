set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE alter_00147 (d Date DEFAULT toDate('2015-01-01'), n Nested(x String)) ENGINE = MergeTree(d, d, 8192);
SELECT * FROM alter_00147;
SELECT * FROM alter_00147 ARRAY JOIN n;
SELECT * FROM alter_00147 ARRAY JOIN n WHERE n.x LIKE '%Hello%';
SELECT * FROM alter_00147 ORDER BY n.x;
SELECT * FROM alter_00147 ARRAY JOIN n ORDER BY n.x;
SELECT * FROM alter_00147 ARRAY JOIN n WHERE n.x LIKE '%Hello%' ORDER BY n.x;
