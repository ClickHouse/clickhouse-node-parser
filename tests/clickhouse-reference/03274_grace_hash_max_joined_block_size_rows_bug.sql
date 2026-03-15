CREATE TABLE t0 (x UInt64) ENGINE = MergeTree ORDER BY x;
CREATE TABLE t1 (x UInt64) ENGINE = MergeTree ORDER BY x;
SET max_joined_block_size_rows = 1;
SET grace_hash_join_initial_buckets = 2;
SET join_algorithm = 'grace_hash';
SELECT sum(x), count() FROM t0 JOIN t1 USING x;
