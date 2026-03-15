-- { echoOn }
CREATE TABLE test_virtual_columns(a Int32) ENGINE = MergeTree() ORDER BY a;
SELECT _part_offset FROM test_virtual_columns;
