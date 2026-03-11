SELECT *
FROM `system`.numbers
WHERE number NOT IN (truncate_test_set)
LIMIT 1;

SELECT *
FROM truncate_test_log;

SELECT *
FROM truncate_test_memory;

SELECT *
FROM truncate_test_tiny_log;

SELECT *
FROM truncate_test_stripe_log;

SELECT *
FROM truncate_test_merge_tree;

SELECT *
FROM truncate_test_materialized_view;