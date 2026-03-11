SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64, INDEX i0 (c0 AS a) TYPE minmax) ENGINE = MergeTree ORDER BY c0');

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a)');

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Date TTL (c0 AS a)) ENGINE = MergeTree ORDER BY ()');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Int64, INDEX i0 (c0 AS a) TYPE minmax) ENGINE = MergeTree ORDER BY c0'));

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a)'));

SELECT formatQuerySingleLine('CREATE TABLE t ENGINE = Memory AS SELECT 1');

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Int64) ENGINE = Memory AS SELECT 1');

SELECT formatQuerySingleLine('CREATE TABLE t (c0 String, INDEX i0 (lower(c0) AS lc) TYPE tokenbf_v1(1024, 2, 0)) ENGINE = MergeTree ORDER BY c0');

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a) SETTINGS index_granularity = 8192');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a) SETTINGS index_granularity = 8192'));

SELECT formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a) PARTITION BY c0');

SELECT formatQuerySingleLine(formatQuerySingleLine('CREATE TABLE t (c0 Date) ENGINE = MergeTree ORDER BY () TTL (c0 AS a) PARTITION BY c0'));