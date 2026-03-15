CREATE TEMPORARY TABLE table_merge_tree_02525
(
    id UInt64,
    info String
)
ENGINE = MergeTree
ORDER BY id
PRIMARY KEY id;
SELECT * FROM table_merge_tree_02525;
-- Check that temporary table with MergeTree is not sent to remote servers
-- The query with remote() should not fail
SELECT dummy FROM remote('127.0.0.{1,2}', system, one);
CREATE TEMPORARY TABLE table_log_02525
(
    id UInt64,
    info String
)
ENGINE = Log;
SELECT * FROM table_log_02525;
CREATE TEMPORARY TABLE table_stripe_log_02525
(
    id UInt64,
    info String
)
ENGINE = StripeLog;
SELECT * FROM table_stripe_log_02525;
CREATE TEMPORARY TABLE table_tiny_log_02525
(
    id UInt64,
    info String
)
ENGINE = TinyLog;
SELECT * FROM table_tiny_log_02525;
CREATE TEMPORARY TABLE table_replicated_merge_tree_02525
(
    id UInt64,
    info String
)
ENGINE ReplicatedMergeTree('/clickhouse/tables/{database}/test_02525/table_replicated_merge_tree_02525', 'r1')
ORDER BY id
PRIMARY KEY id; -- { serverError INCORRECT_QUERY }
CREATE TEMPORARY TABLE table_keeper_map_02525
(
    key String,
    value UInt32
) Engine=KeeperMap('/' || currentDatabase() || '/test02525')
PRIMARY KEY(key); -- { serverError INCORRECT_QUERY }
