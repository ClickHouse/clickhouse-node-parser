-- Tags: no-replicated-database
CREATE TABLE IF NOT EXISTS truncate_test_set
(
    id UInt64
)
ENGINE = Set;

CREATE TABLE IF NOT EXISTS truncate_test_log
(
    id UInt64
)
ENGINE = Log;

CREATE TABLE IF NOT EXISTS truncate_test_memory
(
    id UInt64
)
ENGINE = Memory;

CREATE TABLE IF NOT EXISTS truncate_test_tiny_log
(
    id UInt64
)
ENGINE = TinyLog;

CREATE TABLE IF NOT EXISTS truncate_test_stripe_log
(
    id UInt64
)
ENGINE = StripeLog;

CREATE TABLE IF NOT EXISTS truncate_test_merge_tree
(
    p Date,
    k UInt64
)
ENGINE = MergeTree
ORDER BY p;

INSERT INTO truncate_test_set;

INSERT INTO truncate_test_log;

INSERT INTO truncate_test_memory;

INSERT INTO truncate_test_tiny_log;

INSERT INTO truncate_test_stripe_log;

INSERT INTO truncate_test_merge_tree;

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

SYSTEM DROP  TABLE truncate_test_log;

SYSTEM DROP  TABLE truncate_test_memory;

SYSTEM DROP  TABLE truncate_test_tiny_log;

SYSTEM DROP  TABLE truncate_test_stripe_log;

SYSTEM DROP  TABLE truncate_test_merge_tree;