-- Tags: replica
SET enable_parallel_replicas = 1;

SET max_parallel_replicas = 3;

SET parallel_replicas_mode = 'sampling_key';

SET parallel_replicas_for_non_replicated_merge_tree = 1;

CREATE TABLE t
(
    x String
)
ENGINE = MergeTree
ORDER BY x;

SET max_parallel_replicas = 3;

SELECT *
FROM remote('127.0.0.{2|3|4}', currentDatabase(), t);

CREATE TABLE t
(
    x String
)
ENGINE = MergeTree
ORDER BY cityHash64(x)
SAMPLE BY cityHash64(x);

SET max_parallel_replicas = 1;

SELECT count()
FROM remote('127.0.0.{2|3|4}', currentDatabase(), t);

SET max_parallel_replicas = 2;