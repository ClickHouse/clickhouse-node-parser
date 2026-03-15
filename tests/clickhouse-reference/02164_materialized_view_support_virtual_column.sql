CREATE TABLE test_tb (a UInt64, s String) ENGINE = MergeTree() ORDER BY a;
CREATE MATERIALIZED VIEW test_view_tb ENGINE = MergeTree() ORDER BY a AS SELECT * FROM test_tb;
SELECT count(_part) FROM test_view_tb;
