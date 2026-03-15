-- Tags: no-tsan, no-asan, no-ubsan, no-msan, no-debug, no-fasttest, no-llvm-coverage

CREATE TABLE t_03176(k UInt64, v UInt64) ENGINE=MergeTree() ORDER BY k PARTITION BY k;
-- Table is partitioned by k to so it will have 5 partitions
SELECT count() FROM system.parts WHERE database = currentDatabase() AND table = 't_03176' AND active;
-- Check that q1 was fast, q2 was slow and q3 had timeout
SELECT log_comment, type = 'QueryFinish', intDiv(query_duration_ms, 2000), exception_code != 0, (position('selectPartsToRead' IN stack_trace) > 0 OR position('filterPartsByPartition' IN stack_trace) > 0) AS has_selectPartsToRead
FROM system.query_log
WHERE current_database = currentDatabase() AND log_comment LIKE '03176_q_' AND type IN ('QueryFinish', 'ExceptionBeforeStart')
ORDER BY log_comment;
