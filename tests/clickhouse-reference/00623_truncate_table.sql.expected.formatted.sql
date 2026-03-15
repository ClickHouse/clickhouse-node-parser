SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE truncate_test_set
(
    id UInt64
)
ENGINE = Set;

CREATE TABLE truncate_test_log
(
    id UInt64
)
ENGINE = Log;

CREATE TABLE truncate_test_memory
(
    id UInt64
)
ENGINE = Memory;

CREATE TABLE truncate_test_tiny_log
(
    id UInt64
)
ENGINE = TinyLog;

CREATE TABLE truncate_test_stripe_log
(
    id UInt64
)
ENGINE = StripeLog;

CREATE TABLE truncate_test_merge_tree
(
    p Date,
    k UInt64
)
ENGINE = MergeTree(p, k, 1);

CREATE TABLE truncate_test_materialized_depend
(
    p Date,
    k UInt64
)
ENGINE = Null;

CREATE MATERIALIZED VIEW truncate_test_materialized_view
ENGINE = MergeTree(p, k, 1)
AS
SELECT *
FROM truncate_test_materialized_depend;

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