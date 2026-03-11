SELECT *
FROM table_merge_tree_02525;

SELECT dummy
FROM remote('127.0.0.{1,2}', `system`, one);

SELECT *
FROM table_log_02525;

SELECT *
FROM table_stripe_log_02525;

SELECT *
FROM table_tiny_log_02525;