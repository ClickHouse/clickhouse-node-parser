SELECT * FROM table_merge_tree_02525;
-- Check that temporary table with MergeTree is not sent to remote servers
-- The query with remote() should not fail
SELECT dummy FROM remote('127.0.0.{1,2}', system, one);
SELECT * FROM table_log_02525;
SELECT * FROM table_stripe_log_02525;
SELECT * FROM table_tiny_log_02525;
