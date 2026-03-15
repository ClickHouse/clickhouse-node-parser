set allow_deprecated_syntax_for_merge_tree=1;
CREATE TABLE parallel_replicas (d Date DEFAULT today(), x UInt32, u UInt64, s String) ENGINE = MergeTree(d, cityHash64(u, s), (x, d, cityHash64(u, s)), 8192);
/*
* Check that:
* - the table is not empty on each replica;
* - combining the data of all replicas coincides with the contents of the parallel_replicas table.
*/

/* Two replicas */

SET enable_parallel_replicas=1, parallel_replicas_mode='sampling_key', max_parallel_replicas=3, parallel_replicas_for_non_replicated_merge_tree = 1;
CREATE TABLE parallel_replicas_backup(d Date DEFAULT today(), x UInt32, u UInt64, s String) ENGINE = Memory;
SET parallel_replicas_count = 2;
SET parallel_replica_offset = 0;
SELECT count() > 0 FROM parallel_replicas;
SET parallel_replica_offset = 1;
SET parallel_replicas_count = 0;
SELECT x, u, s FROM parallel_replicas_backup ORDER BY x, u, s ASC;
/* Three replicas */

SET parallel_replicas_count = 3;
SET parallel_replica_offset = 2;
