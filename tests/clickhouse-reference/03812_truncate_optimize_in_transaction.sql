CREATE TABLE test_table (key UInt64, value String) ENGINE = MergeTree ORDER BY key SETTINGS merge_tree_clear_old_parts_interval_seconds=30;
CREATE TABLE t2 (key UInt64, value String) ENGINE = Memory;
SET throw_on_unsupported_query_inside_transaction=0;
