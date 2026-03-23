-- Test that lazy materialization works together with read-in-order optimization
-- Tags: no-random-settings

SET query_plan_optimize_lazy_materialization = 1;
SET query_plan_max_limit_for_lazy_materialization = 10;
SET optimize_read_in_order = 1;
SET enable_analyzer = 1;
SET parallel_replicas_local_plan = 1;
-- Create a table with sorting key on column 'a'
CREATE TABLE test_lazy_read_in_order
(
    a UInt64,
    b String,
    c String,
    d String,
    e UInt64
) ENGINE = MergeTree()
      ORDER BY a;
-- Insert test data
INSERT INTO test_lazy_read_in_order
SELECT number,
       repeat('b', 100),
       repeat('c', 100),
       repeat('d', 100),
       number * 2
FROM numbers(1000);
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT a, b, c, d, e
    FROM test_lazy_read_in_order
    WHERE a >= 0
    ORDER BY a
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
SELECT a, e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY a
LIMIT 5;
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT a, b, c, d, e
    FROM test_lazy_read_in_order
    WHERE e > 100
    ORDER BY a
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
SELECT a, e
FROM test_lazy_read_in_order
WHERE e > 100
ORDER BY a
LIMIT 5;
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT a, b, c, d, e
    FROM test_lazy_read_in_order
    PREWHERE e > 100
    ORDER BY a
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
SELECT a, e
FROM test_lazy_read_in_order PREWHERE e > 100
ORDER BY a
LIMIT 5;
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT a, b, c, d, e
    FROM test_lazy_read_in_order
    WHERE a >= 0
    ORDER BY a, e
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
SELECT a, e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY a, e
LIMIT 5;
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT a, b, c, d, e
    FROM test_lazy_read_in_order
    WHERE a >= 0
    ORDER BY a, a + 1
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
SELECT a, e
FROM test_lazy_read_in_order
WHERE a >= 0
ORDER BY a, a + 1
LIMIT 5;
CREATE TABLE test_correctness
(
    id    UInt64,
    value String,
    score UInt64,
    data  String
) ENGINE = MergeTree()
      ORDER BY id;
-- Insert data in non-sequential order to test sorting
INSERT INTO test_correctness
VALUES (5, 'five', 50, 'data5'),
       (2, 'two', 20, 'data2'),
       (8, 'eight', 80, 'data8'),
       (1, 'one', 10, 'data1'),
       (9, 'nine', 90, 'data9'),
       (3, 'three', 30, 'data3'),
       (7, 'seven', 70, 'data7'),
       (4, 'four', 40, 'data4'),
       (6, 'six', 60, 'data6'),
       (10, 'ten', 100, 'data10');
-- With both optimizations enabled
SELECT id, value, score
FROM test_correctness
ORDER BY id ASC
LIMIT 5;
-- DESC should also work
SELECT id, value, score
FROM test_correctness
ORDER BY id DESC
LIMIT 5;
-- Filter and order
SELECT id, value, score
FROM test_correctness
WHERE score >= 50
ORDER BY id ASC;
-- Same query with optimizations disabled should give same results
SELECT id, value, score
FROM test_correctness
WHERE id >= 0
ORDER BY id ASC
LIMIT 5
SETTINGS
optimize_read_in_order = 0,
query_plan_optimize_lazy_materialization = 0;
SELECT trimLeft(explain)
FROM (
    EXPLAIN PLAN actions=1
    SELECT id, value, score, data
    FROM test_correctness
    WHERE id >= 0
    ORDER BY id ASC
    LIMIT 5
    SETTINGS max_threads=1
)
WHERE explain LIKE '%LazilyRead%'
   OR explain LIKE '%Lazily read columns:%'
   OR explain LIKE '%ReadType:%'
   OR explain LIKE '%Prefix sort description:%'
   OR explain LIKE '%Result sort description:%';
