set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE mutations_and_escaping_1648 (d Date, e Enum8('foo'=1, 'bar'=2)) Engine = MergeTree(d, (d), 8192);
INSERT INTO mutations_and_escaping_1648 (d, e) VALUES ('2018-01-01', 'foo');
INSERT INTO mutations_and_escaping_1648 (d, e) VALUES ('2018-01-02', 'bar');
SELECT e FROM mutations_and_escaping_1648 ORDER BY d;
