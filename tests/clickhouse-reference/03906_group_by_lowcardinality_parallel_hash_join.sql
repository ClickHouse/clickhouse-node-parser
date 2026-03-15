-- Regression test for https://github.com/ClickHouse/ClickHouse/issues/75247
-- GROUP BY with parallel_hash join on LowCardinality(String) and a 64-bit type
-- should produce deterministic and correct results.

SET join_algorithm = 'parallel_hash';
CREATE TABLE t_lc_join_a
(
    key LowCardinality(String),
    value UInt64
) ENGINE = MergeTree() ORDER BY key;
CREATE TABLE t_lc_join_b
(
    key LowCardinality(String),
    id UInt64
) ENGINE = MergeTree() ORDER BY key;
SELECT a.key, sum(a.value), any(b.id)
FROM t_lc_join_a a
INNER JOIN t_lc_join_b b ON a.key = b.key
GROUP BY a.key
ORDER BY a.key;
