CREATE TABLE prefetched_table(key UInt64, s String) Engine = MergeTree() order by key;
SET local_filesystem_read_prefetch=1;
SET allow_prefetched_read_pool_for_remote_filesystem=1;
SET allow_prefetched_read_pool_for_local_filesystem=1;
SELECT * FROM prefetched_table FORMAT Null; --{serverError BAD_ARGUMENTS}
