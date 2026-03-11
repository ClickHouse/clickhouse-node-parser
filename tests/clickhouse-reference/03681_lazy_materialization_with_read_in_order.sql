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
