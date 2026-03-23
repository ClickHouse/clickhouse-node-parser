set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE prewhere (d Date, a String, b String) ENGINE = MergeTree(d, d, 8192);
INSERT INTO prewhere VALUES ('2015-01-01', 'hello', 'world');
INSERT INTO prewhere VALUES ('2015-01-01', 'hello1', 'xxx', 'world1');
SELECT d, a, a1, b FROM prewhere PREWHERE a LIKE 'hello%' ORDER BY a1;
