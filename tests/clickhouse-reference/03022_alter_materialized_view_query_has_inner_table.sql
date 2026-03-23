CREATE TABLE src_table (`a` UInt32, `b` UInt32) ENGINE = MergeTree ORDER BY a;
CREATE MATERIALIZED VIEW mv (`a` UInt32) ENGINE = MergeTree ORDER BY a AS SELECT a FROM src_table;
INSERT INTO src_table (a, b) VALUES (1, 1), (2, 2);
SELECT * FROM mv;
SET allow_experimental_alter_materialized_view_structure = 1;
