SET insert_keeper_fault_injection_probability = 0;
SET max_threads = 4;
CREATE TABLE t_optimize_level (a UInt64, b UInt64)
ENGINE = ReplacingMergeTree ORDER BY a
SETTINGS index_granularity = 1;
SELECT _part, a, b FROM t_optimize_level ORDER BY a;
SELECT count() FROM (EXPLAIN PIPELINE SELECT a, b FROM t_optimize_level FINAL) WHERE explain LIKE '%Replacing%';
SELECT name FROM system.parts WHERE database = currentDatabase() AND table = 't_optimize_level' AND active;
CREATE TABLE t_optimize_level (a UInt64, b UInt64)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{database}/03283_optimize_on_insert_level', '1') ORDER BY a
SETTINGS index_granularity = 1;
